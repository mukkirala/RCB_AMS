using DevExpress.Utils.OAuth.Provider;
using DevExpress.XtraCharts.Native;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Configuration;

public partial class AssignedGEPendingComplaints : System.Web.UI.Page
{
    private static string connection = ConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    private SqlConnection con = new SqlConnection(connection);
    static string Emailid;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        string status = WebConfigurationManager.AppSettings.Get("status");
        cmb_status.DataSource = status.Split(',');
        cmb_status.DataBind();
        if (Session["ComplaintTransactionID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        SqlDataAdapter da = new SqlDataAdapter("select ComplaintTransaction.ComplaintTransactionID,AssetMaster.AssetDesc,ComplaintRegistration.AssetID,ComplaintRegistration.EmployeeID,CustodianMaster.email,ComplaintTransaction.ComplaintID,ComplaintTransaction.AssignedDate, ComplaintRegistration.ComplaintCode,ServiceTypeName,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,ComplaintRegistration.EmployeeName,ComplaintTransaction.Remarks from ComplaintTransaction  inner join ComplaintRegistration on ComplaintRegistration.ComplaintID=ComplaintTransaction.ComplaintID  inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID  inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintRegistration.EmployeeID inner join RCBSAP..AssetMaster on AssetMaster.AssetID=ComplaintRegistration.AssetID where ComplaintTransaction.ComplaintTransactionID ='" + Session["ComplaintTransactionID"] + "'", con);
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
            lbl_status.Text = dt.Rows[0]["ComplaintTransactionID"].ToString();
            string dat = dt.Rows[0]["AssignedDate"].ToString();
            DateTime date = Convert.ToDateTime(dat);
            ViewState["AssignedDate"] = date;
            lbl_Date.Text = date.ToString("dd-MM-yyyy");
            lbl_Description.Text = dt.Rows[0]["Remarks"].ToString();
            //lbl_file.Text = dt.Rows[0]["FilePath"].ToString();
            //lbl_complaintcode.Text = dt.Rows[0]["ComplaintCode"].ToString();
            //lbl_num.Text = dt.Rows[0]["AssetDesc"].ToString();
            //Session["MobileNumber"] = lbl_num.Text;
            //using EnvDTE;
        }

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (Memo_remarks.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Enter Comments');", true);
            return;
        }
        if (cmb_status.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Select Status');", true);
            return;
        }
        else
        {
            try
            {
                con.Open();

                

                
                if (cmb_status.Text == "Resolved")
                {
                    SqlCommand cmd2 = new SqlCommand("update [ComplaintRegistration] set Status='" + cmb_status.Text + "' where [ComplaintID]='" + Com_ID.Text + "'", con);
                    SqlCommand cmd4 = new SqlCommand("update ComplaintTransaction set Comments=@Comments,ProgressDate=@ProgressDate,Status=@Status where[ComplaintTransactionID] = '" + Session["ComplaintTransactionID"] + "'", con);
                    //cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                    //cmd4.Parameters.AddWithValue("@AssignedTo", cmb_jobDefect.Value);
                    //cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                    cmd4.Parameters.AddWithValue("@Comments", Memo_remarks.Text);
                    cmd4.Parameters.AddWithValue("@Status", cmb_status.Text);
                    cmd4.Parameters.AddWithValue("@ProgressDate", System.DateTime.Now);
                    //  cmd4.Parameters.AddWithValue("@AssignedTo", cmb_tech.Value);
                    cmd2.ExecuteNonQuery();
                    cmd4.ExecuteNonQuery();
                    lbl_msg.Text = "Submited As Resolved";
                    //Response.Redirect("~/ViewAssignedComplaints.aspx");
                    string authid = lbl_eid.Text;
                    string subject = "Complaint Status";
                    string msg2 = " Your Complaint for an Asset  " +asset_id.Text + " has Resolved ";
                    bool response = MailSending.sendMailToEmp(authid, subject, msg2);
                    if (response == true)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
                    }
                    else
                    {

                    }
                }

                else
                {
                    SqlCommand cmd2 = new SqlCommand("update [ComplaintRegistration] set Status='" + cmb_status.Text + "' where [ComplaintID]='" + Com_ID.Text + "'", con);
                    SqlCommand cmd4 = new SqlCommand("update ComplaintTransaction set Comments=@Comments,ProgressDate=@ProgressDate,Status=@Status where[ComplaintTransactionID] = '" + Session["ComplaintTransactionID"] + "'", con);
                    //cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                    //cmd4.Parameters.AddWithValue("@AssignedTo", cmb_jobDefect.Value);
                    //cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                    cmd4.Parameters.AddWithValue("@Comments", Memo_remarks.Text);
                    cmd4.Parameters.AddWithValue("@Status", cmb_status.Text);
                    cmd4.Parameters.AddWithValue("@ProgressDate", System.DateTime.Now);
                    cmd2.ExecuteNonQuery();
                    cmd4.ExecuteNonQuery();
                    lbl_msg.Text = "Submited For Work In Progress";
                    //string subject = "Request For Complaint Registaion";
                    //string msg2 = " New Request of Asset  Complaint from Employee ID <b>" + reqid.Text + ", " + lbl_requestername.Text + "</b> for Asset Type: <b>" + gridlkup_Asset.Text + "<b>Please verify to complete the approval process.</b>";
                    //bool response = MailSending.sendMailAttach(authid, subject, msg2);

                }
                //ASPxGridView1.DataBind();
                
                clear();
            }
            catch (Exception ex)

            {

            }
            finally
            {
                con.Close();
                Response.Redirect("~/ViewAssignedComplaints");
            }
        }

    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAssignedComplaints.aspx");
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



    protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {

    }
    protected void clear()
    {
        Memo_remarks.Text = "";
        // cmb_tech.Text = "";
        lbl_status.Text = "";
    }
}