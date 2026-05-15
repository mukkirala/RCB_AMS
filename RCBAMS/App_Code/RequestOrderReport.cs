using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for RequestOrderReport
/// </summary>
public class RequestOrderReport : DevExpress.XtraReports.UI.XtraReport
{
    private DevExpress.XtraReports.UI.DetailBand Detail;
    private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRLabel xrLabel1;
    private XRLabel xrLabel2;
    private XRTable xrTable1;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell2;
    private XRTableCell xrTableCell3;
    private XRLabel xrLabel6;
    private XRLabel xrLabel7;
    private XRLabel xrLabel4;
    private XRLabel xrLabel5;
    private XRLabel xrLabel3;
    private XRLabel xrLabel8;
    private XRLabel xrLabel9;
    private XRLabel xrLabel10;
    private XRLine xrLine1;
    private XRLabel xrLabel11;
    private XRLabel xrLabel12;
    private XRLabel xrLabel13;
    private XRLabel xrLabel14;
    private XRLabel xrLabel15;
    private XRTableCell xrTableCell4;
    private XRTableCell xrTableCell5;
    private XRTableCell xrTableCell6;
    private XRTableCell xrTableCell7;
    private XRPanel xrPanel1;
    private XRLabel xrLabel16;
    private XRLabel xrLabel17;
    private XRLabel xrLabel18;
    private XRLabel xrLabel19;
    private XRLabel xrLabel20;
    private XRLabel xrLabel21;
    private XRLabel xrLabel22;
    private XRLabel xrLabel23;
    private WinControlContainer winControlContainer1;
    private System.Windows.Forms.PictureBox pictureBox1;
    private WinControlContainer winControlContainer2;
    private System.Windows.Forms.TextBox textBox1;
    private WinControlContainer winControlContainer3;
    private System.Windows.Forms.PictureBox pictureBox2;

    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    public RequestOrderReport(DataTable dt, string[] values)
    {
        InitializeComponent();

        this.xrLabel3.Text = values[0];
        this.xrLabel5.Text = values[1];
        this.xrLabel7.Text = values[2];
        this.xrLabel8.Text = values[3];
        this.xrLabel12.Text = values[4];
        this.xrLabel14.Text = values[5];

        this.xrTable1.Borders = DevExpress.XtraPrinting.BorderSide.All;
        this.xrTable1.BeginInit();

        XRTableRow row;
        XRTableCell cell1;
        XRTableCell cell2;
        XRTableCell cell3;
        XRTableCell cell4;

        int count = 0;
        decimal sum = 0;

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            row = new XRTableRow();

            count = count + 1;

            // Asset ID
            cell1 = new XRTableCell();
            row.Cells.SetChildIndex(cell1, 0);
            cell1.Text = dt.Rows[i]["AssetID"].ToString();
            row.Cells.Add(cell1);
            cell1.WidthF = 147.92f;

            // Asset Name
            cell2 = new XRTableCell();
            row.Cells.SetChildIndex(cell2, 1);
            cell2.Text = dt.Rows[i]["AssetName"].ToString();
            row.Cells.Add(cell2);
            cell2.WidthF = 183.22f;

            // Asset Code
            cell3 = new XRTableCell();
            row.Cells.SetChildIndex(cell3, 2);
            cell3.Text = dt.Rows[i]["AssetCode"].ToString();
            row.Cells.Add(cell3);
            cell3.WidthF = 120.28f;

            // Quantity
            cell4 = new XRTableCell();
            row.Cells.SetChildIndex(cell4, 3);
            cell4.Text = dt.Rows[i]["RequiredQuantity"].ToString();
            row.Cells.Add(cell4);
            cell4.WidthF = 100.75f;

            sum += Convert.ToDecimal(
                dt.Rows[i]["RequiredQuantity"] == DBNull.Value
                ? 0
                : dt.Rows[i]["RequiredQuantity"]);

            this.xrTable1.Rows.Add(row);
        }

