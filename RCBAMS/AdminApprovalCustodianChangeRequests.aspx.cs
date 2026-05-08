using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Globalization;
using System.Web.UI;

public partial class AdminApprovalCustodianChangeRequests : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand, mycommand1,myCommand2;
    static string AssetID, adminID, adminName, adminDept, admindesign;
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

                adminID = Session["UserID"].ToString();
                adminName = Session["USR_NAME"].ToString();
               
                adminDept = Session["DepartmentName"].ToString();
                admindesign = Session["DESIGNATION"].ToString();
                if (Session["AssetID"] == null)
                {
                    Response.Redirect("AdminViewCustodianChangeRequests.aspx");
                }
                else
                {
                    lbl_empname.Text = Session["Requestedby"].ToString();
                    if (Session["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(Session["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }
                    lbl_reqasset.Text = Session["AssetTypename"].ToString();
                    lbl_trans.Text = "" + Session["RequestedChangeCustodian"].ToString() + " - " + Session["TransferTo"].ToString() + " ";
                    reqid.Text = Session["EmployeeID"].ToString();
                     
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();
                    //apprID.Text = Session["ApproverID"].ToString();
                    //apprName.Text = Session["ApproverName"].ToString();
                    //apprDept.Text = Session["ApproverDepartment"].ToString();
                   
                    //apprdesign.Text = Session["ApproverDesignation"].ToString();
                    //apprcmts.Text = Session["ApproverComments"].ToString();
                     AssetID = Session["AssetID"].ToString();
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

    protected void AddAssets_Click(object sender, EventArgs e)
    {
        if (txt_cmt.Text == "")
        {
            err_msg.Text = "Enter Comment";
            err_msg.Visible = true;
            return;
        }
        string CustodianChangeID = Session["CustodianChangeID"].ToString();
        string ToCustodian = Session["ToCustodian"].ToString();
        try
        {
            string authid = "";
            authid = GetRequesterCustodianID();
            myCommand = new SqlCommand("update CustodianChangeRequest set Status=@Status,AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment,AdminComments=@AdminComments,AdminDate=@AdminDate where CustodianChangeID='" + CustodianChangeID + "'", conAMS);
            myCommand.Parameters.AddWithValue("@Status", "Approved");
            myCommand.Parameters.AddWithValue("@AdminID", adminID);
            myCommand.Parameters.AddWithValue("@AdminName", adminName);
            myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
            myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
            myCommand.Parameters.AddWithValue("AdminDate", System.DateTime.Now);
          
            myCommand.Parameters.AddWithValue("@AdminComments", txt_cmt.Text);
            mycommand1 = new SqlCommand("update AssetMaster set Status='AVAL',StatusDesc='Asset Available',CustodianID='"+ Session["RequestedChangeCustodian"].ToString() + "',AssetUser='"+ Session["TransferTo"].ToString() + "',CustodianDepartment='" + Session["TDept"].ToString() + "' where AssetID='" + AssetID + "'",conSAP);
            myCommand2 = new SqlCommand("update AssetAllocation set Status='AVAL' where AssetID='" + AssetID+"' and Status='Approved'",conAMS);
            //string subject = "Request For Asset CustodianChange";
            //string msg2 = "Your Request for Asset CustodianChange  From Custodian : <b>" + lbl_empname.Text + "</b> </b> To CustodianID__Name : <b>" + lbl_trans.Text + "</b>.<br/>" + "<b> Custodian Change Request is Approved </b>";
            //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
            //if (response == true)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
            //}
            //else
            //{

            //}
            lbl_msg.Text = "Approved Successfully";
            lbl_msg.Visible = true;
            conAMS.Open();
            conSAP.Open();
            myCommand.ExecuteNonQuery();
            mycommand1.ExecuteNonQuery();
            myCommand2.ExecuteNonQuery();
            Response.Redirect("AdminViewCustodianChangeRequests.aspx");


        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            conSAP.Close();
            txt_cmt.Text = "";

        }

    }

    protected void RejectAsset_Click(object sender, EventArgs e)
    {
        if (txt_cmt.Text == "")
        {
            err_msg.Text = "Enter Comment";
            err_msg.Visible = true;
            return;
        }
        string CustodianChangeID = Session["CustodianChangeID"].ToString();
        try
        {
            string authid = "";
            authid = GetRequesterCustodianID();
            myCommand = new SqlCommand("update CustodianChangeRequest set Status=@Status,AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment where CustodianChangeID='" + CustodianChangeID + "'", conAMS);
            myCommand.Parameters.AddWithValue("@AdminID", adminID);
            myCommand.Parameters.AddWithValue("@AdminName", adminName);
            myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
            myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
          
            myCommand.Parameters.AddWithValue("@Status", "Rejected");
            //string subject = "Request For Asset CustodianChange";
            //string msg2 = " Your Request for CustodianChange of Asset :'" + apprName + "' \n Asset Number :'" + lbl_mainassetnumber + "' CustodianChange has been Rejected. </b>";
            //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
            //if (response == true)
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
            //}
            //else
            //{

            //}
            lbl_msg.Text = "Rejected Successfully";
            lbl_msg.Visible = true;
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            Response.Redirect("AdminViewCustodianChangeRequests.aspx");


        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            txt_cmt.Text = "";

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