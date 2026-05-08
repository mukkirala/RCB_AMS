using AjaxControlToolkit;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class AddInstrument : System.Web.UI.Page
{
    private DatabaseConnection Db = new DatabaseConnection();
    private SqlCommand cmd;
    string base64;
    protected void Page_Load(object sender, EventArgs e)
    {
        string status = WebConfigurationManager.AppSettings.Get("InstrumentStatus");
        cmb_status.DataSource = status.Split(',');
        cmb_status.DataBind();
    
    }
    protected void btn_save_Click1(object sender, EventArgs e)
    {
        try
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("ImageUrl");
            XtraReport report1 = new XtraReport();
            report1.CreateDocument();

            string AssetGroup = cmb_assetgroup.Text.ToString();
            string AssetGroup1 = AssetGroup.Replace(" ", "");
            string name = AssetGroup;

            string QRcode = name;
            //string Barcode =  AssetGroup + srno;
            string currendate = System.DateTime.Now.ToString();

           // Utilities.GenerateMyQCCode(cmb_assetgroup.Text, QRcode);
           string location = "QRImages/" + QRcode + ".jpg";
            string range = txt_from.Text;

            string serialno = txt_serialno.Text;

            string Query2 = "Insert into InstrumentMaster(InstrumentTypeID,InstrumentName,Range,SerialNumber,BrandOrMake,Model,DateOfCommission,UserDepartment,UserSection,SectionID,CalibrationPeriod,DateOfLastCalibration,QRCode,QRImage,CaptureImage,Createdby,Createddate,InstrumentStatus,Description,Status)values(@InstrumentTypeID,@InstrumentName,@Range,@SerialNumber,@BrandOrMake,@Model,@DateOfCommission,@UserDepartment,@UserSection,@SectionID,@CalibrationPeriod,@DateOfLastCalibration,@QRCode,@QRImage,@CaptureImage,@Createdby,@Createddate,@InstrumentStatus,@Description,@Status)" + "Select Scope_Identity()";
            cmd = new SqlCommand(Query2);
            cmd.Parameters.AddWithValue("@InstrumentTypeID", cmb_assetgroup.Value);
            cmd.Parameters.AddWithValue("@InstrumentName", name);
            cmd.Parameters.AddWithValue("@Range", range);
            cmd.Parameters.AddWithValue("@SerialNumber", serialno);
            cmd.Parameters.AddWithValue("@BrandOrMake", txt_brand.Text);
            cmd.Parameters.AddWithValue("@Model", txt_model.Text);
            cmd.Parameters.AddWithValue("@DateOfCommission", ASPxDateEdit1.Text);
            cmd.Parameters.AddWithValue("@UserDepartment", cmb_department.Text);
            cmd.Parameters.AddWithValue("@UserSection", cmb_section.Text);
            cmd.Parameters.AddWithValue("@SectionID", cmb_section.Value);
            cmd.Parameters.AddWithValue("@CalibrationPeriod", txt_calibration.Text);
            cmd.Parameters.AddWithValue("@DateOfLastCalibration", ASPxDateEdit2.Text);
            //cmd.Parameters.AddWithValue("@QRCode", QRcode);
            //cmd.Parameters.AddWithValue("@QRImage", location);
            cmd.Parameters.AddWithValue("@QRCode", "");
            cmd.Parameters.AddWithValue("@QRImage", "");
            cmd.Parameters.AddWithValue("@CaptureImage", "");
            cmd.Parameters.AddWithValue("@Createdby", "Admin");
            cmd.Parameters.AddWithValue("@Createddate", System.DateTime.Now);
            cmd.Parameters.AddWithValue("@InstrumentStatus", cmb_status.Text);
            cmd.Parameters.AddWithValue("@Description", memo_desc.Text);
            cmd.Parameters.AddWithValue("@Status","Active");

            Db.OpenConnection();
            //Db.ExecuteNonQuery(cmd);
            int id1 = Convert.ToInt32(Db.ExecuteScalar(cmd));

            string insert1 = "Insert into CalibrationHistory(InstrumentID,LastCalibrationDate,NextCalibrationDate,CalibrationStatus)values(@InstrumentID,@LastCalibrationDate,@NextCalibrationDate,@CalibrationStatus)";
            cmd = new SqlCommand(insert1);
            cmd.Parameters.AddWithValue("@InstrumentID", id1);
            cmd.Parameters.AddWithValue("@LastCalibrationDate", ASPxDateEdit2.Text);
            cmd.Parameters.AddWithValue("@NextCalibrationDate", "");
            cmd.Parameters.AddWithValue("@CalibrationStatus", "Active");
            Db.ExecuteNonQuery(cmd);

            string Query3 = "INSERT INTO SKUHistory(SKUCode,Status,DateOfStatusChanged,RecordedBy) values(@SKUCode,@Status,@DateOfStatusChanged,@RecordedBy)";
            cmd = new SqlCommand(Query3);
            cmd.Parameters.AddWithValue("@SKUCode", QRcode);
            cmd.Parameters.AddWithValue("@DateOfStatusChanged", System.DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", "Good");
            cmd.Parameters.AddWithValue("@RecordedBy", cmb_createdby.Text);
            Db.ExecuteNonQuery(cmd);

            Db.CloseConnection();
            ASPxGridView1.DataBind();

            dt.Rows.Add(location);

            if (dt.Rows.Count > 0)
            {
                for (int z = 0; z < dt.Rows.Count;)
                {
                    string Imgurl1 = "";
                    string Imgurl = "";
                    for (int y = 0; y < 2; y++)
                    {
                        if (dt.Rows.Count > z)
                        {
                            string Barcode = dt.Rows[z].ItemArray[0].ToString();
                            if (y == 0)
                            {

                                Imgurl1 = Server.MapPath(dt.Rows[z].ItemArray[0].ToString());
                                ASPxImage1.ImageUrl = Imgurl1;
                                z = z + 1;
                            }
                            else if (y == 1)
                            {
                                Imgurl = Server.MapPath(dt.Rows[z].ItemArray[0].ToString());
                                ASPxImage1.ImageUrl = Imgurl;
                                z = z + 1;
                            }
                        }

                    }
                    BarcodeImagesReport report = new BarcodeImagesReport(Imgurl1, Imgurl);
                    report.CreateDocument();
                    report1.Pages.Add(report.Pages[0]);
                    //Reset all page numbers in the resulting document. 
                    report1.PrintingSystem.ContinuousPageNumbering = true;

                }
            }

            string fileName = "";
            PdfExportOptions pdfOptions = report1.ExportOptions.Pdf;
            string d = System.DateTime.Now.ToString("dd");
            string M = System.DateTime.Now.ToString("MM");
            string Y = System.DateTime.Now.ToString("yyyy");
            string mm = System.DateTime.Now.ToString("hh");
            string min = System.DateTime.Now.ToString(" mm ");
            string id = cmb_assetgroup.Text + "" + d + "" + M + "" + Y + "" + mm + "" + min;
            Session["BarcodeReportID"] = id;
            report1.ExportToPdf(Server.MapPath(@"PdfReports//ToBePrinted//BarcodeImages_" + id + ".Pdf"));
            fileName = "BarcodeImages_" + id + ".Pdf";

            cmd = new SqlCommand("INSERT INTO ConsolidatedBarcode([CreatedDate],[Location])VALUES(@CreatedDate,@Location)");
            cmd.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@Location", fileName);
            Db.OpenConnection();
            Db.ExecuteNonQuery(cmd);
            Db.CloseConnection();

            Messages.SetSuccessMessage("30242", null, Session);

            Clear();
            Response.Write("<script>");
            Response.Write("window.open('BarcodeReportPdf.aspx','_blank')");
            Response.Write("</script>");
        }
        catch (Exception ex)
        {
            Messages.SetErrorMessage("20012", null, null, null, Session);
            return;
        }
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["InstrumentID"] = e.KeyValue;
        if (btn == "Edit")
        {
            cmb_assetgroup.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentTypeID").ToString();
            txt_model.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Model").ToString();
            txt_serialno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SerialNumber").ToString();
            memo_desc.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Description").ToString();

            if (ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "DateOfCommission").ToString() == "")
            {
                ASPxDateEdit1.Text = DBNull.Value.ToString();
            }
            else
            {
                DateTime dateofcommission = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "DateOfCommission").ToString());
                ASPxDateEdit1.Date = dateofcommission;
            }
            DateTime lastcalibrationdate = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "DateOfLastCalibration").ToString());
            ASPxDateEdit2.Date = lastcalibrationdate;
            txt_brand.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "BrandOrMake").ToString();
            txt_from.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Range").ToString();
            cmb_department.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "UserDepartment").ToString();
            //cmb_section.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SectionID").ToString();
            cmb_section.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "UserSection").ToString();
            cmb_section.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SectionID").ToString();
            cmb_status.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentStatus").ToString();
            btn_save.Visible = false;
            btn_update.Visible = true;
        }
        else if (btn == "Delete")
        {
            string Delete = "update InstrumentMaster set Status='InActive'  where InstrumentID='" + Session["InstrumentID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(Delete);
            Db.OpenConnection();
            Db.ExecuteNonQuery(cmd);
            Db.CloseConnection();
            ASPxGridView1.DataBind();
        }
    }
    protected void Clear()
    {
        cmb_assetgroup.Text = cmb_createdby.Text =cmb_status.Text= "";
        memo_desc.Text = txt_model.Text = txt_serialno.Text = "";
        ASPxDateEdit1.Text = "";
        txt_brand.Text = "";
        cmb_department.Text = "";
        AspxImage2.ImageUrl = null;
        txt_from.Text = ASPxDateEdit2.Text = "";
        cmb_section.Text = "";

        txt_calibration.Text = "";

    }
    protected void cmb_assetsap_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btn_print_Click(object sender, EventArgs e)
    {
        //ASPxGridView1.FilterExpression = "[Budget] > 100000 AND [Location] = 'Monterey'";
        //ASPxGridView1.SettingsText.Title = ASPxGridView1.FilterExpression;
    }

    protected void btn_update_Click1(object sender, EventArgs e)
    {
        try
        {
            string AssetGroup = cmb_assetgroup.Text.ToString();
            string AssetGroup1 = AssetGroup.Replace(" ", "");
            string name = AssetGroup;
            string QRcode = name;

            //Utilities.GenerateMyQCCode(cmb_assetgroup.Text, QRcode);
            //string location = "QRImages/" + QRcode + ".jpg";

            string Query2 = "UPDATE [dbo].[InstrumentMaster] SET InstrumentTypeID=@InstrumentTypeID,InstrumentName=@InstrumentName,Range=@Range,UserDepartment=@UserDepartment,UserSection=@UserSection,SectionID=@SectionID, [Description]=@AssetDescription,[Model]=@ModelNo,[SerialNumber]=@SerialNo,BrandOrMake=@Brand,DateOfCommission=@CaptureDate,InstrumentStatus=@InstrumentStatus Where InstrumentID=@InstrumentID";
            cmd = new SqlCommand(Query2);
            cmd.Parameters.AddWithValue("@InstrumentID", Session["InstrumentID"].ToString());
            cmd.Parameters.AddWithValue("@AssetDescription", memo_desc.Text);
            cmd.Parameters.AddWithValue("@InstrumentName", cmb_assetgroup.Text);
            cmd.Parameters.AddWithValue("@UserDepartment", cmb_department.Text);
            cmd.Parameters.AddWithValue("@UserSection", cmb_section.Text);
            cmd.Parameters.AddWithValue("@SectionID", cmb_section.Value);
            cmd.Parameters.AddWithValue("@Range", txt_from.Text);
            cmd.Parameters.AddWithValue("@ModelNo", txt_model.Text);
            cmd.Parameters.AddWithValue("@SerialNo", txt_serialno.Text);
            if(ASPxDateEdit1.Text=="")
                {
                cmd.Parameters.AddWithValue("@CaptureDate", DBNull.Value);
                }
            else 
                {
                cmd.Parameters.AddWithValue("@CaptureDate", ASPxDateEdit1.Text);
                }
            cmd.Parameters.AddWithValue("@Brand", txt_brand.Text);
            if (cmb_assetgroup.Text == "")
            {
                cmd.Parameters.AddWithValue("@InstrumentTypeID", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@InstrumentTypeID", cmb_assetgroup.Value);
            }
            cmd.Parameters.AddWithValue("@InstrumentStatus", cmb_status.Text);
            Db.OpenConnection();
            Db.ExecuteNonQuery(cmd);

            //string Query3 = "INSERT INTO SKUHistory(SKUCode,Status,DateOfStatusChanged,RecordedBy) values(@SKUCode,@Status,@DateOfStatusChanged,@RecordedBy)";
            //cmd = new SqlCommand(Query3);
            //cmd.Parameters.AddWithValue("@SKUCode", Session["QRcode"].ToString());
            //cmd.Parameters.AddWithValue("@DateOfStatusChanged", System.DateTime.Now);
            //cmd.Parameters.AddWithValue("@Status", "Modified");
            //cmd.Parameters.AddWithValue("@RecordedBy", cmb_createdby.Text);
            //Db.ExecuteNonQuery(cmd);
            //Db.CloseConnection();
            //Messages.SetSuccessMessage("2095", null, Session);
            ASPxGridView1.DataBind();
            Clear();
            btn_save.Visible = true;
            btn_update.Visible = false;

        }
        catch
        {
            Messages.SetErrorMessage("20012", null, null, null, Session);
            return;
        }

    }


    protected void btnXLSX_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.LeftMargin = 80;
        ASPxGridViewExporter1.RightMargin = 4;
        ASPxGridViewExporter1.TopMargin = 80;
        ASPxGridViewExporter1.PageHeader.Center = "Instrument Master";
        ASPxGridViewExporter1.MaxColumnWidth = 100;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.FileName = "InstrumentList";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        //ASPxGridViewExporter1.LeftMargin = 80;
        //ASPxGridViewExporter1.RightMargin = 4;
        ASPxGridViewExporter1.TopMargin = 80;
        ASPxGridViewExporter1.PageHeader.Center = "Instrument Master";
        ASPxGridViewExporter1.MaxColumnWidth = 80;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.FileName = "InstrumentList";
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ASPxGridView1_DataBound(object sender, EventArgs e)
    {

    }

    protected void ASPxGridView1_DataBound1(object sender, EventArgs e)
    {

    }

    protected void cmb_department_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_section.SelectedIndex = -1;
        cmb_assetgroup.SelectedIndex = -1;
        cmb_status.SelectedIndex = -1;
    }

    protected void cmb_section_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_assetgroup.SelectedIndex = -1;
        cmb_status.SelectedIndex = -1;
    }

    protected void cmb_assetgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_status.SelectedIndex = -1;
    }
}