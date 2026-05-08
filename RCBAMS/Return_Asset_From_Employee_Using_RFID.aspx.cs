using Attendaance_Employee;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class RFID_Reader_Return_Asset_From_Employee_Using_RFID : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand myCommand;
    static DataTable dt1 = new DataTable();
    static DataTable dt2 = new DataTable();
    string AssetId;
    string AssetDescripti;
    double quantity;
    string contactno;
    bool atLeastOneChecked = false;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void chkHeader_CheckedChanged(object sender, EventArgs e)
    {
        //ASPxCheckBox chkHeader = aspxgridview1.FindHeaderTemplateControl(aspxgridview1.Columns[7] as GridViewDataColumn, "chkHeader") as ASPxCheckBox;

        //if (chkHeader == null)
        //{
        //    for (int i = 0; i < aspxgridview1.VisibleRowCount; i++)
        //    {
        //        ASPxCheckBox chkRow = aspxgridview1.FindRowCellTemplateControl(i, aspxgridview1.Columns[7] as GridViewDataColumn, "Check") as ASPxCheckBox;
        //        chkRow.Checked = true;
        //    }
        //}
        //else
        //{
        //    for (int i = 0; i < aspxgridview1.VisibleRowCount; i++)
        //    {
        //        ASPxCheckBox chkRow = aspxgridview1.FindRowCellTemplateControl(i, aspxgridview1.Columns[7] as GridViewDataColumn, "Check") as ASPxCheckBox;
        //        chkRow.Checked = false;
        //    }
        //}
    }

    protected void btnprint_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < aspxgridview1.VisibleRowCount; i++)
        {
            ASPxCheckBox chk = (ASPxCheckBox)aspxgridview1.FindRowCellTemplateControl(i, aspxgridview1.Columns["Check"] as GridViewDataCheckColumn, "Check");
            
            if (chk != null && chk.Checked)
            {
                atLeastOneChecked = true;
                break; // Exit the loop since at least one checkbox is checked
            }

        }
        if (ASPxGridLookup1.Text == "")
        {
            lbl_message.Text = "Select GatePass  No";
            return;

        }
        if (!atLeastOneChecked)
        {
            lbl_message.Text = "Check at least one Return Asset to print";
            return;
        }
        
       
        if (aspxgridview1.VisibleRowCount == 0)
        {
            lbl_message.Text = "No Return Asset record Found";
            return;
        }
 


        else
        {
            dt1.Columns.Clear();
            dt1.Rows.Clear();
            dt1.Columns.Add("AssetID");
            dt1.Columns.Add("AssetSAPNo");
            dt1.Columns.Add("AssetDesc");
            dt1.Columns.Add("Quantity");

            myConnection.Open();

            string date = System.DateTime.Now.ToString("yyyy-MM-dd");
            string insert = "INSERT INTO AssetReceivedMaster(Receivedby,Date,VechileNo,DriverName) Values(@Receivedby,@Date,@VechileNo,@DriverName)" + "Select Scope_Identity()";
            myCommand = new SqlCommand(insert, myConnection);
            myCommand.Parameters.AddWithValue("@Receivedby", lbl_Sendby.Text);
            myCommand.Parameters.AddWithValue("@VechileNo", lbl_Vehicle.Text);
            myCommand.Parameters.AddWithValue("@Date", date);
            myCommand.Parameters.AddWithValue("@DriverName", lbl_DriverName.Text);
            int AssetReceivedID = Convert.ToInt32(myCommand.ExecuteScalar());

            for (int i = 0; i < aspxgridview1.VisibleRowCount; i++)
            {
                ASPxCheckBox chkpresent = (ASPxCheckBox)aspxgridview1.FindRowCellTemplateControl(i, aspxgridview1.Columns["Check"] as GridViewDataCheckColumn, "Check");
                if (chkpresent.Checked == true)
                {
                    AssetId = aspxgridview1.GetRowValues(i, "AssetID").ToString();
                    AssetDescripti = aspxgridview1.GetRowValues(i, "AssetDesc").ToString();
                    quantity = Convert.ToDouble(aspxgridview1.GetRowValues(i, "Quantity").ToString());

                    string insertAssetReceived = "INSERT INTO AssetReceivedDetails(AssetReceivedID,AssetID,Quantity,Status) Values(@AssetReceivedID,@AssetID,@Quantity,@Status)";
                    myCommand = new SqlCommand(insertAssetReceived, myConnection);
                    myCommand.Parameters.AddWithValue("@AssetReceivedID", AssetReceivedID);
                    myCommand.Parameters.AddWithValue("@AssetID", AssetId);
                    myCommand.Parameters.AddWithValue("@Quantity", quantity);
                    myCommand.Parameters.AddWithValue("@Status", "PendingQA");
                    myCommand.ExecuteNonQuery();

                    string query3 = "UPDATE AssetMaster Set Status=@delivered Where AssetID=@Skucode";
                    myCommand = new SqlCommand(query3, myConnection);
                    myCommand.Parameters.AddWithValue("@delivered", "PendingQA");
                    myCommand.Parameters.AddWithValue("@skucode", AssetId);
                    myCommand.ExecuteNonQuery();

                    string query5 = "INSERT INTO SKUHistory(SKUCode,Status,DateOfStatusChanged,RecordedBy) Values(@Skucode,@Status,@date,@Recordedby)";
                    myCommand = new SqlCommand(query5, myConnection);
                    myCommand.Parameters.AddWithValue("@Skucode", AssetId);
                    myCommand.Parameters.AddWithValue("@Status", "PendingQA");
                    myCommand.Parameters.AddWithValue("@date", date);
                    myCommand.Parameters.AddWithValue("@Recordedby", lbl_Sendby.Text);
                    myCommand.ExecuteNonQuery();
                    string a = "";
                    string b = "";
                    dt1.Rows.Add(AssetId, a, AssetDescripti, quantity);
                }


            }

            string date1 = System.DateTime.Now.ToString("dd-MM-yyyy");
            string name = lbl_AssetToWhom.Text;
            //string contactno = "";
            string receiptno = AssetReceivedID.ToString();
            Session["id"] = AssetReceivedID;
            Session["date"] = date1;
            string type = "Received Gate Pass";
            string to = "From Whom";
            string from = "ReceivedBy";
            string createdby = lbl_Sendby.Text;
            DeliveryGatePass report = new DeliveryGatePass(dt1, name, contactno, lbl_Vehicle.Text, lbl_DriverName.Text, createdby, receiptno, type, to, from);
            //report.CreateDocument();
            //report.ExportToPdf(Server.MapPath(@"../PdfReports//ReceivedPass//ReceivedPass_" + Session["date"] + "_" + Session["id"] + ".pdf"));
            //Response.Write("<script>");
            //Response.Write("window.open('../AssetReceivedPdf.aspx','_blank')");
            //Response.Write("</script>");
            string AssetInBoundPdf = @"~/PdfReports/ReceivedPass/ReceivedPass_" + Session["date"] + "_" + Session["id"] + ".pdf";
            report.CreateDocument();
            report.ExportToPdf(Server.MapPath(AssetInBoundPdf));

            // Open the generated PDF file in a new window using JavaScript
            string script = "window.open('" + ResolveUrl(AssetInBoundPdf) + "', '_blank');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenPDF", script, true);

            myConnection.Close();
            Clear();
            dt1.Rows.Clear();
        }
    }
    protected void ASPxGridLookup1_TextChanged(object sender, EventArgs e)
    {
        string getpass = ASPxGridLookup1.Text;
        string query = "SELECT AssetToWhom, Date, Sendby, DriverName, VechileNo, ContactNo  from AssetOutBoundMaster WHERE AssetOutBoundID='" + getpass + "'";
        da = new SqlDataAdapter(query, myConnection);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lbl_AssetToWhom.Text = dt.Rows[0].ItemArray[0].ToString();
            lbl_date.Text = dt.Rows[0].ItemArray[1].ToString();
            lbl_Sendby.Text = dt.Rows[0].ItemArray[2].ToString();
            lbl_DriverName.Text = dt.Rows[0].ItemArray[3].ToString();
            lbl_Vehicle.Text = dt.Rows[0].ItemArray[4].ToString();
            contactno = dt.Rows[0].ItemArray[5].ToString();
        }
    }

    protected void Clear()
    {
        aspxgridview1.DataSource = null;
        ASPxGridLookup1.Text = string .Empty;
        lbl_message.Text = string.Empty;
    }
}