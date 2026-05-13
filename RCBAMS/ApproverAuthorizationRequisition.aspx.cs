using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproverAuthorizationRequisition : System.Web.UI.Page
{
    SqlConnection myconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //string id = Session["GodownID"].ToString();
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string click = e.CommandArgs.CommandName.ToString();
        string ReqID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ReqID").ToString();
        Session["ReqID"] = ReqID;
        //myconnection.Open();
        if (click == "Approve")
        {
            myconnection.Open();
            SqlCommand mycommand = new SqlCommand("Update POSRequisitionParent Set Status='Approved' Where ReqID='" + ReqID + "'", myconnection);
            mycommand.ExecuteNonQuery();
        }
        else if (click == "Reject")
        {
            myconnection.Open();
            SqlCommand mycommand = new SqlCommand("Update POSRequisitionParent Set Status='Rejected' Where ReqID='" + ReqID + "'", myconnection);
            mycommand.ExecuteNonQuery();
        }
        else
        {
            Response.Redirect("ApprovePage.aspx");
        }
        ASPxGridView1.DataBind();
        myconnection.Close();
    }
    protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["ReqID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}