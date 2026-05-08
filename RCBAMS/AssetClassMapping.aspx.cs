using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssetClassMapping : System.Web.UI.Page
{
    SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string RoleType = WebConfigurationManager.AppSettings.Get("Roles");
        cmb_role.DataSource = RoleType.Split(',');
        cmb_role.DataBind();
    }
     
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if(cmb_assetclass.Value == null)
        {
            lbl_msg.Text = "Select Asset Class";
            return;
        }
        if (Cust_gridlookup.Value == null)
        {
            lbl_msg.Text = "Select Custodian";
            return;

        }


        if (btn_save.Text == "Save")
        {
            string query = "Select * from RoleMaster where ROLE_NAME='" + cmb_role.Value.ToString() + "' and AssetClassID= '" + cmb_assetclass.Value.ToString() + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, sqlcon);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string status = "update RoleMaster set ROLE_STATUS ='InActive' where ROLE_NAME='" + cmb_role.Value.ToString() + "' and AssetClassID= '" + cmb_assetclass.Value.ToString() + "'";
                SqlCommand myCommand1 = new SqlCommand(status, sqlcon);
                sqlcon.Open();
                myCommand1.ExecuteNonQuery();
                sqlcon.Close();
            }
            string code = cmb_assetclass.GridView.GetRowValues(cmb_assetclass.GridView.FocusedRowIndex, "DepartmentCode").ToString();
            SqlCommand myCommand = new SqlCommand("insert into RoleMaster(ROLE_NAME,CustodianID,ROLE_STATUS ,AssetClassID,CREATE_DATE)values(@ROLE_NAME,@CustodianID,@ROLE_STATUS ,@AssetClassID,@CREATE_DATE)", sqlcon);
            myCommand.Parameters.AddWithValue("ROLE_NAME", cmb_role.Text);
            myCommand.Parameters.AddWithValue("CustodianID", Cust_gridlookup.Value.ToString());
            myCommand.Parameters.AddWithValue("ROLE_STATUS", "Active");
           //  myCommand.Parameters.AddWithValue("DepartmentCode", code);
            myCommand.Parameters.AddWithValue("AssetClassID", cmb_assetclass.Value.ToString());
            myCommand.Parameters.AddWithValue("CREATE_DATE", System.DateTime.Now);

            sqlcon.Open();
            myCommand.ExecuteNonQuery();
            sqlcon.Close();


     

            clear();
            ASPxGridView1.DataBind();
        }
        else if (btn_save.Text == "Update")
        {

            SqlCommand cmd1 = new SqlCommand("update RoleMaster set ROLE_NAME=@ROLE_NAME,CustodianID=@CustodianID,CREATE_DATE=@CREATE_DATE,AssetClassID=@AssetClassID where ROLE_ID=@ROLE_ID", sqlcon);
            cmd1.Parameters.AddWithValue("@ROLE_NAME", cmb_role.Text);
            cmd1.Parameters.AddWithValue("@CustodianID", Cust_gridlookup.Value.ToString());
            cmd1.Parameters.AddWithValue("@ROLE_STATUS", "Active");
            cmd1.Parameters.AddWithValue("@AssetClassID", cmb_assetclass.Value.ToString());
            cmd1.Parameters.AddWithValue("@CREATE_DATE", System.DateTime.Now);
            cmd1.Parameters.AddWithValue("@ROLE_ID", Session["ROLE_ID"].ToString());

            sqlcon.Open();
            cmd1.ExecuteNonQuery();
            sqlcon.Close();

            clear();

            ASPxGridView1.DataBind();

            btn_save.Text = "Save";
        }
    }
     protected void clear()
    {
        cmb_assetclass.Value = "";
        cmb_role.Value = "";
        Cust_gridlookup.Value = "";

    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["ROLE_ID"] = e.KeyValue;
        if (btn == "Edit")
        {
            cmb_role.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ROLE_NAME").ToString();
            Cust_gridlookup.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            cmb_assetclass.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetClassID").ToString();

            btn_save.Text = "Update";
        }
        else if (btn == "Delete")
        {
            string Delete = "update RoleMaster set ROLE_STATUS='InActive'  where ROLE_ID='" + Session["ROLE_ID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(Delete, sqlcon);
            sqlcon.Open();
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            ASPxGridView1.DataBind();
        }
    }
}