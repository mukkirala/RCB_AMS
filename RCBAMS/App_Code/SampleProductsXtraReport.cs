using System;
using System.Data;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SampleProductsXtraReport
/// </summary>
public class SampleProductsXtraReport : DevExpress.XtraReports.UI.XtraReport
{
	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
	private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRRichText xrRichText1;
    private XRLabel xrLabel1;
    private XRLabel xrLabel2;
    private XRLabel xrLabel3;
    private XRLabel xrLabel4;
    private XRTable xrTable1;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell2;
    private XRTableCell xrTableCell3;
    private XRLabel xrLabel5;
    private XRLabel xrLabel6;
    private XRLabel xrLabel7;
    private XRLabel xrLabel8;
    private XRLabel xrLabel9;
    private XRLabel xrLabel10;
    private XRLabel xrLabel11;
    private XRLabel xrLabel12;
    private XRLabel xrLabel13;
    private XRLabel xrLabel14;
    private XRLabel xrLabel15;
    private XRLabel xrLabel16;
    private XRLabel xrLabel17;
    private XRLabel xrLabel18;
    private XRTableCell xrTableCell4;
	/// <summary>
	/// Required designer variable.
	/// </summary>
	private System.ComponentModel.IContainer components = null;

	public SampleProductsXtraReport(DataTable dt,string[] values)
	{
		InitializeComponent();
		//
		// TODO: Add constructor logic here
		//
        this.xrLabel2.Text = values[0];
        this.xrLabel4.Text = values[1];
        this.xrLabel6.Text=  values[2];
        this.xrLabel8.Text = values[3];
        this.xrLabel10.Text = values[4];
        this.xrLabel12.Text = values[5];
        this.xrLabel14.Text = values[6];
        this.xrLabel16.Text = values[7];
        this.xrLabel18.Text = values[8];

        this.xrTable1.Borders = DevExpress.XtraPrinting.BorderSide.All;
        this.xrTable1.BeginInit();
        XRTableRow row;
        XRTableCell cell1;
        XRTableCell cell2;
        XRTableCell cell3;
        XRTableCell cell4;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            row = new XRTableRow();
            {
                cell1 = new XRTableCell();
                row.Cells.SetChildIndex(cell1, 0);
                cell1.Text = dt.Rows[i][0].ToString();
                row.Cells.Add(cell1);
                xrTableCell1.WidthF = 63f;

                cell2 = new XRTableCell();
                row.Cells.SetChildIndex(cell2,1);
                cell2.Text=dt.Rows[i][1].ToString();
                row.Cells.Add(cell2);
                xrTableCell2.WidthF = 63f;

                cell3 = new XRTableCell();
                row.Cells.SetChildIndex(cell3, 2);
                cell3.Text = dt.Rows[i][2].ToString();
                row.Cells.Add(cell3);
                xrTableCell3.WidthF = 63f;

                cell4 = new XRTableCell();
                row.Cells.SetChildIndex(cell4, 3);
                cell4.Text = dt.Rows[i][3].ToString();
                row.Cells.Add(cell4);
                xrTableCell4.WidthF = 63f;
            }
            this.xrTable1.Rows.Add(row);
        }
        this.xrTable1.EndInit();
	}
	
	/// <summary> 
	/// Clean up any resources being used.
	/// </summary>
	/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
	protected override void Dispose(bool disposing) {
		if (disposing && (components != null)) {
			components.Dispose();
		}
		base.Dispose(disposing);
	}

	#region Designer generated code

	/// <summary>
	/// Required method for Designer support - do not modify
	/// the contents of this method with the code editor.
	/// </summary>
	private void InitializeComponent() {
        string resourceFileName = "SampleProductsXtraReport.resx";
        System.Resources.ResourceManager resources = global::Resources.SampleProductsXtraReport.ResourceManager;
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrLabel18 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel17 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel16 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel15 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrRichText1 = new DevExpress.XtraReports.UI.XRRichText();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrRichText1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel18,
            this.xrLabel17,
            this.xrLabel16,
            this.xrLabel15,
            this.xrLabel14,
            this.xrLabel13,
            this.xrLabel12,
            this.xrLabel11,
            this.xrLabel10,
            this.xrLabel9,
            this.xrLabel8,
            this.xrLabel7,
            this.xrLabel6,
            this.xrLabel5,
            this.xrLabel4,
            this.xrLabel3,
            this.xrLabel2,
            this.xrLabel1,
            this.xrTable1,
            this.xrRichText1});
        this.Detail.HeightF = 312.5F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrLabel18
        // 
        this.xrLabel18.LocationFloat = new DevExpress.Utils.PointFloat(434.3751F, 160.3332F);
        this.xrLabel18.Name = "xrLabel18";
        this.xrLabel18.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel18.SizeF = new System.Drawing.SizeF(139.5833F, 23.00001F);
        this.xrLabel18.Text = "xrLabel18";
        // 
        // xrLabel17
        // 
        this.xrLabel17.LocationFloat = new DevExpress.Utils.PointFloat(334.375F, 160.3333F);
        this.xrLabel17.Name = "xrLabel17";
        this.xrLabel17.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel17.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel17.Text = "Driver Mobile";
        // 
        // xrLabel16
        // 
        this.xrLabel16.LocationFloat = new DevExpress.Utils.PointFloat(133.3334F, 160.3333F);
        this.xrLabel16.Name = "xrLabel16";
        this.xrLabel16.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel16.SizeF = new System.Drawing.SizeF(127.0833F, 22.99999F);
        this.xrLabel16.Text = "xrLabel16";
        // 
        // xrLabel15
        // 
        this.xrLabel15.LocationFloat = new DevExpress.Utils.PointFloat(33.33333F, 160.3333F);
        this.xrLabel15.Name = "xrLabel15";
        this.xrLabel15.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel15.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel15.Text = "Driver Name";
        // 
        // xrLabel14
        // 
        this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(434.3751F, 137.3332F);
        this.xrLabel14.Name = "xrLabel14";
        this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel14.SizeF = new System.Drawing.SizeF(139.5833F, 23F);
        this.xrLabel14.Text = "xrLabel14";
        // 
        // xrLabel13
        // 
        this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(334.3751F, 137.3333F);
        this.xrLabel13.Name = "xrLabel13";
        this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel13.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel13.Text = "Challen Number";
        // 
        // xrLabel12
        // 
        this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(133.3334F, 137.3333F);
        this.xrLabel12.Name = "xrLabel12";
        this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel12.SizeF = new System.Drawing.SizeF(127.0833F, 23F);
        this.xrLabel12.Text = "xrLabel12";
        // 
        // xrLabel11
        // 
        this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(33.33333F, 137.3333F);
        this.xrLabel11.Name = "xrLabel11";
        this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel11.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel11.Text = "Vehicle Number";
        // 
        // xrLabel10
        // 
        this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(434.375F, 112.4166F);
        this.xrLabel10.Name = "xrLabel10";
        this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel10.SizeF = new System.Drawing.SizeF(139.5834F, 23F);
        this.xrLabel10.Text = "xrLabel10";
        // 
        // xrLabel9
        // 
        this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(334.375F, 112.4166F);
        this.xrLabel9.Name = "xrLabel9";
        this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel9.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel9.Text = "Courier Phone";
        // 
        // xrLabel8
        // 
        this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(133.3334F, 112.4166F);
        this.xrLabel8.Name = "xrLabel8";
        this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel8.SizeF = new System.Drawing.SizeF(127.0833F, 23.00001F);
        this.xrLabel8.Text = "xrLabel8";
        // 
        // xrLabel7
        // 
        this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(33.33332F, 114.3333F);
        this.xrLabel7.Name = "xrLabel7";
        this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel7.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel7.Text = "Courier Name";
        // 
        // xrLabel6
        // 
        this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(434.3751F, 89.4166F);
        this.xrLabel6.Name = "xrLabel6";
        this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel6.SizeF = new System.Drawing.SizeF(205.6249F, 23F);
        this.xrLabel6.Text = "xrLabel6";
        // 
        // xrLabel5
        // 
        this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(334.375F, 89.4166F);
        this.xrLabel5.Name = "xrLabel5";
        this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel5.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel5.Text = "Vendor Name";
        // 
        // xrLabel4
        // 
        this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(133.3333F, 48.54167F);
        this.xrLabel4.Name = "xrLabel4";
        this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel4.SizeF = new System.Drawing.SizeF(205.6249F, 23F);
        this.xrLabel4.Text = "xrLabel4";
        // 
        // xrLabel3
        // 
        this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(33.33333F, 48.54167F);
        this.xrLabel3.Name = "xrLabel3";
        this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel3.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel3.Text = "DateTime";
        // 
        // xrLabel2
        // 
        this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(133.3334F, 89.4166F);
        this.xrLabel2.Name = "xrLabel2";
        this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel2.SizeF = new System.Drawing.SizeF(127.0833F, 22.99999F);
        this.xrLabel2.Text = "xrLabel2";
        // 
        // xrLabel1
        // 
        this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(33.33333F, 89.41663F);
        this.xrLabel1.Name = "xrLabel1";
        this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel1.Text = "Delivered Type";
        // 
        // xrTable1
        // 
        this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(33.33333F, 256.6667F);
        this.xrTable1.Name = "xrTable1";
        this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
        this.xrTable1.SizeF = new System.Drawing.SizeF(479.1666F, 25F);
        this.xrTable1.StylePriority.UseBackColor = false;
        // 
        // xrTableRow1
        // 
        this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell3,
            this.xrTableCell4});
        this.xrTableRow1.Name = "xrTableRow1";
        this.xrTableRow1.Weight = 1D;
        // 
        // xrTableCell1
        // 
        this.xrTableCell1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell1.Name = "xrTableCell1";
        this.xrTableCell1.StylePriority.UseFont = false;
        this.xrTableCell1.Text = "Product Id";
        this.xrTableCell1.Weight = 1D;
        // 
        // xrTableCell2
        // 
        this.xrTableCell2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell2.Name = "xrTableCell2";
        this.xrTableCell2.StylePriority.UseFont = false;
        this.xrTableCell2.Text = "Product Name";
        this.xrTableCell2.Weight = 1.562500762939453D;
        // 
        // xrTableCell3
        // 
        this.xrTableCell3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell3.Name = "xrTableCell3";
        this.xrTableCell3.StylePriority.UseFont = false;
        this.xrTableCell3.Text = "Product Code";
        this.xrTableCell3.Weight = 1.1041659545898439D;
        // 
        // xrTableCell4
        // 
        this.xrTableCell4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell4.Name = "xrTableCell4";
        this.xrTableCell4.StylePriority.UseFont = false;
        this.xrTableCell4.Text = "Quantity";
        this.xrTableCell4.Weight = 1.1249992370605468D;
        // 
        // xrRichText1
        // 
        this.xrRichText1.LocationFloat = new DevExpress.Utils.PointFloat(133.3334F, 0F);
        this.xrRichText1.Name = "xrRichText1";
        this.xrRichText1.SerializableRtfString = resources.GetString("xrRichText1.SerializableRtfString");
        this.xrRichText1.SizeF = new System.Drawing.SizeF(314.5834F, 30.66667F);
        // 
        // TopMargin
        // 
        this.TopMargin.Name = "TopMargin";
        this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // BottomMargin
        // 
        this.BottomMargin.Name = "BottomMargin";
        this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // SampleProductsXtraReport
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Version = "11.1";
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrRichText1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}

	#endregion
}
