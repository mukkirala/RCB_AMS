using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewResolvedComplaintsDateWise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxButton3_Click(object sender, EventArgs e)
    {
        Session["fromdate"] = ASPxDateEdit1.Date.ToString("yyyy-MM-dd");
        Session["todate"] = ASPxDateEdit2.Date.ToString("yyyy-MM-dd");

    }

    protected void btn_pdf_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.PageHeader.Center = "View DateWise Resolved Complaints ";
        ASPxGridViewExporter1.PageHeader.Font.Bold= true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();

    }

    protected void btnexporttoxls_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void ViewResolvedComplaint_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
    {
        ASPxGridView gridView = (ASPxGridView)sender;
        string AssetID = e.GetValue("ComplaintID").ToString();
        string Status = e.GetValue("Status").ToString();
        // string ComplaintStatus = e.GetValue("ComplaintStatus").ToString();
        if (e.DataColumn.FieldName == "Status")
        {
            if (Status == "Pending")
            {
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
            else if (Status == "Resolved")
            {
                e.Cell.BackColor = System.Drawing.Color.Green;
            }
            else if (Status == "Work In Progress")
            {
                e.Cell.BackColor = System.Drawing.Color.Orange;
            }
            // }
            //if(e.DataColumn.FieldName == "ComplaintStatus")
            //{
            else if (Status == "Re_open")
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
            }
            else if (Status == "Assign")
            {
                e.Cell.BackColor = System.Drawing.Color.Orchid;
            }
        }
    }
}