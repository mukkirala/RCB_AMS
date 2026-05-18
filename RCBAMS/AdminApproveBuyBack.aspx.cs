using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminApproveBuyBack : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    static int srno = 0;
    static int count = 0;
    string adminID, adminName, adminDept, admindesign;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
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
                    Response.Redirect("AdminViewBuyBackAssets.aspx");
                    return;
                }
                else
                {
                    lbl_empname.Text = Session["Requestedby"].ToString();
                    if (Session["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(Session["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }
                    reqid.Text = Session["EmployeeID"].ToString();
                   
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();
                    

                    string AssetID = Session["AssetID"].ToString();
                    string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(LocationDesc+' (',Location+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote FROM [AssetMaster] where AssetID = '" + AssetID + "'";
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

    public string GetFinCustodianID()
    {
        string id = "";
        string query = "SELECT top 1 CustodianID FROM [RoleMaster] where ROLE_NAME ='PO' and ROLE_STATUS='Active'";
        SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            id = dt.Rows[0]["CustodianID"].ToString();
        }
        return id;
    }


    public string GetHRCustodianID()
    {
        string id = "";
        string query = "SELECT top 1 CustodianID FROM [RoleMaster] where ROLE_NAME ='Store' and ROLE_STATUS='Active'";
        SqlDataAdapter da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            id = dt.Rows[0]["CustodianID"].ToString();
        }
        return id;
    }

    protected void AddAssets_Click(object sender, EventArgs e)
    {
        string BuybackRequestID = Session["BuybackRequestID"].ToString();
        string AssetID = Session["AssetID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetBuyback set Status=@Status,AdminComments=@AdminComments,AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment where BuybackRequestID=@BuybackRequestID", conAMS);
        myCommand.Parameters.AddWithValue("@Status", "Approved");
        myCommand.Parameters.AddWithValue("@AdminComments", txt_cmt.Text);
        myCommand.Parameters.AddWithValue("@BuybackRequestID", BuybackRequestID);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
        myCommand.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);
       

        myCommand1 = new SqlCommand("update AssetMaster set Status='NVAL',StatusDesc='Asset Not Available' where AssetID='" + AssetID + "'", conSAP);
        myCommand2 = new SqlCommand("update AssetAllocation set Status='NVAL' where AssetID='"+AssetID+"' and Status='Approved'",conAMS);
        try
        {
            conAMS.Open();
            conSAP.Open();
            myCommand.ExecuteNonQuery();
            myCommand1.ExecuteNonQuery();
            myCommand2.ExecuteNonQuery();
            string Fin = GetFinCustodianID();
            string HR = GetHRCustodianID();
            string subject = "Asset Buyback Request Approved";
            string msg2 = "Request of Asset Buyback from Employee ID: <b>" + reqid.Text + ", " + lbl_empname.Text + "</b> for Asset with MainAssetNumber: <b>" + lbl_mainassetnumber.Text + "</b> and Asset Description: <b>" + lbl_reqasset.Text + "</b> is approved.<br/><br/>" + "<b></b>";
            if (Fin != "")
            {
                bool response = MailSending.sendMailAttach( Fin, subject, msg2);
            }
            if (HR != "")
            {
                bool response1 = MailSending.sendMailAttach(HR, subject, msg2);
            }
            txt_cmt.Text = "";
            Response.Redirect("AdminViewBuyBackAssets.aspx");

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
        string BuybackRequestID = Session["BuybackRequestID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetBuyback set Status='Rejected',AdminID=@AdminID,AdminName=@AdminName,AdminDesignation=@AdminDesignation,AdminDepartment=@AdminDepartment where BuybackRequestID='" + BuybackRequestID + "'", conAMS);
        myCommand.Parameters.AddWithValue("@AdminID", adminID);
        myCommand.Parameters.AddWithValue("@AdminName", adminName);
        myCommand.Parameters.AddWithValue("@AdminDesignation", admindesign);
        myCommand.Parameters.AddWithValue("@AdminDepartment", adminDept);
       

        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            txt_cmt.Text = "";
            Response.Redirect("AdminViewBuyBackAssets.aspx");

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
        }
    }
}