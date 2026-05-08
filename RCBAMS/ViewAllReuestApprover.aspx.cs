using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAllReuestApprover : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    int id = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

        GetAllRequests();
    }

    protected void GetAllRequests()
    {
        string select1 = "select AssetRequestID as RequestID,RequestType,AssetTypeName as AssetName,Date as RequestedDate,EmployeeAssetRequest.Status from EmployeeAssetRequest inner join RCBSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID = EmployeeAssetRequest.AssetTypeID where RequestType!='' and ApproverID='" + Session["UserID"] + "'";
        SqlCommand cmd1 = new SqlCommand(select1, conAMS);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable datatable1 = new DataTable();
        da1.Fill(datatable1);

        string select2 = "select BuybackRequestID as RequestID,RequestType,AssetMaster.AssetDesc as AssetName,Date as RequestedDate,EmployeeAssetBuyback.Status from EmployeeAssetBuyback inner join RCBSAP..AssetMaster on AssetMaster.AssetID = EmployeeAssetBuyback.AssetID where RequestType!='' and ApproverID='" + Session["UserID"] + "'";
        SqlCommand cmd2 = new SqlCommand(select2, conAMS);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataTable datatable2 = new DataTable();
        da2.Fill(datatable2);

        string select3 = "select LocationChangeID as RequestID,RequestType,AssetMaster.AssetDesc as AssetName,Date as RequestedDate,EmployeeLocationChange.Status from EmployeeLocationChange inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeLocationChange.AssetID where RequestType!=''  and ApproverID = '" + Session["UserID"] + "'";
        SqlCommand cmd3 = new SqlCommand(select3, conAMS);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable datatable3 = new DataTable();
        da3.Fill(datatable3);

        string select4 = "select CustodianChangeID as RequestID,RequestType,AssetMaster.AssetDesc as AssetName,Date as RequestedDate,CustodianChangeRequest.Status from CustodianChangeRequest inner join RCBSAP..AssetMaster on AssetMaster.AssetID = CustodianChangeRequest.AssetID where RequestType!='' and ApproverID='" + Session["UserID"] + "'";
        SqlCommand cmd4 = new SqlCommand(select4, conAMS);
        SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
        DataTable datatable4 = new DataTable();
        da4.Fill(datatable4);

        string select5 = "select AssetReturnID as RequestID,RequestType,AssetMaster.AssetDesc as AssetName,Date as RequestedDate,EmployeeAssetReturn.Status from EmployeeAssetReturn inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetReturn.AssetID where RequestType!=''";
        SqlCommand cmd5 = new SqlCommand(select5, conAMS);
        SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
        DataTable datatable5 = new DataTable();
        da5.Fill(datatable5);

        DataTable dt_copy = new DataTable();

        dt_copy.Merge(datatable1);
        dt_copy.Merge(datatable2);
        dt_copy.Merge(datatable3);
        dt_copy.Merge(datatable4);
        dt_copy.Merge(datatable5);
        dt_copy.AcceptChanges();
        //dt_copy = datatable1.Copy();

        dt_copy.Columns.Add("ID", typeof(System.Int32));

        foreach (DataRow row in dt_copy.Rows)
        {

            row["ID"] = id;
            id = id + 1;
        }
        dt_copy.DefaultView.Sort = "RequestedDate desc";
        ASPxGridView1.DataSource = dt_copy;
        ASPxGridView1.DataBind();

    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {

        Session["RequestID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "RequestID").ToString();
        Session["RequestType"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "RequestType").ToString();
        Session["Status"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["AssetName"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetName").ToString();
        Response.Redirect("ReuestDetailsApprover.aspx");
    }
}