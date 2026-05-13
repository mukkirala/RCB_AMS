using DevExpress.Web.ASPxGridView;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Css.Ast;

public partial class AssetAMC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            string maintenanceContract = WebConfigurationManager.AppSettings.Get("MaintenanceContract");
            cmb_MaintenanceContract.DataSource = maintenanceContract.Split(',');
            cmb_MaintenanceContract.DataBind();
        }

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            if (cmb_asset.Value == null || string.IsNullOrEmpty(cmb_asset.Value.ToString()))
            {
                lbl_msg.Text = "Please select Equipment.";
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (cmb_MaintenanceContract.Text == "")
            {
                lbl_msg.Text = "Please Select Maintenance Contract";


                return;
            }
            if (txt_CalibOn.Text == "")
            {
                lbl_msg.Text = "Please Enter Start Date";

                return;
            }
            if (txt_CalibDue.Text == "")
            {
                lbl_msg.Text = "Please Enter End Date";

                return;
            }

            string assetId = cmb_asset.Value.ToString();
            string mainAssetNumber = cmb_asset.Text;
            string maintenanceContract = cmb_MaintenanceContract.Text;

            DateTime calibOn = txt_CalibOn.Date;
            DateTime calibDue = txt_CalibDue.Date;

            string connStr = ConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd;

                // ✅ INSERT
                if (btn_save.Text == "Save")
                {
                    string query = @"INSERT INTO AssetCalibration
                (AssetID, MainAssetNumber, MaintenanceContract, CalibrationOn, CalibrationDue)
                VALUES (@AssetID, @MainAssetNumber, @MaintenanceContract, @CalibrationOn, @CalibrationDue)";

                    cmd = new SqlCommand(query, con);
                }
                // ✅ UPDATE
                else
                {
                    string query = @"UPDATE AssetCalibration 
                SET AssetID=@AssetID,
                    MainAssetNumber=@MainAssetNumber,
                    MaintenanceContract=@MaintenanceContract,
                    CalibrationOn=@CalibrationOn,
                    CalibrationDue=@CalibrationDue
                WHERE CalibrationID=@CalibrationID";

                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CalibrationID", ViewState["EditCalibrationID"]);
                }

                cmd.Parameters.AddWithValue("@AssetID", assetId);
                cmd.Parameters.AddWithValue("@MainAssetNumber", mainAssetNumber);
                cmd.Parameters.AddWithValue("@MaintenanceContract", maintenanceContract);
                cmd.Parameters.AddWithValue("@CalibrationOn", calibOn);
                cmd.Parameters.AddWithValue("@CalibrationDue", calibDue);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lbl_msg.Text = btn_save.Text == "Save" ? "Saved Successfully!" : "Updated Successfully!";
            lbl_msg.ForeColor = System.Drawing.Color.Green;

            btn_save.Text = "Save"; // 🔁 Reset button
        }
        catch (Exception ex)
        {
            lbl_msg.Text = "Error: " + ex.Message;
            lbl_msg.ForeColor = System.Drawing.Color.Red;
        }

        Clear();
        grid_EquipmentAMC.DataBind(); // 🔁 Refresh grid
    }
    protected void Clear()
    {
        cmb_asset.Value = null;
        txt_CalibOn.Text = null;
        txt_CalibDue.Text = null;
        cmb_MaintenanceContract.Value = null;
    }
    protected void grid_EquipmentAMC_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        ASPxGridView grid = sender as ASPxGridView;

        int calibrationId = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "CalibrationID"));

        if (e.ButtonID == "Edit")
        {
            string id = grid.GetRowValues(e.VisibleIndex, "CalibrationID").ToString();
            ViewState["EditCalibrationID"] = id;

            cmb_asset.DataBind();
            cmb_MaintenanceContract.DataBind();

            cmb_asset.Value = grid.GetRowValues(e.VisibleIndex, "equipmentName").ToString();
            cmb_MaintenanceContract.Value = grid.GetRowValues(e.VisibleIndex, "MaintenanceContract").ToString();

            txt_CalibOn.Date = Convert.ToDateTime(grid.GetRowValues(e.VisibleIndex, "CalibrationOn"));
            txt_CalibDue.Date = Convert.ToDateTime(grid.GetRowValues(e.VisibleIndex, "CalibrationDue"));

            lbl_msg.Text = "";
            btn_save.Text = "Update";
        }

        if (e.ButtonID == "Delete")
        {
            string connStr = ConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM AssetCalibration WHERE CalibrationID=@CalibrationID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CalibrationID", calibrationId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            grid.DataBind();
        }
    }
    protected void grid_EquipmentAMC_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        ASPxGridView grid = sender as ASPxGridView;

        string id = grid.GetRowValuesByKeyValue(e.KeyValue, "CalibrationID").ToString();
        ViewState["EditCalibrationID"] = id;

        if (e.CommandArgs.CommandName == "Edit")
        {
            cmb_asset.Value = grid.GetRowValuesByKeyValue(e.KeyValue, "AssetID");

            cmb_MaintenanceContract.Value = grid.GetRowValuesByKeyValue(e.KeyValue, "MaintenanceContract");

            txt_CalibOn.Date = Convert.ToDateTime(grid.GetRowValuesByKeyValue(e.KeyValue, "CalibrationOn"));
            txt_CalibDue.Date = Convert.ToDateTime(grid.GetRowValuesByKeyValue(e.KeyValue, "CalibrationDue"));

            btn_save.Text = "Update";
        }
        else if (e.CommandArgs.CommandName == "Delete")
        {
            string connStr = ConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM AssetCalibration WHERE CalibrationID=@CalibrationID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CalibrationID", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            grid.DataBind();
        }
    }
}