using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnginnerViewRegisteredComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");


        }
    }

    protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }

    protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
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