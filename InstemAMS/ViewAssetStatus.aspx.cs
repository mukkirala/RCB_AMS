using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
public partial class ViewAssetStatus : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        string Requests = WebConfigurationManager.AppSettings.Get("Requests");
        cmb_selectReqtype.DataSource = Requests.Split(',');
        cmb_selectReqtype.DataBind();
    }

    protected void cmb_selectReqtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        AllRequests.Visible = true;
        Assetrequests.Visible = false;
        try
        {
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = null;
            string requestes = cmb_selectReqtype.Value.ToString();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            string AssetID, MainAssetNumber, AssetSubNumber, AssetDesc, AssetStatus, EmployeeID, RequestBy, CustDepartmentCode, CustodianDepartment, CustDesignation, Status, Date;
            if (requestes.Equals("Asset Requests"))
            {
                Assetrequests.Visible = true;
                AllRequests.Visible = false;
                ASPxGridView2.DataBind();


            }
            if (requestes.Equals("Buyback"))
            {
                string query = "SELECT EmployeeAssetBuyback.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetDesc,AssetMaster.Status as AssetStatus,EmployeeID, RequestBy,EmployeeAssetBuyback.CustDepartmentCode,EmployeeAssetBuyback.CustodianDepartment,EmployeeAssetBuyback.CustDesignation,EmployeeAssetBuyback.Status,EmployeeAssetBuyback.Date FROM  EmployeeAssetBuyback inner join InstemSAP..AssetMaster on AssetMaster.AssetID = EmployeeAssetBuyback.AssetID where  EmployeeAssetBuyback.Status in('Request Sent To Admin','Rejected')";
                da = new SqlDataAdapter(query, myConnection);
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        AssetID = dt.Rows[i].ItemArray[0].ToString();
                        MainAssetNumber = dt.Rows[i].ItemArray[1].ToString();
                        AssetSubNumber = dt.Rows[i].ItemArray[2].ToString();
                        AssetDesc = dt.Rows[i].ItemArray[3].ToString();
                        AssetStatus = dt.Rows[i].ItemArray[4].ToString();
                        EmployeeID = dt.Rows[i].ItemArray[5].ToString();
                        RequestBy = dt.Rows[i].ItemArray[6].ToString();
                        CustDepartmentCode = dt.Rows[i].ItemArray[7].ToString();
                        CustodianDepartment = dt.Rows[i].ItemArray[8].ToString();
                        CustDesignation = dt.Rows[i].ItemArray[9].ToString();
                        Status = dt.Rows[i].ItemArray[10].ToString();
                        Date = dt.Rows[i].ItemArray[11].ToString();
                        AddData(AssetID, MainAssetNumber, AssetSubNumber, AssetDesc, AssetStatus, EmployeeID, RequestBy, CustDepartmentCode, CustodianDepartment, CustDesignation, Status, Date);

                    }

                }
            }
            if (requestes.Equals("Location Transfer"))
            {
                string query = "SELECT EmployeeLocationChange.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetDesc,AssetMaster.Status as AssetStatus,EmployeeID, RequestBy,EmployeeLocationChange.CustDepartmentCode,EmployeeLocationChange.CustodianDepartment,EmployeeLocationChange.CustDesignation,EmployeeLocationChange.Status,EmployeeLocationChange.Date FROM  EmployeeLocationChange inner join InstemSAP..AssetMaster on AssetMaster.AssetID = EmployeeLocationChange.AssetID where  EmployeeLocationChange.Status in('Request Sent To Admin','Rejected')";
                da = new SqlDataAdapter(query, myConnection);
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        AssetID = dt.Rows[i].ItemArray[0].ToString();
                        MainAssetNumber = dt.Rows[i].ItemArray[1].ToString();
                        AssetSubNumber = dt.Rows[i].ItemArray[2].ToString();
                        AssetDesc = dt.Rows[i].ItemArray[3].ToString();
                        AssetStatus = dt.Rows[i].ItemArray[4].ToString();
                        EmployeeID = dt.Rows[i].ItemArray[5].ToString();
                        RequestBy = dt.Rows[i].ItemArray[6].ToString();
                        CustDepartmentCode = dt.Rows[i].ItemArray[7].ToString();
                        CustodianDepartment = dt.Rows[i].ItemArray[8].ToString();
                        CustDesignation = dt.Rows[i].ItemArray[9].ToString();
                        Status = dt.Rows[i].ItemArray[10].ToString();
                        Date = dt.Rows[i].ItemArray[11].ToString();
                        AddData(AssetID, MainAssetNumber, AssetSubNumber, AssetDesc, AssetStatus, EmployeeID, RequestBy, CustDepartmentCode, CustodianDepartment, CustDesignation, Status, Date);

                    }

                }
            }
            if (requestes.Equals("Custodian Transfer"))
            {
                string query = "SELECT CustodianChangeRequest.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetDesc,AssetMaster.Status as AssetStatus,EmployeeID, RequestBy,CustodianChangeRequest.CustDepartmentCode,CustodianChangeRequest.CustodianDepartment,CustodianChangeRequest.CustDesignation,CustodianChangeRequest.Status,CustodianChangeRequest.Date FROM  CustodianChangeRequest inner join InstemSAP..AssetMaster on AssetMaster.AssetID = CustodianChangeRequest.AssetID where  CustodianChangeRequest.Status in('Request Sent To Admin','Rejected')";
                da = new SqlDataAdapter(query, myConnection);
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        AssetID = dt.Rows[i].ItemArray[0].ToString();
                        MainAssetNumber = dt.Rows[i].ItemArray[1].ToString();
                        AssetSubNumber = dt.Rows[i].ItemArray[2].ToString();
                        AssetDesc = dt.Rows[i].ItemArray[3].ToString();
                        AssetStatus = dt.Rows[i].ItemArray[4].ToString();
                        EmployeeID = dt.Rows[i].ItemArray[5].ToString();
                        RequestBy = dt.Rows[i].ItemArray[6].ToString();
                        CustDepartmentCode = dt.Rows[i].ItemArray[7].ToString();
                        CustodianDepartment = dt.Rows[i].ItemArray[8].ToString();
                        CustDesignation = dt.Rows[i].ItemArray[9].ToString();
                        Status = dt.Rows[i].ItemArray[10].ToString();
                        Date = dt.Rows[i].ItemArray[11].ToString();
                        AddData(AssetID, MainAssetNumber, AssetSubNumber, AssetDesc, AssetStatus, EmployeeID, RequestBy, CustDepartmentCode, CustodianDepartment, CustDesignation, Status, Date);

                    }

                }
            }
            if (requestes.Equals("Asset Return"))
            {
                string query = "SELECT EmployeeAssetReturn.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetDesc,AssetMaster.Status as AssetStatus,EmployeeID, RequestBy,EmployeeAssetReturn.CustDepartmentCode,EmployeeAssetReturn.CustodianDepartment,EmployeeAssetReturn.CustDesignation,EmployeeAssetReturn.Status,EmployeeAssetReturn.Date FROM  EmployeeAssetReturn inner join InstemSAP..AssetMaster on AssetMaster.AssetID = EmployeeAssetReturn.AssetID where  EmployeeAssetReturn.Status in('Request Sent To Admin','Rejected')";
                da = new SqlDataAdapter(query, myConnection);
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        AssetID = dt.Rows[i].ItemArray[0].ToString();
                        MainAssetNumber = dt.Rows[i].ItemArray[1].ToString();
                        AssetSubNumber = dt.Rows[i].ItemArray[2].ToString();
                        AssetDesc = dt.Rows[i].ItemArray[3].ToString();
                        AssetStatus = dt.Rows[i].ItemArray[4].ToString();
                        EmployeeID = dt.Rows[i].ItemArray[5].ToString();
                        RequestBy = dt.Rows[i].ItemArray[6].ToString();
                        CustDepartmentCode = dt.Rows[i].ItemArray[7].ToString();
                        CustodianDepartment = dt.Rows[i].ItemArray[8].ToString();
                        CustDesignation = dt.Rows[i].ItemArray[9].ToString();
                        Status = dt.Rows[i].ItemArray[10].ToString();
                        Date = dt.Rows[i].ItemArray[11].ToString();
                        AddData(AssetID, MainAssetNumber, AssetSubNumber, AssetDesc, AssetStatus, EmployeeID, RequestBy, CustDepartmentCode, CustodianDepartment, CustDesignation, Status, Date);

                    }

                }
            }
        }
        catch(Exception ex)
        {

        }
        finally
        {

        }


    }

    private void AddData(string assetID, string mainAssetNumber, string assetSubNumber, string assetDesc, string assetStatus, string employeeID, string requestBy, string custDepartmentCode, string custodianDepartment, string custDesignation, string status, string date)
    {
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        if (AddTask != null)
        {
            AddTask.Rows.Add(assetID,mainAssetNumber,assetSubNumber, assetDesc, assetStatus, employeeID, requestBy, custDepartmentCode, custodianDepartment, custDesignation, status, date);
            ViewState["AddTask"] = AddTask;
            ASPxGridView1.DataSource = AddTask;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = AddTask as DataTable;
        }
        if (AddTask == null)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("AssetID");
            dt.Columns.Add("MainAssetNumber");
            dt.Columns.Add("AssetSubNumber");
            dt.Columns.Add("AssetDesc");
            dt.Columns.Add("AssetStatus");
            dt.Columns.Add("EmployeeID");
            dt.Columns.Add("RequestBy");
            dt.Columns.Add("CustDepartmentCode");
            dt.Columns.Add("CustodianDepartment");
            dt.Columns.Add("CustDesignation");
            dt.Columns.Add("Status");
            dt.Columns.Add("Date");
            dt.Rows.Add(assetID, mainAssetNumber, assetSubNumber, assetDesc, assetStatus, employeeID, requestBy, custDepartmentCode, custodianDepartment, custDesignation, status, date);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = dt as DataTable;
        }
    }
}