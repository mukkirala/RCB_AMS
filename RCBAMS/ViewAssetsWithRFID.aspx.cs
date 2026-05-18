using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView;

public partial class ViewAssetsWithRFID : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "AssetsWithRFID_" + DateTime.Now.ToString("ddMMyyyyhhmmss");
        ASPxGridViewExporter1.MaxColumnWidth = 150;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "AssetsWithRFID_" + DateTime.Now.ToString("ddMMyyyyhhmmss");
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}
