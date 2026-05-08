using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCustodianByDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        if (!IsPostBack)
        {
            Session["DepartmentCode"] = "";
        }
        
    }

    //protected void btn_search_Click(object sender, EventArgs e)
    //{
    //    lbl_msg.Visible = false;
    //    if (ASPxComboBox1.Text == "")
    //    {
    //        lbl_msg.Text = "Select Department";
    //        lbl_msg.Visible = true;
    //        return;
    //    }
    //    else
    //    {
    //        Session["DepartmentCode"] = ASPxComboBox1.Value.ToString();
    //    }
    //}

    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "CustodianListByDepartment";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "CustodianListByDepartment";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }

}