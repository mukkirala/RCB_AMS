using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.XtraExport;
using DevExpress.XtraPrinting.Export.Pdf;

public partial class AssetDescrptionMaster : System.Web.UI.Page
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
        if (txt_Asset.Text == "")
        {
            lbl_msg.Text = "Enter Asset Description";
            lbl_msg.Visible = true;
            return;
        }
        
        string insertq = "insert into AssetDescriptionMaster ([AssetDescription] ,[Status]) Values (@AssetDescription,@Status)";
        myCommand = new SqlCommand(insertq, myConnection);
        myCommand.Parameters.AddWithValue("@AssetDescription", txt_Asset.Text);
      
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open(); ;
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        lbl_msg.Text = "Data Saved Successfully";
        lbl_msg.Visible = true;
        Clear();
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        lbl_msg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string AssetDescID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetDescID").ToString();
            Session["AssetDescID"] = AssetDescID;

            txt_Asset.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetDescription").ToString();
          
            btn_Update.Visible = true;
            btn_save.Visible = false;

        }
        if (btn == "Delete")
        {
            lbl_msg.Text = "";
            string AssetDescID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetDescID").ToString();
            string Query2 = "UPDATE [AssetDescriptionMaster] SET Status='InActive' Where AssetDescID='" + AssetDescID + "'";
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
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_Asset.Text == "")
        {
            lbl_msg.Text = "Enter Asset Description";
            lbl_msg.Visible = true;
            return;
        }
       
        myCommand = new SqlCommand("UPDATE AssetDescriptionMaster SET  AssetDescription='" + txt_Asset.Text + "' WHERE AssetDescID='" + Session["AssetDescID"] + "'", myConnection);
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
        txt_Asset.Text = "";
       
    }
}