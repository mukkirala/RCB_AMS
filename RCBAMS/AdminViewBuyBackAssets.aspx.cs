using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewBuyBackAssets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("/ErrorPage.aspx");
            return;
        }
    }
    protected void BuybackAssetList_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["BuybackRequestID"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "BuybackRequestID").ToString();
        Session["AssetID"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["AssetTypeName"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["Requestedby"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "Requestedby").ToString();
        Session["Comments"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "Comments").ToString();
        Session["Date"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["Status"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["MainAssetNumber"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "MainAssetNumber").ToString();
        Session["AssetSubNumber"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetSubNumber").ToString();
        Session["AssetClass"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetClass").ToString();
        Session["EmployeeID"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = BuybackAssetList.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
       

        

        Response.Redirect("/AdminApproveBuyBack.aspx");
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