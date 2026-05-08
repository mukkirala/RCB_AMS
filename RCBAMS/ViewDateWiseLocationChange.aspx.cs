using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDateWiseLocationChange : System.Web.UI.Page
{
    SqlConnection myConnection1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);

    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxButton3_Click(object sender, EventArgs e)
    {

    }

    //protected void ASPxButton2_Click(object sender, EventArgs e)
    //{

    //    ASPxGridViewExporter1.PageHeader.Center = "View DateWise Location Change";
    //    ASPxGridViewExporter1.PageHeader.Font.Bold = true;
    //    ASPxGridViewExporter1.MaxColumnWidth = 75;
    //    ASPxGridViewExporter1.Landscape = true;
    //    ASPxGridViewExporter1.WritePdfToResponse();
    //}

    //protected void ASPxButton1_Click(object sender, EventArgs e)
    //{
       
    //}

    protected void ASPxButton3_Click1(object sender, EventArgs e)
    {
       // string LocationChangeID = (string)(Session["LocationChangeID"]);
        Session["fromdate"] = ASPxDateEdit1.Date.ToString("yyyy-MM-dd");
        Session["todate"] = ASPxDateEdit2.Date.ToString("yyyy-MM-dd");
       

    }

    protected void btnexporttoxls_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.PageHeader.Center = "View DateWise Location Change";
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();
    }
}