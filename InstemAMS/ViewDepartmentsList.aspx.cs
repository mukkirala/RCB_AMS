using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDepartmentsList : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
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
        string query = "select * from vDepartmentAssetApp";
        da = new SqlDataAdapter(query, con);
        da.Fill(dtm);
        for (int i = 0; i < dtm.Rows.Count; i++)
        {
            string DepartmentCode = dtm.Rows[i]["DepartmentCode"].ToString();
            string DepartmentName = dtm.Rows[i]["DepartmentName"].ToString();
            cmd = new SqlCommand("IF(NOT EXISTS(SELECT * FROM DepartmentMaster WHERE DepartmentCode = @DepartmentCode))BEGIN INSERT INTO DepartmentMaster(DepartmentCode,DepartmentName)VALUES(@DepartmentCode,@DepartmentName)END", conAMS);
            cmd.Parameters.AddWithValue("@DepartmentCode", DepartmentCode);
            cmd.Parameters.AddWithValue("@DepartmentName", DepartmentName);
            conAMS.Open();
            cmd.ExecuteNonQuery();
            conAMS.Close();
        }
    }



    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "Department Details";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Department Details";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();
    }

}