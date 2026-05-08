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
using System.Linq;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AdminAssignedGEPendingComplaints : System.Web.UI.Page
{
    private static string connection = ConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    private SqlConnection con = new SqlConnection(connection);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        string status = WebConfigurationManager.AppSettings.Get("status");
        cmb_status.DataSource = status.Split(',');
        cmb_status.DataBind();
        if (Session["ComplaintID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        SqlDataAdapter da = new SqlDataAdapter("select ComplaintTransaction.Status,AssetMaster.AssetDesc,ComplaintRegistration.AssetID,ComplaintRegistration.EmployeeID,CustodianMaster.email,ComplaintTransaction.ComplaintID,ComplaintTransaction.AssignedDate, ComplaintRegistration.ComplaintCode,ServiceTypeName,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,ComplaintRegistration.EmployeeName,ComplaintTransaction.Remarks from ComplaintTransaction  inner join ComplaintRegistration on ComplaintRegistration.ComplaintID=ComplaintTransaction.ComplaintID  inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID  inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintRegistration.EmployeeID inner join RCBSAP..AssetMaster on AssetMaster.AssetID=ComplaintRegistration.AssetID where ComplaintTransaction.ComplaintID ='" + Session["ComplaintID"] + "'", con);
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
        }
        if (cmb_status.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please Select Status');", true);
        }
        else
        {
            try
            {
                con.Open();

                SqlCommand cmd2 = new SqlCommand("update [ComplaintRegistration] set Status='" + cmb_status.Text + "' where [ComplaintID]='" + Session["ComplaintID"] + "'", con);

                cmd2.ExecuteNonQuery();
                if (cmb_status.Text == "Resolved")
                {
                    SqlCommand cmd4 = new SqlCommand("update ComplaintTransaction set Comments=@Comments,ProgressDate=@ProgressDate,Status=@Status where[ComplaintID] = '" + Session["ComplaintID"] + "'", con);
                    //cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                    //cmd4.Parameters.AddWithValue("@AssignedTo", cmb_jobDefect.Value);
                    //cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                    cmd4.Parameters.AddWithValue("@Comments", Memo_remarks.Text);
                    cmd4.Parameters.AddWithValue("@Status", cmb_status.Text);
                    cmd4.Parameters.AddWithValue("@ProgressDate", System.DateTime.Now);
                    //  cmd4.Parameters.AddWithValue("@AssignedTo", cmb_tech.Value);
                    cmd4.ExecuteNonQuery();
                    lbl_msg.Text = "Submited As Resolved";
                }
                else
                {
                    SqlCommand cmd4 = new SqlCommand("update ComplaintTransaction set Comments=@Comments,ProgressDate=@ProgressDate,Status=@Status where[ComplaintID] = '" + Session["ComplaintID"] + "'", con);
                    //cmd4.Parameters.AddWithValue("@ComplaintID", Session["ComplaintID"]);
                    //cmd4.Parameters.AddWithValue("@AssignedTo", cmb_jobDefect.Value);
                    //cmd4.Parameters.AddWithValue("@USR_ID", Session["UserID"]);
                    cmd4.Parameters.AddWithValue("@Comments", Memo_remarks.Text);
                    cmd4.Parameters.AddWithValue("@Status", cmb_status.Text);
                    cmd4.Parameters.AddWithValue("@ProgressDate", System.DateTime.Now);
                    cmd4.ExecuteNonQuery();
                    lbl_msg.Text = "Submited For Work In Progress";
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
            }
        }

    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EngineerPendingComplaints.aspx");
    }
    protected void clear()
    {
        Memo_remarks.Text = "";
        // cmb_tech.Text = "";
        lbl_status.Text = "";
    }
}