using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Collections;

public partial class AddInstrumentSAPMaster : System.Web.UI.Page
{
    DatabaseConnection Db = new DatabaseConnection();
    SqlCommand cmd;
   

    protected void Page_Load(object sender, EventArgs e)
    {
      
        lbl_date.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txt_sapcode.Text == "")
        {
            lbl_msg.Text = "Please Enter the SAP Code";
            return;
        }
        cmd = new SqlCommand("INSERT INTO AssetSapMaster(AssetSapCode,CreatedDate) Values(@AssetSapCode,@Date)");
        cmd.Parameters.AddWithValue("@AssetSapCode", txt_sapcode.Text);
        cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
        Db.OpenConnection();
        Db.ExecuteNonQuery(cmd);
        Db.CloseConnection();
        ASPxGridView1.DataBind();
        lbl_msg.Text = "Data Saved Successfully!";
        txt_sapcode.Text = "";
    }
    
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (txt_sapcode.Text == "")
        {
            lbl_msg.Text = "Please Enter the SAP Code";
            return;
        }
        cmd = new SqlCommand("Update AssetSapMaster set AssetSapCode=@AssetSapCode WHERE AssetSapID=@AssetSapID");
        cmd.Parameters.AddWithValue("@AssetSapCode", txt_sapcode.Text);
        cmd.Parameters.AddWithValue("@AssetSapID", Session["AssetSapID"].ToString());
        Db.OpenConnection();
        Db.ExecuteNonQuery(cmd);
        Db.CloseConnection();
        ASPxGridView1.DataBind();
        lbl_msg.Text = "Data Updated Successfully!";
        txt_sapcode.Text = "";
        btnsave.Visible = true;
        btnupdate.Visible = false;
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["AssetSapID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetSapID").ToString();
        if (btn == "Edit")
        {
            txt_sapcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetSapCode").ToString();
            btnsave.Visible = false;
            btnupdate.Visible = true;
        }
        else if (btn == "Delete")
        {

            cmd = new SqlCommand("Delete from AssetSapMaster WHERE AssetSapID=@AssetSapID");
            cmd.Parameters.AddWithValue("@AssetSapID", Session["AssetSapID"].ToString());
            Db.OpenConnection();
            Db.ExecuteNonQuery(cmd);
            Db.CloseConnection();
            lbl_msg.Text = "Data Deleted Successfully!";
            ASPxGridView1.DataBind();
            btnsave.Visible = true;
            btnupdate.Visible = false;
        }
    }
}