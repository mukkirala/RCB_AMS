using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting;
using System.Configuration;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Export;
using DevExpress.Utils.OAuth.Provider;

public partial class AddAsset : System.Web.UI.Page
{

    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand cmd;
    SqlCommand myCommand;
    SqlDataAdapter da;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        //else
        //{
        //    string query = "Select AssetID,MainAssetNumber,AssetSubNumber,AssetClass from AssetMaster";
        //    da = new SqlDataAdapter(query, conSAP);
        //    DataTable dasset = new DataTable();
        //    da.Fill(dasset);
        //    if (dasset.Rows.Count > 0)
        //    {
        //        for (int z = 0; z < dasset.Rows.Count; z++)
        //        {
        //            string ID = dasset.Rows[z].ItemArray[0].ToString();
        //            string Asset = dasset.Rows[z].ItemArray[1].ToString();
        //            string Sub = dasset.Rows[z].ItemArray[2].ToString();
        //            string SN = "0"+Sub+"";
        //            string Class = dasset.Rows[z].ItemArray[3].ToString();
        //            int avl = QRExist(Asset, Sub);
        //            if (avl == 0)
        //            {
        //                string equname = ID;
        //                //string space = equname.Replace(" ", "");
        //                // string QRCode = space.Substring(0, 7); 
        //                string QRCode = Asset;
        //                DateTime date = DateTime.Now;
        //                string myList = ""+ID+"-NRL-"+ Asset +"-"+SN+"";
        //                //ArrayList myList = new ArrayList();
        //                //// Adding elements to ArrayList 
        //                //myList.Add("ID:" + ID + "");
        //                //myList.Add("MainAssetNumber:" + Asset + "");
        //                // myList.Add(Asset);
        //                // myList.Add(MainAssetNumber);
        //                // myList.Add(AssetSubNumber);
        //                // myList.Add(AssetClass);
        //                // myList.Add(Location);
        //                //myList.Add(Status);
        //                string location = "QRImages/" + ID + ".jpg";
        //                QRUtilities.GenerateMyQCCode(equname, QRCode, myList);
        //                // QRUtilities.SaveQRCode(myList,Asset);                       
        //                cmd = new SqlCommand("Insert into  QRCodeMaster(QRCode,QRImage,CreatedBy,CreatedDate,MainAssetNumber,AssetSubNumber,AssetID)values(@QRCode,@QRImage,@CreatedBy,@CreatedDate,@MainAssetNumber,@AssetSubNumber,@AssetID)", conAMS);
        //                cmd.Parameters.AddWithValue("@QRCode", ID);
        //                cmd.Parameters.AddWithValue("@QRImage", location);
        //                cmd.Parameters.AddWithValue("@CreatedBy", Session["UserID"].ToString());
        //                cmd.Parameters.AddWithValue("@CreatedDate", date);
        //                cmd.Parameters.AddWithValue("@MainAssetNumber", Asset);
        //                cmd.Parameters.AddWithValue("@AssetSubNumber", Sub);
        //                cmd.Parameters.AddWithValue("@AssetID", ID);
        //                conAMS.Open();
        //                int qrid = Convert.ToInt32(cmd.ExecuteScalar());
        //                conAMS.Close();

        //            }
        //        }
        //    }

