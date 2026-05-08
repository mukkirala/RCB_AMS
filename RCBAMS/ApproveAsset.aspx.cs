using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproveAsset : System.Web.UI.Page
{
    static string EmailId;
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
            
        }
        //EmailId = Session["UserID"].ToString();
    }

    protected void ASPxGridView2_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["AssetRequestID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "AssetRequestID").ToString();
        Session["AssetTypeID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeID").ToString();
        Session["Quantity"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "Quantity").ToString();
        Session["Date"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "Date").ToString();
        Session["RequestBy"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "RequestBy").ToString();
        Session["Status"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "Status").ToString();
        Session["AssetTypename"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "AssetTypename").ToString();
        Session["EmployeeID"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "EmployeeID").ToString();
        Session["EmpDept"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartment").ToString();
        Session["EmpDesig"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "CustDesignation").ToString();
        Session["CustLocation"] = ASPxGridView2.GetRowValuesByKeyValue(e.KeyValue, "LocationCode").ToString();

        Response.Redirect("/ApproveAssetRequest.aspx");
    }


    protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["RequestID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}