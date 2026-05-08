using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


public partial class ViewAssignedComplaints : System.Web.UI.Page
{
    private static string connection = ConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString;
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
    protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["ComplaintTransactionID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ComplaintTransactionID").ToString();

        Response.Redirect("~/AssignedGEPendingComplaints.aspx");

    }
 }