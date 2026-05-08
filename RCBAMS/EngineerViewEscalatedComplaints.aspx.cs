using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EngineerViewEscalatedComplaints : System.Web.UI.Page
{
    string ComplaintID;
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
        ComplaintID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ComplaintID").ToString();
        Session["ComplaintID"] = ComplaintID;
        Response.Redirect("~/EngineerViewEscalatedComplaints.aspx");
    }
}