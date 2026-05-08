using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDateWiseAssets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxButton3_Click(object sender, EventArgs e)
    {
        Session["fromdate"] = FromDate.Date.ToString("yyyy-MM-dd");
        Session["todate"] = todate.Date.ToString("yyyy-MM-dd");
    }

    protected void btn_pdf_Click(object sender, ImageClickEventArgs e)
    {

        ASPxGridViewExporter1.PageHeader.Center = "View DateWise Asset List ";
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void btnexporttoxls_Click(object sender, ImageClickEventArgs e)
    {

        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}