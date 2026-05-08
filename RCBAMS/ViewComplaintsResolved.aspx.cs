using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewComplaintsResolved : System.Web.UI.Page
{
    private static string connection = ConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;
    private SqlConnection con = new SqlConnection(connection);
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["EmployeeID"] == null)
        //{
        //    Response.Redirect("~/ErrorPage.aspx");
        //}
        SqlDataAdapter da = new SqlDataAdapter("select AssetClassID from RCBAMS..[ComplaintRegistration] where EmployeeID='" + Session["EmployeeID"] + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            Session["AssetClassID"] = dt.Rows[0]["AssetClassID"].ToString();
        }
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["ComplaintID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ComplaintID").ToString();
        Response.Redirect("~/Reopen.aspx");
    }

    protected void ASPxGridView1_CustomUnboundColumnData1(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }
}