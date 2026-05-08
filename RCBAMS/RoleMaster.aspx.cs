using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView;
using System.Data;


public partial class RoleMaster : System.Web.UI.Page
{
    SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        string RoleType = WebConfigurationManager.AppSettings.Get("Roles");
        ASPxComboBox1.DataSource = RoleType.Split(',');
        ASPxComboBox1.DataBind();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (ASPxComboBox1.Text == "")
        {
            lbl_msg.Text = "Select Role";
            lbl_msg.Visible = true;
            return;
        }

        if (Cust_gridlookup.Text == "")
        {
            lbl_msg.Text = "Select Employee";
            lbl_msg.Visible = true;
            return;
        }

        if (btn_save.Text == "Save")
        {
            string query = "Select * from RoleMaster where CustodianID='" + Cust_gridlookup.Value.ToString() + "'";
            da = new SqlDataAdapter(query, sqlcon);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string status = "update RoleMaster set ROLE_STATUS ='Active' where CustodianID='" + Cust_gridlookup.Value.ToString() + "'";
                myCommand = new SqlCommand(status, sqlcon);
                sqlcon.Open();
                myCommand.ExecuteNonQuery();
                sqlcon.Close();
            }
            myCommand = new SqlCommand("insert into RoleMaster(ROLE_NAME,CustodianID,ROLE_STATUS ,CREATE_DATE)values(@ROLE_NAME,@CustodianID,@ROLE_STATUS ,@CREATE_DATE)", sqlcon);
            myCommand.Parameters.AddWithValue("ROLE_NAME", ASPxComboBox1.Text);
            myCommand.Parameters.AddWithValue("CustodianID", Cust_gridlookup.Value.ToString());
            myCommand.Parameters.AddWithValue("ROLE_STATUS", "Active");
            myCommand.Parameters.AddWithValue("CREATE_DATE", System.DateTime.Now);
            sqlcon.Open();
            myCommand.ExecuteNonQuery();
            sqlcon.Close();
            Clear();
            ASPxGridView1.DataBind();
        }
        else if (btn_save.Text == "Update")
        {
           
            SqlCommand cmd1 = new SqlCommand("update RoleMaster set ROLE_NAME=@ROLE_NAME,CustodianID=@CustodianID,CREATE_DATE=@CREATE_DATE where ROLE_ID=@ROLE_ID", sqlcon);
            cmd1.Parameters.AddWithValue("@ROLE_NAME", ASPxComboBox1.Text);
            cmd1.Parameters.AddWithValue("@CustodianID", Cust_gridlookup.Value.ToString());
            //cmd1.Parameters.AddWithValue("@ROLE_STATUS", "Active");
            cmd1.Parameters.AddWithValue("@CREATE_DATE", System.DateTime.Now);
            cmd1.Parameters.AddWithValue("@ROLE_ID", Session["ROLE_ID"].ToString());

            sqlcon.Open();
            cmd1.ExecuteNonQuery();
            sqlcon.Close();

            Clear();

            ASPxGridView1.DataBind();

            btn_save.Text = "Save";
        }


    }

    private void Clear()
    {
        ASPxComboBox1.Value = "";
        Cust_gridlookup.Value = "";
        
    }

    protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["ROLE_ID"] = e.KeyValue;
        if (btn == "Edit")
        {
            ASPxComboBox1.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ROLE_NAME").ToString();
            Cust_gridlookup.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();

            btn_save.Text = "Update";
        }


        else if (btn == "Delete")
        {
            string Delete = "update RoleMaster set ROLE_STATUS='InActive'  where ROLE_ID='" + Session["ROLE_ID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(Delete,sqlcon);
            sqlcon.Open();
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            ASPxGridView1.DataBind();
        }

    }
}