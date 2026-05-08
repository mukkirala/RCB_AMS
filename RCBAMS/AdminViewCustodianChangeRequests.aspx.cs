using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewCustodianChangeRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

    }

    protected void AssetList_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["CustodianChangeID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianChangeID").ToString();
        Session["AssetID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["AssetTypeName"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["Requestedby"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Requestedby").ToString();
        Session["EmployeeID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
       
        Session["Date"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["Status"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["CustodianComments"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        Session["ApproverID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverID").ToString();
        Session["ApproverName"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverName").ToString();
        Session["ApproverDepartment"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDepartment").ToString();
       
        Session["ApproverDesignation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDesignation").ToString();
        Session["ApproverComments"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverComments").ToString();
        Session["ToCustodian"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ToCustodian").ToString();
        Session["RequestedChangeCustodian"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "RequestedChangeCustodian").ToString();
        Session["TransferTo"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "TransferTo").ToString();
        Session["TDept"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "TDept").ToString();
        Response.Redirect("AdminApprovalCustodianChangeRequests.aspx");

    }

    protected void DetailGrid1_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void DetailGrid2_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["RequestID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}