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

public partial class EditAuditedAssets : System.Web.UI.Page
{
    DataTable dt;
    SqlCommand myCommand;
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
        }
        AssetDetails.Visible = false;
        if (!IsPostBack)
        {
            //string Status = WebConfigurationManager.AppSettings.Get("DelieveryStatus");
            //cmb_Status.DataSource = Status.Split(',');
            //cmb_Status.DataBind();
            //cmb_Status.SelectedIndex = -1;
            //Session["AuditID"] = null;
            ASPxGridView1.DataBind();
        }
    }
   
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = true;
        if (gd_Audit.Text == "")
        {
            lbl_msg.Text = "Select Audit";
            lbl_msg.Visible = true;
            return;
        }
        if (gridlkup_Asset.Text == "")
        {
            lbl_msg.Text = "Select Asset";
            lbl_msg.Visible = true;
            return;
        }
        if(cmb_Status.Text=="")
        {
            lbl_msg.Text = "Select Status";
            lbl_msg.Visible = true;
            AssetDetails.Visible = true;
            return;
        }
        if (cmb_assetlocation.Text == "")
        {
            lbl_msg.Text = "Select Wing";
            lbl_msg.Visible = true;
            AssetDetails.Visible = true;
            return;
        }
        if (Cust_gridlookup.Text == "")
        {
            lbl_msg.Text = "Select Custodian";
            lbl_msg.Visible = true;
            AssetDetails.Visible = true;
            return;
        }
        if (txt_Comments.Text == "")
        {
            lbl_msg.Text = "Enter Remarks";
            lbl_msg.Visible = true;
            AssetDetails.Visible = true;
            return;
        }
        myCommand = new SqlCommand("Update AuditDetails Set Status=@Status,Comments=@Comments,Date=@Date,AuditStatus=@AuditStatus,Location=@Location,CustodianID=@CustodianID Where AuditDetailsID='" + gridlkup_Asset.Value + "'", myConnection);
        myCommand.Parameters.AddWithValue("@AuditStatus", cmb_Status.Text);
        myCommand.Parameters.AddWithValue("@Comments", txt_Comments.Text);
        myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now.ToString("yyyy-MM-dd"));
        myCommand.Parameters.AddWithValue("@Status", "Audited");
        myCommand.Parameters.AddWithValue("@Location", cmb_assetlocation.Text);
        myCommand.Parameters.AddWithValue("@CustodianID",Cust_gridlookup.Text);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

        lbl_msg.Text = "Updated Successfully";
        lbl_msg.Visible = true;
        Clear();

       ASPxGridView1.DataBind();

    }

    private void Clear()
    {
        txt_Comments.Text = "";
        cmb_Status.Text = "";
        gd_Audit.Value = "";
        gridlkup_Asset.Value = "";
        lbl_AssetNo.Text = "";
        lbl_Assetclass.Text = "";
        lbl_AssetType.Text = "";
        cmb_assetlocation.Text = "";
        Cust_gridlookup.Value = "";

    }

    protected void gridlkup_Asset_TextChanged(object sender, EventArgs e)
    {
        AssetDetails.Visible = true;
        string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(LocationDesc+' (',Location+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote FROM [AssetMaster] where MainAssetNumber = '" + gridlkup_Asset.Text.ToString() + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, myConnection2);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
            lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
            lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
            lbl_Assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
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

        string query3 = "Select AuditStatus,Comments,Location,CustodianID from  AuditDetails where AuditDetailsID='" + gridlkup_Asset.Value + "'";
        SqlDataAdapter da3 = new SqlDataAdapter(query3, myConnection);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        foreach (DataRow row in dt3.Rows)
        {
            cmb_Status.Text = row["AuditStatus"].ToString();
            txt_Comments.Text = row["Comments"].ToString();
            cmb_assetlocation.Text = row["Location"].ToString();
            Cust_gridlookup.Text = row["CustodianID"].ToString();
        }
    }

    protected void gd_Audit_TextChanged(object sender, EventArgs e)
    {
       
        Session["AuditID"] = gd_Audit.Value.ToString();
    }

    protected void gd_Audit_Init(object sender, EventArgs e)
    {
        ASPxGridView gv = gridlkup_Asset.GridView as ASPxGridView;
        gv.Width = 300;
    }
}