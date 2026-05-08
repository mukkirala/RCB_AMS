using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Globalization;
using DevExpress.Utils.OAuth.Provider;
using DevExpress.Web.ASPxGridView;

public partial class ApproveAssetRequest : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    static int srno = 0;
    static int count = 0;
    string UserID, USR_NAME, DepartmentName, DESIGNATION;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        try
        {
            UserID = Session["UserID"].ToString();
            USR_NAME = Session["USR_NAME"].ToString();

            DepartmentName = Session["DepartmentName"].ToString();
            DESIGNATION = Session["DESIGNATION"].ToString();
            if (Session["Status"].ToString() == "Approved")
            {
                Approve.Visible = false;
            }
            lbl_empname.Text = Session["RequestBy"].ToString();
            if (Session["Date"].ToString() != null)
            {
                lbl_date.Text = Convert.ToDateTime(Session["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
            }
            lbl_rqAsset.Text = Session["AssetTypename"].ToString();
            lbl_Quantity.Text = Session["Quantity"].ToString();
            reqid.Text = Session["EmployeeID"].ToString();

            reqdeptname.Text = Session["EmpDept"].ToString();
            reqdesig.Text = Session["EmpDesig"].ToString();
            lbl_custlocation.Text = Session["CustLocation"].ToString();
        }
        catch(Exception ex)
        {

        }
         
        //lbl_req.Text = Session["Status"].ToString();
    }

    protected void Approve_Click(object sender, EventArgs e)
    {
        if (text_cmt.Text == "")
        {
            lbl_msg.Text = "Enter Remarks";
            lbl_msg.Visible = true;
            return;
        }

        string authid = "";
        //authid = GetAdminCustodianID();
        string query = "SELECT CustodianID FROM [RoleMaster] where ROLE_NAME ='Admin' and ROLE_STATUS='Active'";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                authid = dt.Rows[i]["CustodianID"].ToString();

                myCommand = new SqlCommand("update EmployeeAssetRequest set Status='Request Sent To Admin',ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment,ApproverComments='" + text_cmt.Text + "' where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);
                myCommand.Parameters.AddWithValue("@ApproverID", UserID);
                myCommand.Parameters.AddWithValue("@ApproverName", USR_NAME);
                myCommand.Parameters.AddWithValue("@ApproverDesignation", DESIGNATION);
                myCommand.Parameters.AddWithValue("@ApproverDepartment", DepartmentName);
                string subject = "Request For Asset Allocation";
                string msg2 = " New Request of Asset Allocation from Employee ID <b>" + reqid.Text + ",</b> Name : <b> " + lbl_empname.Text + "</b> Requested Quantity For Asset Type: <b>" + lbl_Quantity.Text + "</b> for Asset Type: <b>" + lbl_rqAsset.Text + "</b> to the location: <b>" + lbl_custlocation.Text + "</b>.<br/>" + "<b>Please verify to complete the approval process.</b>";
                bool response = MailSending.AdminsendMailAttach(authid, subject, msg2);
                if (response == true)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent To Admin Successfully.');", true);
                }
                lbl_msg.Text = "Sent To Admin Successfully";
                lbl_msg.Visible = true;
            }
        }
        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();

        }
        catch(Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            Response.Redirect("/ApproveAsset.aspx");
        }
      
    }

    protected void Reject_Click(object sender, EventArgs e)
    {
        if (text_cmt.Text == "")
        {
            lbl_msg.Text = "Enter Remarks";
            lbl_msg.Visible = true;
            return;
        }
        string authid = "";
        authid = GetRequesterCustodianID();
        myCommand = new SqlCommand("update EmployeeAssetRequest set Status='Rejected',ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment,ApproverComments='" + text_cmt.Text + "' where AssetRequestID='" + Session["AssetRequestID"] + "'", conAMS);
        myCommand.Parameters.AddWithValue("@ApproverID", UserID);
        myCommand.Parameters.AddWithValue("@ApproverName", USR_NAME);
        myCommand.Parameters.AddWithValue("@ApproverDesignation", DESIGNATION);
       
        myCommand.Parameters.AddWithValue("@ApproverDepartment", DepartmentName);
        string subject = "Status Of Your Asset Request";
        string msg2 = " Your Request for an Asset has been Rejected.</b>";
        bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
        if (response == true)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
        }
        else
        {

        }
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
            Response.Redirect("/ApproveAsset.aspx");
        }
    }
    public string GetAdminCustodianID()
    {
        string id = "";
       
        return id;
    }
    public string GetRequesterCustodianID()
    {
        string id = "";
        string inputString = reqid.Text;
        string[] parts = inputString.Split('_');

        string variable1 = parts[0];
        string variable2 = parts[1];

        string query = "SELECT EmployeeID FROM [EmployeeAssetRequest] where EmployeeID ='"+ variable1 + "'";
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