using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminApproveAssetRequest : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    string adminID, adminName, adminDept, admindesign, rqAsset;
    string AssetTypeID;
    
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
            adminDept = Session["DepartmentName"].ToString();
            admindesign = Session["DESIGNATION"].ToString();
            if (Session["AssetRequestID"] == null)
            {
                Response.Redirect("AdminViewAssetRequest.aspx");
                return;
            }
            else
            {
                try
                {
                    lbl_empname.Text = Session["RequestBy"].ToString();
                    if (Session["RequestedDate"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(Session["RequestedDate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    lbl_rqAsset.Text = Session["AssetTypename"].ToString();
                    lbl_Quantity.Text = Session["RequestedQuantity"].ToString();
                    //lbl_req.Text = Session["Status"].ToString();

                    reqid.Text = Session["EmployeeID"].ToString();
                    reqlocation.Text = Session["CustLocation"].ToString();
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();
                    //apprID.Text = Session["ApproverID"].ToString();
                    //apprName.Text = Session["ApproverName"].ToString();
                    //apprDept.Text = Session["ApproverDepartment"].ToString();
                    //apprdesign.Text = Session["ApproverDesignation"].ToString();
                    //apprcmts.Text = Session["ApproverComments"].ToString();
                    lbl_block.Text = Session["Block"].ToString();
                    //LocationGridLookup1.Text = Session["CustLocation"].ToString();

                    Session["AssetType"] = "";
                    Session["TypeID"] = "";
                    //getAssetTypes();
                }
                catch(Exception ex)
                {

                }
                
                
            }
        }
  }

    //protected void getAssetTypes()
    //{
        
    //    string selectquery = "select * from AssetMaster where AssetMaster.AssetDesc='"+ lbl_rqAsset.Text + "' and AssetMaster.Status in('AVAL','') and AssetMaster.CustodianID in('000000','') and AssetMaster.Deacdate in('')";
    //    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectquery, conSAP);
    //    DataTable dataTable = new DataTable();
    //    sqlDataAdapter.Fill(dataTable);
    //    if (dataTable.Rows.Count > 0)
    //    {
    //        if (gridlkup_Asset.Text == "")
    //        {
    //            Session["AssetType"] = lbl_rqAsset.Text;
    //            Session["TypeID"] = Session["AssetTypeID"].ToString();
    //            AssetTypesGridView.DataBind();
    //        }
    //        else
    //        {
    //            Session["AssetType"] = gridlkup_Asset.Text.ToString();
    //            Session["TypeID"]= gridlkup_Asset.Value.ToString();
    //            AssetTypesGridView.DataBind();
    //        }
           
    //    }
    //    else
    //    {
    //        if (gridlkup_Asset.Text == "")
    //        {
               
    //        }
    //        else
    //        {
    //            //Session["AssetTypename"] = "";
    //            Session["AssetType"] = gridlkup_Asset.Text.ToString();
    //            Session["TypeID"] = gridlkup_Asset.Value.ToString();
    //            AssetTypesGridView.DataBind();
    //        }
    //    }
    //}

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
                string CustodianID = AssetTypesGridView.GetRowValues(i, "CustodianID").ToString();
                AddData(AssetID, MainAssetNumber, SerialNumber, AssetSubNumber, AssetClass, AssetType, AssetTypeID, CustodianID);

                req_qnty.Value = ASPxGridView1.VisibleRowCount;
                //Clear();
            }
        }


    }



    private void AddData(string AssetID, string MainAssetNumber, string SerialNumber, string AssetSubNumber, string AssetClass, string AssetType,string AssetTypeID,string CustodianID)
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
                AddTask.Rows.Add(AssetID, MainAssetNumber, SerialNumber, AssetSubNumber, AssetClass, AssetType, AssetTypeID, CustodianID);
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
            dt.Columns.Add("CustodianID");
            dt.Rows.Add(AssetID, MainAssetNumber, SerialNumber, AssetSubNumber, AssetClass, AssetType, AssetTypeID, CustodianID);
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

        if (req_qnty.Text == "")
        {
            err_msg.Text = "Allocate Quantity";
            err_msg.Visible = true;
            return;
        }

        if (txt_cmt.Text == "")
        {
            err_msg.Text = "Enter Comments";
            err_msg.Visible = true;
            return;
        }
        DataTable dt = new DataTable();
        dt = ViewState["dt"] as DataTable;
        int Allocated_quantity = Convert.ToInt32(req_qnty.Value.ToString());
        int Requested_quantity = Convert.ToInt32(lbl_Quantity.Text);

        if (Allocated_quantity <= Requested_quantity)
        {
            try
            {
                for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
                {
                    AssetTypeID = Session["AssetTypeID"].ToString();
                    int AssetID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetID"));
                    string MainAssetNumber = ASPxGridView1.GetRowValues(i, "MainAssetNumber").ToString();
                    string AssetType = ASPxGridView1.GetRowValues(i, "AssetTypeID").ToString();
                    if (AssetTypeID == AssetType)
                    {
                        if (dt == null)
                        {
                            DataTable dt1 = new DataTable();

                            dt1.Columns.Add("AssetID");
                            dt1.Columns.Add("MainAssetNumber");
                            dt1.Columns.Add("AssetTypeID");

                            dt1.Rows.Add(AssetID, MainAssetNumber, AssetType);

                            dt = dt1 as DataTable;
                        }
                        else
                        {
                            dt.Rows.Add(AssetID, MainAssetNumber, AssetType);
                        }
                    }
                }
                if (dt != null)
                {
                    for (int m = 0; m < dt.Rows.Count; m++)
                    {
                        string authid ="";
                        authid = GetRequesterCustodianID();
                        string AssetID = dt.Rows[m].ItemArray[0].ToString();
                        string MainAssetNumber = dt.Rows[m].ItemArray[1].ToString();
                        int AssetRequestID = Convert.ToInt32(Session["AssetRequestID"]);
                        SqlCommand cmd = new SqlCommand("insert into AssetAllocation(AssetID, MainAssetNumber, AssetRequestID, Date, Status)values(@AssetID,@MainAssetNumber,@AssetRequestID,@Date,@Status)", conAMS);
                        myCommand1 = new SqlCommand("update AssetMaster set Status='LTRF',StatusDesc='Asset Location Transferred',CustodianID='" + authid + "',CustodianDepartment='" + reqdeptname.Text + "',AssetUser='"+ lbl_empname.Text + "',Location='" + reqlocation.Text + "',Block='" + Session["Block"] + "',LocationDesc='" + Session["CustLocationCode"] + "'   where AssetID='" + AssetID + "'", conSAP);
                        cmd.Parameters.AddWithValue("@AssetID", AssetID);
                        cmd.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber);
                        cmd.Parameters.AddWithValue("@AssetRequestID", AssetRequestID);
                        cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
                        cmd.Parameters.AddWithValue("@Status", "Approved");
                        //string subject = "Status Of Your Asset Request";
                        //string msg2 = " Your Request for an Asset has been Approved.</b>";
                        //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
                        //if (response == true)
                        //{
                        //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
                        //}
                        //else
                        //{

                        //}
                        lbl_msg.Text = "Approved Successfully";
                        lbl_msg.Visible = true;
                        try
                        {
                            conAMS.Open();
                            cmd.ExecuteNonQuery();
                            conSAP.Open();
                            myCommand1.ExecuteNonQuery();
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
                    myCommand = new SqlCommand("update EmployeeAssetRequest set Status='Approved',ApprovedQuantity='" + dt.Rows.Count + "',AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment,AdminComments='" + txt_cmt.Text + "',AdminDate=@AdminDate where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);

                    myCommand.Parameters.AddWithValue("@AdminID", adminID);
                    myCommand.Parameters.AddWithValue("@AdminName", adminName);
                    myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
                    myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
                    myCommand.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);



                    try
                    {
                        conAMS.Open();
                        myCommand.ExecuteNonQuery();


                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        conAMS.Close();

                    }

                    DataTable data = new DataTable();
                    data = ViewState["AddTask"] as DataTable;
                    for (int y = 0; y < data.Rows.Count;)
                    {
                        string id = data.Rows[y].ItemArray[6].ToString();

                        if (AssetTypeID == id)
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
                    //count++;
                }

                else
                {
                    //string authid = "";
                    //authid = reqid.Text;
                    SqlCommand myCommand = new SqlCommand("update EmployeeAssetRequest set Status='Rejected',AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment,AdminComments='" + txt_cmt.Text + "' where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);
                    // myCommand1 = new SqlCommand("update AssetAllocation set Status='Rejected' where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);
                    myCommand.Parameters.AddWithValue("@AdminID", adminID);
                    myCommand.Parameters.AddWithValue("@AdminName", adminName);
                    myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
                    myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
                    myCommand.Parameters.AddWithValue("@AdminDate",System.DateTime.Now);
                    //string subject = "Status Of Your Asset Request";
                    //string msg2 = " Your Request for an Asset has been Rejected.</b>";
                    //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
                    //if (response == true)
                    //{
                    //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
                    //}
                    //else
                    //{

                    //}
                    //lbl_msg.Text = "Rejected Successfully";
                    //lbl_msg.Visible = true;

                    try
                    {
                        conAMS.Open();
                        myCommand.ExecuteNonQuery();


                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        conAMS.Close();

                    }
                }

                dt = null;
                dt = ViewState["dt"] as DataTable;
                for (int i = 0; i < ASPxGridView1.VisibleRowCount;)
                {
                    int AssetID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetID"));
                    string MainAssetNumber = ASPxGridView1.GetRowValues(i, "MainAssetNumber").ToString();
                    int AssetType = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetTypeID").ToString());
                    if (dt == null)
                    {
                        DataTable dt1 = new DataTable();

                        dt1.Columns.Add("AssetID");
                        dt1.Columns.Add("MainAssetNumber");
                        dt1.Columns.Add("AssetTypeID");

                        dt1.Rows.Add(AssetID, MainAssetNumber, AssetType);

                        dt = dt1 as DataTable;
                    }
                    for (int j = i + 1; j < ASPxGridView1.VisibleRowCount; j++)
                    {
                        int AssetID1 = Convert.ToInt32(ASPxGridView1.GetRowValues(j, "AssetID"));
                        string MainAssetNumber1 = ASPxGridView1.GetRowValues(j, "MainAssetNumber").ToString();
                        int AssetType1 = Convert.ToInt32(ASPxGridView1.GetRowValues(j, "AssetTypeID").ToString());
                        if (AssetType == AssetType1)
                        {

                            dt.Rows.Add(AssetID1, MainAssetNumber1, AssetType1);

                        }
                        else
                        {

                        }
                    }
                    int AssetRequestID2 = 0;
                    if (dt != null)
                    {
                        string authid1 = "";
                        authid1 = GetRequesterCustodianID();
                        myCommand = new SqlCommand("insert into EmployeeAssetRequest(AssetTypeID,RequestBy,EmployeeID,Location,CustodianDepartment,CustDesignation,Status,Date,ApprovedQuantity,AdminComments,AdminID,AdminName,AdminDesignation,AdminDepartment,RequestType,AdminDate)values(@AssetTypeID,@RequestBy,@EmployeeID,@Location,@CustodianDepartment,@CustDesignation,@Status,@Date,@ApprovedQuantity,@AdminComments,@AdminID,@AdminName,@AdminDesignation,@AdminDepartment,@RequestType,@AdminDate);SELECT SCOPE_IDENTITY();", conAMS);
                        myCommand.Parameters.AddWithValue("@AssetTypeID", AssetType);
                        myCommand.Parameters.AddWithValue("@RequestBy", lbl_empname.Text);
                        myCommand.Parameters.AddWithValue("@EmployeeID", authid1);
                        myCommand.Parameters.AddWithValue("@Location", reqlocation.Text);
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



                        myCommand.Parameters.AddWithValue("@RequestType", "Admin Allocated");
                        myCommand.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);
                        //string subject = "Status Of Your Asset Request";
                        //string msg2 = " Your Request for an Asset has been Approved.</b>";
                        //bool response = MailSending.RejectsendMailAttach(authid1, subject, msg2);
                        //if (response == true)
                        //{
                        //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
                        //}
                        //else
                        //{

                        //}
                        lbl_msg.Text = "Approved Successfully";
                        lbl_msg.Visible = true;
                        try
                        {
                            conAMS.Open();
                            AssetRequestID2 = Convert.ToInt32(myCommand.ExecuteScalar());
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
                            
                            string AssetID2 = dt.Rows[m].ItemArray[0].ToString();
                            string MainAssetNumber2 = dt.Rows[m].ItemArray[1].ToString();
                            SqlCommand cmd = new SqlCommand("insert into AssetAllocation(AssetID, MainAssetNumber, AssetRequestID, Date, Status)values(@AssetID,@MainAssetNumber,@AssetRequestID,@Date,@Status)", conAMS);
                            SqlCommand myCommand1 = new SqlCommand("update AssetMaster set Status='LTRF',StatusDesc='Asset Location Transferred',CustodianID='" + authid1 + "',CustodianDepartment='" + reqdeptname.Text + "',Location='" + reqlocation.Text + "',Block='" + Session["Block"] + "',LocationDesc='" + Session["CustLocationCode"] + "'  where AssetID='" + AssetID2 + "'", conSAP);

                            cmd.Parameters.AddWithValue("@AssetID", AssetID2);
                            cmd.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber2);
                            cmd.Parameters.AddWithValue("@AssetRequestID", AssetRequestID2);
                            cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
                            cmd.Parameters.AddWithValue("@Status", "Approved");
                            //string subject1 = "Status Of Your Asset Request";
                            //string msg21 = " Your Request for an Asset has been Approved.</b>";
                            //bool response1 = MailSending.RejectsendMailAttach(authid1, subject1, msg21);
                            //if (response1 == true)
                            //{
                            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
                            //}
                            //else
                            //{

                            //}
                            lbl_msg.Text = "Approved Successfully";
                            lbl_msg.Visible = true;
                            try
                            {
                                conAMS.Open();
                                cmd.ExecuteNonQuery();

                                conSAP.Open();
                                myCommand1.ExecuteNonQuery();



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
                            int id = Convert.ToInt32(data.Rows[y].ItemArray[6]);

                            if (id == AssetType)
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


                    dt = null;

                }
            }
            catch(Exception ex)
            {

            }
       }
        else
        {
            err_msg.Text = "Allocated Quantity Should Be Less Than Requested Quantity";
            err_msg.Visible = true;
            return;
        }
       
        ////myCommand2 = new SqlCommand("update AssetMaster set Status='LTRF',StatusDesc='Asset Location Transferred',CustodianID='" + EmployeeID + "',CustodianDepartment='"+ Session["CustodianDepartment"].ToString() + "' where AssetID='" + AssetID + "'", conSAP);

        Response.Redirect("/AdminViewAssetRequest");

    }

    //public string GetRequesterCustodianID()
    //{
    //    string id = "";
    //    string query = "SELECT EmployeeID FROM [EmployeeAssetRequest] where EmployeeID ='" + reqid.Text + "'";
    //    SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    if (dt.Rows.Count > 0)
    //    {
    //        id = dt.Rows[0]["EmployeeID"].ToString();
    //    }
    //    return id;
    //}


    protected void RejectAsset_Click(object sender, EventArgs e)
    {
        if (txt_cmt.Text == "")
        {
            err_msg.Text = "Enter Comments";
            err_msg.Visible = true;
            return;
        }
        string authid = "";
        authid = GetRequesterCustodianID();
        myCommand = new SqlCommand("update EmployeeAssetRequest set Status='Rejected',AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment,AdminComments='" + txt_cmt.Text + "' where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);
       // myCommand1 = new SqlCommand("update AssetAllocation set Status='Rejected' where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
        myCommand.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);
        //string subject = "Status Of Your Asset Request";
        //string msg2 = " Your Request for an Asset was Rejected.</b>";
        //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
        //if (response == true)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
        //}
        //else
        //{

        //}
        lbl_msg.Text = "Rejected Successfully";
        lbl_msg.Visible = true;

        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();
           

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            Response.Redirect("/AdminViewAssetRequest.aspx");
        }
    }
    //protected void gridlkup_Asset_Init(object sender, EventArgs e)
    //{
    //    ASPxGridView gv = gridlkup_Asset.GridView as ASPxGridView;
    //    gv.Width = 170;
    //}

    //protected void btn_search_Click(object sender, EventArgs e)
    //{
    //           Session["AssetType"] = "";


    //            if (gridlkup_Asset.Text == "")
    //            {

    //            }
    //            else
    //            {

    //            Session["AssetType"] = gridlkup_Asset.Text.ToString();
    //            AssetTypesGridView.DataBind();
    //            }


    //    }

    public string GetRequesterCustodianID()
    {
        string id = "";
        string inputString = reqid.Text;
        string[] parts = inputString.Split('_');

        string variable1 = parts[0];
        string variable2 = parts[1];

        string query = "SELECT EmployeeID FROM [EmployeeAssetRequest] where EmployeeID ='" + variable1 + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            id = dt.Rows[0]["EmployeeID"].ToString();
        }
        return id;
    }
}