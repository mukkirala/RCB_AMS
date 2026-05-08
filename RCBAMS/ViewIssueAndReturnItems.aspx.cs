using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewIssueAndReturnItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Issued Assets";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "Issued Assets";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Returned Assets";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "Returned Assets";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}