        this.xrTable1.EndInit();

        this.xrLabel20.Text = sum.ToString();
        this.xrLabel23.Text = count.ToString();
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
        string resourceFileName = "RequestOrderReport.resx";
        System.Resources.ResourceManager resources = global::Resources.RequestOrderReport.ResourceManager;
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrPanel1 = new DevExpress.XtraReports.UI.XRPanel();
        this.winControlContainer2 = new DevExpress.XtraReports.UI.WinControlContainer();
        this.textBox1 = new System.Windows.Forms.TextBox();
        this.winControlContainer1 = new DevExpress.XtraReports.UI.WinControlContainer();
        this.pictureBox1 = new System.Windows.Forms.PictureBox();
        this.xrLabel23 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel22 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel21 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel20 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel19 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel18 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel17 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel16 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
        this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell5 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell6 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell7 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel15 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        this.pictureBox2 = new System.Windows.Forms.PictureBox();
        this.winControlContainer3 = new DevExpress.XtraReports.UI.WinControlContainer();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPanel1});
        this.Detail.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.Detail.HeightF = 520.7501F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.StylePriority.UseFont = false;
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrPanel1
        // 
        this.xrPanel1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
        | DevExpress.XtraPrinting.BorderSide.Right)
        | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrPanel1.BorderWidth = 2;
        this.xrPanel1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.winControlContainer3,
            this.winControlContainer2,
            this.winControlContainer1,
            this.xrLabel23,
            this.xrLabel22,
            this.xrLabel21,
            this.xrLabel20,
            this.xrLabel19,
            this.xrLabel18,
            this.xrLabel17,
            this.xrLabel16,
            this.xrLabel14,
            this.xrLine1,
            this.xrLabel2,
            this.xrLabel3,
            this.xrTable1,
            this.xrLabel5,
            this.xrLabel4,
            this.xrLabel7,
            this.xrLabel6,
            this.xrLabel8,
            this.xrLabel9,
            this.xrLabel11,
            this.xrLabel12,
            this.xrLabel13,
            this.xrLabel10,
            this.xrLabel15,
            this.xrLabel1});
        this.xrPanel1.LocationFloat = new DevExpress.Utils.PointFloat(6.784972F, 10.00001F);
        this.xrPanel1.Name = "xrPanel1";
        this.xrPanel1.SizeF = new System.Drawing.SizeF(748.215F, 453.875F);
        this.xrPanel1.StylePriority.UseBorders = false;
        this.xrPanel1.StylePriority.UseBorderWidth = false;
        // 
        // winControlContainer2
        // 
        this.winControlContainer2.LocationFloat = new DevExpress.Utils.PointFloat(110.4583F, 41F);
        this.winControlContainer2.Name = "winControlContainer2";
        this.winControlContainer2.SizeF = new System.Drawing.SizeF(490.4583F, 34F);
        this.winControlContainer2.WinControl = this.textBox1;
        // 
        // textBox1
        // 
        this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold);
        this.textBox1.Location = new System.Drawing.Point(0, 0);
        this.textBox1.Name = "textBox1";
        this.textBox1.Size = new System.Drawing.Size(467, 29);
        this.textBox1.TabIndex = 1;
        this.textBox1.Text = "Regional Centre for Biotechnology";
        this.textBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
        // 
        // winControlContainer1
        // 
        this.winControlContainer1.LocationFloat = new DevExpress.Utils.PointFloat(9.416635F, 10F);
        this.winControlContainer1.Name = "winControlContainer1";
        this.winControlContainer1.SizeF = new System.Drawing.SizeF(101.0416F, 87.99999F);
        this.winControlContainer1.WinControl = this.pictureBox1;
        // 
        // pictureBox1
        // 
        this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
        this.pictureBox1.Location = new System.Drawing.Point(0, 0);
        this.pictureBox1.Name = "pictureBox1";
        this.pictureBox1.Size = new System.Drawing.Size(93, 80);
        this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
        this.pictureBox1.TabIndex = 0;
        this.pictureBox1.TabStop = false;
        // 
        // xrLabel23
        // 
        this.xrLabel23.BorderWidth = 1;
        this.xrLabel23.LocationFloat = new DevExpress.Utils.PointFloat(108.3333F, 288.5415F);
        this.xrLabel23.Name = "xrLabel23";
        this.xrLabel23.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel23.SizeF = new System.Drawing.SizeF(57.29158F, 23F);
        this.xrLabel23.StylePriority.UseBorderWidth = false;
        this.xrLabel23.Text = "xrLabel23";
        // 
        // xrLabel22
        // 
        this.xrLabel22.BorderWidth = 1;
        this.xrLabel22.LocationFloat = new DevExpress.Utils.PointFloat(17.7083F, 288.5415F);
        this.xrLabel22.Name = "xrLabel22";
        this.xrLabel22.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel22.SizeF = new System.Drawing.SizeF(90.625F, 23F);
        this.xrLabel22.StylePriority.UseBorderWidth = false;
        this.xrLabel22.Text = "ItemCount";
        // 
        // xrLabel21
        // 
        this.xrLabel21.BorderWidth = 1;
        this.xrLabel21.LocationFloat = new DevExpress.Utils.PointFloat(573.0484F, 288.5415F);
        this.xrLabel21.Name = "xrLabel21";
        this.xrLabel21.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel21.SizeF = new System.Drawing.SizeF(89.5246F, 23F);
        this.xrLabel21.StylePriority.UseBorderWidth = false;
        this.xrLabel21.Text = "Total Qty";
        // 
        // xrLabel20
        // 
        this.xrLabel20.BorderWidth = 1;
        this.xrLabel20.LocationFloat = new DevExpress.Utils.PointFloat(662.573F, 288.5415F);
        this.xrLabel20.Name = "xrLabel20";
        this.xrLabel20.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel20.SizeF = new System.Drawing.SizeF(71.30878F, 23F);
        this.xrLabel20.StylePriority.UseBorderWidth = false;
        this.xrLabel20.StylePriority.UseTextAlignment = false;
        this.xrLabel20.Text = "xrLabel20";
        this.xrLabel20.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel19
        // 
        this.xrLabel19.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel19.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrLabel19.LocationFloat = new DevExpress.Utils.PointFloat(151.0417F, 141.5832F);
        this.xrLabel19.Name = "xrLabel19";
        this.xrLabel19.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel19.SizeF = new System.Drawing.SizeF(161.4583F, 23F);
        this.xrLabel19.StylePriority.UseBorders = false;
        this.xrLabel19.StylePriority.UseFont = false;
        // 
        // xrLabel18
        // 
        this.xrLabel18.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel18.LocationFloat = new DevExpress.Utils.PointFloat(17.7083F, 141.5832F);
        this.xrLabel18.Name = "xrLabel18";
        this.xrLabel18.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel18.SizeF = new System.Drawing.SizeF(133.3333F, 23F);
        this.xrLabel18.StylePriority.UseBorders = false;
        this.xrLabel18.Text = "Requisition From";
        // 
        // xrLabel17
        // 
        this.xrLabel17.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel17.Font = new System.Drawing.Font("Verdana", 9F);
        this.xrLabel17.LocationFloat = new DevExpress.Utils.PointFloat(573.0485F, 116.6249F);
        this.xrLabel17.Name = "xrLabel17";
        this.xrLabel17.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel17.SizeF = new System.Drawing.SizeF(160.8334F, 23F);
        this.xrLabel17.StylePriority.UseBorders = false;
        this.xrLabel17.StylePriority.UseFont = false;
        this.xrLabel17.Text = "36490213093";
        // 
        // xrLabel16
        // 
        this.xrLabel16.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel16.LocationFloat = new DevExpress.Utils.PointFloat(481.7985F, 116.6249F);
        this.xrLabel16.Name = "xrLabel16";
        this.xrLabel16.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel16.SizeF = new System.Drawing.SizeF(91.25003F, 23F);
        this.xrLabel16.StylePriority.UseBorders = false;
        this.xrLabel16.Text = "VAT TIN";
        // 
        // xrLabel14
        // 
        this.xrLabel14.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel14.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(151.0415F, 176.0832F);
        this.xrLabel14.Name = "xrLabel14";
        this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel14.SizeF = new System.Drawing.SizeF(161.4584F, 23F);
        this.xrLabel14.StylePriority.UseBorders = false;
        this.xrLabel14.StylePriority.UseFont = false;
        this.xrLabel14.Text = "xrLabel14";
        // 
        // xrLine1
        // 
        this.xrLine1.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(640.5067F, 346.4165F);
        this.xrLine1.Name = "xrLine1";
        this.xrLine1.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLine1.StylePriority.UseBorders = false;
        // 
        // xrLabel2
        // 
        this.xrLabel2.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel2.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(481.7985F, 139.6249F);
        this.xrLabel2.Name = "xrLabel2";
        this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel2.SizeF = new System.Drawing.SizeF(91.24997F, 23F);
        this.xrLabel2.StylePriority.UseBorders = false;
        this.xrLabel2.StylePriority.UseFont = false;
        this.xrLabel2.Text = "Date";
        // 
        // xrLabel3
        // 
        this.xrLabel3.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel3.Font = new System.Drawing.Font("Times New Roman", 9.75F);
        this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(573.0484F, 139.6249F);
        this.xrLabel3.Name = "xrLabel3";
        this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel3.SizeF = new System.Drawing.SizeF(160.8333F, 23F);
        this.xrLabel3.StylePriority.UseBorders = false;
        this.xrLabel3.StylePriority.UseFont = false;
        this.xrLabel3.Text = "xrLabel3";
        // 
        // xrTable1
        // 
        this.xrTable1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
        | DevExpress.XtraPrinting.BorderSide.Right)
        | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTable1.BorderWidth = 1;
        this.xrTable1.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(17.70829F, 263.5415F);
        this.xrTable1.Name = "xrTable1";
        this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
        this.xrTable1.SizeF = new System.Drawing.SizeF(716.1736F, 24.99999F);
        this.xrTable1.StylePriority.UseBorders = false;
        this.xrTable1.StylePriority.UseBorderWidth = false;
        this.xrTable1.StylePriority.UseFont = false;
        this.xrTable1.StylePriority.UseTextAlignment = false;
        this.xrTable1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrTableRow1
        // 
        this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell4,
            this.xrTableCell5,
            this.xrTableCell6,
            this.xrTableCell7,
            this.xrTableCell3});
        this.xrTableRow1.Name = "xrTableRow1";
        this.xrTableRow1.Weight = 1D;
        // 
        // xrTableCell1
        // 
        this.xrTableCell1.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell1.Name = "xrTableCell1";
        this.xrTableCell1.StylePriority.UseFont = false;
        this.xrTableCell1.Text = "ItemCode";
        this.xrTableCell1.Weight = 1.4327003353401329D;
        // 
        // xrTableCell2
        // 
        this.xrTableCell2.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell2.Name = "xrTableCell2";
        this.xrTableCell2.StylePriority.UseFont = false;
        this.xrTableCell2.Text = "Item Name";
        this.xrTableCell2.Weight = 1.7745965405435715D;
        // 
        // xrTableCell4
        // 
        this.xrTableCell4.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell4.Name = "xrTableCell4";
        this.xrTableCell4.StylePriority.UseFont = false;
        this.xrTableCell4.Text = "Wing";
        this.xrTableCell4.Weight = 0.73882027673927619D;
        // 
        // xrTableCell5
        // 
        this.xrTableCell5.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell5.Name = "xrTableCell5";
        this.xrTableCell5.StylePriority.UseFont = false;
        this.xrTableCell5.Text = "Floor";
        this.xrTableCell5.Weight = 0.66590376412157537D;
        // 
        // xrTableCell6
        // 
        this.xrTableCell6.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell6.Name = "xrTableCell6";
        this.xrTableCell6.StylePriority.UseFont = false;
        this.xrTableCell6.Text = "Unit";
        this.xrTableCell6.Weight = 0.76692811917718418D;
        // 
        // xrTableCell7
        // 
        this.xrTableCell7.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell7.Name = "xrTableCell7";
        this.xrTableCell7.StylePriority.UseFont = false;
        this.xrTableCell7.Text = "Style";
        this.xrTableCell7.Weight = 0.867123069548863D;
        // 
        // xrTableCell3
        // 
        this.xrTableCell3.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrTableCell3.Name = "xrTableCell3";
        this.xrTableCell3.StylePriority.UseFont = false;
        this.xrTableCell3.Text = "Quantity";
        this.xrTableCell3.Weight = 0.69068836892102459D;
        // 
        // xrLabel5
        // 
        this.xrLabel5.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel5.Font = new System.Drawing.Font("Times New Roman", 9.75F);
        this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(151.0415F, 199.0832F);
        this.xrLabel5.Name = "xrLabel5";
        this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel5.SizeF = new System.Drawing.SizeF(161.4584F, 23F);
        this.xrLabel5.StylePriority.UseBorders = false;
        this.xrLabel5.StylePriority.UseFont = false;
        this.xrLabel5.Text = "xrLabel5";
        // 
        // xrLabel4
        // 
        this.xrLabel4.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel4.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(17.70824F, 199.0834F);
        this.xrLabel4.Name = "xrLabel4";
        this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel4.SizeF = new System.Drawing.SizeF(133.3333F, 23F);
        this.xrLabel4.StylePriority.UseBorders = false;
        this.xrLabel4.StylePriority.UseFont = false;
        this.xrLabel4.Text = "Contact Person";
        // 
        // xrLabel7
        // 
        this.xrLabel7.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel7.Font = new System.Drawing.Font("Times New Roman", 9.75F);
        this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(573.0484F, 199.0834F);
        this.xrLabel7.Name = "xrLabel7";
        this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel7.SizeF = new System.Drawing.SizeF(160.8334F, 23F);
        this.xrLabel7.StylePriority.UseBorders = false;
        this.xrLabel7.StylePriority.UseFont = false;
        this.xrLabel7.Text = "xrLabel7";
        // 
        // xrLabel6
        // 
        this.xrLabel6.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel6.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(481.7985F, 199.0834F);
        this.xrLabel6.Name = "xrLabel6";
        this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel6.SizeF = new System.Drawing.SizeF(91.25F, 23F);
        this.xrLabel6.StylePriority.UseBorders = false;
        this.xrLabel6.StylePriority.UseFont = false;
        this.xrLabel6.Text = "Contact No";
        // 
        // xrLabel8
        // 
        this.xrLabel8.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel8.Font = new System.Drawing.Font("Times New Roman", 9.75F);
        this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(573.0484F, 176.0832F);
        this.xrLabel8.Name = "xrLabel8";
        this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel8.SizeF = new System.Drawing.SizeF(160.8334F, 23F);
        this.xrLabel8.StylePriority.UseBorders = false;
        this.xrLabel8.StylePriority.UseFont = false;
        this.xrLabel8.Text = "xrLabel8";
        // 
        // xrLabel9
        // 
        this.xrLabel9.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel9.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(481.7985F, 176.0832F);
        this.xrLabel9.Name = "xrLabel9";
        this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel9.SizeF = new System.Drawing.SizeF(91.24997F, 23F);
        this.xrLabel9.StylePriority.UseBorders = false;
        this.xrLabel9.StylePriority.UseFont = false;
        this.xrLabel9.Text = "Address";
        // 
        // xrLabel11
        // 
        this.xrLabel11.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(16.70829F, 117.6249F);
        this.xrLabel11.Name = "xrLabel11";
        this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel11.SizeF = new System.Drawing.SizeF(134.3333F, 23F);
        this.xrLabel11.StylePriority.UseBorders = false;
        this.xrLabel11.Text = "Requisition No";
        // 
        // xrLabel12
        // 
        this.xrLabel12.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel12.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(151.0415F, 117.6249F);
        this.xrLabel12.Name = "xrLabel12";
        this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel12.SizeF = new System.Drawing.SizeF(161.4584F, 23F);
        this.xrLabel12.StylePriority.UseBorders = false;
        this.xrLabel12.StylePriority.UseFont = false;
        this.xrLabel12.Text = "xrLabel12";
        // 
        // xrLabel13
        // 
        this.xrLabel13.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(17.70824F, 176.0832F);
        this.xrLabel13.Name = "xrLabel13";
        this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel13.SizeF = new System.Drawing.SizeF(133.3333F, 23F);
        this.xrLabel13.StylePriority.UseBorders = false;
        this.xrLabel13.Text = "Requisition To";
        // 
        // xrLabel10
        // 
        this.xrLabel10.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel10.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(540.5067F, 346.4165F);
        this.xrLabel10.Name = "xrLabel10";
        this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel10.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel10.StylePriority.UseBorders = false;
        this.xrLabel10.StylePriority.UseFont = false;
        this.xrLabel10.StylePriority.UseTextAlignment = false;
        this.xrLabel10.Text = "Signature";
        this.xrLabel10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel15
        // 
        this.xrLabel15.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel15.Font = new System.Drawing.Font("Verdana", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel15.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
        this.xrLabel15.LocationFloat = new DevExpress.Utils.PointFloat(17.70829F, 240.5414F);
        this.xrLabel15.Name = "xrLabel15";
        this.xrLabel15.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel15.SizeF = new System.Drawing.SizeF(120.8333F, 23F);
        this.xrLabel15.StylePriority.UseBorders = false;
        this.xrLabel15.StylePriority.UseFont = false;
        this.xrLabel15.StylePriority.UseForeColor = false;
        this.xrLabel15.Text = "Items List";
        // 
        // xrLabel1
        // 
        this.xrLabel1.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel1.Font = new System.Drawing.Font("Verdana", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(190.1183F, 87.5F);
        this.xrLabel1.Name = "xrLabel1";
        this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1.SizeF = new System.Drawing.SizeF(311.4583F, 26.12502F);
        this.xrLabel1.StylePriority.UseBackColor = false;
        this.xrLabel1.StylePriority.UseBorders = false;
        this.xrLabel1.StylePriority.UseFont = false;
        this.xrLabel1.StylePriority.UseTextAlignment = false;
        this.xrLabel1.Text = "Requisition  For Items";
        this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // TopMargin
        // 
        this.TopMargin.HeightF = 6.04167F;
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
        // pictureBox2
        // 
        this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
        this.pictureBox2.Location = new System.Drawing.Point(0, 0);
        this.pictureBox2.Name = "pictureBox2";
        this.pictureBox2.Size = new System.Drawing.Size(92, 80);
        this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
        this.pictureBox2.TabIndex = 2;
        this.pictureBox2.TabStop = false;
        // 
        // winControlContainer3
        // 
        this.winControlContainer3.LocationFloat = new DevExpress.Utils.PointFloat(612.5416F, 10.00001F);
        this.winControlContainer3.Name = "winControlContainer3";
        this.winControlContainer3.SizeF = new System.Drawing.SizeF(100F, 87.99999F);
        this.winControlContainer3.WinControl = this.pictureBox2;
        // 
        // RequestOrderReport
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Margins = new System.Drawing.Printing.Margins(34, 51, 6, 100);
        this.Version = "11.1";
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

    }

    #endregion
}
