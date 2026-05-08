using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAssetsLocationWise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_search_Click(object sender, EventArgs e)
    {

    }


    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "AssetLocationWiseList";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "AssetLocationWiseList";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }



}