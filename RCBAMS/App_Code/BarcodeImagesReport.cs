using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

/// <summary>
/// Summary description for BarcodeImagesReport
/// </summary>
public class BarcodeImagesReport : DevExpress.XtraReports.UI.XtraReport
{
    private DevExpress.XtraReports.UI.DetailBand Detail;
    private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRPictureBox xrPictureBox1;
    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;
    private XRPictureBox xrPictureBox2;
    private string Imgurl;


    public BarcodeImagesReport(string Imgurl, string Imgurl1)
    {
        // TODO: Complete member initialization
        InitializeComponent();
        //this.Imgurl = Imgurl;
        this.xrPictureBox1.ImageUrl = Imgurl;
        this.xrPictureBox2.ImageUrl = Imgurl1;
    }

    /// <summary> 
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        string resourceFileName = "BarcodeImagesReport.resx";
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrPictureBox2 = new DevExpress.XtraReports.UI.XRPictureBox();
        this.xrPictureBox1 = new DevExpress.XtraReports.UI.XRPictureBox();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPictureBox2,
            this.xrPictureBox1});
        this.Detail.HeightF = 146.75F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);

        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrPictureBox2
        // changed from 150.958 to 180.9584
        //180 to 170
        this.xrPictureBox2.LocationFloat = new DevExpress.Utils.PointFloat(170.9584F, 21.74999F);
        this.xrPictureBox2.Name = "xrPictureBox2";
        //60*60 to 120*60
        this.xrPictureBox2.SizeF = new System.Drawing.SizeF(120F, 64F);
      
        // xrPictureBox1
        // changed from 0F to 30F
        //40F - 30F
        this.xrPictureBox1.LocationFloat = new DevExpress.Utils.PointFloat(30F, 21.74999F);
        this.xrPictureBox1.Name = "xrPictureBox1";
        //60*60 to 120*60
        this.xrPictureBox1.SizeF = new System.Drawing.SizeF(120F, 64F);
        // 
        // TopMargin
        // 
        this.TopMargin.HeightF = 9F;
        this.TopMargin.Name = "TopMargin";
        this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // BottomMargin  
        this.BottomMargin.HeightF = 0F;
        this.BottomMargin.Name = "BottomMargin";
        this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // BarcodeImagesReport
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Margins = new System.Drawing.Printing.Margins(0, 0, 1, 0);
        //changed from 80*208 H*W
        this.PageHeight = 76;
        this.PageWidth = 288;
        this.PaperKind = System.Drawing.Printing.PaperKind.Custom;
        this.Version = "11.1";
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

    }

    #endregion
}
