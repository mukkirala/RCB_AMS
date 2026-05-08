using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView;
using System.Data;

public partial class RequestCustodianChange : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static string Emailid;
    // static string EmployeeID="1";
    static string AssetID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("/ErrorPage.aspx");
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
            AssetList.Visible = true;
        }
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        errormsg.Visible = true;
        if (gridlkup_Asset.Text == "") 
        {
            errormsg.Text = "Select Asset Name";
            errormsg.Visible = true;
            return;

        }
        if (Cust_gridlookup.Text == "")
        {
            errormsg.Text = "Select Employee";
            errormsg.Visible = true;
            return;

        }
        if (txt_comments.Text == "") 
        {
            errormsg.Text = " Enter Comments";
            errormsg.Visible = true;
            return;

        }
        string query1 = "SELECT EmployeeID FROM [CustodianChangeRequest] where EmployeeID ='" + reqid.Text + "'";
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

            string comcode1 = "SELECT Top 1 CustodianSequence FROM CustodianChangeRequest WHERE EmployeeID = '" + reqid.Text + "' ORDER BY Date DESC";
            SqlDataAdapter da3 = new SqlDataAdapter(comcode1, conAMS);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            int count = 0;
            if (dt3.Rows.Count > 0)
            {
                count = Convert.ToInt32(dt3.Rows[0]["CustodianSequence"].ToString());
                count++;
                sequencecount = count;
            }
        }
        else
        {
            sequencecount++;

        }
        myCommand = new SqlCommand("insert into CustodianChangeRequest(AssetID,EmployeeID,RequestBy,CustodianComments,Status,Date,CustodianDepartment,CustDesignation,RequestType,ApproverID,RequestedChangeCustodian,CustodianSequence)values(@AssetID,@EmployeeID,@RequestBy,@CustodianComments,@Status,@Date,@CustodianDepartment,@CustDesignation,@RequestType,@ApproverID,@RequestedChangeCustodian,@CustodianSequence)", conAMS);
        myCommand.Parameters.AddWithValue("AssetID", gridlkup_Asset.Value.ToString());
        myCommand.Parameters.AddWithValue("EmployeeID", reqid.Text);
        myCommand.Parameters.AddWithValue("RequestBy", lbl_requestername.Text);
        myCommand.Parameters.AddWithValue("CustodianComments", txt_comments.Text.ToString());
       
        myCommand.Parameters.AddWithValue("Date", System.DateTime.Now);
        myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
        myCommand.Parameters.AddWithValue("CustDesignation", reqdesign.Text);
        myCommand.Parameters.AddWithValue("RequestType", "Employee Transfer");
        myCommand.Parameters.AddWithValue("CustodianSequence", sequencecount);
        if (lbl_auth.Text == "")
        {
            myCommand.Parameters.AddWithValue("ApproverID", GetAdminCustodianID());
            myCommand.Parameters.AddWithValue("Status", "Request Sent To Admin");
        }
        else
        {
            myCommand.Parameters.AddWithValue("ApproverID", lbl_auth.Text);
            myCommand.Parameters.AddWithValue("Status", "Request Sent To Approver");
        }
        myCommand.Parameters.AddWithValue("RequestedChangeCustodian", Cust_gridlookup.Text);
        conAMS.Open();
        try
        {
            myCommand.ExecuteNonQuery();
            string authid = "";
            if (lbl_auth.Text == "")
            {
                authid = GetAdminCustodianID();
            }
            else
            {
                authid = lbl_auth.Text;
            }
            //string subject = "Request For Asset Custodian Transfer";
            //string msg2 = "New Request of Custodian Transfer from Employee ID <b>" + reqid.Text + ", " + lbl_requestername.Text + "</b> for Asset with MainAssetNumber: <b>" + gridlkup_Asset.Text + "</b> and Asset Description: <b>" + lbl_AssetType.Text + " </b>, is requested for custodian transfer to EmployeeID : <b>"+ Cust_gridlookup.Text + "'</b><br/>" + "<b>Please verify to complete the approval process.</b>";
            //bool response = MailSending.sendMailAttach(authid, subject, msg2);
            //if (response == true)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
            //}
            errormsg.Text = "Request Sent Successfully";
            errormsg.Visible = true;
        }
        catch (Exception ex)
        {
            errormsg.Text = " ";
            errormsg.Visible = true;
        }
        finally
        {
            conAMS.Close();
            Clear();
            AssetList.DataBind();
        }
    }
    private void Clear()
    {
        gridlkup_Asset.Value = "";
        txt_comments.Text = "";
        AssetDetails.Visible = false;
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

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (gridlkup_Asset.Text == "")
        {


        }
        else
        {
            AssetDetails.Visible = true;
            string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,Location,Block,AssetClass FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
                lbl_Assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
                lbl_assetlocation.Text = dt.Rows[0]["Location"].ToString();
                lbl_Block.Text = dt.Rows[0]["Block"].ToString();

            }
        }
    }
}