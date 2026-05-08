using DevExpress.Utils.OAuth.Provider;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AdminAssignPendingComplaints : System.Web.UI.Page
{
    //lbl_Emailidusing DevExpress.Utils.OAuth.Provider;
    private static string connection = ConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    private SqlConnection con = new SqlConnection(connection);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        //string StatusNames = WebConfigurationManager.AppSettings.Get("Status");
        //cmb_status.DataSource = StatusNames.Split(',');
        //cmb_status.DataBind();
        if (Session["ComplaintTransactionID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        SqlDataAdapter da = new SqlDataAdapter("select ComplaintRegistration.Status,AssetMaster.AssetDesc,ComplaintRegistration.AssetID,ComplaintRegistration.EmployeeID,ComplaintRegistration.Complaint_Description,CustodianMaster.email,ComplaintRegistration.ComplaintID,ComplaintRegistration.CreatedDate, ComplaintCode,ServiceTypeName,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,ComplaintRegistration.EmployeeName from ComplaintRegistration  inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID  inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID  inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintRegistration.EmployeeID inner join RCBSAP..AssetMaster on AssetMaster.AssetID=ComplaintRegistration.AssetID where  ComplaintTransaction.ComplaintTransactionID='" + Session["ComplaintTransactionID"] + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lbl_eid.Text = dt.Rows[0]["EmployeeID"].ToString();
            lbl_ename.Text = dt.Rows[0]["EmployeeName"].ToString();
            lbl_Emailid.Text = dt.Rows[0]["email"].ToString();
            Com_ID.Text = dt.Rows[0]["ComplaintID"].ToString();
            asset_name.Text = dt.Rows[0]["AssetDesc"].ToString();
            asset_id.Text = dt.Rows[0]["AssetID"].ToString();
            lbl_Mnum.Text = dt.Rows[0]["MainAssetNumber"].ToString();
            lbl_Snum.Text = dt.Rows[0]["AssetSubNumber"].ToString();
            lbl_serv.Text = dt.Rows[0]["ServiceTypeName"].ToString();
            lbl_status.Text = dt.Rows[0]["Status"].ToString();
            string dat = dt.Rows[0]["CreatedDate"].ToString();
            DateTime date = Convert.ToDateTime(dat);
            ViewState["CreatedDate"] = date;
            lbl_Date.Text = date.ToString("dd-MM-yyyy");
            lbl_Description.Text = dt.Rows[0]["Complaint_Description"].ToString();
            //lbl_file.Text = dt.Rows[0]["FilePath"].ToString();
            //lbl_complaintcode.Text = dt.Rows[0]["ComplaintCode"].ToString();
            //lbl_num.Text = dt.Rows[0]["AssetDesc"].ToString();
            //Session["MobileNumber"] = lbl_num.Text;
        }
    }

    static int slno = 0;
    static DataTable inspectdef_DT;


    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (cmb_jobDefect.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Select Engineer');", true);
        }
        if (Memo_remarks.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Enter Remarks');", true);
        }
        else
        {
            try
            {
                con.Open();

                //SqlCommand cmd2 = new SqlCommand("update [ComplaintRegistration] set AssignedTo='" + cmb_jobDefect.Value + "' where [ComplaintID]='" + Session["ComplaintID"] + "'", con);

                //cmd2.ExecuteNonQuery();

                SqlCommand cmd4 = new SqlCommand("update ComplaintTransaction set ApproverComments=@ApproverComments, AssignedTo=@AssignedTo,AssignedDate=@AssignedDate,AsnStatus=@AsnStatus,Status=@Status where[ComplaintTransactionID] = '" + Session["ComplaintTransactionID"] + "'", con);
                //cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                cmd4.Parameters.AddWithValue("@AssignedTo", cmb_jobDefect.Value);
                //cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                cmd4.Parameters.AddWithValue("@ApproverComments", Memo_remarks.Text);
                cmd4.Parameters.AddWithValue("@AsnStatus", "Assign");
                cmd4.Parameters.AddWithValue("@AssignedDate", System.DateTime.Now);

                cmd4.Parameters.AddWithValue("@Status", "Assign");

                lbl_msg.Text = "Data Saved Successfully";
                string authid = cmb_jobDefect.Value.ToString();
                string subject = "Request to Solve Complaint";
                string msg2 = " A new Complaint was Assigned to you with Asset <b>" + asset_id.Text + "<b> Complete as soon as you can .</b>";
                bool response = MailSending.sendMailToEng(authid, subject, msg2);
                if (response == true)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent for Engineer Successfully.');", true);
                }
                else
                {

                }
                cmd4.ExecuteNonQuery();
                clear();
                Response.Redirect("~/AdminViewPendingComplaints.aspx");
                //Response.Redirect("~/ViewGEPendingComplaints.aspx");
            }
            catch (Exception ex)

            {

            }
            finally
            {
                con.Close();
            }
        }

    
}
    public void SendSMS()
    {
        // string otp = Session["OTP"].ToString();
        //string Message = "Dear:" + Session["name"].ToString() + ", " + otp + " is your NAARM Verification Code. Use this code for Signup";
        string Message = "Your Complaint Number" + Session["ComplaintTransactionID"] + " has been resolved. Please check details on portal/mobile app.NEEMUS";
        //string Message = "SVPNPA Signup Verification code is " + otp + " ,Please do not share this OTP with anyone to ensure account security ";
        string Contactnumber;
        Contactnumber = "91" + Session["MobileNumber"].ToString();
        // Utilities.Sms(Contactnumber.Trim(), Message);
    }
    protected void clear()
    {
        Memo_remarks.Text = "";
        cmb_jobDefect.Value = "";
        // cmb_tech.Text = "";
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminViewPendingComplaints.aspx");
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string path = "";
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "view")
        {
            try
            {
                path = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "FilePath").ToString();
                //SqlDataAdapter SelectQery = new SqlDataAdapter("SELECT documentFileLocation from DocumentRepository where  DocumentRepID='" + DocumentRepID + "'", con);
                //DataTable dt = new DataTable();
                //SelectQery.Fill(dt);
                //if (dt.Rows.Count > 0)
                //{
                //path = dt.Rows[0].ItemArray[0].ToString();
                Session["path"] = path;
                string files = Path.GetFileName(Path.GetDirectoryName(path));
                string filename = Path.GetFileName(path);
                //string url = "PdfReports" + "/" + files + "/" + filename + "";
                //string fullURL = "window.open('" + url + "', '_blank' );";
                //ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", fullURL, true);
                Response.Redirect(path);

            }
            // }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}