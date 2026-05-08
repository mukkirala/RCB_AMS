using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using DevExpress.Xpo.DB.Helpers;
using System.Windows.Forms;

public partial class AssetReturnRequest : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserID"] == null)
        {
            Response.Redirect("/Login.aspx");
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
        if (txt_comments.Text == "")
        {
            errormsg.Text = "Enter Comments";
            errormsg.Visible = true;
            return;

        }
        String query12 = " Select AssetID From EmployeeAssetReturn where  EmployeeID='" + reqid.Text + "' and Status='Request Sent To Admin' and AssetID='" + gridlkup_Asset.Value.ToString() + "'";
        SqlDataAdapter da12 = new SqlDataAdapter(query12, conAMS);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        if(dt12.Rows.Count > 0)
        {
            errormsg.Text = "A Request With Same Asset ID is Sent To Admin";
            errormsg.Visible = true;
            return;
        }

        String query =" Select EmployeeID From EmployeeAssetReturn where  EmployeeID='"+ reqid.Text +"' ";
        SqlDataAdapter da1 = new SqlDataAdapter(query, conAMS);
        DataTable dt2 = new DataTable();
        da1.Fill(dt2);
        int sequencecount = 0;
        if(dt2.Rows.Count > 0)
        {
            string query1 = "Select Top 1 ReturnSequene From EmployeeAssetReturn where EmployeeID='"+ reqid.Text + "' ";
            SqlDataAdapter da2 = new SqlDataAdapter(query1, conAMS);
            DataTable dt3 = new DataTable();
            da2.Fill(dt3);
            int count = 0;
            if (dt3.Rows.Count > 0)
            {
                count = Convert.ToInt32(dt3.Rows[0]["ReturnSequene"].ToString());
                count++;
                sequencecount = count;
            }
        }
        else
        {
            sequencecount++;
        }       
        string authid = "";
        //authid = GetRequesterCustodianID();
        string query11 = "SELECT CustodianID FROM [RoleMaster] where ROLE_NAME ='Admin' and ROLE_STATUS='Active'";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(query11, conAMS);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                authid = dt.Rows[i]["CustodianID"].ToString();
                myCommand = new SqlCommand("insert into EmployeeAssetReturn(AssetID,EmployeeID,RequestBy,CustodianComments,Status,Date,CustodianDepartment,CustDesignation,RequestType,ApproverID,ReturnSequene)values(@AssetID,@EmployeeID,@RequestBy,@CustodianComments,@Status,@Date,@CustodianDepartment,@CustDesignation,@RequestType,@ApproverID,@ReturnSequene)", conAMS);
        myCommand.Parameters.AddWithValue("AssetID", gridlkup_Asset.Value.ToString());
        myCommand.Parameters.AddWithValue("EmployeeID", reqid.Text);
        myCommand.Parameters.AddWithValue("RequestBy", lbl_requestername.Text);
        myCommand.Parameters.AddWithValue("CustodianComments", txt_comments.Text.ToString());
        myCommand.Parameters.AddWithValue("Status", "Request Sent To Admin");
        myCommand.Parameters.AddWithValue("Date", System.DateTime.Now);
        myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
        myCommand.Parameters.AddWithValue("CustDesignation", reqdesign.Text);
        myCommand.Parameters.AddWithValue("RequestType", "Asset Return");
        myCommand.Parameters.AddWithValue("ReturnSequene", sequencecount );
        myCommand.Parameters.AddWithValue("ApproverID", lbl_auth.Text);
                //string subject = "Request For Asset Return";
                //string msg2 = "New Request of Asset Return from Employee ID: <b>" + reqid.Text + ", " + lbl_requestername.Text + "</b> for An Asset with AssetNumber: <b>" + gridlkup_Asset.Text + "</b> and Asset Description: <b>" + lbl_AssetType.Text + "</b>.<br/><br/>" + "<b>Please verify to complete the approval process.</b>";

                //bool response = MailSending.AdminsendMailAttach(authid, subject, msg2);
                //if (response == true)
                //{
                //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent To Admin Successfully.');", true);
                //}
                errormsg.Text = "Sent To Admin Successfully";
                errormsg.Visible = true;
            }
        }

        conAMS.Open();
        try
        {
            myCommand.ExecuteNonQuery();
            errormsg.Text = "Request Sent Successfully";
            errormsg.Visible = true;

        }
        catch (Exception )
        {
            //errormsg.Text = "Request Sending Failed";
            errormsg.Visible = true;
        }
        finally
        {
            conAMS.Close();
            Clear();
            AssetList.DataBind();
           
        }
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

    private void Clear()
    {
        gridlkup_Asset.Value = "";
        txt_comments.Text = "";
        
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