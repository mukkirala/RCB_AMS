using System;

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using DevExpress.Web.ASPxGridView;
using System.Globalization;
using System.Web.UI;

public partial class ChangeOfCustodian : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand, mycommand1;
    static string AssetID, apprID, apprName, apprDept, apprdesign;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
       
        else
         {
            try
            {
                apprID = Session["UserID"].ToString();
                apprName = Session["USR_NAME"].ToString();
                
                apprDept = Session["DepartmentName"].ToString();
                apprdesign = Session["DESIGNATION"].ToString();
                if (Session["AssetID"] == null)
                {
                    Response.Redirect("ViewCustodianChangeRequests.aspx");
                }
                else
                {
                    lbl_empname.Text = Session["Requestedby"].ToString();
                    if(Session["Date"].ToString()!=null)
                    {
                        lbl_date.Text = Convert.ToDateTime(Session["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }
                    
                    lbl_reqasset.Text = Session["AssetTypename"].ToString();
                    reqid.Text = Session["EmployeeID"].ToString();
                  
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();

                    lbl_trans.Text = ""+ Session["RequestedChangeCustodian"].ToString() + " - " + Session["TransferTo"].ToString() + " ";

                    string AssetID = Session["AssetID"].ToString();
                    string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(Location+' (',Block+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote FROM [AssetMaster] where AssetID = '" + AssetID + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {

                        lbl_mainassetnumber.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                        lbl_subnumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                        lbl_reqasset.Text = dt.Rows[0]["AssetDescription"].ToString();
                        lbl_assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
                        lbl_assetlocation.Text = dt.Rows[0]["Location"].ToString();
                        lbl_assetstatus.Text = dt.Rows[0]["Status"].ToString();
                        lbl_quantity.Text = dt.Rows[0]["Quantity"].ToString();
                        lbl_component.Text = dt.Rows[0]["Component"].ToString();
                        lbl_inventorynote.Text = dt.Rows[0]["InventoryNote"].ToString();

                        if (dt.Rows[0]["AssetCapitalizationDate"].ToString() != null)
                        {
                            lbl_capitalizationdate.Text = Convert.ToDateTime(dt.Rows[0]["AssetCapitalizationDate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                        }
                        if (dt.Rows[0]["FirstAcquisitionDate"].ToString() != null)
                        {
                            lbl_acquisitiondate.Text = Convert.ToDateTime(dt.Rows[0]["FirstAcquisitionDate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                        }
                        if (dt.Rows[0]["Deacdate"].ToString() != null)
                        {
                            lbl_deacdate.Text = Convert.ToDateTime(dt.Rows[0]["Deacdate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                        }
                        if (dt.Rows[0]["Invdate"].ToString() != null)
                        {
                            lbl_inventorydate.Text = Convert.ToDateTime(dt.Rows[0]["Invdate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                        }



                    }
                }
            }
            catch(Exception ex)
            {

            }
        }
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        if (txt_cmt.Text == "")
        {
            lbl_msg.Text = "Enter Remarks";
            lbl_msg.Visible = true;
            return;
        }
        err_msg.Visible = false;
        string CustodianChangeID = Session["CustodianChangeID"].ToString();
        try
        {
            string authid = "";
            //authid = GetRequesterCustodianID();
            string query = "SELECT CustodianID FROM [RoleMaster] where ROLE_NAME ='Admin' and ROLE_STATUS='Active'";
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    authid = dt.Rows[i]["CustodianID"].ToString();
                    myCommand = new SqlCommand("update CustodianChangeRequest set Status=@Status,ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment,ApproverComments=@ApproverComments where CustodianChangeID='" + CustodianChangeID + "'",conAMS);
          
            myCommand.Parameters.AddWithValue("@Status", "Request Sent To Admin");
            myCommand.Parameters.AddWithValue("@ApproverComments", txt_cmt.Text);
            myCommand.Parameters.AddWithValue("@ApproverID", apprID);
            myCommand.Parameters.AddWithValue("@ApproverName", apprName);
            myCommand.Parameters.AddWithValue("@ApproverDesignation", apprdesign);
           
            myCommand.Parameters.AddWithValue("@ApproverDepartment", apprDept);
            //myCommand.Parameters.AddWithValue("@ToCustodian", ASPxGridLookup_ToCustodian.Value);
            string subject = "Request For Asset CustodianChange";
            string msg2 = " New Request for Asset CustodianChange from Employee ID : <b>" + reqid.Text + ",</b> Name : <b> " + lbl_empname.Text + "</b></b> \n </b> To Employee ID__Name : <b>" + lbl_trans.Text + "</b>.<br/>" + "<b>Please verify to complete the approval process.</b>";
            bool response = MailSending.AdminsendMailAttach(authid, subject, msg2);
            if (response == true)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent To Admin Successfully.');", true);
            }
            lbl_msg.Text = "Sent To Admin Successfully";
            lbl_msg.Visible = true;
                }
            }
    conAMS.Open();
            myCommand.ExecuteNonQuery();
            //mycommand1 = new SqlCommand("update AssetMaster set CustVeriBy='" + ASPxGridLookup_ToCustodian.Value + "' where AssetID='" +AssetID+ "'", conSAP);
            //conSAP.Open();
            //mycommand1.ExecuteNonQuery();
            Response.Redirect("ViewCustodianChangeRequests.aspx");
             

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            //conSAP.Close();
            Clear();
            
        }
    }

    private void Clear()
    {
        txt_cmt.Text = "";
        //ASPxGridLookup_ToCustodian.Value = "";
        
    }

    //protected void ASPxGridLookup_ToCustodian_Init(object sender, EventArgs e)
    //{
    //    ASPxGridView gv = ASPxGridLookup_ToCustodian.GridView as ASPxGridView;
    //    gv.Width = 200;
    //}

    protected void ASPxButton2_Click(object sender, EventArgs e)
    {
        string CustodianChangeID = Session["CustodianChangeID"].ToString();
        try
        {
            string authid = "";
            authid = GetRequesterCustodianID();
            myCommand = new SqlCommand("update CustodianChangeRequest set Status=@Status,ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment,ApproverComments=@ApproverComments where CustodianChangeID='" + CustodianChangeID + "'", conAMS);

            myCommand.Parameters.AddWithValue("@Status", "Rejected");
            myCommand.Parameters.AddWithValue("@ApproverID", apprID);
            myCommand.Parameters.AddWithValue("@ApproverName", apprName);
            myCommand.Parameters.AddWithValue("@ApproverDesignation", apprdesign);
           
            myCommand.Parameters.AddWithValue("@ApproverDepartment", apprDept);
            myCommand.Parameters.AddWithValue("@ApproverComments", txt_cmt.Text);
            string subject = "Request For Asset CustodianChange";
            string msg2 = " Your Request for CustodianChange of Asset :'" + apprName + "' \n Asset Number :'" + lbl_mainassetnumber + "' has been Rejected.\n By Approver Name :'" + apprName + "' </b>";
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
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            Response.Redirect("ViewCustodianChangeRequests.aspx");

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            Clear();
        }
    }
    public string GetRequesterCustodianID()
    {
        string id = "";
        string inputString = reqid.Text;
        string[] parts = inputString.Split('_');

        string variable1 = parts[0];
        string variable2 = parts[1];

        string query = "SELECT EmployeeID FROM [EmployeeAssetRequest] where EmployeeID ='" + variable1 + "'";
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