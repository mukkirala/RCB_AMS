using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewAssetRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
    }
    protected void DetailGrid_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["AssetRequestID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void ASPxGridView2_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {

        Session["AssetRequestID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "AssetRequestID").ToString();
        Session["AssetTypeID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeID").ToString();
        Session["AssetTypeName"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["RequestBy"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "RequestBy").ToString();
        Session["CustodianID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["RequestedQuantity"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "RequestedQuantity").ToString();
        Session["ApprovedQuantity"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ApprovedQuantity").ToString();
        Session["RequestedDate"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["CustodianDepartment"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["CustDesignation"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        Session["EmployeeID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        //Session["CustodianComments"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        Session["ApproverID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ApproverID").ToString();
        Session["ApproverName"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ApproverName").ToString();
        Session["ApproverDepartment"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ApproverDepartment").ToString();
        Session["ApproverDesignation"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ApproverDesignation").ToString();
        Session["ApproverComments"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "ApproverComments").ToString();
        Session["CustLocation"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "Location").ToString();
        Session["CustLocationCode"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();
        Session["BLOCK"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "BLOCK").ToString();
        Response.Redirect("AdminApproveAssetRequest");
    }
}