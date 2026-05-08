using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class BuyBackMailAssign : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
        SqlCommand myCommand;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] ==null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        string RoleType = WebConfigurationManager.AppSettings.Get("BuyBackAuthority");
        ASPxComboBox1.DataSource = RoleType.Split(',');
        ASPxComboBox1.DataBind();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {

        //lbl_msg.Visible = false;
        if (ASPxComboBox1.Text == "")
        {
            lbl_msg.Text = "Select Department";
            lbl_msg.Visible = true;
            return;
        }

        if (Cust_gridlookup.Text == "")
        {
            lbl_msg.Text = "Select Custodian";
            lbl_msg.Visible = true;
            return;
        }

        if (btn_save.Text == "Save")
        {
            myCommand = new SqlCommand("insert into RoleMaster(ROLE_NAME,CustodianID,ROLE_STATUS ,CREATE_DATE)values(@ROLE_NAME,@CustodianID,@ROLE_STATUS ,@CREATE_DATE)", conAMS);
            myCommand.Parameters.AddWithValue("ROLE_NAME", ASPxComboBox1.Text);
            myCommand.Parameters.AddWithValue("CustodianID", Cust_gridlookup.Value.ToString());
            myCommand.Parameters.AddWithValue("ROLE_STATUS", "Active");
            myCommand.Parameters.AddWithValue("CREATE_DATE", System.DateTime.Now);
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            conAMS.Close();
            Clear();
            ASPxGridView1.DataBind();
            lbl_msg.Text = "Saved Successfully";

        }
        else if (btn_save.Text == "Update")
        {
           
            SqlCommand cmd1 = new SqlCommand("update RoleMaster set ROLE_NAME=@ROLE_NAME,CustodianID=@CustodianID,CREATE_DATE=@CREATE_DATE where ROLE_ID=@ROLE_ID", conAMS);
            cmd1.Parameters.AddWithValue("@ROLE_NAME", ASPxComboBox1.Text);
            cmd1.Parameters.AddWithValue("@CustodianID", Cust_gridlookup.Value.ToString());
            //cmd1.Parameters.AddWithValue("@ROLE_STATUS", "Active");
            cmd1.Parameters.AddWithValue("@CREATE_DATE", System.DateTime.Now);
            cmd1.Parameters.AddWithValue("@ROLE_ID", Session["ROLE_ID"].ToString());
            conAMS.Open();
            cmd1.ExecuteNonQuery();
            conAMS.Close();
            Clear();
            ASPxGridView1.DataBind();
            btn_save.Text = "Save";
            lbl_msg.Text = "Updated Successfully";

        }

    }



    private void Clear()
    {
        ASPxComboBox1.Value = "";
        Cust_gridlookup.Value = "";

    }




    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["ROLE_ID"] = e.KeyValue;
        if (btn == "Edit")
        {
            ASPxComboBox1.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
            Cust_gridlookup.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();

            btn_save.Text = "Update";
        }


        else if (btn == "Delete")
        {
            string Delete = "update RoleMaster set ROLE_STATUS='InActive'  where ROLE_ID='" + Session["ROLE_ID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(Delete, conAMS);
            conAMS.Open();
            cmd.ExecuteNonQuery();
            conAMS.Close();
            ASPxGridView1.DataBind();
            lbl_msg.Text = "Record InActivated Successfull";

        }
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        //try
        //{
        //    if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
        //    string test = (e.GetValue("ROLE_STATUS").ToString());
        //    Session["ROLE_STATUS"] = test;
        //    if (Session["ROLE_STATUS"].ToString() == "Active")
        //    {
        //        e.Row.BackColor = System.Drawing.Color.FromName("rgb(108, 235, 112)");//207, 207, 207,
        //    }
        //    else if (Session["ROLE_STATUS"].ToString() == "InActive")
        //    {
        //        e.Row.BackColor = System.Drawing.Color.FromName("rgb(242, 116, 116)");
        //    }
        //}
        //catch (Exception ex)
        //{

        //}
    }
}
