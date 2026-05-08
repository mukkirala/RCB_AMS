using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AddAssetStatus : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
        ASPxGridView1.DataBind();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_statusname.Text == "")
        {
            lbl_msg.Text = "Enter Status Name";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_statuscode.Text == "")
        {
            lbl_msg.Text = "Enter Status Code";
            lbl_msg.Visible = true;
            return;
        }
        string insertq = "insert into StatusMaster ([StatusName] ,[StatusCode],[Status]) Values (@StatusName,@StatusCode,@Status)";
        myCommand = new SqlCommand(insertq, myConnection);
        myCommand.Parameters.AddWithValue("@StatusName", txt_statusname.Text);
        myCommand.Parameters.AddWithValue("@StatusCode", txt_statuscode.Text);
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open(); ;
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
        if (txt_statusname.Text == "")
        {
            lbl_msg.Text = "Enter Status Name";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_statuscode.Text == "")
        {
            lbl_msg.Text = "Enter Status Code";
            lbl_msg.Visible = true;
            return;
        }
        myCommand = new SqlCommand("UPDATE StatusMaster SET  StatusName='" + txt_statusname.Text + "',StatusCode='" + txt_statuscode.Text+ "' WHERE StatusID='" + Session["StatusID"] + "'", myConnection);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("0060", null, Session);
        Clear();
        btn_Update.Visible = false;
        btn_save.Visible = true;
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {

        lbl_msg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string StatusID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "StatusID").ToString();
            Session["StatusID"] = StatusID;

            txt_statusname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "StatusName").ToString();
            txt_statuscode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "StatusCode").ToString();
            btn_Update.Visible = true;
            btn_save.Visible = false;

        }
        if (btn == "Delete")
        {
            lbl_msg.Text = "";
            string StatusID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "StatusID").ToString();
            string Query2 = "UPDATE [StatusMaster] SET Status='InActive' Where StatusID='" + StatusID + "'";
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

    protected void Clear()
    {
        txt_statusname.Text = "";
        txt_statuscode.Text = "";
    }
}