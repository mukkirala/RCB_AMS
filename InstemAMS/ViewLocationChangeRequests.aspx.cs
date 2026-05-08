using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewLocationChangeRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserID"]==null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        else
        {
            lbl_requestername.Text = Session["USR_NAME"].ToString();
            reqid.Text = Session["UserID"].ToString();
            reqdept.Text = Session["DepartmentName"].ToString();
            reqdesign.Text = Session["DESIGNATION"].ToString();
           
        }
    }

    protected void AssetList_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["LocationChangeID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationChangeID").ToString();
        Session["AssetID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["AssetTypeName"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["Requestedby"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Requestedby").ToString();
        Session["RequestedLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();
        Session["Date"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["Status"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["CustodianComments"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        Session["ToLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "ToLocation").ToString();
        Session["EmployeeID"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        Session["CLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CLocation").ToString();
        Session["CBlock"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "CBlock").ToString();
        Session["RBlock"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "Block").ToString();
        Session["RLocation"] = AssetList.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();

        Response.Redirect("/ApproveLocationChangeRequest.aspx");
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