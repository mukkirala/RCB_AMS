using DevExpress.Web.ASPxGridView;
using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

public partial class ApproverAuthorizationRequisition : System.Web.UI.Page
{
    SqlConnection myconnection =
        new SqlConnection(
        WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxGridView1_RowCommand(
        object sender,
        ASPxGridViewRowCommandEventArgs e)
    {
        string click = e.CommandArgs.CommandName.ToString();

        object objReqID =
            ASPxGridView1.GetRowValuesByKeyValue(
            e.KeyValue,
            "ReqID");

        if (objReqID == null)
        {
            return;
        }

        string ReqID = objReqID.ToString();

        Session["ReqID"] = ReqID;

        try
        {
            if (myconnection.State ==
                System.Data.ConnectionState.Closed)
            {
                myconnection.Open();
            }

            if (click == "Approve")
            {
                SqlCommand mycommand =
                    new SqlCommand(
                    "UPDATE POSRequisitionParent " +
                    "SET Status=@Status " +
                    "WHERE ReqID=@ReqID",
                    myconnection);

                mycommand.Parameters.AddWithValue(
                    "@Status",
                    "Approved");

                mycommand.Parameters.AddWithValue(
                    "@ReqID",
                    ReqID);

                mycommand.ExecuteNonQuery();
            }

            else if (click == "Reject")
            {
                SqlCommand mycommand =
                    new SqlCommand(
                    "UPDATE POSRequisitionParent " +
                    "SET Status=@Status " +
                    "WHERE ReqID=@ReqID",
                    myconnection);

                mycommand.Parameters.AddWithValue(
                    "@Status",
                    "Rejected");

                mycommand.Parameters.AddWithValue(
                    "@ReqID",
                    ReqID);

                mycommand.ExecuteNonQuery();
            }

            else if (click == "View")
            {
                Response.Redirect("ApprovePage.aspx");
            }

            ASPxGridView1.DataBind();
            ASPxGridView3.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            myconnection.Close();
        }
    }

    protected void ASPxGridView2_BeforePerformDataSelect(
        object sender,
        EventArgs e)
    {
        Session["ReqID"] =
            (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}