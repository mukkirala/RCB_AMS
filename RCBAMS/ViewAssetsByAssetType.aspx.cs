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

public partial class ViewAssetsByAssetType : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            Session["AssetType"] = "";
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
       if(gl_assettype.Text=="")
        {
            lbl_msg.Text = "select Asset Type";
            lbl_msg.Visible = true;
            return;
        }
       else
        {
            Session["AssetType"] = gl_assettype.Text;
        }

    }

    protected void btn_Printbarcode_Click(object sender, EventArgs e)
    {
        string query = " Select QRCodeMaster.MainAssetNumber,QRCodeMaster.AssetSubNumber,QRImage from InstemAMS..QRCodeMaster inner  join InstemSAP..AssetMaster on AssetMaster.AssetID=QRCodeMaster.AssetID where AssetMaster.AssetDesc='" + Session["AssetType"]+"'";
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

                            Imgurl1 = Server.MapPath(dt.Rows[z].ItemArray[2].ToString());
                            ASPxImage1.ImageUrl = Imgurl1;
                            z = z + 1;
                        }
                        else if (y == 1)
                        {
                            
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
        Response.Write("<script>");
        Response.Write("window.open('BarcodeReportPdf.aspx','_blank')");
        Response.Write("</script>");
    }

    protected void btn_printItems_Click(object sender, EventArgs e)
    {
        string query = "Select QRCodeMaster.MainAssetNumber,QRCode,QRImage from InstemAMS..QRCodeMaster inner  join InstemSAP..AssetMaster on AssetMaster.AssetID=QRCodeMaster.AssetID where AssetMaster.AssetDesc='" + Session["AssetType"] + "'";
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

    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {

    }



    protected void gl_assettype_Init(object sender, EventArgs e)
    {
        ASPxGridView gv = gl_assettype.GridView as ASPxGridView;
        gv.Width = 300;
    }
}