using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SingleReportPdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string BarcodeReportID = Session["BarcodeReportID"].ToString();
        Response.Redirect("~//PdfReports//SingleQRPrint//BarcodeImages_" + BarcodeReportID + ".Pdf");
    }
}