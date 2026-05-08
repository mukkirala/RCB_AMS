using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DepartmentMaster : System.Web.UI.Page
{

    static string constr = ConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    SqlConnection con = new SqlConnection(constr);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());

    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        if (btn_Save.Text == "Save")
        {
            string insert = "insert into DepartmentMaster(DepartmentCode,DepartmentName,DepartmentStatus)VALUES(@DepartmentCode,@DepartmentName,@DepartmentStatus)";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.Parameters.AddWithValue("DepartmentCode", txt_Deptcode.Text);
            cmd.Parameters.AddWithValue("DepartmentName", txtDeptName.Text);
            cmd.Parameters.AddWithValue("DepartmentStatus", "Active");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lbl_msg.Text = "Data Saved Successfully";
            clear();
            Grid_Departments.DataBind();
        }
        else if(btn_Save.Text=="Update")
        {
            string update = "update DepartmentMaster set DepartmentCode=@DepartmentCode,DepartmentName=@DepartmentName where DepartmentCode='" + ViewState["DepartmentCode"].ToString() +"' ";
           SqlCommand cmd = new SqlCommand(update, con);
            cmd.Parameters.AddWithValue("DepartmentCode", txt_Deptcode.Text);
            cmd.Parameters.AddWithValue("DepartmentName", txtDeptName.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lbl_msg.Text = "Data Updated Successfully";
            clear();
            Grid_Departments.DataBind();
        }
    }

    void clear()
    {
        txt_Deptcode.Text = "";
        txtDeptName.Text = "";
    }

    protected void Grid_Departments_RowCommand1(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        string id = Grid_Departments.GetRowValuesByKeyValue(e.KeyValue, "DepartmentCode").ToString();
        ViewState["DepartmentCode"] = id;
        if (btn == "Edit")
        {
            txt_Deptcode.Text = Grid_Departments.GetRowValuesByKeyValue(e.KeyValue, "DepartmentCode").ToString();
            txtDeptName.Text = Grid_Departments.GetRowValuesByKeyValue(e.KeyValue, "DepartmentName").ToString();
            btn_Save.Text = "Update";
        }
        else if (btn == "Delete")
        {
            string delete = "Update DepartmentMaster set DepartmentStatus = 'InActive' where DepartmentCode = '" + id + "'";
            SqlCommand cmd = new SqlCommand(delete, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lbl_msg.Text = "Data Deleted Successfully";
            Grid_Departments.DataBind();
        }

    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}