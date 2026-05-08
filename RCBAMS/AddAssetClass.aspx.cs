using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AddAssetClass : System.Web.UI.Page
{
    static string myConnectionString = myConnectionString = WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;
    SqlConnection myConnection = new SqlConnection(myConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        //lbl_date.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_assgrpcode.Text == "")
        {
            lbl_msg.Text = "Enter Asset Class Code";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_assgrpdes.Text == "")
        {
            lbl_msg.Text = "Enter Asset Class Name";
            lbl_msg.Visible = true;
            return;
        }
        myCommand = new SqlCommand("INSERT INTO AssetClassMaster(AssetClassName,AssetClassCode,CreatedDate,Status) Values(@AssetClassName,@AssetClassCode,@CreatedDate,@Status)", myConnection);
        myCommand.Parameters.AddWithValue("@AssetClassName", txt_assgrpdes.Text);
        myCommand.Parameters.AddWithValue("@AssetClassCode", txt_assgrpcode.Text);
        myCommand.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        lbl_msg.Text = "Data Saved Successfully";
        lbl_msg.Visible = true;
        Clear();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_assgrpcode.Text == "")
        {
            lbl_msg.Text = "Enter Asset Class Code";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_assgrpdes.Text == "")
        {
            lbl_msg.Text = "Enter Asset Class Name";
            lbl_msg.Visible = true;
            return;
        }
        myCommand = new SqlCommand("UPDATE AssetClassMaster SET AssetClassCode=@AssetClassCode,AssetClassName=@AssetClassName WHERE AssetClassID=@AssetClassID ", myConnection);
        myCommand.Parameters.AddWithValue("@AssetClassCode", txt_assgrpcode.Text);
        myCommand.Parameters.AddWithValue("@AssetClassName", txt_assgrpdes.Text);
        myCommand.Parameters.AddWithValue("@AssetClassID", Session["AssetClassID"].ToString());
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        
        Clear();
        btnsave.Visible = true;
        btnupdate.Visible = false;
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        lbl_msg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        Session["AssetClassID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetClassID").ToString();
        if (btn == "Edit")
        {

            txt_assgrpcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetClassCode").ToString();
            txt_assgrpdes.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetClassName").ToString();
            btnsave.Visible = false;
            btnupdate.Visible = true;
            ASPxGridView1.DataBind();

        }
        else if (btn == "Delete")
        {
            myCommand = new SqlCommand("Update AssetClassMaster Set Status='InActive' Where AssetClassID=@AssetClassID", myConnection);
            myCommand.Parameters.AddWithValue("@AssetClassID", Session["AssetClassID"].ToString());
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            //Messages.SetSuccessMessage("0061", null, Session);
            btnsave.Visible = true;
            btnupdate.Visible = false;
        }
    }

    protected void Clear()
    {
        txt_assgrpcode.Text = txt_assgrpdes.Text = "";
    }
}