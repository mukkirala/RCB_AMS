using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAssetsByCustodian : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        ASPxGridViewExporter1.PageHeader.Center = "View Assets By Coustidion";
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();

    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}