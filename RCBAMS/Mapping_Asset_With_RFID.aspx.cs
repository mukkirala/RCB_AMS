using DevExpress.CodeParser;
using DevExpress.XtraCharts.Native;
using DevExpress.XtraPrinting.Export.Pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mapping_Asset_With_RFID : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    string AssetSLNO = "";
    //string AssetID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        table1.Visible=false;
        ASPxGridView1.DataBind();
    }

    protected void txt_REIDCard_TextChanged(object sender, EventArgs e)
    {
        string rfidTag = txt_REIDCard.Text;
    }

    protected void btn_mapp_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_REIDCard.Text == "")
            {
                lbl_message.Text = "Please enter RFID";
            }
            if (gridlookup_Asset.Text=="")
            {
                lbl_message.Text = "Please Select Asset";
            }
            string rfidTag = txt_REIDCard.Text.Trim();
            string slno = gridlookup_Asset.Value.ToString();
            string AssetID = gridlookup_Asset.Value.ToString();

            myConnection.Open();


            string clearOldAssetRFID = @"
                    UPDATE AssetMaster 
                    SET RFIDCardNumber = NULL, RFIDMAPDATE = NULL
                    WHERE RFIDCardNumber = @RFIDCardNumber 
                    AND NOT (AssetID = @AssetID AND SLNO = @SLNO)"
            ;

            using (SqlCommand clearCmd = new SqlCommand(clearOldAssetRFID, myConnection))
            {
                clearCmd.Parameters.AddWithValue("@RFIDCardNumber", rfidTag);
                clearCmd.Parameters.AddWithValue("@AssetID", AssetID);
                clearCmd.Parameters.AddWithValue("@SLNO", slno);
                clearCmd.ExecuteNonQuery();
            }

            // 2️⃣ Check in history table if RFID already exists as Active → make Inactive
            string checkRFID = @"
                    SELECT COUNT(*) FROM RFIDMappingHistory 
                    WHERE (RFIDCardNumber = @RFID OR SRNO = @SRNO) AND RFIDStatus = 'Active'";
            

            using (SqlCommand checkCmd = new SqlCommand(checkRFID, myConnection))
            {
                checkCmd.Parameters.AddWithValue("@RFID", rfidTag);
                checkCmd.Parameters.AddWithValue("@SRNO", slno);
                int exists = (int)checkCmd.ExecuteScalar();

                if (exists > 0)
                {
                    string inactiveQuery = @"
                            UPDATE RFIDMappingHistory
                            SET RFIDStatus = 'Inactive'
                            WHERE (RFIDCardNumber = @RFID OR SRNO = @SRNO) AND RFIDStatus = 'Active'"
                    ;

                    using (SqlCommand inactiveCmd = new SqlCommand(inactiveQuery, myConnection))
                    {
                        inactiveCmd.Parameters.AddWithValue("@RFID", rfidTag);
                        inactiveCmd.Parameters.AddWithValue("@SRNO", slno);
                        inactiveCmd.ExecuteNonQuery();
                    }
                }
            }

            // 3️⃣ Insert NEW history record as Active
            string insertHistory = @"
                    INSERT INTO RFIDMappingHistory (RFIDCardNumber, SRNO, RFIDHistoryDate, RFIDStatus)
                    VALUES (@RFIDCardNumber, @SRNO, @RFIDHistoryDate, 'Active')"
            ;

            using (SqlCommand insertCmd = new SqlCommand(insertHistory, myConnection))
            {
                insertCmd.Parameters.AddWithValue("@RFIDCardNumber", rfidTag);
                insertCmd.Parameters.AddWithValue("@SRNO", slno);
                insertCmd.Parameters.AddWithValue("@RFIDHistoryDate", DateTime.Now.ToString("yyyy-MM-dd"));
                insertCmd.ExecuteNonQuery();
            }
            string AssetSLNO = gridlookup_Asset.Value.ToString();
                string Query2 = "UPDATE AssetMaster SET RFIDCardNumber=@RFIDCardNumber,RFIDMAPDATE=@RFIDMAPDATE Where SLNO='" + AssetSLNO + "'";
                myCommand = new SqlCommand(Query2, myConnection);
                myCommand.Parameters.AddWithValue("@RFIDCardNumber", txt_REIDCard.Text);
                myCommand.Parameters.AddWithValue("@RFIDMAPDATE", System.DateTime.Now);
               
                myCommand.ExecuteNonQuery();
                myConnection.Close();
                lbl_message.Text = "Successfully Mapped.";

                //string select = "SELECT Barcode,AssetGroupCode,AssetDescription,CaptureDate FROM AssetMaster Where Barcode='" + AssetID + "'  ";
                string select = "SELECT AssetID,AssetClass,AssetDesc,RFIDMAPDATE FROM AssetMaster Where SLNO='" + AssetSLNO + "'  ";

                SqlDataAdapter da = new SqlDataAdapter(select, myConnection);
                DataTable dt_select = new DataTable();
                da.Fill(dt_select);
                if (dt_select.Rows.Count > 0)
                {
                    table1.Visible = true;
                    lbl_AssetID.Text = dt_select.Rows[0].ItemArray[0].ToString();
                    lbl_AssetGroupCode.Text = dt_select.Rows[0].ItemArray[1].ToString();
                    lbl_AssetDescription.Text = dt_select.Rows[0].ItemArray[2].ToString();
                    lbl_CaptureDate.Text = dt_select.Rows[0].ItemArray[3].ToString();
                    //lbl_CaptureDate.Text = DateTime.Today.ToString("yyyy-MM-dd");

                }
            
        }
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            myConnection.Close();
        }
       


        //string AssetBarcode = gridlookup_Asset.Text;
       
        //clear();
        //}
        
    }
    protected void clear()
    {
        txt_REIDCard.Text = "";
        //gridlookup_AssetBarcode.Text = "";
        //gridlookup_AssetBarcode.Value = -1;
        gridlookup_Asset.Text = "";
        gridlookup_Asset.Value = -1;
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {

    }

    protected void btnexporttoxls_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "AssetMappedRFIDList";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "AssetMappedRFIDList";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }
}