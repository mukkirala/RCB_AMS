using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.XtraExport;
using DevExpress.Web.ASPxEditors;
public partial class Reopen : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static string Emailid;
    Utilities db = new Utilities();
    // static string EmployeeID="1";
    static string AssetID;
    int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        string StatusNames = WebConfigurationManager.AppSettings.Get("ComplaintStatus");
        ASPxComboBox1.DataSource = StatusNames.Split(',');
        ASPxComboBox1.DataBind();

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
   
    protected void btn_save_Click1(object sender, EventArgs e)
    {
        if (ASPxComboBox1.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Select Status');", true);
        }
        if (Memo_remarks.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Enter Remarks');", true);
        }
        else
        {
            try
            {
                conAMS.Open();
                if (ASPxComboBox1.Text == "Re_open")
                {
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
                    SqlCommand cmd2 = new SqlCommand("update [ComplaintRegistration] set Status='Re_open'  where [ComplaintID]='" + Session["ComplaintID"] + "'", conAMS);
                    SqlCommand cmd3 = new SqlCommand("update  [ComplaintRegistration] set Re_OpenDate =  @RDate, Comments = @Remarks where [ComplaintID]='" + Session["ComplaintID"] + "'", conAMS);
                    cmd3.Parameters.AddWithValue("@RDate", System.DateTime.Now);
                    cmd3.Parameters.AddWithValue("@Remarks", Memo_remarks.Text);
                    cmd3.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();

                    SqlCommand cmd4 = new SqlCommand("insert into ComplaintTransaction(ComplaintID, Status, USR_ID, Remarks, CreatedDate,Sequence) values(@ComplaintID, @Status, @USR_ID, @Remarks, @CreatedDate,@Sequence)", conAMS);
                    cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                    cmd4.Parameters.AddWithValue("@Status", ASPxComboBox1.Text);
                    cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                    cmd4.Parameters.AddWithValue("@Remarks", Memo_remarks.Text);
                    cmd4.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
                    cmd4.Parameters.AddWithValue("@Sequence", sequencecount);
                    string authid = lbl_auth.Value.ToString();
                    string subject = "Dear " + lbl_auth.Text + "";
                    string msg2 = " A Complaint With Complaint ID <b>" + Session["ComplaintID"] + "<b> was Re_opned.</b>";
                    bool response = MailSending.sendMailToApr(authid, subject, msg2);
                    if (response == true)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent for Engineer Successfully.');", true);
                    }
                    else
                    {

                    }
                    cmd4.ExecuteNonQuery();
                    errormsg.Text = "Data Saved Successfully";
                   
                }
                
                //else
                //{
                //    SqlCommand cmd2 = new SqlCommand("update [ComplaintRegistration] set Status='Solved'  where [ComplaintID]='" + Session["ComplaintID"] + "'", conAMS);

                //    cmd2.ExecuteNonQuery();

                //    SqlCommand cmd4 = new SqlCommand("insert into ComplaintTransaction(ComplaintID, Status, USR_ID, Remarks, CreatedDate, ApprovedDate) values(@ComplaintID, @Status, @USR_ID, @Remarks, @CreatedDate, @ApprovedDate)", conAMS);
                //    cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                //    cmd4.Parameters.AddWithValue("@Status", ASPxComboBox1.Text);
                //    cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                //    cmd4.Parameters.AddWithValue("@Remarks", Memo_remarks.Text);
                //    cmd4.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
                //    cmd4.Parameters.AddWithValue("@ApprovedDate", System.DateTime.Now);
                //    cmd4.ExecuteNonQuery();
                //    clear();
                //    errormsg.Text = "Data Saved Successfully";

                //}

            }
            catch (Exception ex)

            {

            }
            finally
            {
                clear();
                conAMS.Close();
                Response.Redirect("~/ViewComplaintsResolved.aspx");
            }
        }
    }

    protected void btn_back_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewComplaintsResolved.aspx");
    }
    protected void clear()
    {
        Memo_remarks.Text = "";
        ASPxComboBox1.Text = "";

    }
}