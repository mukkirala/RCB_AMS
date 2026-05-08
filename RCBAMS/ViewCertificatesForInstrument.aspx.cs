using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCertificatesForInstrument : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "view")
        {
            string LocURL = Request.Url.Host + ":" + Request.Url.Port.ToString();
            string LocAppPath = Request.ApplicationPath;
            string Loc = "";
            if (LocAppPath == "")
            {
                Loc = "http://" + LocURL + "/PdfReports/CalibrationCertificate" + ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentID").ToString()+".pdf";
            }
            else
            {
                Loc = "http://" + LocURL + LocAppPath + "/PdfReports/CalibrationCertificate" + ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentID").ToString()+".pdf";
            }

            Response.Write("<script>");
            string winopen = "window.open('" + Loc + "', '_blank')";
            // Response.Write("window.open(Loc,'_blank')");
            Response.Write(winopen);
            Response.Write("</script>");
        }
    }

    protected void btnXLSX_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.MaxColumnWidth = 100;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();
        }
}