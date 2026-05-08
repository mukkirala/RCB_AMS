using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewLocationChange : System.Web.UI.Page
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
        Session["LocationChangeID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationChangeID").ToString();
        Session["AssetID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["AssetTypeName"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["Requestedby"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Requestedby").ToString();
        Session["RequestedLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Location").ToString();
        //Session["RequestedBlock"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Block").ToString();
        //Session["RequestedLAB"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();
        Session["Date"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["Status"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["CustodianComments"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        Session["LocationID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationID").ToString();
        //Session["ToLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ToLocation").ToString();
        //Session["ToBlock"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ToBlock").ToString();
        //Session["ToLab"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ToLab").ToString();
        Session["EmployeeID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        Session["Location"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Location").ToString();
        Session["Block"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Block").ToString();
        Session["LocationCode"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();
        //Session["CustodianComments"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        Session["ApproverID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverID").ToString();
        Session["ApproverName"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverName").ToString();
        Session["ApproverDepartment"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDepartment").ToString();
        //Session["Block"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Block").ToString();
        Session["ApproverDesignation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverDesignation").ToString();
        Session["ApproverComments"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ApproverComments").ToString();
        Session["CLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CLocation").ToString();
        Session["CBlock"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CBlock").ToString();
        Session["CLocationDesc"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CLocationDesc").ToString();

        Response.Redirect("/AdminApproveLocationChange.aspx");
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