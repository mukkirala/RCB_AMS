using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Activities;

public partial class SingleQRPrint : System.Web.UI.Page
{
   
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand cmd;
    SqlCommand myCommand;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["UserID"] == null)
      {
        Response.Redirect("/Login.aspx");
      }

      grid.DataBind();
    }

    protected void btn_ExportPdf_Click(object sender, EventArgs e)
    {
      ASPxGridViewExporter1.WritePdfToResponse();
    }
    protected void btn_print_Click(object sender, EventArgs e)
    {

    }
    protected void btn_XLS_Click(object sender, EventArgs e)
    {
      ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
      try
      {
        if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
        string test = (e.GetValue("PrintStatus").ToString());
        Session["PrintStatus"] = test;
        if (Session["PrintStatus"].ToString() == "yes")
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

      if (e.RowType != GridViewRowType.Data) return;
      string ID = e.GetValue("AssetID").ToString();
      string Asset = e.GetValue("MainAssetNumber").ToString();
      string Sub = e.GetValue("AssetSubNumber").ToString();
      string Class = e.GetValue("AssetClass").ToString();
      string SN = "0" + Sub + "";
      string myList = "" + ID + "-NRL-" + Asset + "-" + SN + "";
      //ArrayList myList = new ArrayList();
      //// Adding elements to ArrayList 
      //myList.Add(ID);
      //myList.Add(Asset);
      //myList.Add(Sub);
      //myList.Add(Class);
      int avl = QRExist(Asset, Sub);
      if (avl == 0)
      {
        string equname = ID;
        //string space = equname.Replace(" ", "");
        //string QRCode = space.Substring(0, 7);
        string QRCode = Asset;
        QRUtilities.GenerateMyQCCode(equname, QRCode, Asset);
        string location = "QRImages/" + ID + ".jpg";
        cmd = new SqlCommand("Insert into  QRCodeMaster(QRCode,QRImage,CreatedBy,CreatedDate,MainAssetNumber,AssetSubNumber,AssetID)values(@QRCode,@QRImage,@CreatedBy,@CreatedDate,@MainAssetNumber,@AssetSubNumber,@AssetID)", conAMS);
        cmd.Parameters.AddWithValue("@QRCode", ID);
        cmd.Parameters.AddWithValue("@QRImage", location);
        cmd.Parameters.AddWithValue("@CreatedBy", Session["UserID"].ToString());
        DateTime date = DateTime.Now;
        cmd.Parameters.AddWithValue("@CreatedDate", date);
        cmd.Parameters.AddWithValue("@MainAssetNumber", Asset);
        cmd.Parameters.AddWithValue("@AssetSubNumber", Sub);
        cmd.Parameters.AddWithValue("@AssetID", ID);
        conAMS.Open();
        int id = Convert.ToInt32(cmd.ExecuteScalar());
        conAMS.Close();
      }
      if (avl == 1)
      {

      }
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
      string AssetID;
      int j = 0;
      DataTable dtt = new DataTable();
      for (int i = 0; i < grid.VisibleRowCount; i++)
      {
        if (grid.Selection.IsRowSelected(i))
        {
          j = 1;
          AssetID = grid.GetRowValues(i, "AssetID").ToString();
          string query = "Select MainAssetNumber,AssetSubNumber,QRImage from QRCodeMaster where AssetID='" + AssetID + "'";
          da = new SqlDataAdapter(query, conAMS);

          da.Fill(dtt);
        }

      }

      if (j == 0)
      {
        string query = "Select MainAssetNumber,AssetSubNumber,QRImage from QRCodeMaster";
        da = new SqlDataAdapter(query, conAMS);

        da.Fill(dtt);
      }

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

      for (int i = 0; i < grid.VisibleRowCount; i++)
      {
        if (grid.Selection.IsRowSelected(i))
        {
          grid.Selection.UnselectRow(i);
        }
      }
    }
    protected void cbAll_Init(object sender, EventArgs e)
    {
      ASPxCheckBox chk = sender as ASPxCheckBox;
      ASPxGridView grid = (chk.NamingContainer as GridViewHeaderTemplateContainer).Grid;
      chk.Checked = (grid.Selection.Count == grid.VisibleRowCount);
    }

    protected void cbPage_Init(object sender, EventArgs e)
    {
      ASPxCheckBox chk = sender as ASPxCheckBox;
      ASPxGridView grid = (chk.NamingContainer as GridViewHeaderTemplateContainer).Grid;

      Boolean cbChecked = true;
      Int32 start = grid.VisibleStartIndex;
      Int32 end = grid.VisibleStartIndex + grid.SettingsPager.PageSize;
      end = (end > grid.VisibleRowCount ? grid.VisibleRowCount : end);

      for (int i = start; i < end; i++)
        if (!grid.Selection.IsRowSelected(i))
        {
          cbChecked = false;
          break;
        }

      chk.Checked = cbChecked;
    }

    protected void grid_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
    {
      ASPxGridView grid = sender as ASPxGridView;

      Int32 start = grid.VisibleStartIndex;
      Int32 end = grid.VisibleStartIndex + grid.SettingsPager.PageSize;
      Int32 selectNumbers = 0;
      end = (end > grid.VisibleRowCount ? grid.VisibleRowCount : end);

      for (int i = start; i < end; i++)
        if (grid.Selection.IsRowSelected(i))
          selectNumbers++;

      e.Properties["cpSelectedRowsOnPage"] = selectNumbers;
      e.Properties["cpVisibleRowCount"] = grid.VisibleRowCount;
    }

    protected void btn_Printbarcode_Click(object sender, EventArgs e)
    {
      string AssetID;
        string AssetName = string.Empty;
        string Location = string.Empty;
        string Code = string.Empty;
        DataTable dt = new DataTable();
      // int j = 0;
      for (int i = 0; i < grid.VisibleRowCount; i++)
      {
        if (grid.Selection.IsRowSelected(i))
        {
                // j = 1;
                AssetID = grid.GetRowValues(i, "AssetID").ToString();
                string query = "Select qr.MainAssetNumber,qr.AssetSubNumber,qr.QRImage, asset.AssetDesc, asset.Location, asset.BLOCK, asset.LocationDesc , asset.Code from RCBAMS.dbo.QRCodeMaster as qr inner join RCBSAP.dbo. AssetMaster as asset on asset.AssetID = qr.AssetID where qr.AssetID ='" + AssetID + "'";
                da = new SqlDataAdapter(query, conAMS);

                da.Fill(dt);

          string query1 = "update QRCodeMaster set PrintStatus=@PrintStatus where AssetID='" + AssetID + "'";
          SqlCommand sqlcmd = new SqlCommand(query1, conAMS);
          sqlcmd.Parameters.AddWithValue("PrintStatus", "yes");
          conAMS.Open();
          sqlcmd.ExecuteNonQuery();
          conAMS.Close();

        }
      }

      //if (j == 0)
      //{
      //    string query = "Select MainAssetNumber,AssetSubNumber,QRImage from QRCodeMaster";
      //    da = new SqlDataAdapter(query, conAMS);

      //    da.Fill(dt);
      //}

      XtraReport report1 = new XtraReport();
      report1.CreateDocument();
        if (dt.Rows.Count > 0)
        {
            for (int z = 0; z < dt.Rows.Count;)
            {
                string Imgurl1 = "";
                string Imgurl = "";
                for (int y = 0; y < 1; y++)
                {
                    if (dt.Rows.Count > z)
                    {
                        string Barcode = dt.Rows[z].ItemArray[2].ToString();
                        if (y == 0)
                        {

                            //DataTable dt1 = new DataTable();
                            //SqlDataAdapter da1 = new SqlDataAdapter("SELECT ImageLocation FROM AssetMaster WHERE Barcode='" + Barcode + "'", myConnection);
                            //da1.Fill(dt1);
                            AssetName = dt.Rows[z]["AssetDesc"].ToString();
                            Location = dt.Rows[z]["Location"].ToString() +" "+ dt.Rows[z]["BLOCK"].ToString() +" "+ dt.Rows[z]["LocationDesc"].ToString();
                            Code = dt.Rows[z]["Code"].ToString();
                            Imgurl1 = Server.MapPath(dt.Rows[z].ItemArray[2].ToString());
                            ASPxImage1.ImageUrl = Imgurl1;
                            z = z + 1;
                        }
                        //else if (y == 1)
                        //{
                        //  //DataTable dt1 = new DataTable();
                        //  //SqlDataAdapter da1 = new SqlDataAdapter("SELECT ImageLocation FROM AssetMaster WHERE Barcode='" + Barcode + "'", myConnection);
                        //  //da1.Fill(dt1);
                        //  Imgurl = Server.MapPath(dt.Rows[z].ItemArray[2].ToString());
                        //  ASPxImage1.ImageUrl = Imgurl;
                        //  z = z + 1;
                        //}
                    }
                }
                BarcodeImagesReportSingle report = new BarcodeImagesReportSingle(Imgurl1, Imgurl, AssetName, Location, Code); //this.xrPictureBox1.ImageUrl = Imgurl;
                                                                                                                              //this.xrPictureBox2.ImageUrl = Imgurl1;

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
      report1.ExportToPdf(Server.MapPath(@"PdfReports//SingleQRPrint//BarcodeImages_" + id + ".Pdf"));
      fileName = "BarcodeImages_" + id + ".Pdf";

      //myCommand = new SqlCommand("INSERT INTO ConsolidatedBarcode([CreatedDate],[Location])VALUES(@CreatedDate,@Location)", myConnection);
      //myCommand.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now.ToString("yyyy-MM-dd"));
      //myCommand.Parameters.AddWithValue("@Location", fileName);
      //myConnection.Open();
      //myCommand.ExecuteNonQuery();
      //myConnection.Close();

      Response.Write("<script>");
      Response.Write("window.open('SingleReportPdf.aspx','_blank')");
      Response.Write("</script>");

      for (int i = 0; i < grid.VisibleRowCount; i++)
      {
        if (grid.Selection.IsRowSelected(i))
        {
          grid.Selection.UnselectRow(i);
        }
      }
      grid.DataBind();

    }

  
}
