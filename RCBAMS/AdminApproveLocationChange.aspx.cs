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

public partial class AdminApproveLocationChange : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
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
                    Response.Redirect("AdminViewLocationChange.aspx");
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
                    lbl_Requestedlocation.Text = Session["RequestedLocation"].ToString();
                    reqid.Text = Session["EmployeeID"].ToString();
                   
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();
                    //apprID.Text = Session["ApproverID"].ToString();
                    //apprName.Text = Session["ApproverName"].ToString();
                    //apprDept.Text = Session["ApproverDepartment"].ToString();
                    //lbl_block.Text = Session["Block"].ToString();


                    //apprdesign.Text = Session["ApproverDesignation"].ToString();
                    //apprcmts.Text = Session["ApproverComments"].ToString();
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
                        lbl_Currentlocation.Text = dt.Rows[0]["Location"].ToString();
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
        string LocationChangeID = Session["LocationChangeID"].ToString();
        string LocationID = Session["LocationID"].ToString();
        string Location = Session["Location"].ToString();
        string Block = Session["Block"].ToString();
        string Lab = Session["LocationCode"].ToString();
        string AssetID = Session["AssetID"].ToString();
        myCommand = new SqlCommand("update EmployeeLocationChange set Status=@Status,AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment,AdminComments=@AdminComments,AdminDate=@AdminDate where LocationChangeID=@LocationChangeID", conAMS);
        myCommand.Parameters.AddWithValue("@Status", "Approved");
        myCommand.Parameters.AddWithValue("@AdminComments", txt_cmt.Text);
        myCommand.Parameters.AddWithValue("@LocationChangeID", LocationChangeID);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
        myCommand.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);
        myCommand1 = new SqlCommand("update AssetMaster set LocationID='" + LocationID + "',Location='" + Location + "',Block='"+ Block +"',LocationDesc='" + Lab + "' where AssetID='" + AssetID + "'", conSAP);
        //string subject = "Request For Asset LocationChange";
        //string msg2 = "Your Request for Asset LocationChange From Location : <b>" + lbl_Currentlocation.Text + "</b> </b> To Location : <b>" + lbl_Requestedlocation.Text + "</b>.<br/>" + "<b>Assets Location Change has be Approved </b>";
        //bool response = MailSending.RejectsendMailAttach(authid, subject, msg2);
        //if (response == true)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Mail Sent Successfully.');", true);
        //}
        //else
        //{

        //}
        lbl_msg.Text = "Approved  Successfully";
        lbl_msg.Visible = true;
        try
        {
            conAMS.Open();
            conSAP.Open();
            myCommand.ExecuteNonQuery();
            myCommand1.ExecuteNonQuery();
            txt_cmt.Text = "";
            Response.Redirect("AdminViewLocationChange.aspx");

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
        string LocationChangeID = Session["LocationChangeID"].ToString();
        myCommand = new SqlCommand("update EmployeeLocationChange set Status='Rejected',AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment where LocationChangeID=@LocationChangeID", conAMS);
        myCommand.Parameters.AddWithValue("LocationChangeID", LocationChangeID);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
        //string subject = "Request For Asset LocationChange";
        //string msg2 = " Your Request for LocationChange of Asset :'" + apprName + "'  Asset Number :'" + lbl_mainassetnumber + "'  location Change Request has been Rejected.</b>";
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
            Response.Redirect("AdminViewLocationChange.aspx");

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