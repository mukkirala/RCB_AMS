using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Globalization;

public partial class ApproveAssetBuybackRequest : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    static int srno = 0;
    static int count = 0;
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

                apprID.Text = Session["UserID"].ToString();
                apprName.Text = Session["USR_NAME"].ToString();
               // apprDeptCode.Text = Session["DepartmentCode"].ToString();
                apprDept.Text = Session["DepartmentName"].ToString();
                apprdesign.Text = Session["DESIGNATION"].ToString();
                if (Session["AssetID"] == null)
                {
                    Response.Redirect("ViewAssetBuyBack.aspx");
                    return;
                }
                else
                {
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
                        lbl_capitalizationdate.Text = dt.Rows[0]["AssetCapitalizationDate"].ToString();
                        lbl_acquisitiondate.Text = dt.Rows[0]["FirstAcquisitionDate"].ToString();
                        lbl_deacdate.Text = dt.Rows[0]["Deacdate"].ToString();
                        lbl_inventorydate.Text = dt.Rows[0]["Invdate"].ToString();


                    }
                    lbl_empname.Text = Session["Requestedby"].ToString();
                    if (Session["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(Session["Date"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }
                    reqid.Text = Session["EmployeeID"].ToString();
                    //reqdeptcode.Text = Session["EmpDeptCode"].ToString();
                    reqdeptname.Text = Session["EmpDept"].ToString();
                    reqdesig.Text = Session["EmpDesig"].ToString();
                }
            }
            catch(Exception ex)
            {

            }
        }
        
    }

    protected void AddAssets_Click(object sender, EventArgs e)
    {
        string BuybackRequestID = Session["BuybackRequestID"].ToString();
        string AssetID=Session["AssetID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetBuyback set Status=@Status,ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment,ApproverComments=@ApproverComments where BuybackRequestID=@BuybackRequestID", conAMS);
        myCommand.Parameters.AddWithValue("@Status", "Request Sent To Admin");
        myCommand.Parameters.AddWithValue("@ApproverComments", txt_cmt.Text);
        myCommand.Parameters.AddWithValue("@BuybackRequestID", BuybackRequestID);
        myCommand.Parameters.AddWithValue("@ApproverID", apprID.Text);
        myCommand.Parameters.AddWithValue("@ApproverName", apprName.Text);
        myCommand.Parameters.AddWithValue("@ApproverDesignation", apprdesign.Text);
        //myCommand.Parameters.AddWithValue("@ApproverDeptCode", apprDeptCode.Text);
        myCommand.Parameters.AddWithValue("@ApproverDepartment", apprDept.Text);
        try
        {
            conAMS.Open();
          
            myCommand.ExecuteNonQuery();
            txt_cmt.Text = "";
            Response.Redirect("ViewAssetBuyBack.aspx");

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
        string BuybackRequestID = Session["BuybackRequestID"].ToString();
        myCommand = new SqlCommand("update EmployeeAssetBuyback set Status='Rejected',ApproverID=@ApproverID,ApproverName=@ApproverName,ApproverDesignation=@ApproverDesignation,ApproverDepartment=@ApproverDepartment where BuybackRequestID='" + BuybackRequestID + "'", conAMS);
        myCommand.Parameters.AddWithValue("@ApproverID", apprID.Text);
        myCommand.Parameters.AddWithValue("@ApproverName", apprName.Text);
        myCommand.Parameters.AddWithValue("@ApproverDesignation", apprdesign.Text);
       // myCommand.Parameters.AddWithValue("@ApproverDeptCode", apprDeptCode.Text);
        myCommand.Parameters.AddWithValue("@ApproverDepartment", apprDept.Text);
        try
        {
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            txt_cmt.Text = "";
            Response.Redirect("ViewAssetBuyBack.aspx");

        }
        catch(Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
        }
    }
}