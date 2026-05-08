using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GeneralComplaintRegestation : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static string Emailid;
    Utilities db = new Utilities();
    // static string EmployeeID="1";
    static string AssetID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // AssetDetails.Visible = false;
        }
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
            lbl_auth.Text = Session["ReportingAuthority"].ToString();
            lblmail.Text = Session["Mail"].ToString();
        }

    

}

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (gridlkup_Asset.Text == "")
        {
            errormsg.Text = "Pelese Select Asset";

        }
       
        else
        {
            AssetDetails.Visible = true;
            string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,BLOCK,Location,AssetID FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
                lbl_Assetclass.Text = dt.Rows[0]["AssetID"].ToString();
                lbl_assetlocation.Text = dt.Rows[0]["Location"].ToString();
                lbl_block.Text = dt.Rows[0]["BLOCK"].ToString();

            }
        }

    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        //errormsg.Visible = false;
        // if (cmb_assetclass.Text == "")
        {
            // errormsg.Text = "Please Select Asset Class";
            //errormsg.Visible = true;
            // return;

        }
        //if (gridlkup_Asset.Text == "")
        //{
        //    errormsg.Text = "Select Asset";
        //    errormsg.Visible = true;
        //    return;
        //}
        if (cmb_service.Text == "")
        {
            errormsg.Text = "Select Complaint Type";
            errormsg.Visible = true;
            return;
        }
        if (Memo_Desc.Text == "")
        {
            errormsg.Text = "Pelese Enter Description";

        }

        try
        {
            generatecode();

            if (FileUpload1.HasFile)
            {

                FileUpload1.SaveAs(Server.MapPath("~/complaintimages/") + FileUpload1.PostedFile.FileName);


                Session["file_guest"] = "~/complaintimages/" + FileUpload1.PostedFile.FileName;
            }

            //string assetclassname = cmb_assetclass.GridView.GetRowValues(cmb_assetclass.GridView.FocusedRowIndex, "AssetClassID").ToString();
            myCommand = new SqlCommand("insert into [dbo].[ComplaintRegistration](AssetID,EmployeeID,ApproverID,ApproverName,EmployeeName,ComplaintType, EmployeeDepartment,EmployeeDesignation,ServiceTypeID,CreatedDate, Status,Complaint_Description,FilePath)values(@AssetID,@EmployeeID,@ApproverID,@ApproverName,@EmployeeName,@ComplaintType,@EmployeeDepartment,@EmployeeDesignation,@ServiceTypeID, @CreatedDate,@Status,@Complaint_Description, @FilePath)" + "SELECT SCOPE_IDENTITY()", conAMS);
            if (FileUpload1.HasFile)
            {
                myCommand.Parameters.AddWithValue("@FilePath", Session["file_guest"]);
            }
            else
            {
                myCommand.Parameters.AddWithValue("@FilePath", "");
            }

            //D:\Bharath\bel\BELAssetManagement\complaintimages("insert into EmployeeAssetRequest(AssetTypeID,RequestBy,EmployeeID,Status,Date,CustodianDepartment,EmployeeDesignation,ComplaintType,ApproverID,AssetClassID)values(@AssetTypeID,@RequestBy,@EmployeeID,@Quantity,@Status,@Date,@CustodianDepartment,@CustDesignation,@ComplaintType,@ApproverID,@AssetClassID)", conAMS);
            // myCommand.Parameters.AddWithValue("AssetClassID", cmb_assetclass.Text);
            myCommand.Parameters.AddWithValue("AssetID", gridlkup_Asset.Value.ToString());
            //myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
            myCommand.Parameters.AddWithValue("EmployeeName", lbl_requestername.Text.ToString());
            myCommand.Parameters.AddWithValue("EmployeeID", reqid.Value.ToString());
            myCommand.Parameters.AddWithValue("EmployeeDepartment", reqdept.Text.ToString());
            myCommand.Parameters.AddWithValue("ApproverName", lbl_auth.Value.ToString());
            myCommand.Parameters.AddWithValue("Status", "Pending");
            myCommand.Parameters.AddWithValue("ComplaintType", "General");
            myCommand.Parameters.AddWithValue("CreatedDate", System.DateTime.Now);
            myCommand.Parameters.AddWithValue("Complaint_Description", Memo_Desc.Text);
            myCommand.Parameters.AddWithValue("EmployeeDesignation", reqdesign.Text.ToString());
            myCommand.Parameters.AddWithValue("ServiceTypeID", cmb_service.Value);

            if (lbl_auth.Text == "")
            {
                myCommand.Parameters.AddWithValue("ApproverID", GetAdminCustodianID());
                //myCommand.Parameters.AddWithValue("Status", "Request Sent To Admin");
            }
            else
            {
                myCommand.Parameters.AddWithValue("ApproverID", lbl_auth.Text);
                // myCommand.Parameters.AddWithValue("Status", "Request Sent To Approver");
            }
            conAMS.Open();
            int ComID = Convert.ToInt32(myCommand.ExecuteScalar());
            Session["ComID"] = ComID;
            Session["ServiceType"] = cmb_service.Text;



            //clear();
            //lbl_msg.Text = "Data Saved Successfully";
            // SendSMS();
            string query1 = "SELECT USR_ID FROM [ComplaintTransaction] where USR_ID ='" + reqid.Text + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(query1, conAMS);
            DataTable dt2 = new DataTable();
            da1.Fill(dt2);
            int sequencecount = 0;
            if (dt2.Rows.Count > 0)
            {
                //id1 = dt.Rows[0]["CustodianID"].ToString();
                //myCommand.Parameters.AddWithValue("ApproverName", dt1.Rows[0]["CustodianName"].ToString());
                //SqlCommand comcode = new SqlCommand("SELECT Top 1 ComplaintID,Sequence FROM ComplaintTransaction WHERE USR_ID = '" + reqid.Text + "' ORDER BY CreatedDate DESC", conAMS);
                //comcode.ExecuteNonQuery();

                string comcode1 = "SELECT Top 1 Sequence FROM ComplaintTransaction WHERE USR_ID = '" + reqid.Text + "' ORDER BY CreatedDate DESC";
                SqlDataAdapter da3 = new SqlDataAdapter(comcode1, conAMS);
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                int count = 0;
                if (dt3.Rows.Count > 0)
                {
                    count = Convert.ToInt32(dt3.Rows[0]["Sequence"].ToString());
                    count++;
                    sequencecount = count;
                }
            }
            else
            {
                sequencecount++;

            }



            SqlCommand cmd1 = new SqlCommand("Update ComplaintRegistration set ComplaintCode='" + Session["ComplaintCode"] + "'  where ComplaintID='" + ComID + "' ", conAMS);

            cmd1.ExecuteNonQuery();
            errormsg.Text = "Data Submitted Successfully";
            SqlCommand cmd2 = new SqlCommand("insert into [dbo].[ComplaintTransaction]( ComplaintID, Status, USR_ID, Remarks, CreatedDate,Sequence,ComplaintType)values(@ComplaintID, @Status, @USR_ID, @Remarks, @CreatedDate,@Sequence,@ComplaintType)", conAMS);
            cmd2.Parameters.AddWithValue("@ComplaintID", ComID);
            cmd2.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
            cmd2.Parameters.AddWithValue("@Remarks", "");
            cmd2.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
            cmd2.Parameters.AddWithValue("@Sequence", sequencecount);
            // cmd2.Parameters.AddWithValue("@ApprovedDate", System.DateTime.Now);
            cmd2.Parameters.AddWithValue("@Status", "Pending");
            cmd2.Parameters.AddWithValue("@ComplaintType", "General");
            cmd2.ExecuteNonQuery();

            conAMS.Close();
            Clear();

            AssetList.DataBind();
            errormsg.Text = "Data Submitted Successfully";

            string authid = "";
            if (lbl_auth.Text == "")
            {
                authid = GetAdminCustodianID();
            }
            else
            {
                authid = lbl_auth.Text;
            }
            string subject = "Request For Complaint Registaion";
            string msg2 = " New Request of Asset  Complaint from Employee ID <b>" + reqid.Text + ", " + lbl_requestername.Text + "</b> for Asset Type: <b>" + gridlkup_Asset.Text + "<b>Please verify to complete the approval process.</b>";
            bool response = MailSending.sendMailAttach(authid, subject, msg2);
            if (response == true)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent for complaint Registion Successfully.');", true);
            }
            else
            {

            }
            errormsg.Text = "Request Sent Successfully";
            errormsg.Visible = true;

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
        }
    }

    private void Clear()
    {
        gridlkup_Asset.Value = "";
        // cmb_assetclass.Text = "";
        cmb_service.Text = "";
        Memo_Desc.Text = "";
        //LocationGridLookup1.Value = "";
    }

    public string GetAdminCustodianID()
    {
        string id = "";
        string query = "SELECT CustodianID FROM [RoleMaster] where ROLE_NAME ='Admin' and ROLE_STATUS='Active'";
        SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            id = dt.Rows[0]["CustodianID"].ToString();
        }
        return id;
    }

    protected void gridlkup_Asset_Init(object sender, EventArgs e)
    {
        ASPxGridView gv = gridlkup_Asset.GridView as ASPxGridView;
        gv.Width = 300;
    }
    protected void SendSMS()
    {
        // string otp = Session["OTP"].ToString();
        //string Message = "Dear:" + Session["name"].ToString() + ", " + otp + " is your NAARM Verification Code. Use this code for Signup";
        string Message = "Your Complaint for " + Session["ServiceType"] + " registered with MES. Your Complaint Number is " + Session["ComID"] + " Thank You NEEMUS";
        //string Message = "SVPNPA Signup Verification code is " + otp + " ,Please do not share this OTP with anyone to ensure account security ";
        string Contactnumber;
        Contactnumber = "91" + Session["MobileNumber"].ToString();
        // Utilities.Sms(Contactnumber.Trim(), Message);
    }
    private string generatecode()
    {
        string code;
        string Temp = "TEMP";
        SqlCommand command = new SqlCommand("select Top 1 ComplaintCode from ComplaintRegistration where Status='Pending' order by ComplaintID DESC", conAMS);
        SqlDataAdapter da = new SqlDataAdapter(command);
        System.Data.DataTable dt = new System.Data.DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string t = dt.Rows[0].ItemArray[0].ToString();
            if (t != "")
            {
                t = t.Substring(t.Length - 5);
                int PIID = Convert.ToInt32(t);
                ViewState["ComplaintCode"] = PIID;
            }
            else
            {
                int PIID = 0;
                ViewState["ComplaintCode"] = PIID;
            }
        }
        else
        {
            int PIID = 0;
            ViewState["ComplaintCode"] = PIID;
        }
        int seqno = Convert.ToInt32(ViewState["ComplaintCode"].ToString());
        if (seqno == 0)
        {
            seqno = 000000001;
            code = Convert.ToString(seqno).PadLeft(9, '0');

            Session["ComplaintCode"] = code;
        }
        else
        {
            code = Convert.ToString(seqno + 1).PadLeft(9, '0');
            Session["ComplaintCode"] = code;
        }
        return code;


    }

    protected void AssetList_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
    {
        ASPxGridView gridView = (ASPxGridView)sender;
        string AssetID = e.GetValue("ComplaintID").ToString();
        string Status = e.GetValue("Status").ToString();
        // string ComplaintStatus = e.GetValue("ComplaintStatus").ToString();
        if (e.DataColumn.FieldName == "Status")
        {
            if (Status == "Pending")
            {
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
            else if (Status == "Resolved")
            {
                e.Cell.BackColor = System.Drawing.Color.Green;
            }
            else if (Status == "Work In Progres")
            {
                e.Cell.BackColor = System.Drawing.Color.Orange;
            }
            // }
            //if(e.DataColumn.FieldName == "ComplaintStatus")
            //{
            else if (Status == "Re_open")
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
            }
        }
    }
}