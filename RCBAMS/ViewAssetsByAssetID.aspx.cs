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

public partial class ViewAssetsByAssetID : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand cmd;
    SqlCommand myCommand;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if(txt_mainassetnumber.Text=="")
        {
            lbl_msg.Text = "Enter MainAssetNumber";
            lbl_msg.Visible = true;
            return;
        }
        else
        {
            if (txt_subnumber.Text == "")
            {
                string query = "Select * from AssetMaster left JOIN InstemAMS..QRCodeMaster ON AssetMaster.AssetID=QRCodeMaster.AssetID  where AssetMaster.MainAssetNumber='" + txt_mainassetnumber.Text + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ASPxGridView1.DataSource = dt;
                    ASPxGridView1.DataBind();
                }
                else
                {
                    lbl_msg.Text = "Records Not Found";
                    lbl_msg.Visible = true;
                    ASPxGridView1.DataSource = null;
                    ASPxGridView1.DataBind();
                    return;
                }
            }
            else
            {
                string query = "Select * from vAssetMaster where vAssetMaster.MainAssetNumber='" + txt_mainassetnumber.Text + "' and vAssetMaster.AssetSubNumber='" + txt_subnumber.Text+"'";
                SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ASPxGridView1.DataSource = dt;
                    ASPxGridView1.DataBind();
                }
                else
                {
                    lbl_msg.Text = "Records Not Found";
                    lbl_msg.Visible = true;
                    ASPxGridView1.DataSource = null;
                    ASPxGridView1.DataBind();
                    return;
                }
            }
        }

    }

    protected void btn_Printbarcode_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_mainassetnumber.Text == "")
        {
            lbl_msg.Text = "Enter MainAssetNumber";
            lbl_msg.Visible = true;
            return;
        }
        else
        {
            string query;
            if (txt_subnumber.Text == "")
            {
                query = "Select QRCodeMaster.MainAssetNumber,QRCode,QRImage from QRCodeMaster inner join InstemSAP..AssetMaster on AssetMaster.AssetID=QRCodeMaster.AssetID where AssetMaster.MainAssetNumber='" + txt_mainassetnumber.Text + "'";
            }
            else
            {
                query = "Select QRCodeMaster.MainAssetNumber,QRCode,QRImage from QRCodeMaster inner join InstemSAP..AssetMaster on AssetMaster.AssetID=QRCodeMaster.AssetID where AssetMaster.MainAssetNumber='" + txt_mainassetnumber.Text + "' and AssetMaster.AssetSubNumber='" + txt_subnumber.Text + "'";
            }
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
     
    }

    protected void btn_printItems_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (txt_mainassetnumber.Text == "")
        {
            lbl_msg.Text = "Enter MainAssetNumber";
            lbl_msg.Visible = true;
            return;
        }
        else
        {
            string query;
            if (txt_subnumber.Text == "")
            {
                query = "Select QRCodeMaster.MainAssetNumber,QRCodeMaster.AssetSubNumber,QRImage from QRCodeMaster inner join InstemSAP..AssetMaster on AssetMaster.AssetID=QRCodeMaster.AssetID where AssetMaster.MainAssetNumber='" + txt_mainassetnumber.Text + "'";
            }
            else
            {
                query = "Select QRCodeMaster.MainAssetNumber,QRCodeMaster.AssetSubNumber,QRImage from QRCodeMaster inner join InstemSAP..AssetMaster on AssetMaster.AssetID=QRCodeMaster.AssetID where AssetMaster.MainAssetNumber='" + txt_mainassetnumber.Text + "' and AssetMaster.AssetSubNumber='" + txt_subnumber.Text + "'";
            }
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
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        
    }
    public int QRExist(string Asset)
    {
        int result = 0;
        string query = "Select * from QRCodeMaster where MainAssetNumber='" + Asset + "'";
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


}