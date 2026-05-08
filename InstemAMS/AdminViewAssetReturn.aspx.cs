using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewAssetReturn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
    }
    protected void AssetReturnList_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["AssetReturnID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "AssetReturnID").ToString();
        Session["AssetID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["AssetTypeName"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["Requestedby"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "Requestedby").ToString();
        Session["EmployeeID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        

        Session["Date"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["Status"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["CustodianComments"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        //Session["ApproverID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "ApproverID").ToString();
        //Session["ApproverName"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "ApproverName").ToString();
        //Session["ApproverDepartment"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDepartment").ToString();
        //Session["ApproverDeptCode"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDeptCode").ToString();
        //Session["ApproverDesignation"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDesignation").ToString();
        //Session["ApproverComments"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "ApproverComments").ToString();
        //
        Response.Redirect("/AdminApproveAssetReturn.aspx");
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