        //}
    }
 
   
    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        try
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            string test = (e.GetValue("PrintStatus").ToString());
            Session["PrintStatus"] = test;
            if (test == "yes")
            {
                e.Row.BackColor = System.Drawing.Color.FromName("rgb(240, 240, 240)");//207, 207, 207,
            }
            //if (Session["PrintStatus"].ToString() == "")
            //{
            //    e.Row.BackColor = System.Drawing.Color.FromName("rgb(157, 244, 249)");
            //}
        }
        catch (Exception ex)
        {

        }


        //if (e.RowType != GridViewRowType.Data) return;
        //string ID = e.GetValue("AssetID").ToString();
        //string Asset =e.GetValue("MainAssetNumber").ToString();
        //string Sub = e.GetValue("AssetSubNumber").ToString();
        //string Class = e.GetValue("AssetClass").ToString();
     
       
    }
    public int QRExist(string Main, string Sub)
    {
        int result = 0;
        string query = "Select * from QRCodeMaster where MainAssetNumber='" + Main + "' and AssetSubNumber='" + Sub + "'; SELECT SCOPE_IDENTITY();";
        da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            result = 1;
        }
        else
        {

        }
        return result;
    }
    protected void btn_printItems_Click(object sender, EventArgs e)
    {
       
        string query = "Select MainAssetNumber,AssetSubNumber,QRImage from QRCodeMaster";
        da = new SqlDataAdapter(query, conAMS);
        DataTable dtt = new DataTable();
        da.Fill(dtt);

        if (dtt.Rows.Count > 0)
        {
            PrintAssetWithBarcodeReport report = new PrintAssetWithBarcodeReport(dtt);
            report.CreateDocument();
            string dd = System.DateTime.Now.ToString("dd");
            string MM = System.DateTime.Now.ToString("MM");
            string yy = System.DateTime.Now.ToString("yyyy");
            string hh = System.DateTime.Now.ToString("hh");
            string mm = System.DateTime.Now.ToString("mm");
            string ss = System.DateTime.Now.ToString("ss");
            string Date = dd + "" + MM + "" + yy + "" + hh + "" + mm + "" + ss;
            Session["Today_datetime"] = Date;
            Session["ID"] = "AuditNo_" + Date + ".pdf";
            report.ExportToPdf(Server.MapPath(@"PdfReports//AssetAuditing//" + Session["ID"]));
            Response.Write("<script>");
            Response.Write("window.open('PysicalVerificationPDF.aspx','_blank')");
            Response.Write("</script>");
        }
    }
    protected void btn_Printbarcode_Click(object sender, EventArgs e)
    {
        string query = "Select MainAssetNumber,AssetSubNumber,QRImage from QRCodeMaster";
        da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        XtraReport report1 = new XtraReport();
        report1.CreateDocument();
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
                        string Barcode = dt.Rows[z].ItemArray[2].ToString();
                        if (y == 0)
                        {

                            //DataTable dt1 = new DataTable();
                            //SqlDataAdapter da1 = new SqlDataAdapter("SELECT ImageLocation FROM AssetMaster WHERE Barcode='" + Barcode + "'", myConnection);
                            //da1.Fill(dt1);
                            Imgurl1 = Server.MapPath(dt.Rows[z].ItemArray[2].ToString());
                            ASPxImage1.ImageUrl = Imgurl1;
                            z = z + 1;
                        }
                        else if (y == 1)
                        {
                            //DataTable dt1 = new DataTable();
                            //SqlDataAdapter da1 = new SqlDataAdapter("SELECT ImageLocation FROM AssetMaster WHERE Barcode='" + Barcode + "'", myConnection);
                            //da1.Fill(dt1);
                            Imgurl = Server.MapPath(dt.Rows[z].ItemArray[2].ToString());
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

        string id = "";
        string fileName = "";
        PdfExportOptions pdfOptions = report1.ExportOptions.Pdf;
        // RtfExportOptions pdfOptions = report1.ExportOptions.Rtf;

        string d = System.DateTime.Now.ToString("dd");
        string M = System.DateTime.Now.ToString("MM");
        string Y = System.DateTime.Now.ToString("yyyy");
        string hh = System.DateTime.Now.ToString("hh");
        string min = System.DateTime.Now.ToString("mm");
        string sec = System.DateTime.Now.ToString("ss");
        id = d + "" + M + "" + Y + "" + hh + "" + min;
        Session["BarcodeReportID"] = id;
        report1.ExportToPdf(Server.MapPath(@"PdfReports//ToBePrinted//BarcodeImages_" + id + ".Pdf"));
        fileName = "BarcodeImages_" + id + ".Pdf";

        //myCommand = new SqlCommand("INSERT INTO ConsolidatedBarcode([CreatedDate],[Location])VALUES(@CreatedDate,@Location)", myConnection);
        //myCommand.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now.ToString("yyyy-MM-dd"));
        //myCommand.Parameters.AddWithValue("@Location", fileName);
        //myConnection.Open();
        //myCommand.ExecuteNonQuery();
        //myConnection.Close();

        Response.Write("<script>");
        Response.Write("window.open('BarcodeReportPdf.aspx','_blank')");
        Response.Write("</script>");

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Asset Export Data";
        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('PDF Downloaded Successfully.');", true);
        ASPxGridViewExporter1.PageHeader.Center = "View Accept Audit Tools";
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();

        string script = "<script type='text/javascript'>showPopup();</script>";
        ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", script);



    }
    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    // Configure export settings
    //    ASPxGridViewExporter1.PageHeader.Center = "View Accept Audit Tools";
    //    ASPxGridViewExporter1.PageHeader.Font.Bold = true;
    //    ASPxGridViewExporter1.MaxColumnWidth = 75;
    //    ASPxGridViewExporter1.Landscape = true;

    //    // Write PDF to response (export)
    //    ASPxGridViewExporter1.WritePdfToResponse();

    //    // Register a script to show a popup after the PDF is downloaded
    //    string script = "<script type='text/javascript'>" +
    //                    "window.onload = function() {" +
    //                    "    alert('PDF Downloaded Successfully.');" +
    //                    "    showPopup();" +
    //                    "};" +
    //                    "</script>";
    //    ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", script);
    //}
    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    // Configure export settings
    //    ASPxGridViewExporter1.PageHeader.Center = "View Accept Audit Tools";
    //    ASPxGridViewExporter1.PageHeader.Font.Bold = true;
    //    ASPxGridViewExporter1.MaxColumnWidth = 75;
    //    ASPxGridViewExporter1.Landscape = true;

    //    // Write PDF to response (export)
    //    ASPxGridViewExporter1.WritePdfToResponse();

    //    // Register a script to show a popup
    //    string script = "<script type='text/javascript'>alert('PDF Downloaded Successfully.'); showPopup();</script>";
    //    ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", script);
    //}


    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.FileName = "Asset Export Data";
        ASPxGridViewExporter1.WriteXlsToResponse();
        
    }
}