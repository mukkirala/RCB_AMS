using System;

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class AssetTransferLocation : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand,mycommand1;
    static string AssetID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

        if (!IsPostBack)
        {
            AssetDetails.Visible = false;
        }
       
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
      
  
        if(AssetGrpGridLookup1.Text=="")
        {
            errmsg.Text = "Select Asset Class";
            errmsg.Visible = true;
            return;
        }
        if (gridlkup_Asset.Text == "")
        {
            errmsg.Text = "Select Asset";
            errmsg.Visible = true;
            return;
        }
        if (ASPxGridLookup_Tolocation.Text == "")
        {
            errmsg.Text = "Select To Location";
            errmsg.Visible = true;
            return;
        }
      
        try
        {
            myCommand = new SqlCommand("insert into AssetTransfer(AssetID,ToLocation,Status,Date)values(@AssetID,@ToLocation,@Status,@Date)", conAMS);
            myCommand.Parameters.AddWithValue("@AssetID", gridlkup_Asset.Value.ToString());
            myCommand.Parameters.AddWithValue("@ToLocation", ASPxGridLookup_Tolocation.Value.ToString());
            myCommand.Parameters.AddWithValue("@Status", "Transferred");
            myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now);
          
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            mycommand1 = new SqlCommand("update AssetMaster set Location='" + ASPxGridLookup_Tolocation.Value+ "' where AssetID='" + gridlkup_Asset.Value.ToString() + "'",conSAP);
            conSAP.Open();
            mycommand1.ExecuteNonQuery();
            errmsg.Text = "Asset Transferred Successfully";
            errmsg.Visible = true;

        }
        catch (Exception ex)
        {

        }
        finally
        {
            conAMS.Close();
            conSAP.Close();
           
            Clear();
            AssetList.DataBind();
        }
    }

    private void Clear()
    {
        gridlkup_Asset.Value = "";

        ASPxGridLookup_Tolocation.Value = "";
        AssetGrpGridLookup1.Value = "";
        AssetDetails.Visible = false;
    }

    protected void btnXLS_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsxToResponse();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void cmb_Assetname_SelectedIndexChanged(object sender, EventArgs e)
    {
         //string AssetRequestID=Session["AssetRequestID"].ToString();
    }

    protected void AssetGrpGridLookup1_TextChanged(object sender, EventArgs e)
    {
        Session["AssetClassCode"] =AssetGrpGridLookup1.Value.ToString();
       // Session["EmpID"] = cmb_transferredto.Value.ToString();
    }

    protected void gridlkup_Asset_TextChanged(object sender, EventArgs e)
    {
        AssetDetails.Visible = true;
        AssetID= gridlkup_Asset.Value.ToString();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT AssetID,MainAssetNumber,AssetSubNumber,AssetDesc,AssetClass,Location,SerialNumber,CustVeriBy from InstemSAP..AssetMaster where AssetID = '" + AssetID+"'", conSAP);
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            lbl_AssetNo.Text = dt.Rows[0].ItemArray[1].ToString();
            lbl_subnumber.Text = dt.Rows[0].ItemArray[2].ToString();
            lbl_AssetType.Text = dt.Rows[0].ItemArray[3].ToString();
            lbl_Assetclass.Text = dt.Rows[0].ItemArray[4].ToString();
            lbl_currentlocation.Text= dt.Rows[0].ItemArray[5].ToString();
            lbl_currentcustodian.Text= dt.Rows[0].ItemArray[7].ToString();


        }

    }

}