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

public partial class ApproveAssetReturnRequest : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    string apprID, apprName, apprDeptCode, apprDept, apprdesign;
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
                //apprDeptCode = Session["DepartmentCode"].ToString();
                apprDept = Session["DepartmentName"].ToString();
                apprdesign = Session["DESIGNATION"].ToString();

                if (Session["AssetID"] == null)
                {
                    Response.Redirect("ViewAssetReturnRequest.aspx");
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
                    reqid.Text = Session["EmployeeID"].ToString();
                    reqdeptcode.Text = Session["EmpDeptCode"].ToString();
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

    protected void AddAssets_Click(object sender, EventArgs e)
    {
        string AssetReturnID = Session["AssetReturnID"].ToString();

        myCommand = new SqlCommand("update EmployeeAssetReturn set Status=@Status,ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment,ApproverComments=@ApproverComments where AssetReturnID=@AssetReturnID", conAMS);
        myCommand.Parameters.AddWithValue("@Status", "Request Sent To Admin");
        myCommand.Parameters.AddWithValue("@ApproverComments", txt_cmt.Text);
        myCommand.Parameters.AddWithValue("@AssetReturnID", AssetReturnID);
        myCommand.Parameters.AddWithValue("@ApproverID", apprID);
        myCommand.Parameters.AddWithValue("@ApproverName", apprName);
        myCommand.Parameters.AddWithValue("@ApproverDesignation", apprdesign);
       // myCommand.Parameters.AddWithValue("@ApproverDeptCode", apprDeptCode);
        myCommand.Parameters.AddWithValue("@ApproverDepartment", apprDept);
        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();

            txt_cmt.Text = "";
            Response.Redirect("ViewAssetReturnRequest.aspx");

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();

        }
    }

    protected void RejectAsset_Click(object sender, EventArgs e)
    {
        string AssetReturnID = Session["AssetReturnID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetReturn set Status='Rejected',ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment where AssetReturnID=@AssetReturnID", conAMS);
        myCommand.Parameters.AddWithValue("AssetReturnID", AssetReturnID);
        myCommand.Parameters.AddWithValue("@ApproverID", apprID);
        myCommand.Parameters.AddWithValue("@ApproverName", apprName);
        myCommand.Parameters.AddWithValue("@ApproverDesignation", apprdesign);
        //myCommand.Parameters.AddWithValue("@ApproverDeptCode", apprDeptCode);
        myCommand.Parameters.AddWithValue("@ApproverDepartment", apprDept);
        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            txt_cmt.Text = "";
            Response.Redirect("ViewAssetReturnRequest.aspx");

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