using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AddLocation : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
       ASPxGridView1.DataBind();

        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_location.Text == "")
        {
            lbl_msg.Text = "Enter Wing";
            lbl_msg.Visible = true;
            return;
        }
        if (txtblock.Text == "")
        {
            lbl_msg.Text = "Enter Floor";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_locationcode.Text == "")
        {
            lbl_msg.Text = "Enter LAB";
            lbl_msg.Visible = true;
            return;
        }
        string insertq = "insert into LocationMaster ([Location] ,[Block],[LocationCode],[Status]) Values (@Location,@Block,@LocationCode,@Status)";
        myCommand = new SqlCommand(insertq, myConnection);
        myCommand.Parameters.AddWithValue("@Location", txt_location.Text);
        myCommand.Parameters.AddWithValue("@Block", txtblock.Text);
        myCommand.Parameters.AddWithValue("@LocationCode", txt_locationcode.Text);
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open(); 
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        lbl_msg.Text = "Data Saved Successfully";
        lbl_msg.Visible = true;
        Clear();
    }

    protected void btn_Update_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_location.Text == "")
        {
            lbl_msg.Text = "Enter Wing";
            lbl_msg.Visible = true;
            return;
        }
        if (txtblock.Text == "")
        {
            lbl_msg.Text = "Enter Floor";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_locationcode.Text == "")
        {
            lbl_msg.Text = "Enter LAB";
            lbl_msg.Visible = true;
            return;
        }

        myCommand = new SqlCommand("UPDATE LocationMaster SET  Location='" + txt_location.Text + "',Block='" + txtblock.Text + "',LocationCode='" + txt_locationcode.Text + "' WHERE LocationID='" + Session["LocationID"] + "'", myConnection);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("0060", null, Session);
        Clear();
        btn_Update.Visible = false;
        btn_save.Visible = true;
    }

    protected void Clear()
    {
        txt_location.Text = "";
        txtblock.Text = "";
        txt_locationcode.Text = "";
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        lbl_msg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string LocationID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LocationID").ToString();
            Session["LocationID"] = LocationID;

            txt_location.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Location").ToString();
            txtblock.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Block").ToString();
            txt_locationcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();
            btn_Update.Visible = true;
            btn_save.Visible = false;

        }
        if (btn == "Delete")
        {
            lbl_msg.Text = "";
            string LocationID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LocationID").ToString();
            string Query2 = "UPDATE [LocationMaster] SET Status='InActive' Where LocationID='" + LocationID + "'";
            myCommand = new SqlCommand(Query2, myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            btn_Update.Visible = false;
            btn_save.Visible = true;
            Messages.SetSuccessMessage("0061", null, Session);
            Clear();
        }
    }
}