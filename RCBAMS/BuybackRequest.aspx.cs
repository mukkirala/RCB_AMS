using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView;

public partial class BuybackRequest : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection myConnectionString = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static string Emailid;
    // static string EmployeeID="1";
    static string AssetID;

    protected void Page_Load(object sender, EventArgs e)
    {
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
            AssetList.Visible = true;
        }
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        errormsg.Visible = false;
        if (gridlkup_Asset.Text == "")
        {
            errormsg.Text = "Select Asset Name";
            errormsg.Visible = true;
            return;

        }
        myCommand = new SqlCommand("insert into EmployeeAssetBuyback(AssetID,EmployeeID,RequestBy,Comments,Status,Date,CustodianDepartment,CustDesignation,RequestType,ApproverID)values(@AssetID,@EmployeeID,@RequestBy,@Comments,@Status,@Date,@CustodianDepartment,@CustDesignation,@RequestType,@ApproverID)", conAMS);
        myCommand.Parameters.AddWithValue("AssetID", gridlkup_Asset.Value.ToString());
        myCommand.Parameters.AddWithValue("EmployeeID", reqid.Text);
        myCommand.Parameters.AddWithValue("RequestBy", lbl_requestername.Text);
        myCommand.Parameters.AddWithValue("Comments", txt_comments.Text.ToString());
        myCommand.Parameters.AddWithValue("Status", "Request Sent To Admin");
        myCommand.Parameters.AddWithValue("Date", System.DateTime.Now);
        myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
        myCommand.Parameters.AddWithValue("CustDesignation", reqdesign.Text);
        myCommand.Parameters.AddWithValue("RequestType", "Buyback");
        myCommand.Parameters.AddWithValue("ApproverID",lbl_auth.Text);
        conAMS.Open();
        try
        {
            myCommand.ExecuteNonQuery();
            errormsg.Text = "Request Sent Successfully";
            errormsg.Visible = true;
            string authid = GetAdminCustodianID();
            string subject = "Request For Asset BuyBack";
            string msg2 = "New Request of Asset Buyback from Employee ID: <b>" + reqid.Text + ", " + lbl_requestername.Text + "</b> for Asset with MainAssetNumber: <b>" + gridlkup_Asset.Text + "</b> and Asset Description: <b>" + lbl_AssetType.Text + "</b>.<br/><br/>" + "<b>Please verify to complete the approval process.</b>";
            
            bool response = MailSending.sendMailAttach(authid, subject, msg2);
            if (response == true)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
            }
           
        }
        catch (Exception ex)
        {
            errormsg.Text = "Request Sending Failed";
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
            string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,LocationDesc,AssetClass FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
                lbl_Assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
                lbl_assetlocation.Text = dt.Rows[0]["LocationDesc"].ToString();
                
                
            }
        }
    }
}