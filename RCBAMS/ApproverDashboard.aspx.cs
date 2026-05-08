using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class ApproverDashboard : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conCommon = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
           
            updates_fa();
        }
        else
        {
            Response.Redirect("/Login.aspx");
        }
    }

    void updates_fa()
    {
        string approverid = Session["UserID"].ToString();
        SqlDataAdapter da_fa = new SqlDataAdapter("select Count(CustodianID) from vAssetMaster where vAssetMaster.CustodianID='" + approverid + "' and vAssetMaster.Status !='NVAL'", conSAP);
        DataTable dt_fa = new DataTable();
        da_fa.Fill(dt_fa);
        if (dt_fa.Rows.Count > 0)
        {
            lbl_cntAllocatedassets.Text = dt_fa.Rows[0].ItemArray[0].ToString();
            if (int.Parse(lbl_cntAllocatedassets.Text) > 0)
            {
                reqicon.Visible = true;
            }
        }
        else
        {
            lbl_cntAllocatedassets.Text = "0";
            reqicon.Visible = false;
        }
        string select1 = "select Count(AssetRequestID) from EmployeeAssetRequest where EmployeeAssetRequest.Status = 'Request Sent To Approver' and ApproverID="+approverid+"";
        SqlDataAdapter da1 = new SqlDataAdapter(select1, conAMS);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            lbl_assetrequest.Text = dt1.Rows[0].ItemArray[0].ToString();
        }
        else
        {
            lbl_assetrequest.Text = "0";
        }

        string select2 = "select Count(LocationChangeID) from EmployeeLocationChange where Status='Request Sent To Approver' and ApproverID=" + approverid + "";
        SqlDataAdapter da2 = new SqlDataAdapter(select2, conAMS);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        if (dt2.Rows.Count > 0)
        {
            lbl_locationtransfer.Text = dt2.Rows[0].ItemArray[0].ToString();
        }
        else
        {
            lbl_locationtransfer.Text = "0";
        }


        string select3 = "select Count(CustodianChangeID) from CustodianChangeRequest where Status='Request Sent To Approver' and ApproverID=" + approverid + "";
        SqlDataAdapter da3 = new SqlDataAdapter(select3, conAMS);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            lbl_custodiantransfer.Text = dt3.Rows[0].ItemArray[0].ToString();
        }
        else
        {
            lbl_custodiantransfer.Text = "0";
        }

        string select4 = "select Count(CustodianID) from vEmpDtlsAssetApp where vEmpDtlsAssetApp.reporting_staff_no="+approverid+"";
        SqlDataAdapter da4 = new SqlDataAdapter(select4, conCommon);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        if (dt4.Rows.Count > 0)
        {
            lbl_assetreturn.Text = dt4.Rows[0].ItemArray[0].ToString();
        }
        else
        {
            lbl_assetreturn.Text = "0";
        }
    }

    protected void lbtn_allocatedassets_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAllocatedAssets.aspx");
    }


}
