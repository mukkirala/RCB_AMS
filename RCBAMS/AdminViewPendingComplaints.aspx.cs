using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class AdminViewPendingComplaints : System.Web.UI.Page
{
    private static string connection = ConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    private SqlConnection con = new SqlConnection(connection);
    string CreatedDate;
    DateTime date;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");


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
        }
    }

    protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        Session["ComplaintTransactionID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ComplaintTransactionID").ToString();
        Response.Redirect("~/AdminAssignPendingComplaints.aspx");
    }

    protected void ASPxGridView2_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        Session["ComplaintTransactionID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ComplaintTransactionID").ToString();


        Response.Redirect("~/AdminViewPendingComplaints.aspx");
    }
}