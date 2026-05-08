using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEmployee : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtuserid.Text == "")
            {
                lbl_msg.Text = "UserID Required";
                return;
            }
            if (txtusrname.Text == "")
            {
                lbl_msg.Text = "UserName Required";
                return;
            }
            if (txtemail.Text == "")
            {
                lbl_msg.Text = "Enter Email ID";
                return;
            }
            if (ASPxTextBox1.Text == "")
            {
                lbl_msg.Text = "Enter Password";
                return;
            }
            if (btn_save.Text == "Save")
            {
                myCommand = new SqlCommand("IF(NOT EXISTS(SELECT * FROM CustodianMaster WHERE CustodianID = @CustodianID))BEGIN Insert into CustodianMaster(CustodianID,CustodianName,email,Designation,NonBel_Password)values(@CustodianID,@CustodianName,@email,@Designation,@NonBel_Password)END", conAMS);
                myCommand.Parameters.AddWithValue("CustodianID", txtuserid.Text.ToLower());
                myCommand.Parameters.AddWithValue("CustodianName", txtusrname.Text);
                myCommand.Parameters.AddWithValue("email", txtemail.Text);
                myCommand.Parameters.AddWithValue("Designation", "Non User");
                myCommand.Parameters.AddWithValue("NonBel_Password", ASPxTextBox1.Text);

                conAMS.Open();
                myCommand.ExecuteNonQuery();
                conAMS.Close();
                Clear();
                ASPxGridView1.DataBind();
                lbl_msg.Text = "Saved Successfully";

            }
            else if (btn_save.Text == "Update")
            {

                SqlCommand cmd1 = new SqlCommand("update CustodianMaster set CustodianID=@CustodianID,CustodianName=@CustodianName,email=@email,NonBel_Password=@NonBel_Password where CustodianID=@CustodianID", conAMS);
                cmd1.Parameters.AddWithValue("@CustodianID", txtuserid.Text.ToLower());
                cmd1.Parameters.AddWithValue("@CustodianName", txtusrname.Text);
                cmd1.Parameters.AddWithValue("@email", txtemail.Text);
                cmd1.Parameters.AddWithValue("@NonBel_Password", ASPxTextBox1.Text);
                //myCommand.Parameters.AddWithValue("Designation", "Non User");

                conAMS.Open();
                cmd1.ExecuteNonQuery();
                conAMS.Close();
                Clear();
                ASPxGridView1.DataBind();
                btn_save.Text = "Save";
                lbl_msg.Text = "Updated Successfully";

            }
        }
        catch(Exception ex)
        {

        }
    }

    private void Clear()
    {
        txtuserid.Text = txtusrname.Text = txtemail.Text = ASPxTextBox1.Text="";
        txtuserid.ReadOnly = false;
    }




    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["Non_ID"] = e.KeyValue;
        txtuserid.ReadOnly = true;
        if (btn == "Edit")
        {
            txtuserid.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            txtusrname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianName").ToString();
            txtemail.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "email").ToString();
            ASPxTextBox1.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "NonBel_Password").ToString();

            btn_save.Text = "Update";
        }


        else if (btn == "Delete")
        {
            string Delete = "delete from CustodianMaster where CustodianID='" + Session["Non_ID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(Delete, conAMS);
            conAMS.Open();
            cmd.ExecuteNonQuery();
            conAMS.Close();
            ASPxGridView1.DataBind();
            lbl_msg.Text = "Deleted Successfully";

        }
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        

    }
}