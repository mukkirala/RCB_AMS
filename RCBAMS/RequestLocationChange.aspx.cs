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

public partial class RequestLocationChange : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserID"]==null)
        {
            Response.Redirect("ErrorPage.aspx");
        }
        else
        {
            lbl_requestername.Text = Session["USR_NAME"].ToString();
            //AssetList.Visible = true;
            reqid.Text = Session["UserID"].ToString();
            reqdept.Text = Session["DepartmentName"].ToString();
            reqdesign.Text = Session["DESIGNATION"].ToString();
            //lbl_auth.Text = Session["ReportingAuthority"].ToString();
            lblmail.Text = Session["Mail"].ToString();

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
        if(txt_Locationid.Text=="")
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
        if (txt_comments.Text == "")
        {
            errormsg.Text = "Enter Comments";
            errormsg.Visible = true;
            return;
        }
        //if (lbl_Block.Text == "")
        //{
        //    errormsg.Text = "Enter Block";
        //    errormsg.Visible = true;
        //    return;
        //}
        string query1 = "select * From [AssetMaster] where MainAssetNumber='" + gridlkup_Asset.Text + "'";
        SqlCommand cmd = new SqlCommand(query1, conSAP);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
          Session["location"]=  dt.Rows[0]["Location"].ToString();
            //dt.Rows[0]["LocationDesc"].ToString();
            //dt.Rows[0]["Block"].ToString();
            Session["locationID"] = dt.Rows[0]["LocationID"].ToString();
            Session["locationdesc"] = dt.Rows[0]["LocationDesc"].ToString();
            Session["block"] = dt.Rows[0]["Block"].ToString();
        }

        string query3 = "SELECT EmployeeID FROM [EmployeeLocationChange] where EmployeeID ='" + reqid.Text + "'";
        SqlDataAdapter da1 = new SqlDataAdapter(query3, conAMS);
        DataTable dt2 = new DataTable();
        da1.Fill(dt2);
        int sequencecount = 0;
        if (dt2.Rows.Count > 0)
        {
            //id1 = dt.Rows[0]["CustodianID"].ToString();
            //myCommand.Parameters.AddWithValue("ApproverName", dt1.Rows[0]["CustodianName"].ToString());
            //SqlCommand comcode = new SqlCommand("SELECT Top 1 ComplaintID,Sequence FROM ComplaintTransaction WHERE USR_ID = '" + reqid.Text + "' ORDER BY CreatedDate DESC", conAMS);
            //comcode.ExecuteNonQuery();

            string comcode1 = "SELECT Top 1 LocationSequence FROM EmployeeLocationChange WHERE EmployeeID = '" + reqid.Text + "' ORDER BY Date DESC";
            SqlDataAdapter da3 = new SqlDataAdapter(comcode1, conAMS);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            int count = 0;
            if (dt3.Rows.Count > 0)
            {
                count = Convert.ToInt32(dt3.Rows[0]["LocationSequence"].ToString());
                count++;
                sequencecount = count;
            }
        }
        else
        {
            sequencecount++;

        }

        myCommand = new SqlCommand("insert into EmployeeLocationChange(AssetID,EmployeeID,RequestBy,FromLocationID,FromLocation,FromBlock,FromLab,ToLocation,ToBlock,ToLab,CustodianComments,LocationID,Status,Date,CustodianDepartment,CustDesignation,RequestType,ApproverID,LocationSequence)values(@AssetID,@EmployeeID,@RequestBy,@FromLocationID,@FromLocation,@FromBlock,@FromLab,@ToLocation,@ToBlock,@ToLab,@CustodianComments,@LocationID,@Status,@Date,@CustodianDepartment,@CustDesignation,@RequestType,@ApproverID,@LocationSequence)", conAMS);
        myCommand.Parameters.AddWithValue("AssetID", gridlkup_Asset.Value.ToString());
        myCommand.Parameters.AddWithValue("EmployeeID", reqid.Text);
        myCommand.Parameters.AddWithValue("RequestBy", lbl_requestername.Text);
        myCommand.Parameters.AddWithValue("FromLocationID", Session["locationID"]);
        myCommand.Parameters.AddWithValue("FromLocation", Session["location"]);
        myCommand.Parameters.AddWithValue("FromBlock", Session["block"]);
        myCommand.Parameters.AddWithValue("FromLab", Session["locationdesc"]);
        myCommand.Parameters.AddWithValue("ToLocation", txt_Locationid.Text.ToString());
        myCommand.Parameters.AddWithValue("ToBlock", txtblock.Text.ToString());
        myCommand.Parameters.AddWithValue("ToLab", txt_Lab.Text.ToString());
        myCommand.Parameters.AddWithValue("CustodianComments", txt_comments.Text.ToString());
        myCommand.Parameters.AddWithValue("LocationID", txt_Lab.Value.ToString());
        myCommand.Parameters.AddWithValue("Date", System.DateTime.Now);
        myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
        myCommand.Parameters.AddWithValue("CustDesignation", reqdesign.Text);
        myCommand.Parameters.AddWithValue("RequestType", "Location Transfer");
        myCommand.Parameters.AddWithValue("LocationSequence", sequencecount);
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
            //string subject = "Request For Asset Location Transfer";
            //string msg2 = "New Request of Location Transfer from Employee ID <b>" + reqid.Text + ", " + lbl_requestername.Text + "</b> for Asset with MainAssetNumber: <b>" + gridlkup_Asset.Text + "</b> and Asset Description: <b>" + lbl_AssetType.Text + " </b>, is requested to transfer to the location: <b>" + txt_Lab.Text + "</b>.<br/>" + "<b>Please verify to complete the approval process.</b>";
            //bool response = MailSending.sendMailAttach(authid, subject, msg2);
            //if (response == true)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert(' Request For Asset Location Transfer Mail Sent Successfully.');", true);
            //}
            errormsg.Text = "Request Sent Successfully";
            errormsg.Visible = true;
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
        txt_Locationid.Text = "";
        txtblock.Text = "";
        txt_Lab.Text = "";
        txt_comments.Text = "";
        AssetDetails.Visible = false;
    }


    protected void gLookup_Init(object sender, EventArgs e)
    {
        ASPxGridView gv = gridlkup_Asset.GridView as ASPxGridView;
        gv.Width = 300;
    }

    //protected void ASPxGridLookup1_Init(object sender, EventArgs e)
    //{
    //    ASPxGridView gv = ASPxGridLookup1.GridView as ASPxGridView;
    //    gv.Width = 300;
    //}
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


    protected void txt_Locationid_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtblock.SelectedIndex = -1;
        txt_Lab.SelectedIndex = -1;
    }

    protected void txtblock_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_Lab.SelectedIndex = -1;
    }
}