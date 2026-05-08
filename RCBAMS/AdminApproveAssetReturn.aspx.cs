using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Web.UI.Design;

public partial class AdminApproveAssetReturn : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    string adminID, adminName, adminDept, admindesign;
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
                    Response.Redirect("AdminViewAssetReturn.aspx");
                    return;
                }
                else
                {
                    lbl_empname.Text = Session["Requestedby"].ToString();
                    if (Session["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(Session["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }
                    lbl_reqasset.Text = Session["AssetTypename"].ToString();
                    string AssetID = Session["AssetID"].ToString();
                    reqid.Text = Session["EmployeeID"].ToString();
                   
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();
                    //apprID.Text = Session["ApproverID"].ToString();
                    //apprName.Text = Session["ApproverName"].ToString();
                    //apprDept.Text = Session["ApproverDepartment"].ToString();
                    //apprDeptCode.Text = Session["ApproverDeptCode"].ToString();
                    //apprdesign.Text = Session["ApproverDesignation"].ToString();
                    //apprcmts.Text = Session["ApproverComments"].ToString();

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
        string authid = "";
        authid = GetRequesterCustodianID();
        //err_msg.Visible = false;
        if (txt_cmt.Text == "")
        {
            lbl_msg.Text = "Please enter comments";
            lbl_msg.Visible = true;
            return;

        }
        string AssetID = Session["AssetID"].ToString();
        
        string AssetReturnID = Session["AssetReturnID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetReturn set Status=@Status,AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment,AdminComments=@AdminComments,AdminDate=@AdminDate where AssetReturnID=@AssetReturnID", conAMS);
       
        myCommand.Parameters.AddWithValue("@Status", "Approved");
        myCommand.Parameters.AddWithValue("@AdminComments", txt_cmt.Text);
        myCommand.Parameters.AddWithValue("@AssetReturnID", AssetReturnID);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
        myCommand.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);
        

        myCommand1 = new SqlCommand("update AssetMaster set Status=@Status,StatusDesc=@StatusDesc,CustodianID=@custid,CustodianDepartment='' where AssetID=@AssetID", conSAP);

        myCommand1.Parameters.AddWithValue("@Status", "AVAL");
        myCommand1.Parameters.AddWithValue("@StatusDesc", "Asset Available");
        myCommand1.Parameters.AddWithValue("@AssetID",Session["AssetID"].ToString());

        myCommand1.Parameters.AddWithValue("@custid", DBNull.Value);

        myCommand2 = new SqlCommand("update AssetAllocation set Status='AVAL' where AssetID='" + AssetID + "' and Status='Approved'", conAMS);
        //string subject = "Request For Asset Return";
        //string msg2 = "Your Request for Asset Return Asset Number :'" + lbl_mainassetnumber.Text + "' Asset Type :'" + lbl_reqasset.Value + "' </b>.<br/>" + "<b>Please verify.</b>";
        //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
        //if (response == true)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent To Admin Successfully.');", true);
        //}
        lbl_msg.Text = "Asset Return Approved Successfully";
        lbl_msg.Visible = true;
        
        try
        {
            conAMS.Open();
            conSAP.Open();
            myCommand.ExecuteNonQuery();
            myCommand1.ExecuteNonQuery();
            myCommand2.ExecuteNonQuery();
            Response.Redirect("AdminViewAssetReturn.aspx");

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            conSAP.Close();

        }
    }

    protected void RejectAsset_Click(object sender, EventArgs e)
    {
        string authid = "";
        authid = GetRequesterCustodianID();
        string AssetReturnID = Session["AssetReturnID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetReturn set Status='Rejected',AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment where AssetReturnID=@AssetReturnID", conAMS);
        myCommand.Parameters.AddWithValue("AssetReturnID", AssetReturnID);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
        //string subject = "Request For Asset Return";
        //string msg2 = " Your Request for Asset Return For Asset Number :'" + lbl_mainassetnumber.Text + "' Asset Type :'" + lbl_reqasset.Value + "'Was Rejected.</b>\n</br/> Approved Successfully";
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


        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            txt_cmt.Text = "";
            Response.Redirect("AdminViewAssetReturn.aspx");

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
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