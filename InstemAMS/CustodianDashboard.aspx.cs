using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class CustodianDashboard : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
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
        SqlDataAdapter da_fa = new SqlDataAdapter("select Count(CustodianID) from vAssetMaster where vAssetMaster.CustodianID='" + Session["UserID"].ToString()+ "' and vAssetMaster.Status !='NVAL'", conSAP);
        DataTable dt_fa = new DataTable();
        da_fa.Fill(dt_fa);
        if (dt_fa.Rows.Count > 0)
        {
            lbl_cntallocatedassets.Text = dt_fa.Rows[0].ItemArray[0].ToString();
            if (int.Parse(lbl_cntallocatedassets.Text) > 0)
            {
                reqicon.Visible = true;
            }
        }
        else
        {
            lbl_cntallocatedassets.Text = "0";
            reqicon.Visible = false;
        }
        string select1 = "SELECT EmployeeAssetRequest.EmployeeID FROM InstemAMS..EmployeeAssetRequest where EmployeeID = '" + Session["UserID"].ToString() + "' and Status='Request Sent To Approver'";
        SqlDataAdapter da1 = new SqlDataAdapter(select1, conAMS);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        int a = dt1.Rows.Count;
        lbl_assetrequests.Text = a.ToString();

        string select2 = "SELECT EmployeeAssetReturn.EmployeeID FROM InstemAMS..EmployeeAssetReturn where EmployeeID = '" + Session["UserID"].ToString() + "' and Status='Request Sent To Approver'";
        SqlDataAdapter da2 = new SqlDataAdapter(select2, conAMS);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        int i = dt2.Rows.Count;
        lbl_assetreturn.Text = i.ToString();

        string select3 = "SELECT EmployeeLocationChange.EmployeeID FROM InstemAMS..EmployeeLocationChange where EmployeeID = '" + Session["UserID"].ToString() + "' and Status='Request Sent To Approver'";
        SqlDataAdapter da3 = new SqlDataAdapter(select3, conAMS);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        int b = dt3.Rows.Count;
        lbl_locationtransfer.Text = b.ToString();

        string select4 = "SELECT CustodianChangeRequest.EmployeeID FROM InstemAMS..CustodianChangeRequest where EmployeeID = '" + Session["UserID"].ToString() + "' and Status='Request Sent To Approver'";
        SqlDataAdapter da4 = new SqlDataAdapter(select4, conAMS);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        int c = dt4.Rows.Count;
        lbl_custodiantransfer.Text = c.ToString();

        //string select5 = "SELECT EmployeeAssetBuyBack.EmployeeID FROM InstemAMS..EmployeeAssetBuyBack where EmployeeID = '" + Session["UserID"].ToString() + "' and Status='Request Sent To Approver'";
        //SqlDataAdapter da5 = new SqlDataAdapter(select5, conAMS);
        //DataTable dt5 = new DataTable();
        //da5.Fill(dt5);
        //int d = dt5.Rows.Count;
        //lbl_cntBuybackreq.Text = d.ToString();

    }

    protected void lbtn_buybackreq_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BuybackRequest.aspx");
    }


    protected void lbtn_allocatedassets_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAllocatedAssets.aspx");
    }
}