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


public partial class RequestAsset : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static string Emailid;
    Utilities db = new Utilities();
    // static string EmployeeID="1";
    static string AssetID;
    string emp;
    protected void Page_Load(object sender, EventArgs e)
    {
        string AssetClass = WebConfigurationManager.AppSettings.Get("AssetClass");
        //cmb_AssetClass.DataSource = AssetClass.Split(',');
        //cmb_AssetClass.DataBind();

        // ASPxLabel6.Text = System.DateTime.Now.ToString();
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

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        errormsg.Visible = true;
        if (cmb_AssetClass.Text == "")
        {
            errormsg.Text = "Select Asset Class";
            errormsg.Visible = true;
            return;

        }
        if (gridlkup_Asset.Text=="")
        {
            errormsg.Text = "Select Asset Name";
            errormsg.Visible = true;
            return;

        }
        if (txt_Locationid.Text == "")
        {
            errormsg.Text = "Select Wing";
            errormsg.Visible = true;
            return;
        }
        if (txtblock.Text == "")
        {
            errormsg.Text = "Select Floor";
            errormsg.Visible = true;
            return;
        }
        if (txt_Lab.Text == "")
        {
            errormsg.Text = "Select LAB";
            errormsg.Visible = true;
            return;
        }
        if (txt_quantity.Text=="")
        {
            errormsg.Text = "Enter Quantity";
            errormsg.Visible = true;
            return;
        }
        if (txt_quantity.Text != "")
        {
            string stringTest= txt_quantity.Text.ToString();
            if (!stringTest.All(char.IsDigit))
            {
                errormsg.Text = "Enter Quantity In Numbers";
                errormsg.Visible = true;
                return;
            }
                     
        }
        if (txt_quantity.Text == "0")
        {         
            errormsg.Text = "Quantity cannot be zero";
            errormsg.Visible = true;
            return;
        }


        string query1 = "SELECT EmployeeID FROM [EmployeeAssetRequest] where EmployeeID ='" + reqid.Text + "'";
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

            string comcode1 = "SELECT Top 1 RequestSequene FROM EmployeeAssetRequest WHERE EmployeeID = '" + reqid.Text + "' ORDER BY Date DESC";
            SqlDataAdapter da3 = new SqlDataAdapter(comcode1, conAMS);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            int count = 0;
            if (dt3.Rows.Count > 0)
            {
                count = Convert.ToInt32(dt3.Rows[0]["RequestSequene"].ToString());
                count++;
                sequencecount = count;
            }
        }
        else
        {
            sequencecount++;

        }

        myCommand = new SqlCommand("insert into EmployeeAssetRequest(AssetTypeID,RequestBy,EmployeeID,Location,LocationID,BLOCK,LocationCode,Quantity,Status,Date,CustodianDepartment,CustDesignation,RequestType,ApproverID,RequestSequene)values(@AssetTypeID,@RequestBy,@EmployeeID,@Location,@LocationID,@BLOCK,@LocationCode,@Quantity,@Status,@Date,@CustodianDepartment,@CustDesignation,@RequestType,@ApproverID,@RequestSequene)", conAMS);
        myCommand.Parameters.AddWithValue("AssetTypeID", gridlkup_Asset.Value.ToString());
        myCommand.Parameters.AddWithValue("EmployeeID", reqid.Text);
        //Session["Employee"] = reqid.Text;
        //emp = Session["Employee"].ToString();
        myCommand.Parameters.AddWithValue("RequestBy", lbl_requestername.Text);
        myCommand.Parameters.AddWithValue("Location", txt_Locationid.Text.ToString());
        myCommand.Parameters.AddWithValue("LocationID", txt_Lab.Value.ToString());
        myCommand.Parameters.AddWithValue("BLOCK", txtblock.Text.ToString());
        myCommand.Parameters.AddWithValue("LocationCode", txt_Lab.Text.ToString());
        myCommand.Parameters.AddWithValue("Quantity", txt_quantity.Text.ToString());
        //myCommand.Parameters.AddWithValue("Block", txt_quantity.Text.ToString());
        myCommand.Parameters.AddWithValue("Date", System.DateTime.Now);
        myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
        myCommand.Parameters.AddWithValue("CustDesignation", reqdesign.Text);
        myCommand.Parameters.AddWithValue("RequestType", "Asset Request");
        myCommand.Parameters.AddWithValue("RequestSequene", sequencecount);
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
            //string subject = "Request For Asset Allocation";
            //string msg2 = " New Request of Asset Allocation from Employee ID <b>" + reqid.Text + ",</b> Name : <b> " + lbl_requestername.Text +"</b> for Asset Type: <b>" + gridlkup_Asset.Text + "</b> to the location: <b>" + txt_Locationid.Text + "</b>.<br/>" + "<b>Please verify to complete the approval process.</b>";
            //bool response = MailSending.sendMailAttach(authid, subject, msg2);
            //if (response == true)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
            //}
            //else
            //{

            //}
            errormsg.Text = "Request Sent Successfully";
            errormsg.Visible = true;
        }
        catch (Exception ex)
        {
            errormsg.Text = "Request Sending Failed";
            errormsg.Visible = true;
            errormsg.Text = ex.Message.ToString();
           // db.ExpLog(ex.Message, ex.HelpLink);
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
        cmb_AssetClass.Text = "";
        gridlkup_Asset.Value = "";
        txt_quantity.Text = "";
        txt_Locationid.Text = "";
        txtblock.Text = "";
        txt_Lab.Text = "";
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
        ASPxGridView gv =gridlkup_Asset.GridView as ASPxGridView;
        gv.Width = 300;
    }

    protected void txtLocationid_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtblock.SelectedIndex = -1;
        txt_Lab.SelectedIndex = -1;

    }
    protected void txtbolck_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_Lab.SelectedIndex = -1;

    }

    //protected void ASPxGridLookup1_Init(object sender, EventArgs e)
    //{
    //    ASPxGridView gv = ASPxGridLookup1.GridView as ASPxGridView;
    //    gv.Width = 300;
    //}
}