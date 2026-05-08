using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using DevExpress.Web.ASPxEditors;

public partial class RFID_Reader_Issues_Items_To_Employee_Using_RFID_Reader : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand myCommand;
    static DataTable dt1 = new DataTable();
    static DataTable dt2 = new DataTable();
    string assetbarcode_ = "";
    string returnstatus = "";

    protected void Page_Load(object sender, EventArgs e)
    {
       
        lbl_Date.Text = System.DateTime.Now.ToString("dd-MM-yyyy");
        if (!IsPostBack)
        {
            if (dt1.Columns.Count == 0)
            {
                FillDatatoGrid();
                txt_sendby.Text = "admin";
            }
            ASPxComboBox1.Text = null;
        }
    }

    private DataTable FillDatatoGrid()
    {
        //Adding columns to table sale
        DataColumn AssetID = new DataColumn("AssetID", typeof(System.String));
        DataColumn AssetSAPNo = new DataColumn("AssetSAPNo", typeof(System.String));
        DataColumn AssetDesc = new DataColumn("AssetDesc", typeof(System.String));
        DataColumn Quantity = new DataColumn("Quantity", typeof(System.Double));

        //Adding columns to datatable
        dt1.Columns.AddRange(new DataColumn[] { AssetID, AssetSAPNo, AssetDesc, Quantity });
        return dt1;
    }

    // RFID Text Changed Event 14_09_2018
    protected void txt_scanbarcode_TextChanged(object sender, EventArgs e)
    {
        string txtassetbarcode = txt_scanbarcode.Text;
        GateAssetData(txtassetbarcode);
    }

    // GridLook Event
    protected void GridLookup_assetbarcode_TextChanged(object sender, EventArgs e)
    {
        assetbarcode_ = GridLookup_assetbarcode.Text.ToString();
        GateAssetData(assetbarcode_);
    }

    public void GateAssetData(string assetbarcode)
    {
        string _assetbarcode = assetbarcode;
        DataTable dt = new DataTable();

        // For RFID 
        if (txt_scanbarcode.Text != "")
        {
            string query = "SELECT AssetDesc,AssetID from AssetMaster WHERE RFIDCardNumber='" + _assetbarcode + "' AND Status!='OutBound' AND Status!='DeActivate' AND Status!='Transfered' AND Status!='TentativeTransfer'";
            da = new SqlDataAdapter(query, myConnection);
            da.Fill(dt);
        }

        // For Select Asset
        if (_assetbarcode != "")
        {
            string query = "SELECT AssetDesc,AssetID from AssetMaster WHERE AssetID='" + _assetbarcode + "' AND Status!='OutBound' AND Status!='DeActivate' AND Status!='Transfered' AND Status!='TentativeTransfer'";
            da = new SqlDataAdapter(query, myConnection);
            da.Fill(dt);
        }
        else { 
            
        }

        string AssetDescription;
        string AssetID;
        string AssetSapno = "";
        // string AssetSapno = _assetbarcode.Substring(4, 7);

        if (dt.Rows.Count > 0)
        {
            AssetDescription = dt.Rows[0].ItemArray[0].ToString();
            AssetID = dt.Rows[0].ItemArray[1].ToString();
            AssetSapno = AssetID;
        }
        else
        {
            Messages.SetErrorMessage("2113", null, null, null, Session);
            return;
        }
        if (dt1.Columns.Count == 0)
        {
            FillDatatoGrid();
        }
        if (dt1.Rows.Count == 0)
        {
            dt1.Rows.Add(AssetID, AssetSapno, AssetDescription, "1");
            dt1.AcceptChanges();
            ASPxGridView1.DataSource = dt1;
            ASPxGridView1.DataBind();
        }
        else
        {
            int count = 0;
            foreach (DataRow dr in dt1.Rows) // search whole table
            {
                if (dr["AssetID"].ToString() == _assetbarcode) // if id==2
                {
                    double quan = Convert.ToDouble(dr["Quantity"].ToString());
                    dt1.Rows.RemoveAt(count);
                    break;
                }
                else
                {

                }
                count = count + 1;
                dt1.AcceptChanges();
                ASPxGridView1.DataSource = dt1;
                ASPxGridView1.DataBind();
            }
            dt1.Rows.Add(_assetbarcode, AssetSapno, AssetDescription, "1");
            dt1.AcceptChanges();
            ASPxGridView1.DataSource = dt1;
            ASPxGridView1.DataBind();
        }
        txt_scanbarcode.Text = "";
        GridLookup_assetbarcode.Value = null;
        txt_scanbarcode.Focus();
    }

    // Grid View
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string commandname = e.CommandArgs.CommandName.ToString();
        if (commandname == "Delete")
        {
            string val = (String)e.KeyValue;
            Session["AssetID"] = e.KeyValue;

            var row = dt1.Select("AssetID='" + val + "'");
            foreach (var ro in row)
            {
                ro.Delete();
                dt1.AcceptChanges();
            }
            ASPxGridView1.DataSource = dt1;
            ASPxGridView1.DataBind();

        }
        ASPxGridView1.DataBind();
        
    }
    protected void Clear()
    {
        txt_contactno.Text = txt_sendby.Text = txt_vechileno.Text = txtdrivername.Text = memo_remarks.Text = "";
        dt1 = new DataTable();
        ASPxGridView1.DataSource = dt1;
        ASPxGridView1.DataBind();
        ASPxComboBox1.Text = "";
    }

    // Button Click Event 14_09_2018
    protected void btnprint_Click(object sender, EventArgs e)
    {
        if(txt_vechileno.Text =="")
        {
            Label1.Text = "Enter Vehicle Number";
        }
        else if (txtdrivername.Text == "")
        {
            Label1.Text = "Enter Driver Name";
        }
        else if (ASPxComboBox1.Text == "")
        {
            Label1.Text = "Select Employee Name";
        }
        else if (txt_contactno.Text == "")
        {
            Label1.Text = "Enter Contact Number";
        }
        else if (txt_sendby.Text == "")
        {
            Label1.Text = "Enter Send By Number";
        }
        else if (ASPxGridView1.VisibleRowCount == 0)
        {
            Label1.Text = "Select Item Or Scan RFID";
           
        }
        else
        {
            returnstatus = ASPxRadioButtonList1.SelectedItem.Value.ToString();
            myConnection.Open();
            string date = System.DateTime.Now.ToString("yyyy-MM-dd");
            string insertWODM = "INSERT INTO AssetOutBoundMaster(AssetToWhom,Sendby,Date,Remarks,VechileNo,DriverName,ReturnableStatus,EmployeeID,ContactNo) VALUES (@AssetToWhom,@Sendby,@Date,@Remarks,@VechileNo,@DriverName,@ReturnableStatus,@EmployeeID,@ContactNo); SELECT SCOPE_IDENTITY();";
            myCommand = new SqlCommand(insertWODM, myConnection);
            myCommand.Parameters.AddWithValue("@AssetToWhom", ASPxComboBox1.Text);
            myCommand.Parameters.AddWithValue("@Sendby", txt_sendby.Text);
            myCommand.Parameters.AddWithValue("@Date", date);
            myCommand.Parameters.AddWithValue("@Remarks", memo_remarks.Text);
            myCommand.Parameters.AddWithValue("@VechileNo", txt_vechileno.Text);
            myCommand.Parameters.AddWithValue("@DriverName", txtdrivername.Text);
            myCommand.Parameters.AddWithValue("@ReturnableStatus", returnstatus);
            if (ASPxComboBox1.Value != null)
            {
                myCommand.Parameters.AddWithValue("@EmployeeID", ASPxComboBox1.Value);
            }
            else
            {
                myCommand.Parameters.AddWithValue("@EmployeeID", DBNull.Value);
            }
            //myCommand.Parameters.AddWithValue("@EmployeeID", ASPxComboBox1.Value);
            myCommand.Parameters.AddWithValue("@ContactNo", txt_contactno.Text);

            int AssetOutBoundID = Convert.ToInt32(myCommand.ExecuteScalar());

            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                string AssetId = ASPxGridView1.GetRowValues(i, "AssetID").ToString();
                // string name1 = ASPxGridView1.GetRowValues(i, "AssetDescription").ToString();                
                double quantity = Convert.ToDouble(ASPxGridView1.GetRowValues(i, "Quantity").ToString());

                string insertAssettransfer = "INSERT INTO AssetOutBoundDetails(AssetOutBoundID,AssetID,Quantity,Status,itemStatus) Values(@AssetOutBoundID,@AssetID,@Quantity,@Status,@itemStatus)";
                myCommand = new SqlCommand(insertAssettransfer, myConnection);
                myCommand.Parameters.AddWithValue("@AssetOutBoundID", AssetOutBoundID);
                myCommand.Parameters.AddWithValue("@AssetID", AssetId);
                //myCommand.Parameters.AddWithValue("@AssetDescription", name1);
                myCommand.Parameters.AddWithValue("@Quantity", quantity);
                myCommand.Parameters.AddWithValue("@Status", "OutBound");
                myCommand.Parameters.AddWithValue("@itemStatus", "Assign");
                myCommand.ExecuteNonQuery();

                string query3 = "UPDATE AssetMaster Set Status=@delivered Where AssetID=@Skucode";
                myCommand = new SqlCommand(query3, myConnection);
                myCommand.Parameters.AddWithValue("@delivered", "OutBound");
                //myCommand.Parameters.AddWithValue("@date", date);
                myCommand.Parameters.AddWithValue("@skucode", AssetId);
                myCommand.ExecuteNonQuery();


                string query5 = "INSERT INTO SKUHistory(SKUCode,Status,DateOfStatusChanged,RecordedBy) Values(@Skucode,@Status,@date,@Recordedby)";
                myCommand = new SqlCommand(query5, myConnection);
                myCommand.Parameters.AddWithValue("@Skucode", AssetId);
                myCommand.Parameters.AddWithValue("@Status", "OutBound");
                myCommand.Parameters.AddWithValue("@date", date);
                myCommand.Parameters.AddWithValue("@Recordedby", txt_sendby.Text);
                myCommand.ExecuteNonQuery();

            }
            string date1 = System.DateTime.Now.ToString("dd-MM-yyyy");
            // string name = txt_name.Text;
            string name = ASPxComboBox1.Text;
            string contactno = txt_contactno.Text;
            string receiptno = AssetOutBoundID.ToString();
            Session["id"] = AssetOutBoundID;
            Session["date"] = date1;
            string type = "Dispatch Gate Pass";
            string to = "To Whom";
            string from = "SendBy";
            string createdby = txt_sendby.Text;
            DeliveryGatePass report = new DeliveryGatePass(dt1, name, contactno, txt_vechileno.Text, txtdrivername.Text, createdby, receiptno, type, to, from);
            //report.CreateDocument();
            //report.ExportToPdf(Server.MapPath(@"//PdfReports//GatePass//GatePass_" + Session["date"] + "_" + Session["id"] + ".pdf"));

            //Response.Write("<script>");
            //Response.Write("window.open('../AssetOutBoundPdf.aspx','_blank')");
            //Response.Write("</script>");

            //myConnection.Close();
            // Export the report to PDF
            string AssetOutBoundPdf = @"~/PdfReports/GatePass/GatePass_" + Session["date"] + "_" + Session["id"] + ".pdf";
            report.CreateDocument();
            report.ExportToPdf(Server.MapPath(AssetOutBoundPdf));

            // Open the generated PDF file in a new window using JavaScript
            string script = "window.open('" + ResolveUrl(AssetOutBoundPdf) + "', '_blank');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenPDF", script, true);


            Clear();
            dt1.Clear();
        }
       
    }
    protected void ASPxRadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        returnstatus = ASPxRadioButtonList1.SelectedItem.Value.ToString();
    }
}