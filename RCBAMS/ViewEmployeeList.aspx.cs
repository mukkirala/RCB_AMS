using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewEmployeeList : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        DataTable dtm = new DataTable();
        // exporting dept data code starts....
        string query = "select * from vEmpDtlsAssetApp";
        da = new SqlDataAdapter(query, con);
        da.Fill(dtm);
        for (int i = 0; i < dtm.Rows.Count; i++)
        {
            string CustodianID = dtm.Rows[i]["CustodianID"].ToString();
            string CustodianDepartmentCode = dtm.Rows[i]["CustodianDepartmentCode"].ToString();
            string CustodianName = dtm.Rows[i]["CustodianName"].ToString();
            string Designation = dtm.Rows[i]["Designation"].ToString();
            string reporting_staff_no = dtm.Rows[i]["reporting_staff_no"].ToString();
            string email = dtm.Rows[i]["email"].ToString();
            cmd = new SqlCommand("IF(NOT EXISTS(SELECT * FROM CustodianMaster WHERE CustodianID = @CustodianID))BEGIN INSERT INTO CustodianMaster(CustodianID,CustodianDepartmentCode,CustodianName,Designation,reporting_staff_no,email)VALUES(@CustodianID,@CustodianDepartmentCode,@CustodianName,@Designation,@reporting_staff_no,@email)END", conAMS);
            cmd.Parameters.AddWithValue("@CustodianID", CustodianID);
            cmd.Parameters.AddWithValue("@CustodianDepartmentCode", CustodianDepartmentCode);
            cmd.Parameters.AddWithValue("@CustodianName", CustodianName);
            cmd.Parameters.AddWithValue("@Designation", Designation);
            cmd.Parameters.AddWithValue("@reporting_staff_no", reporting_staff_no);
            cmd.Parameters.AddWithValue("@email", email);
            conAMS.Open();
            cmd.ExecuteNonQuery();
            conAMS.Close();
        }
    }

    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "Employees Details";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Employees Details";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

       
    }

}