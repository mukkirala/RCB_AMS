using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;

public partial class ApproveAssetParking : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conCommon = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static int count = 0;
    string adminID, adminName, adminDept, admindesign, rqAsset;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        else
        {

            try
            {
                adminID = Session["UserID"].ToString();
                adminName = Session["USR_NAME"].ToString();
              
                adminDept = Session["DepartmentName"].ToString();
                admindesign = Session["DESIGNATION"].ToString();
                reqid.Text = Session["CustodianID"].ToString();
                lbl_empname.Text = Session["CustodianName"].ToString();
               
                reqdeptname.Text = Session["DepartmentName"].ToString();
                reqdesig.Text = Session["Designation"].ToString();

            }
            catch (Exception ex)
            {

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
                string AssetParkingID = AssetTypesGridView.GetRowValues(i, "AssetParkingID").ToString();
                string AssetID = AssetTypesGridView.GetRowValues(i, "AssetID").ToString();
                string MainAssetNumber = AssetTypesGridView.GetRowValues(i, "MainAssetNumber").ToString();
                string AssetSubNumber = AssetTypesGridView.GetRowValues(i, "AssetSubNumber").ToString();
                string AssetClass = AssetTypesGridView.GetRowValues(i, "AssetClass").ToString();
                string AssetType = AssetTypesGridView.GetRowValues(i, "AssetDesc").ToString();
                string LocationCode = AssetTypesGridView.GetRowValues(i, "LocationCode").ToString();
                string Location = AssetTypesGridView.GetRowValues(i, "Location").ToString();
                string LocationID = AssetTypesGridView.GetRowValues(i, "LocationID").ToString();
                string Block = AssetTypesGridView.GetRowValues(i, "Block").ToString();
                string AssetStatus = AssetTypesGridView.GetRowValues(i, "AssetStatus").ToString();
                DateTime RD = Convert.ToDateTime(AssetTypesGridView.GetRowValues(i, "RequestDate"));
                string RequestDate = RD.ToString("dd-MMM-yyyy");
                string AssetTypeID = AssetTypesGridView.GetRowValues(i, "AssetTypeID").ToString();
                AddData(AssetParkingID,AssetID, MainAssetNumber, AssetSubNumber, AssetClass, AssetType,LocationCode,Location, AssetStatus, RequestDate, AssetTypeID,LocationID,Block);
                req_qnty.Value = ASPxGridView1.VisibleRowCount;


            }
        }
    }

    protected void AddData(string AssetParkingID,string assetID, string mainAssetNumber, string assetSubNumber, string assetClass, string assetType,string locationCode,string location, string assetStatus, string requestDate,string AssetTypeID,string LocationID,string Block)
    {
        err_msg.Visible = false;
        int temp = 0;
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        if (AddTask != null)
        {
            for (int i = 0; i < AddTask.Rows.Count; i++)
            {
                if (AddTask.Rows[i].ItemArray[1].Equals(assetID))
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
                AddTask.Rows.Add(AssetParkingID,assetID, mainAssetNumber, assetSubNumber, assetClass, assetType, locationCode,location,LocationID,Block, assetStatus, requestDate, AssetTypeID);
                ViewState["AddTask"] = AddTask;
                ASPxGridView1.DataSource = AddTask;
                ASPxGridView1.DataBind();
                ViewState["AddTask"] = AddTask as DataTable;
            }
        }
        if (AddTask == null)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("AssetParkingID");
            dt.Columns.Add("AssetID");
            dt.Columns.Add("MainAssetNumber");
            dt.Columns.Add("AssetSubNumber");
            dt.Columns.Add("AssetClass");
            dt.Columns.Add("AssetType");
            dt.Columns.Add("LocationCode");
            dt.Columns.Add("Location");
            dt.Columns.Add("LocationID");
            dt.Columns.Add("Block");
            dt.Columns.Add("AssetStatus");
            dt.Columns.Add("RequestDate");
            dt.Columns.Add("AssetTypeID");
            dt.Rows.Add(AssetParkingID,assetID, mainAssetNumber, assetSubNumber, assetClass, assetType, locationCode, location,LocationID,Block, assetStatus, requestDate, AssetTypeID);
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
       
        int count = 0;
        if (ASPxGridView1.VisibleRowCount == 0)
        {
            err_msg.Text = "Add Assets To Approve";
            err_msg.Visible = true;
            return;
        }
        else
        {
            try
            {


                DataTable dt = new DataTable();
                dt = ViewState["dt"] as DataTable;
                for (int i = 0; i < ASPxGridView1.VisibleRowCount;)
                {
                    int AssetParkingID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetParkingID"));
                    int AssetID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetID"));
                    string MainAssetNumber = ASPxGridView1.GetRowValues(i, "MainAssetNumber").ToString();
                    int AssetTypeID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetTypeID"));
                    string LocationCode = ASPxGridView1.GetRowValues(i, "LocationCode").ToString();
                    string Location = ASPxGridView1.GetRowValues(i, "Location").ToString();
                    string LocationID = ASPxGridView1.GetRowValues(i, "LocationID").ToString();
                    string Block = ASPxGridView1.GetRowValues(i, "Block").ToString();
                    if (dt == null)
                    {
                        DataTable dt1 = new DataTable();

                        dt1.Columns.Add("AssetParkingID");
                        dt1.Columns.Add("AssetID");
                        dt1.Columns.Add("MainAssetNumber");
                        dt1.Columns.Add("AssetTypeID");
                        dt1.Columns.Add("LocationCode");
                        dt1.Columns.Add("Location");
                        dt1.Columns.Add("LocationID");
                        dt1.Columns.Add("Block");
                        dt1.Rows.Add(AssetParkingID, AssetID, MainAssetNumber, AssetTypeID,LocationCode,Location,LocationID,Block);

                        dt = dt1 as DataTable;
                    }
                    for (int j = i + 1; j < ASPxGridView1.VisibleRowCount; j++)
                    {

                        int AssetTypeID1 = Convert.ToInt32(ASPxGridView1.GetRowValues(j, "AssetTypeID"));
                        int AssetParkingID1 = Convert.ToInt32(ASPxGridView1.GetRowValues(j, "AssetParkingID"));
                        int AssetID1 = Convert.ToInt32(ASPxGridView1.GetRowValues(j, "AssetID"));
                        string MainAssetNumber1 = ASPxGridView1.GetRowValues(j, "MainAssetNumber").ToString();
                        string LocationCode1 = ASPxGridView1.GetRowValues(j, "LocationCode").ToString();
                        string Location1 = ASPxGridView1.GetRowValues(j, "Location").ToString();
                        string LocationID1 = ASPxGridView1.GetRowValues(j, "LocationID").ToString();
                        string Block1 = ASPxGridView1.GetRowValues(j, "Block").ToString();

                        if (AssetTypeID == AssetTypeID1)
                        {
                            //dt = ViewState["dt"] as DataTable;
                            dt.Rows.Add(AssetParkingID1, AssetID1, MainAssetNumber1, AssetTypeID1,LocationCode1,Location1,LocationID1,Block1);
                            //ViewState["dt"] = dt;
                            //ViewState["dt"] = dt as DataTable;
                        }
                        else
                        {

                        }
                    }


                    int AssetRequestID = 0;
                    if (dt != null)
                    {

                        myCommand = new SqlCommand("insert into EmployeeAssetRequest(AssetTypeID,RequestBy,EmployeeID,Location,LocationID,LocationCode,BLOCK,CustodianDepartment,CustDesignation,Status,Date,ApprovedQuantity,AdminComments,AdminID,AdminName,AdminDesignation,AdminDepartment,RequestType)values(@AssetTypeID,@RequestBy,@EmployeeID,@Location,@LocationID,@LocationCode,@Block,@CustodianDepartment,@CustDesignation,@Status,@Date,@ApprovedQuantity,@AdminComments,@AdminID,@AdminName,@AdminDesignation,@AdminDepartment,@RequestType);SELECT SCOPE_IDENTITY();", conAMS);
                        myCommand.Parameters.AddWithValue("@AssetTypeID", AssetTypeID);
                        myCommand.Parameters.AddWithValue("@RequestBy", lbl_empname.Text);
                        myCommand.Parameters.AddWithValue("@EmployeeID", reqid.Text);
                        myCommand.Parameters.AddWithValue("@Location", Location);
                        myCommand.Parameters.AddWithValue("@LocationID", LocationID);
                        myCommand.Parameters.AddWithValue("@LocationCode", LocationCode);
                        myCommand.Parameters.AddWithValue("@BLOCK", Block);
                        myCommand.Parameters.AddWithValue("@CustodianDepartment", reqdeptname.Text);
                       
                        myCommand.Parameters.AddWithValue("@CustDesignation", reqdesig.Text);
                        myCommand.Parameters.AddWithValue("@Status", "Approved");
                        myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now);
                        myCommand.Parameters.AddWithValue("@ApprovedQuantity", dt.Rows.Count);
                        myCommand.Parameters.AddWithValue("@AdminComments", txt_cmt.Text);
                        myCommand.Parameters.AddWithValue("@AdminID", adminID);
                        myCommand.Parameters.AddWithValue("@AdminName", adminName);
                        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
                        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
                       
                        myCommand.Parameters.AddWithValue("@RequestType", "Asset Parking");
                        try
                        {
                            conAMS.Open();
                            AssetRequestID = Convert.ToInt32(myCommand.ExecuteScalar());
                        }
                        catch (Exception ex)
                        {

                        }
                        finally
                        {
                            conAMS.Close();
                        }


                        for (int m = 0; m < dt.Rows.Count; m++)
                        {
                            string AssetParkingID2 = dt.Rows[m].ItemArray[0].ToString();
                            string AssetID2 = dt.Rows[m].ItemArray[1].ToString();
                            string MainAssetNumber2 = dt.Rows[m].ItemArray[2].ToString();
                            string AssetTypeID2 = dt.Rows[m].ItemArray[3].ToString();
                            string LocationCode2 = dt.Rows[m].ItemArray[4].ToString();
                            string Location2 = dt.Rows[m].ItemArray[5].ToString();
                            string LocationID2 = dt.Rows[m].ItemArray[6].ToString();
                            string Block2 = dt.Rows[m].ItemArray[7].ToString();
                            SqlCommand cmd = new SqlCommand("insert into AssetAllocation(AssetID, MainAssetNumber, AssetRequestID, Date, Status)values(@AssetID,@MainAssetNumber,@AssetRequestID,@Date,@Status)", conAMS);
                            SqlCommand myCommand1 = new SqlCommand("update AssetMaster set Status='LTRF',StatusDesc='Asset Location Transferred',CustodianID='" + reqid.Text + "',CustodianDepartment='" + reqdeptname.Text + "',Location='"+ LocationCode2 + "',LocationDesc='"+ Location2 + "',LocationID='"+ LocationID2 + "',Block='"+ Block2 + "'  where AssetID='" + AssetID2 + "'", conSAP);
                            SqlCommand myCommand2 = new SqlCommand("update AssetParking set Status='InActive' where AssetParkingID='" + AssetParkingID2 + "'", conAMS);
                            cmd.Parameters.AddWithValue("@AssetID", AssetID2);
                            cmd.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber2);
                            cmd.Parameters.AddWithValue("@AssetRequestID", AssetRequestID);
                            cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
                            cmd.Parameters.AddWithValue("@Status", "Approved");
                            try
                            {
                                conAMS.Open();
                                cmd.ExecuteNonQuery();
                                myCommand2.ExecuteNonQuery();
                                conSAP.Open();
                                myCommand1.ExecuteNonQuery();
                                err_msg.Text = "Asset Parking Approved";
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
                        DataTable data = new DataTable();
                        data = ViewState["AddTask"] as DataTable;
                        for (int y = 0; y < data.Rows.Count;)
                        {
                            int id = Convert.ToInt32(data.Rows[y].ItemArray[10]);

                            if (id == AssetTypeID)
                            {
                                data.Rows[y].Delete();
                                data.AcceptChanges();
                                ASPxGridView1.DataSource = data;
                                ASPxGridView1.DataBind();
                                y = 0;

                            }
                            else
                            {
                                y++;
                            }
                        }
                        data.AcceptChanges();
                        ASPxGridView1.DataSource = data;
                        ASPxGridView1.DataBind();
                        count++;
                    }
                    //ViewState["dt"] = null;
                    dt = null;

                }
                clear();
                Response.Redirect("AdminViewAllocatedAssets.aspx");

            }

            catch (Exception ex)
            {

            }
            
        }
                
      }

    protected void clear()
    {
       
        req_qnty.Text = "";
        txt_cmt.Text = "";
        Session["CustodianID"] = "";
        AssetTypesGridView.DataBind();
        ASPxGridView1.DataSource = null;
        ASPxGridView1.DataBind();
        ViewState["AddTask"] = null;
       

    }

    protected void AssetTypesGridView_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Delete")
        {
            string AssetParkingID = AssetTypesGridView.GetRowValuesByKeyValue(e.KeyValue, "AssetParkingID").ToString();
            string AssetID = AssetTypesGridView.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
            SqlCommand myCommand1 = new SqlCommand("update AssetParking set Status='InActive' where AssetParkingID='" + AssetParkingID + "'", conAMS);
            SqlCommand myCommand2 = new SqlCommand("update AssetMaster set Status='AVAL',StatusDesc='Asset Available' where AssetID='" + AssetID + "'", conSAP);

            try
            {
                conAMS.Open();
                conSAP.Open();
                myCommand1.ExecuteNonQuery();
                myCommand2.ExecuteNonQuery();
                AssetTypesGridView.DataBind();
            }
            catch(Exception ex)
            {

            }
            finally
            {
                conAMS.Close();
                conSAP.Close();
            }
         

        }
    }
}
