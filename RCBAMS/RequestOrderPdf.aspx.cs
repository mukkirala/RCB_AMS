using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestOrderPdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string requestid = Session["reqid"].ToString();
        Response.Redirect("~//PdfReports//RequestOrder//Requestorder_"+ requestid.Trim() + ".pdf");
    }
}