using DevExpress.Web.ASPxGridView;
using DevExpress.XtraExport;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;

public partial class AssetParking : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conCommon = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    string adminID, adminName, adminDeptCode, adminDept, admindesign, rqAsset;
    static int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        else
        {
            adminID = Session["UserID"].ToString();
            adminName = Session["USR_NAME"].ToString();
           // adminDeptCode = Session["DepartmentCode"].ToString();
            adminDept = Session["DepartmentName"].ToString();
            admindesign = Session["DESIGNATION"].ToString();
        }
        if (!IsPostBack)
        {
            Session["AssetType"] = "";
            Session["AssetTypeID"] = "";
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (Cust_gridlookup.Text == "")
        {

        }
        else
        {
            RequestorDetails.Visible = true;

            string RequestorID = Cust_gridlookup.Value.ToString();
            string selectquery = "SELECT CustodianID,DepartmentName,CustodianName,Designation FROM vEmpDtlsAssetApp inner join vDepartmentAssetApp on vDepartmentAssetApp.DepartmentCode = vEmpDtlsAssetApp.CustodianDepartmentCode where CustodianID='" + RequestorID + "'";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectquery, conCommon);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {

                lbl_ReqID.Text = dataTable.Rows[0].ItemArray[0].ToString();             
                lbl_ReqDept.Text = dataTable.Rows[0].ItemArray[1].ToString();
                lbl_ReqName.Text = dataTable.Rows[0].ItemArray[2].ToString();
                lbl_Desig.Text = dataTable.Rows[0].ItemArray[3].ToString();
            }
        }
    }

    protected void AddAssets_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < AssetTypesGridView.VisibleRowCount; i++)

        {

            if (AssetTypesGridView.Selection.IsRowSelected(i))
            {
                count = count + 1;
                string AssetID = AssetTypesGridView.GetRowValues(i, "AssetID").ToString();
                string MainAssetNumber = AssetTypesGridView.GetRowValues(i, "MainAssetNumber").ToString();
                string SerialNumber = AssetTypesGridView.GetRowValues(i, "SerialNumber").ToString();
                string AssetSubNumber = AssetTypesGridView.GetRowValues(i, "AssetSubNumber").ToString();
                string AssetClass = AssetTypesGridView.GetRowValues(i, "AssetClass").ToString();
                string AssetType = AssetTypesGridView.GetRowValues(i, "AssetDesc").ToString();
                string AssetTypeID = AssetTypesGridView.GetRowValues(i, "AssetTypeID").ToString();

                AddData(AssetID, MainAssetNumber, SerialNumber, AssetSubNumber, AssetClass, AssetType, AssetTypeID);

                req_qnty.Value = ASPxGridView1.VisibleRowCount;
                //Clear();
            }
        }
    }

    private void AddData(string AssetID, string MainAssetNumber, string SerialNumber, string AssetSubNumber, string AssetClass, string AssetType, string AssetTypeID)
    {
        err_msg.Visible = false;
        int temp = 0;
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        if (AddTask != null)
        {
            for (int i = 0; i < AddTask.Rows.Count; i++)
            {
                if (AddTask.Rows[i].ItemArray[0].Equals(AssetID))
                {
                    temp++;
                    break;
                }
            }
            if (temp > 0)
            {

            }
            else
            {
                AddTask.Rows.Add(AssetID, MainAssetNumber, SerialNumber, AssetSubNumber, AssetClass, AssetType, AssetTypeID);
                ViewState["AddTask"] = AddTask;
                ASPxGridView1.DataSource = AddTask;
                ASPxGridView1.DataBind();
                ViewState["AddTask"] = AddTask as DataTable;
            }
        }
        if (AddTask == null)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("AssetID");
            dt.Columns.Add("MainAssetNumber");
            dt.Columns.Add("SerialNumber");
            dt.Columns.Add("AssetSubNumber");
            dt.Columns.Add("AssetClass");
            dt.Columns.Add("AssetType");
            dt.Columns.Add("AssetTypeID");
            dt.Rows.Add(AssetID, MainAssetNumber, SerialNumber, AssetSubNumber, AssetClass, AssetType, AssetTypeID);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = dt as DataTable;
        }
    }



    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Delete")
        {
            int s = e.VisibleIndex;
            DataTable dt2 = (DataTable)ViewState["AddTask"];
            dt2.Rows[s].Delete();
            ASPxGridView1.DataSource = dt2;
            ASPxGridView1.DataBind();
            req_qnty.Value = ASPxGridView1.VisibleRowCount;
        }
    }

    protected void Assets_Click(object sender, EventArgs e)
    {
        int AssetRequestID = 0;
        if (Cust_gridlookup.Text == "")
        {
            err_msg.Text = "Select Employee";
            err_msg.Visible = true;
            return;
        }
        if (txt_Locationid.Text == "")
        {
            err_msg.Text = "Select Wing";
            err_msg.Visible = true;
            return;
        }
        if (txtblock.Text == "")
        {
            err_msg.Text = "Select Floor";
            err_msg.Visible = true;
            return;
        }
        if (txt_Lab.Text == "")
        {
            err_msg.Text = "Select LAB";
            err_msg.Visible = true;
            return;
        }
        if (gridlkup_Asset.Text == "")
        {
            err_msg.Text = "Select Asset Name";
            err_msg.Visible = true;
            return;
        }

        if (req_qnty.Text == "")
        {
            err_msg.Text = "Allocate Quantity";
            err_msg.Visible = true;
            return;
        }
        if (txt_cmt.Text == "")
        {
            err_msg.Text = "Enter Comment";
            err_msg.Visible = true;
            return;
        }


        else
        {
            btn_search_Click(sender, e);
            
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {


                int AssetID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetID"));
                string MainAssetNumber = ASPxGridView1.GetRowValues(i, "MainAssetNumber").ToString();
                int AssetTypeID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetTypeID"));
                SqlCommand cmd = new SqlCommand("insert into AssetParking(AssetID,MainAssetNumber,CustodianID,RequestBy,CustodianDepartment,CustDesignation,AssetTypeID,LocationCode,Location,LocationID,Block,Date,Status)values(@AssetID,@MainAssetNumber,@CustodianID,@RequestBy,@CustodianDepartment,@CustDesignation,@AssetTypeID,@LocationCode,@Location,@LocationID,@Block,@Date,@Status)", conAMS);
                cmd.Parameters.AddWithValue("@AssetID", AssetID);
                cmd.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber);
                cmd.Parameters.AddWithValue("@CustodianID", Cust_gridlookup.Value.ToString());
                cmd.Parameters.AddWithValue("@RequestBy", lbl_ReqName.Text);
                cmd.Parameters.AddWithValue("@CustodianDepartment", lbl_ReqDept.Text);

                cmd.Parameters.AddWithValue("@CustDesignation", lbl_Desig.Text);
                cmd.Parameters.AddWithValue("@AssetTypeID", AssetTypeID);
                cmd.Parameters.AddWithValue("@LocationCode", txt_Lab.Text.ToString());
                cmd.Parameters.AddWithValue("@Location", txt_Locationid.Text);
                cmd.Parameters.AddWithValue("@LocationID", txt_Lab.Value);
                cmd.Parameters.AddWithValue("@Block", txtblock.Text);
                cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
                cmd.Parameters.AddWithValue("@Status", "Active");
                //SqlCommand cmd = new SqlCommand("insert into AssetAllocation(AssetID, MainAssetNumber, AssetRequestID, Date, Status)values(@AssetID,@MainAssetNumber,@AssetRequestID,@Date,@Status)", conAMS);
                myCommand1 = new SqlCommand("update AssetMaster set Status='AssetParked',StatusDesc='AssetParked'  where AssetID='" + AssetID + "'", conSAP);
                //cmd.Parameters.AddWithValue("@AssetID", AssetID);
                //cmd.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber);
                //cmd.Parameters.AddWithValue("@AssetRequestID", AssetRequestID);
                //cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
                //cmd.Parameters.AddWithValue("@Status", "Approved");
                try
                {
                    conAMS.Open();
                    cmd.ExecuteNonQuery();
                    conSAP.Open();
                    myCommand1.ExecuteNonQuery();
                    err_msg.Text = "Asset Parked";
                    err_msg.Visible = true;
                }
                catch (Exception ex)
                {

                }

                finally
                {
                    conAMS.Close();
                    conSAP.Close();
                }
            }

        }
        clear();


    }

    protected void clear()
    {
        Cust_gridlookup.Value = "";
        //LocationGridLookup1.Value = "";
        txt_Locationid.Text = "";
        txtblock.Text = "";
        txt_Lab.Text = "";
        gridlkup_Asset.Value = "";
        req_qnty.Text = "";
        txt_cmt.Text = "";
        Session["AssetType"] = "";
        AssetTypesGridView.DataBind();
        ASPxGridView1.DataSource = null;
        ASPxGridView1.DataBind();
        ViewState["AddTask"] = null;
        RequestorDetails.Visible = false;

    }

    protected void gridlkup_Asset_Init(object sender, EventArgs e)
    {
        ASPxGridView gv = gridlkup_Asset.GridView as ASPxGridView;
        gv.Width = 170;
    }

    protected void gridlkup_Asset_Click(object sender, EventArgs e)
    {

        err_msg.Visible = false;
        if (gridlkup_Asset.Text == "")
        {

        }
        else
        {

            Session["AssetType"] = gridlkup_Asset.Text.ToString();

            AssetTypesGridView.DataBind();
            if (AssetTypesGridView.VisibleRowCount == 0)
            {
                err_msg.Text = "Assets not available with requested type";
                err_msg.Visible = true;
                return;
            }
        }


    }

    protected void txt_Locationid_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtblock.SelectedIndex = -1;
        txt_Lab.SelectedIndex = -1;
    }

    protected void txtblock_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_Lab.SelectedIndex = -1;
    }
}