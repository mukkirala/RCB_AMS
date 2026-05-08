using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AssetRetirement : System.Web.UI.Page
{
    DataTable dt;
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        AssetDetails.Visible = false;
    }

    protected void gridlkup_Asset_TextChanged(object sender, EventArgs e)
    {
        AssetDetails.Visible = true;
        string query = "Select MainAssetNumber,TechnicalAssetNumber,AssetClassName,AssetMaster.Status,SerialNumber,AssetType from  AssetMaster inner join AssetClassMaster on AssetClassMaster.AssetClassCode = AssetMaster.AssetClass  where MainAssetNumber='" + gridlkup_Asset.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, myConnection2);
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            lbl_AssetNo.Text = row["MainAssetNumber"].ToString();
            lbl_AssetType.Text = row["AssetType"].ToString();
            lbl_Assetclass.Text = row["AssetClassName"].ToString();
            lbl_SerialNumber.Text = row["SerialNumber"].ToString();
        }
      
       
    }

    protected void gd_Assetclass_TextChanged(object sender, EventArgs e)
    {
        Session["AssetClassCode"] = gd_Assetclass.Value.ToString();
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        err_msg.Visible = false;
        if(gd_Assetclass.Text=="")
        {
            err_msg.Text = "Select Asset Class";
            err_msg.Visible = true;
            return;
        }
        if(gridlkup_Asset.Text=="")
        {
            err_msg.Text = "Select Asset";
            err_msg.Visible = true;
            return;
        }
        if(ASPxDateEdit1.Text=="")
        {
            err_msg.Text = "Select Retirement Date";
            err_msg.Visible = true;
            AssetDetails.Visible = true;
            return;
        }
        if (txt_Cmts.Text == "")
        {
            err_msg.Text = "Give Reason For Retirement";
            err_msg.Visible = true;
            AssetDetails.Visible = true;
            return;
        }
        myCommand = new SqlCommand("Update AssetMaster set Status=@Status where MainAssetNumber=@MainAssetNumber", myConnection2);
        myCommand.Parameters.AddWithValue("@Status", "DACT");
        myCommand.Parameters.AddWithValue("@MainAssetNumber", gridlkup_Asset.Value.ToString());
        myConnection2.Open();
        myCommand.ExecuteNonQuery();
        myConnection2.Close();
        myCommand1 = new SqlCommand("insert into AssetRetirement(MainAssetNumber,AssetClass,Status,LastRetirementDate,PlannedRetirementDate,ReasonForRetirement)values(@MainAssetNumber,@AssetClass,@Status,@LastRetirementDate,@PlannedRetirementDate,@ReasonForRetirement)", myConnection);
        myCommand1.Parameters.AddWithValue("@MainAssetNumber", gridlkup_Asset.Value.ToString());
        myCommand1.Parameters.AddWithValue("@AssetClass", gd_Assetclass.Value.ToString());
        myCommand1.Parameters.AddWithValue("@Status", "Retired");
        myCommand1.Parameters.AddWithValue("@LastRetirementDate", DateTime.Now);
        myCommand1.Parameters.AddWithValue("@PlannedRetirementDate", ASPxDateEdit1.Date);
        myCommand1.Parameters.AddWithValue("@ReasonForRetirement", txt_Cmts.Text);
        myConnection.Open();
        myCommand1.ExecuteNonQuery();
        myConnection.Close();
        err_msg.Text = "Asset Retired";
        err_msg.Visible = true;
        ASPxGridView1.DataBind();
        Clear();
    }

    private void Clear()
    {
        gd_Assetclass.Value = "";
        gridlkup_Asset.Value = "";
        lbl_AssetNo.Text = "";
        lbl_Assetclass.Text = "";
        lbl_AssetType.Text = "";
        lbl_SerialNumber.Text = "";
        ASPxDateEdit1.Text = "";
        txt_Cmts.Text = "";

    }
}
