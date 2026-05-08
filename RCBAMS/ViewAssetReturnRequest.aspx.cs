using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAssetReturnRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
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
            reqdeptcode.Text = Session["DepartmentCode"].ToString();
        }
    }

    protected void AssetReturnList_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["AssetReturnID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "AssetReturnID").ToString();
        Session["AssetID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["AssetTypeName"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
        Session["Requestedby"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "Requestedby").ToString();

        Session["Date"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["Status"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["CustodianComments"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustodianComments").ToString();
        Session["EmployeeID"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        Session["EmpDeptCode"] = AssetReturnList.GetRowValuesByKeyValue(e.KeyValue, "CustDepartmentCode").ToString();
        Response.Redirect("/ApproveAssetReturnRequest.aspx");
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