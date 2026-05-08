using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BudgetSanctionPdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //string requestid = Session["ReqID"].ToString();
        //Response.Redirect("~//PdfReports//BudgetSanction//BudgetSanction_" + requestid.Trim() + ".jpg");
        Response.Redirect("~//QRImages//000AAA111BBB.jpg");
    }
}