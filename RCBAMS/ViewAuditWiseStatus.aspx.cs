using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAuditWiseStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        if(!IsPostBack)
        {
            Session["ID"] = "";
            Session["AuditStatus"] = "";
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = true;
        if (ASPxComboBox1.Text == "")
        {
            lbl_msg.Text = "Select Audit Name";
            lbl_msg.Visible = true;
            return;
        }
        if (cmb_Status.Text == "")
        {
            lbl_msg.Text = "Select Status";
            lbl_msg.Visible = true;
            return;
        }
        Session["ID"] = ASPxComboBox1.Value.ToString();
        Session["AuditStatus"] = cmb_Status.Text.ToString();
        lbl_message.Text = Convert.ToDateTime(ASPxComboBox1.GridView.GetRowValues(ASPxComboBox1.GridView.FocusedRowIndex, "AuditDate")).ToString("dd-MMM-yyyy");
    }
    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "AuditWiseStatusList";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "AuditWiseStatusList";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }
}