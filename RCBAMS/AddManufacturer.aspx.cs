using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
public partial class AddManufacturer : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    string date = System.DateTime.Now.Date.ToString("yyyy-MM-dd");
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        lbl_dsplay.Visible = false;
        if (txt_manufname.Text == "")
        {
            lbl_dsplay.Text = "Enter Manufacture Name";
            lbl_dsplay.Visible = true;
            return;
        }
        string insertq = "insert into ManufacturerMaster ([ManufacturerName],[ManufacturerCode],[Status]) Values (@ManufacturerName,@ManufacturerCode,@Status)";
        myCommand = new SqlCommand(insertq, myConnection);
        myCommand.Parameters.AddWithValue("@ManufacturerName", txt_manufname.Text);
        myCommand.Parameters.AddWithValue("@ManufacturerCode", txt_manufcode.Text);
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        lbl_dsplay.Text = "Data Saved Successfully";
        Clear();

    }
    protected void Clear()
    {
        txt_manufname.Text = "";
        txt_manufcode.Text = "";
    }


    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string ManufacturerID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ManufacturerID").ToString();
            Session["ManufacturerID"] = ManufacturerID;
            txt_manufname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ManufacturerName").ToString();
            txt_manufcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ManufacturerCode").ToString();

            btn_Update.Visible = true;
            btn_save.Visible = false;

        }
        if (btn == "Delete")
        {
            
            string DepartmentID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ManufacturerID").ToString();
            string Query2 = "UPDATE [ManufacturerMaster] SET Status='InActive' Where ManufacturerID='" + DepartmentID + "'";
            myCommand = new SqlCommand(Query2, myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            btn_Update.Visible = false;
            btn_save.Visible = true;
            Clear();
            lbl_dsplay.Visible = false;
            Messages.SetSuccessMessage("0061", null, Session);

        }
    }

    protected void btn_Update_Click(object sender, EventArgs e)
    {
        if (txt_manufname.Text == "")
        {
            lbl_dsplay.Text = "Enter Manufacture Name";
            lbl_dsplay.Visible = true;
            return;
        }
        myCommand = new SqlCommand("UPDATE ManufacturerMaster SET  ManufacturerName='" + txt_manufname.Text + "',ManufacturerCode='" + txt_manufcode.Text + "' WHERE ManufacturerID='" + Session["ManufacturerID"] + "'", myConnection);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        Messages.SetSuccessMessage("0060", null, Session);
        Clear();
        ASPxGridView1.DataBind();

    }
}