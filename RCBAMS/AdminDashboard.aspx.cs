using DevExpress.Web.ASPxGridView;
using DevExpress.XtraCharts;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Series = DevExpress.XtraCharts.Series;
using System.Configuration;
using DevExpress.CodeParser;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraCharts.Web;
using System.Linq;


public partial class AdminDashboard : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conCommon = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowCalibrationPopup();
        }
        if (Session["UserID"] != null)
        {
            string select1 = "select Count(AssetID) from AssetMaster where  Status !='InActive'";
            SqlDataAdapter da1 = new SqlDataAdapter(select1, conSAP);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                lbl_importedassets.Text = dt1.Rows[0].ItemArray[0].ToString();
            }
            else
            {
                lbl_importedassets.Text = "0";
            }

            string select2 = "select AuditID from AuditMaster where AuditStatus='Active'";
            SqlDataAdapter da2 = new SqlDataAdapter(select2, conAMS);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            int a = dt2.Rows.Count;
            lbl_createdaudits.Text = a.ToString();

            string select3 = "select Count(AllocationID) from AssetAllocation inner join EmployeeAssetRequest on EmployeeAssetRequest.AssetRequestID=AssetAllocation.AssetRequestID where AssetAllocation.Status='Approved'";
            SqlDataAdapter da3 = new SqlDataAdapter(select3, conAMS);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                lbl_allocatedassets.Text = dt3.Rows[0].ItemArray[0].ToString();
            }
            else
            {
                lbl_allocatedassets.Text = "0";
            }

            string select4 = "select Count(CustodianID) from CustodianMaster  ";
            SqlDataAdapter da4 = new SqlDataAdapter(select4, conAMS);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            if (dt4.Rows.Count > 0)
            {
                lbl_custodianlist.Text = dt4.Rows[0].ItemArray[0].ToString();
            }
            else
            {
                lbl_custodianlist.Text = "0";
            }

            updates_fa();
            GetAllRequests();
        }
        else
        {
            Response.Redirect("/Login.aspx");
        }
        //if (fromDate.Text == "")
        //{
        //    lbl_msg.Text = "please select date";
        //    return;
        //}
        //string fromdate = fromDate.Date.ToString("yyyy-MM-dd");
        //string todaydate = todate.Date.ToString("yyyy-MM-dd");
        //DataSet ds = new DataSet();
        //SqlDataAdapter da = new SqlDataAdapter("SELECT AssetDesc, COUNT(AssetDesc) AS NOOFASSETS FROM AssetMaster GROUP BY AssetDesc", conSAP);
        //da.Fill(ds);

        //DataTable ChartData = ds.Tables[0];
        //if (ChartData.Rows.Count > 0)
        //{
        //    if (ChartData.Rows[0]["AssetDesc"].ToString() != "")
        //    {
        //        //storing total rows count to loop on each Record                          
        //        string[] XPoints = new string[ChartData.Rows.Count];

        //        int[] YPOints = new int[ChartData.Rows.Count];

        //        for (int count = 0; count < ChartData.Rows.Count; count++)
        //        {
        //            // store values for X axis  
        //            XPoints[count] = ChartData.Rows[count]["AssetDesc"].ToString();
        //            //store values for Y Axis  
        //            YPOints[count] = Convert.ToInt32(ChartData.Rows[count]["NOOFASSETS"]);

        //        }
        //        //YPOints[0] = Convert.ToInt32(100);
        //        //YPOints[1] = Convert.ToInt32(100);
        //        //binding chart control  
        //        Chart1.Series[0].Points.DataBindXY(XPoints, YPOints);

        //        //Setting width of line  
        //        Chart1.Series[0].BorderWidth = 5;
        //        //setting Chart type   
        //        Chart1.Series[0].ChartType = SeriesChartType.Pie;

        //        //enable to show legend
        //        Chart1.Legends[0].Enabled = true;

        //        //show pie chart in 3d
        //        Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
        //        //anusha
        //    }

        //}

    }

    private void ShowCalibrationPopup()
    {
        string connStr = ConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"
        select AssetID, MainAssetNumber,MaintenanceContract,CalibrationOn,CalibrationDue from AssetCalibration ";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();

            if (count > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "popup", "pcCalibrationAlert.Show();", true);
            }
        }
    }
    protected void GetAllRequests()
    {
        int id = 1;
        //  string CustodianName, CustodianDepartmentCode, DepartmentName, Designation;
        string select1 = " SELECT CustodianID FROM AssetParking where Status='Active' GROUP BY CustodianID";
        SqlCommand cmd1 = new SqlCommand(select1, conAMS);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable datatable1 = new DataTable();
        datatable1.Columns.Add("CustodianName", typeof(String));
        datatable1.Columns.Add("CustodianDepartmentCode", typeof(String));
        datatable1.Columns.Add("DepartmentName", typeof(String));
        datatable1.Columns.Add("Designation", typeof(String));
        datatable1.Columns.Add("ID", typeof(System.Int32));
        datatable1.Columns.Add("RequestType", typeof(String));
        //datatable1.AcceptChanges();
        da1.Fill(datatable1);
        for (int i = 0; i < datatable1.Rows.Count; i++)
        {
            datatable1.Rows[i]["ID"] = id;
            id = id + 1;
            string CustodianID = datatable1.Rows[i]["CustodianID"].ToString();
            string select2 = "SELECT CustodianName,CustodianDepartmentCode,DepartmentName,Designation FROM vEmpDtlsAssetApp inner join vDepartmentAssetApp on vDepartmentAssetApp.DepartmentCode = vEmpDtlsAssetApp.CustodianDepartmentCode where CustodianID='" + CustodianID + "'";
            SqlCommand cmd2 = new SqlCommand(select2, conCommon);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable datatable2 = new DataTable();
            da2.Fill(datatable2);
            if (datatable2.Rows.Count > 0)
            {
                datatable1.Rows[i]["RequestType"] = "Asset Parking";
                datatable1.Rows[i]["CustodianName"] = datatable2.Rows[0].ItemArray[0].ToString();
                datatable1.Rows[i]["CustodianDepartmentCode"] = datatable2.Rows[0].ItemArray[1].ToString();
                datatable1.Rows[i]["DepartmentName"] = datatable2.Rows[0].ItemArray[2].ToString();
                datatable1.Rows[i]["Designation"] = datatable2.Rows[0].ItemArray[3].ToString();

            }
        }
        lbl_parkedassets.Text = datatable1.Rows.Count.ToString();
    }


    void updates_fa()
    {

        SqlDataAdapter da_assetreq = new SqlDataAdapter("select Count(AssetRequestID) from EmployeeAssetRequest where EmployeeAssetRequest.Status='Request Sent To Admin'", conAMS);
        DataTable dt_assetreq = new DataTable();
        da_assetreq.Fill(dt_assetreq);
        if (dt_assetreq.Rows.Count > 0)
        {
            lbl_cntAssetrequest.Text = dt_assetreq.Rows[0].ItemArray[0].ToString();
            if (int.Parse(lbl_cntAssetrequest.Text) > 0)
            {
                reqicon.Visible = true;
            }
        }
        else
        {
            lbl_cntAssetrequest.Text = "0";
            reqicon.Visible = false;
        }


        SqlDataAdapter da_loctransfer = new SqlDataAdapter("select Count(LocationChangeID) from EmployeeLocationChange where Status='Request Sent To Admin'", conAMS);
        DataTable dt_loctransfer = new DataTable();
        da_loctransfer.Fill(dt_loctransfer);
        if (dt_loctransfer.Rows.Count > 0)
        {
            lbl_cntLocationtransfer.Text = dt_loctransfer.Rows[0].ItemArray[0].ToString();
            if (int.Parse(lbl_cntLocationtransfer.Text) > 0)
            {
                reqicon1.Visible = true;
            }
        }
        else
        {
            lbl_cntLocationtransfer.Text = "0";
            reqicon1.Visible = false;
        }

        SqlDataAdapter da_custransfer = new SqlDataAdapter("select Count(CustodianChangeID) from CustodianChangeRequest where Status='Request Sent To Admin'", conAMS);
        DataTable dt_custransfer = new DataTable();
        da_custransfer.Fill(dt_custransfer);
        if (dt_custransfer.Rows.Count > 0)
        {
            lbl_cntCustodianTransfer.Text = dt_custransfer.Rows[0].ItemArray[0].ToString();
            if (int.Parse(lbl_cntCustodianTransfer.Text) > 0)
            {
                reqicon2.Visible = true;
            }
        }
        else
        {
            lbl_cntCustodianTransfer.Text = "0";
            reqicon2.Visible = false;
        }



        //SqlDataAdapter da_fa = new SqlDataAdapter("select Count(BuybackRequestID) from EmployeeAssetBuyback where EmployeeAssetBuyback.Status='Request Sent To Admin'", conAMS);
        //DataTable dt_fa = new DataTable();
        //da_fa.Fill(dt_fa);
        //if (dt_fa.Rows.Count > 0)
        //{
        //    lbl_cntBuybackreq.Text = dt_fa.Rows[0].ItemArray[0].ToString();
        //    if (int.Parse(lbl_cntBuybackreq.Text) > 0)
        //    {
        //        req1.Visible = true;
        //    }
        //}
        //else
        //{
        //    lbl_cntBuybackreq.Text = "0";
        //    req1.Visible = false;
        //}

        SqlDataAdapter da_fa1 = new SqlDataAdapter("select Count(AssetReturnID) from EmployeeAssetReturn where EmployeeAssetReturn.Status='Request Sent To Admin'", conAMS);
        DataTable dt_fa1 = new DataTable();
        da_fa1.Fill(dt_fa1);
        if (dt_fa1.Rows.Count > 0)
        {
            lbl_cntAssetreturnreq.Text = dt_fa1.Rows[0].ItemArray[0].ToString();
            if (int.Parse(lbl_cntAssetreturnreq.Text) > 0)
            {
                req2.Visible = true;
            }
        }
        else
        {
            lbl_cntAssetreturnreq.Text = "0";
            req2.Visible = false;
        }


    }
    protected void ASPxGridView1_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }

    protected void lbtn_assetrequest_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminViewAssetRequest.aspx");
    }

    protected void lbtn_locationtransfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminViewLocationChange.aspx");
    }

    protected void lbtn_custodiantransfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminViewCustodianChangeRequests.aspx");
    }

    protected void lbtn_buybackreq_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminViewBuyBackAssets.aspx");
    }


    protected void lbtn_assetreturnreq_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminViewAssetReturn.aspx");
    }
    protected void lbtn_alloc_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdminViewAllocatedAssets.aspx");
    }

    ////////////////
    protected void search_Click(object sender, ImageClickEventArgs e)
    {
        //AllAssets();
    }


    //protected void AllAssets()
    //{
    //    DateTime systemdate = System.DateTime.Now;
    //    string date = systemdate.ToString("yyyy-MM-dd");
    //    // DateTime dtt = ASPxDateEdit1.Date;
    //    //string date2 = dtt.ToString("yyyy-MM-dd");
    //    //All Schools Class Wise Total Strength
    //    string select4 = "SELECT COUNT(AssetMaster.AssetDesc)as NoOfAssets,AssetDesc   FROM AssetMaster  where YearofPurchase='" + cmb_Dep.Text + "'   group by AssetDesc  order by AssetDesc ASC ";
    //    SqlDataAdapter da4 = new SqlDataAdapter(select4, conSAP);
    //    DataTable dt4 = new DataTable();
    //    da4.Fill(dt4);
    //    WebChartControl1.DataSource = dt4;
    //    WebChartControl1.DataBind();
    //    conSAP.Open();
    //    DataTable OutputDt = new DataTable();
    //    OutputDt.Columns.Add("AssetDesc", typeof(string));
    //    //  OutputDt.Columns.Add("TotalStudents", typeof(int));
    //    //  OutputDt.Columns.Add("Presentees", typeof(int));
    //    // OutputDt.Columns.Add("Percent", typeof(double));
    //    conSAP.Close();
    //}





    //protected void todate_DateChanged(object sender, EventArgs e)
    //{
    //    if (fromDate.Text == "")
    //    {
    //        lbl_msg.Text = "please select date";
    //        return;
    //    }
    //    string fromdate = fromDate.Date.ToString("yyyy-MM-dd");
    //    string todaydate = todate.Date.ToString("yyyy-MM-dd");
    //    DataSet ds = new DataSet();
    //    SqlDataAdapter da = new SqlDataAdapter("SELECT  COUNT(EmployeeAssetRequest.ApprovedQuantity) as ApprovedQuantity,COUNT(EmployeeAssetRequest.Quantity) as Quantity  FROM EmployeeAssetRequest WHERE ([AdminDate] between  '" + fromdate + "' and  '" + todaydate + "') ", conAMS);
    //    da.Fill(ds);

    //    DataTable ChartData = ds.Tables[0];
    //    if (ChartData.Rows.Count > 0)
    //    {
    //        if (ChartData.Rows[0]["ApprovedQuantity"].ToString() != "")
    //        {
    //            //storing total rows count to loop on each Record                          
    //            string[] XPoints = new string[ChartData.Rows.Count];

    //            int[] YPOints = new int[ChartData.Rows.Count];

    //            for (int count = 0; count < ChartData.Rows.Count; count++)
    //            {
    //                // store values for X axis  
    //                XPoints[count] = ChartData.Rows[count]["Quantity"].ToString();
    //                //store values for Y Axis  
    //                YPOints[count] = Convert.ToInt32(ChartData.Rows[count]["ApprovedQuantity"]);

    //            }
    //            //YPOints[0] = Convert.ToInt32(100);
    //            //YPOints[1] = Convert.ToInt32(100);
    //            //binding chart control  
    //            Chart1.Series[0].Points.DataBindXY(XPoints, YPOints);

    //            //Setting width of line  
    //            Chart1.Series[0].BorderWidth = 5;
    //            //setting Chart type   
    //            Chart1.Series[0].ChartType = SeriesChartType.Pie;

    //            //enable to show legend
    //            Chart1.Legends[0].Enabled = true;

    //            //show pie chart in 3d
    //            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
    //            //anusha
    //        }

    //    }



    protected void ViewResolvedComplaint_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["AssetName"] = ViewResolvedComplaint.GetRowValuesByKeyValue(e.KeyValue, "AssetName").ToString();
        Response.Redirect("AssetDetailsonCount.aspx");
    }
}
