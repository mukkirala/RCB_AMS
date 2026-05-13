using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Data;
using System.Web.Configuration;


/// <summary>
/// Summary description for DeliveryGatePass
/// </summary>
public class DeliveryGatePass1 : DevExpress.XtraReports.UI.XtraReport
{
    private DevExpress.XtraReports.UI.DetailBand Detail;
    private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private ReportHeaderBand ReportHeader;
    private ReportFooterBand ReportFooter;
    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;
    private DataTable dt;
    private XRPanel xrPanel1;
    private XRLabel xrUnitName;
    private XRLabel xrLabel9;
    private XRLabel xrLabel12;
    private XRLabel xrLabel10;
    private XRTable xrDisplayTable;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell2;
    private XRLabel xrtoUnit;
    private XRLabel xrReqID;
    private XRLabel xrIssueDate;
    private XRLabel xrLabel11;
    private XRLabel xrLabel3;
    private XRLabel xrLabel2;
    private XRLabel xrLabel4;
    private XRLabel xrLabel6;
    private XRLabel xrLabel26;
    private XRLabel xrLabel25;
    private XRLabel xrLabel24;
    private XRLabel xrLabel28;
    private XRLabel xrLabel31;
    private XRLabel xrLabel30;
    private XRLabel xrLabel29;
    private XRLabel xrLabel19;
    private XRLabel xrLabel18;
    private XRLabel xrLabel17;
    private XRLabel xrLabel20;
    private XRLabel xrLabel23;
    private XRLabel xrLabel22;
    private XRLabel xrLabel21;
    private XRTableCell xrTableCell7;
    private XRTableCell xrTableCell8;
    private XRLabel xrLabel1;
    private XRLabel xrLabel5;
    private XRLabel xrLabel7;
    private XRLabel xrLabel8;
    private XRLabel xrLabel13;
    private XRLabel xrLabel14;
    private XRLabel xrLabel15;
    private XRLabel xrLabel16;
    private XRLabel xrLabel27;
    private XRLabel xrLabel33;
    private WinControlContainer winControlContainer1;
    private System.Windows.Forms.PictureBox pictureBox1;
    private XRLabel xrLabel32;

    private WinControlContainer winControlContainer2;
    private System.Windows.Forms.PictureBox pictureBox2;
    private string[] values;

    public DeliveryGatePass1(DataTable dt1, string[] Values)
    {
        InitializeComponent();

        xrUnitName.Text = Values[0];
        xrIssueDate.Text = System.DateTime.Now.Date.ToString("dd-MM-yyyy");
        xrReqID.Text = Values[1];
        xrtoUnit.Text = Values[2];
        this.xrLabel24.Text = Values[3];
        this.xrLabel17.Text = Values[4];
        this.xrLabel18.Text = Values[5];
        this.xrLabel19.Text = Values[6];
        this.xrLabel20.Text = Values[7];
        this.xrLabel21.Text = Values[8];
        this.xrLabel22.Text = Values[9];
        this.xrLabel25.Text = Values[10];
        this.xrLabel26.Text = Values[11];
        this.xrLabel30.Text = Values[12];
        this.xrLabel31.Text = Values[13];
        this.xrLabel28.Text = Values[14];
        this.xrLabel29.Text = Values[15];
        this.xrLabel5.Text = Values[16];
        this.xrLabel2.Text = Values[17];
        this.xrLabel11.Text = Values[18];
        this.xrLabel14.Text = Values[19];
        this.xrLabel15.Text = Values[20];
        this.xrLabel16.Text = Values[21];


        if (dt1.Rows.Count > 0)
        {

            this.xrDisplayTable.Borders = DevExpress.XtraPrinting.BorderSide.All;
            this.xrDisplayTable.BeginInit();
            XRTableRow row;
            XRTableCell cell1;
            XRTableCell cell2;
            //XRTableCell cell3;
            //XRTableCell cell4;
            //XRTableCell cell5;
            //XRTableCell cell6;
            XRTableCell cell7;
            XRTableCell cell8;

            int count = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                row = new XRTableRow();
                {
                    count = count + 1;
                    cell1 = new XRTableCell();
                    row.Cells.SetChildIndex(cell1, 0);
                    cell1.Text = dt1.Rows[i][0].ToString();
                    row.Cells.Add(cell1);
                    cell1.WidthF = 152.84f;

                    cell2 = new XRTableCell();
                    row.Cells.SetChildIndex(cell2, 1);
                    cell2.Text = dt1.Rows[i][1].ToString();
                    row.Cells.Add(cell2);
                    cell2.WidthF = 273.83f;

                    //cell3 = new XRTableCell();
                    //row.Cells.SetChildIndex(cell3, 2);
                    //cell3.Text = dt1.Rows[i][2].ToString();
                    //row.Cells.Add(cell3);
                    //cell3.WidthF = 72.5f;

                    //cell4 = new XRTableCell();
                    //row.Cells.SetChildIndex(cell4, 3);
                    //cell4.Text = dt1.Rows[i][3].ToString();
                    //row.Cells.Add(cell4);
                    //cell4.WidthF = 78.54f;

                    //cell5 = new XRTableCell();
                    //row.Cells.SetChildIndex(cell5, 4);
                    //cell5.Text = dt1.Rows[i][4].ToString();
                    //row.Cells.Add(cell5);
                    //cell5.WidthF = 87.71f;

                    //cell6 = new XRTableCell();
                    //row.Cells.SetChildIndex(cell6, 5);
                    //cell6.Text = dt1.Rows[i][5].ToString();
                    //row.Cells.Add(cell6);
                    //cell6.WidthF = 76.46f;


                    cell7 = new XRTableCell();
                    row.Cells.SetChildIndex(cell7, 6);
                    cell7.Text = dt1.Rows[i][6].ToString();
                    row.Cells.Add(cell7);
                    cell7.WidthF = 268.19f;


                    cell8 = new XRTableCell();
                    row.Cells.SetChildIndex(cell8, 7);
                    cell8.Text = dt1.Rows[i][7].ToString();
                    row.Cells.Add(cell8);
                    cell8.WidthF = 69.9f;

                }
                this.xrDisplayTable.Rows.Add(row);
            }
            this.xrDisplayTable.EndInit();
            this.xrLabel27.Text = count.ToString();

        }
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
        string resourceFileName = "DeliveryGatePass1.resx";
       // System.Resources.ResourceManager resources = global::Resources.DeliveryGatePass1.ResourceManager;
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrPanel1 = new DevExpress.XtraReports.UI.XRPanel();
        this.winControlContainer2 = new DevExpress.XtraReports.UI.WinControlContainer();
        this.pictureBox2 = new System.Windows.Forms.PictureBox();
        this.xrLabel32 = new DevExpress.XtraReports.UI.XRLabel();
        this.winControlContainer1 = new DevExpress.XtraReports.UI.WinControlContainer();
        this.pictureBox1 = new System.Windows.Forms.PictureBox();
        this.xrLabel33 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel27 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel16 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel15 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel26 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel25 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel24 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel28 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel31 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel30 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel29 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel19 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel18 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel17 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel20 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel23 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel22 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel21 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrUnitName = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrDisplayTable = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell7 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell8 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrtoUnit = new DevExpress.XtraReports.UI.XRLabel();
        this.xrReqID = new DevExpress.XtraReports.UI.XRLabel();
        this.xrIssueDate = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        this.ReportHeader = new DevExpress.XtraReports.UI.ReportHeaderBand();
        this.ReportFooter = new DevExpress.XtraReports.UI.ReportFooterBand();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrDisplayTable)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPanel1});
        this.Detail.HeightF = 672.2918F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrPanel1
        // 
        this.xrPanel1.BorderColor = System.Drawing.Color.Black;
        this.xrPanel1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
        | DevExpress.XtraPrinting.BorderSide.Right)
        | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrPanel1.BorderWidth = 2;
        this.xrPanel1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.winControlContainer2,
            this.xrLabel32,
            this.winControlContainer1,
            this.xrLabel33,
            this.xrLabel27,
            this.xrLabel16,
            this.xrLabel15,
            this.xrLabel14,
            this.xrLabel13,
            this.xrLabel8,
            this.xrLabel7,
            this.xrLabel5,
            this.xrLabel1,
            this.xrLabel26,
            this.xrLabel25,
            this.xrLabel24,
            this.xrLabel28,
            this.xrLabel31,
            this.xrLabel30,
            this.xrLabel29,
            this.xrLabel19,
            this.xrLabel18,
            this.xrLabel17,
            this.xrLabel20,
            this.xrLabel23,
            this.xrLabel22,
            this.xrLabel21,
            this.xrUnitName,
            this.xrLabel9,
            this.xrLabel12,
            this.xrLabel10,
            this.xrDisplayTable,
            this.xrtoUnit,
            this.xrReqID,
            this.xrIssueDate,
            this.xrLabel11,
            this.xrLabel3,
            this.xrLabel2,
            this.xrLabel4,
            this.xrLabel6});
        this.xrPanel1.LocationFloat = new DevExpress.Utils.PointFloat(9.999998F, 10.00001F);
        this.xrPanel1.Name = "xrPanel1";
        this.xrPanel1.SizeF = new System.Drawing.SizeF(793F, 569.5835F);
        this.xrPanel1.StylePriority.UseBorderColor = false;
        this.xrPanel1.StylePriority.UseBorders = false;
        this.xrPanel1.StylePriority.UseBorderWidth = false;
        // 
        // winControlContainer2
        // 
        this.winControlContainer2.LocationFloat = new DevExpress.Utils.PointFloat(673.0856F, 10.00001F);
        this.winControlContainer2.Name = "winControlContainer2";
        this.winControlContainer2.SizeF = new System.Drawing.SizeF(102.0834F, 92.79165F);
        this.winControlContainer2.WinControl = this.pictureBox2;
        // 
        // pictureBox2
        // 
        //this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
        this.pictureBox2.Location = new System.Drawing.Point(0, 0);
        this.pictureBox2.Name = "pictureBox2";
        this.pictureBox2.Size = new System.Drawing.Size(94, 85);
        this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
        this.pictureBox2.TabIndex = 1;
        this.pictureBox2.TabStop = false;
        // 
        // xrLabel32
        // 
        this.xrLabel32.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel32.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold);
        this.xrLabel32.LocationFloat = new DevExpress.Utils.PointFloat(106.2501F, 33.16666F);
        this.xrLabel32.Name = "xrLabel32";
        this.xrLabel32.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel32.SizeF = new System.Drawing.SizeF(546.2109F, 42.79167F);
        this.xrLabel32.StylePriority.UseBorders = false;
        this.xrLabel32.StylePriority.UseFont = false;
        this.xrLabel32.StylePriority.UseTextAlignment = false;
        this.xrLabel32.Text = "IX Corps Western Command";
        this.xrLabel32.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // winControlContainer1
        // 
        this.winControlContainer1.LocationFloat = new DevExpress.Utils.PointFloat(6.250167F, 10.00001F);
        this.winControlContainer1.Name = "winControlContainer1";
        this.winControlContainer1.SizeF = new System.Drawing.SizeF(99.99998F, 92.79166F);
        this.winControlContainer1.WinControl = this.pictureBox1;
        // 
        // pictureBox1
        // 
      //  this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
        this.pictureBox1.Location = new System.Drawing.Point(0, 0);
        this.pictureBox1.Name = "pictureBox1";
        this.pictureBox1.Size = new System.Drawing.Size(92, 85);
        this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
        this.pictureBox1.TabIndex = 0;
        this.pictureBox1.TabStop = false;
        // 
        // xrLabel33
        // 
        this.xrLabel33.BorderWidth = 1;
        this.xrLabel33.LocationFloat = new DevExpress.Utils.PointFloat(15.62504F, 381.5834F);
        this.xrLabel33.Name = "xrLabel33";
        this.xrLabel33.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel33.SizeF = new System.Drawing.SizeF(91.45856F, 23F);
        this.xrLabel33.StylePriority.UseBorderWidth = false;
        this.xrLabel33.Text = "TotalCount";
        // 
        // xrLabel27
        // 
        this.xrLabel27.BorderWidth = 1;
        this.xrLabel27.LocationFloat = new DevExpress.Utils.PointFloat(106.2501F, 381.5834F);
        this.xrLabel27.Name = "xrLabel27";
        this.xrLabel27.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel27.SizeF = new System.Drawing.SizeF(62.21648F, 23F);
        this.xrLabel27.StylePriority.UseBorderWidth = false;
        this.xrLabel27.StylePriority.UseTextAlignment = false;
        this.xrLabel27.Text = "xrLabel27";
        this.xrLabel27.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel16
        // 
        this.xrLabel16.BorderWidth = 1;
        this.xrLabel16.LocationFloat = new DevExpress.Utils.PointFloat(710.4814F, 381.5834F);
        this.xrLabel16.Name = "xrLabel16";
        this.xrLabel16.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel16.SizeF = new System.Drawing.SizeF(69.89612F, 23F);
        this.xrLabel16.StylePriority.UseBorderWidth = false;
        this.xrLabel16.StylePriority.UseTextAlignment = false;
        this.xrLabel16.Text = "xrLabel16";
        this.xrLabel16.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel15
        // 
        this.xrLabel15.BorderWidth = 1;
        this.xrLabel15.LocationFloat = new DevExpress.Utils.PointFloat(442.2917F, 381.5834F);
        this.xrLabel15.Name = "xrLabel15";
        this.xrLabel15.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel15.SizeF = new System.Drawing.SizeF(268.1896F, 23F);
        this.xrLabel15.StylePriority.UseBorderWidth = false;
        this.xrLabel15.StylePriority.UseTextAlignment = false;
        this.xrLabel15.Text = "xrLabel15";
        this.xrLabel15.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel14
        // 
        this.xrLabel14.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(129.3756F, 128.1667F);
        this.xrLabel14.Name = "xrLabel14";
        this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel14.SizeF = new System.Drawing.SizeF(206.2083F, 23F);
        this.xrLabel14.StylePriority.UseBorders = false;
        this.xrLabel14.Text = "xrLabel14";
        // 
        // xrLabel13
        // 
        this.xrLabel13.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel13.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(12.29189F, 128.1667F);
        this.xrLabel13.Name = "xrLabel13";
        this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel13.SizeF = new System.Drawing.SizeF(116.4583F, 23F);
        this.xrLabel13.StylePriority.UseBorders = false;
        this.xrLabel13.StylePriority.UseFont = false;
        this.xrLabel13.Text = "Gate Pass No.";
        // 
        // xrLabel8
        // 
        this.xrLabel8.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel8.Font = new System.Drawing.Font("Verdana", 9F);
        this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(575.7941F, 128.1667F);
        this.xrLabel8.Name = "xrLabel8";
        this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel8.SizeF = new System.Drawing.SizeF(204.5834F, 23F);
        this.xrLabel8.StylePriority.UseBorders = false;
        this.xrLabel8.StylePriority.UseFont = false;
        this.xrLabel8.Text = "36490213093";
        // 
        // xrLabel7
        // 
        this.xrLabel7.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel7.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(458.5019F, 128.1667F);
        this.xrLabel7.Name = "xrLabel7";
        this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel7.SizeF = new System.Drawing.SizeF(117.2921F, 23F);
        this.xrLabel7.StylePriority.UseBorders = false;
        this.xrLabel7.StylePriority.UseFont = false;
        this.xrLabel7.Text = "VAT TIN";
        // 
        // xrLabel5
        // 
        this.xrLabel5.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(229.3756F, 425.1248F);
        this.xrLabel5.Name = "xrLabel5";
        this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel5.SizeF = new System.Drawing.SizeF(312.5F, 23F);
        this.xrLabel5.StylePriority.UseBorders = false;
        this.xrLabel5.Text = "xrLabel5";
        // 
        // xrLabel1
        // 
        this.xrLabel1.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel1.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(22.49999F, 425.1248F);
        this.xrLabel1.Name = "xrLabel1";
        this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1.SizeF = new System.Drawing.SizeF(206.8756F, 23F);
        this.xrLabel1.StylePriority.UseBorders = false;
        this.xrLabel1.StylePriority.UseFont = false;
        this.xrLabel1.Text = "Reason For Sending Less Items";
        // 
        // xrLabel26
        // 
        this.xrLabel26.BorderWidth = 0;
        this.xrLabel26.LocationFloat = new DevExpress.Utils.PointFloat(610.0852F, 266.2501F);
        this.xrLabel26.Name = "xrLabel26";
        this.xrLabel26.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel26.SizeF = new System.Drawing.SizeF(170.2922F, 23F);
        this.xrLabel26.StylePriority.UseBorderWidth = false;
        this.xrLabel26.Text = "xrLabel20";
        // 
        // xrLabel25
        // 
        this.xrLabel25.BorderWidth = 0;
        this.xrLabel25.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel25.LocationFloat = new DevExpress.Utils.PointFloat(458.0852F, 266.2501F);
        this.xrLabel25.Name = "xrLabel25";
        this.xrLabel25.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel25.SizeF = new System.Drawing.SizeF(151.0418F, 23F);
        this.xrLabel25.StylePriority.UseBorderWidth = false;
        this.xrLabel25.StylePriority.UseFont = false;
        this.xrLabel25.Text = "xrLabel19";
        // 
        // xrLabel24
        // 
        this.xrLabel24.BorderWidth = 0;
        this.xrLabel24.LocationFloat = new DevExpress.Utils.PointFloat(165.4585F, 206.2501F);
        this.xrLabel24.Name = "xrLabel24";
        this.xrLabel24.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel24.SizeF = new System.Drawing.SizeF(112.5F, 23F);
        this.xrLabel24.StylePriority.UseBorderWidth = false;
        this.xrLabel24.Text = "xrLabel24";
        // 
        // xrLabel28
        // 
        this.xrLabel28.BorderWidth = 0;
        this.xrLabel28.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel28.LocationFloat = new DevExpress.Utils.PointFloat(11.87521F, 242.25F);
        this.xrLabel28.Name = "xrLabel28";
        this.xrLabel28.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel28.SizeF = new System.Drawing.SizeF(153.125F, 22.99998F);
        this.xrLabel28.StylePriority.UseBorderWidth = false;
        this.xrLabel28.StylePriority.UseFont = false;
        // 
        // xrLabel31
        // 
        this.xrLabel31.BorderWidth = 0;
        this.xrLabel31.LocationFloat = new DevExpress.Utils.PointFloat(611.7496F, 242.25F);
        this.xrLabel31.Name = "xrLabel31";
        this.xrLabel31.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel31.SizeF = new System.Drawing.SizeF(171.2504F, 23F);
        this.xrLabel31.StylePriority.UseBorderWidth = false;
        // 
        // xrLabel30
        // 
        this.xrLabel30.BorderWidth = 0;
        this.xrLabel30.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel30.LocationFloat = new DevExpress.Utils.PointFloat(458.0852F, 242.25F);
        this.xrLabel30.Name = "xrLabel30";
        this.xrLabel30.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel30.SizeF = new System.Drawing.SizeF(151.0418F, 23.00002F);
        this.xrLabel30.StylePriority.UseBorderWidth = false;
        this.xrLabel30.StylePriority.UseFont = false;
        // 
        // xrLabel29
        // 
        this.xrLabel29.BorderWidth = 0;
        this.xrLabel29.LocationFloat = new DevExpress.Utils.PointFloat(165.8752F, 242.25F);
        this.xrLabel29.Name = "xrLabel29";
        this.xrLabel29.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel29.SizeF = new System.Drawing.SizeF(168.7087F, 23F);
        this.xrLabel29.StylePriority.UseBorderWidth = false;
        // 
        // xrLabel19
        // 
        this.xrLabel19.BorderWidth = 0;
        this.xrLabel19.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel19.LocationFloat = new DevExpress.Utils.PointFloat(458.0852F, 290.2501F);
        this.xrLabel19.Name = "xrLabel19";
        this.xrLabel19.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel19.SizeF = new System.Drawing.SizeF(151.0418F, 23F);
        this.xrLabel19.StylePriority.UseBorderWidth = false;
        this.xrLabel19.StylePriority.UseFont = false;
        // 
        // xrLabel18
        // 
        this.xrLabel18.BorderWidth = 0;
        this.xrLabel18.LocationFloat = new DevExpress.Utils.PointFloat(165.8752F, 265.75F);
        this.xrLabel18.Name = "xrLabel18";
        this.xrLabel18.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel18.SizeF = new System.Drawing.SizeF(168.7087F, 23F);
        this.xrLabel18.StylePriority.UseBorderWidth = false;
        this.xrLabel18.Text = "xrLabel18";
        // 
        // xrLabel17
        // 
        this.xrLabel17.BorderWidth = 0;
        this.xrLabel17.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel17.LocationFloat = new DevExpress.Utils.PointFloat(11.87521F, 265.75F);
        this.xrLabel17.Name = "xrLabel17";
        this.xrLabel17.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel17.SizeF = new System.Drawing.SizeF(153.125F, 23F);
        this.xrLabel17.StylePriority.UseBorderWidth = false;
        this.xrLabel17.StylePriority.UseFont = false;
        this.xrLabel17.Text = "xrLabel17";
        // 
        // xrLabel20
        // 
        this.xrLabel20.BorderWidth = 0;
        this.xrLabel20.LocationFloat = new DevExpress.Utils.PointFloat(611.7496F, 290.2501F);
        this.xrLabel20.Name = "xrLabel20";
        this.xrLabel20.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel20.SizeF = new System.Drawing.SizeF(170.2922F, 23F);
        this.xrLabel20.StylePriority.UseBorderWidth = false;
        // 
        // xrLabel23
        // 
        this.xrLabel23.BorderWidth = 0;
        this.xrLabel23.Font = new System.Drawing.Font("Verdana", 10F, System.Drawing.FontStyle.Bold);
        this.xrLabel23.LocationFloat = new DevExpress.Utils.PointFloat(11.4585F, 206.2501F);
        this.xrLabel23.Name = "xrLabel23";
        this.xrLabel23.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel23.SizeF = new System.Drawing.SizeF(153.125F, 23F);
        this.xrLabel23.StylePriority.UseBorderWidth = false;
        this.xrLabel23.StylePriority.UseFont = false;
        this.xrLabel23.Text = "Mode of Transport";
        // 
        // xrLabel22
        // 
        this.xrLabel22.BorderWidth = 0;
        this.xrLabel22.LocationFloat = new DevExpress.Utils.PointFloat(165.0002F, 288.75F);
        this.xrLabel22.Name = "xrLabel22";
        this.xrLabel22.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel22.SizeF = new System.Drawing.SizeF(169.5836F, 23F);
        this.xrLabel22.StylePriority.UseBorderWidth = false;
        this.xrLabel22.Text = "xrLabel22";
        // 
        // xrLabel21
        // 
        this.xrLabel21.BorderWidth = 0;
        this.xrLabel21.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel21.LocationFloat = new DevExpress.Utils.PointFloat(11.87521F, 288.75F);
        this.xrLabel21.Name = "xrLabel21";
        this.xrLabel21.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel21.SizeF = new System.Drawing.SizeF(153.125F, 23F);
        this.xrLabel21.StylePriority.UseBorderWidth = false;
        this.xrLabel21.StylePriority.UseFont = false;
        this.xrLabel21.Text = "xrLabel21";
        // 
        // xrUnitName
        // 
        this.xrUnitName.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrUnitName.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrUnitName.LocationFloat = new DevExpress.Utils.PointFloat(128.7504F, 174.1666F);
        this.xrUnitName.Name = "xrUnitName";
        this.xrUnitName.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrUnitName.SizeF = new System.Drawing.SizeF(205.8335F, 23F);
        this.xrUnitName.StylePriority.UseBorders = false;
        this.xrUnitName.StylePriority.UseFont = false;
        this.xrUnitName.Text = "xrUnitName";
        // 
        // xrLabel9
        // 
        this.xrLabel9.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel9.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(12.29189F, 174.1666F);
        this.xrLabel9.Name = "xrLabel9";
        this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel9.SizeF = new System.Drawing.SizeF(116.4583F, 23F);
        this.xrLabel9.StylePriority.UseBorders = false;
        this.xrLabel9.StylePriority.UseFont = false;
        this.xrLabel9.Text = "From Unit";
        // 
        // xrLabel12
        // 
        this.xrLabel12.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel12.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(458.5019F, 174.1666F);
        this.xrLabel12.Name = "xrLabel12";
        this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel12.SizeF = new System.Drawing.SizeF(116.4583F, 23F);
        this.xrLabel12.StylePriority.UseBorders = false;
        this.xrLabel12.StylePriority.UseFont = false;
        this.xrLabel12.Text = "To Unit";
        // 
        // xrLabel10
        // 
        this.xrLabel10.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel10.Font = new System.Drawing.Font("Verdana", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(15.20833F, 333.5833F);
        this.xrLabel10.Name = "xrLabel10";
        this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel10.SizeF = new System.Drawing.SizeF(235.8333F, 23F);
        this.xrLabel10.StylePriority.UseBorders = false;
        this.xrLabel10.StylePriority.UseFont = false;
        this.xrLabel10.Text = "Items List";
        // 
        // xrDisplayTable
        // 
        this.xrDisplayTable.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
        this.xrDisplayTable.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
        | DevExpress.XtraPrinting.BorderSide.Right)
        | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrDisplayTable.BorderWidth = 1;
        this.xrDisplayTable.Font = new System.Drawing.Font("Times New Roman", 10F);
        this.xrDisplayTable.LocationFloat = new DevExpress.Utils.PointFloat(15.62504F, 356.5834F);
        this.xrDisplayTable.Name = "xrDisplayTable";
        this.xrDisplayTable.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
        this.xrDisplayTable.SizeF = new System.Drawing.SizeF(764.7524F, 25F);
        this.xrDisplayTable.StylePriority.UseBackColor = false;
        this.xrDisplayTable.StylePriority.UseBorders = false;
        this.xrDisplayTable.StylePriority.UseBorderWidth = false;
        this.xrDisplayTable.StylePriority.UseFont = false;
        this.xrDisplayTable.StylePriority.UseTextAlignment = false;
        this.xrDisplayTable.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrTableRow1
        // 
        this.xrTableRow1.BorderColor = System.Drawing.Color.Black;
        this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell7,
            this.xrTableCell8});
        this.xrTableRow1.Name = "xrTableRow1";
        this.xrTableRow1.StylePriority.UseBorderColor = false;
        this.xrTableRow1.Weight = 1D;
        // 
        // xrTableCell1
        // 
        this.xrTableCell1.BackColor = System.Drawing.Color.White;
        this.xrTableCell1.BorderColor = System.Drawing.Color.Black;
        this.xrTableCell1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell1.ForeColor = System.Drawing.Color.Black;
        this.xrTableCell1.Name = "xrTableCell1";
        this.xrTableCell1.StylePriority.UseBackColor = false;
        this.xrTableCell1.StylePriority.UseBorderColor = false;
        this.xrTableCell1.StylePriority.UseFont = false;
        this.xrTableCell1.StylePriority.UseForeColor = false;
        this.xrTableCell1.Text = "ItemCode";
        this.xrTableCell1.Weight = 0.73473386622633341D;
        // 
        // xrTableCell2
        // 
        this.xrTableCell2.BackColor = System.Drawing.Color.White;
        this.xrTableCell2.BorderColor = System.Drawing.Color.Black;
        this.xrTableCell2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell2.ForeColor = System.Drawing.Color.Black;
        this.xrTableCell2.Name = "xrTableCell2";
        this.xrTableCell2.StylePriority.UseBackColor = false;
        this.xrTableCell2.StylePriority.UseBorderColor = false;
        this.xrTableCell2.StylePriority.UseFont = false;
        this.xrTableCell2.StylePriority.UseForeColor = false;
        this.xrTableCell2.Text = "ItemName";
        this.xrTableCell2.Weight = 1.3163225330510531D;
        // 
        // xrTableCell7
        // 
        this.xrTableCell7.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
        this.xrTableCell7.Name = "xrTableCell7";
        this.xrTableCell7.StylePriority.UseFont = false;
        this.xrTableCell7.Text = "ReqQty";
        this.xrTableCell7.Weight = 1.2892312776875192D;
        // 
        // xrTableCell8
        // 
        this.xrTableCell8.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
        this.xrTableCell8.Name = "xrTableCell8";
        this.xrTableCell8.StylePriority.UseFont = false;
        this.xrTableCell8.Text = "SendQty";
        this.xrTableCell8.Weight = 0.33600162553766827D;
        // 
        // xrtoUnit
        // 
        this.xrtoUnit.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrtoUnit.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrtoUnit.LocationFloat = new DevExpress.Utils.PointFloat(574.9604F, 174.1666F);
        this.xrtoUnit.Name = "xrtoUnit";
        this.xrtoUnit.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrtoUnit.SizeF = new System.Drawing.SizeF(205.8337F, 23F);
        this.xrtoUnit.StylePriority.UseBorders = false;
        this.xrtoUnit.StylePriority.UseFont = false;
        this.xrtoUnit.Text = "xrtoUnit";
        // 
        // xrReqID
        // 
        this.xrReqID.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrReqID.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrReqID.LocationFloat = new DevExpress.Utils.PointFloat(577.1664F, 151.1667F);
        this.xrReqID.Name = "xrReqID";
        this.xrReqID.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrReqID.SizeF = new System.Drawing.SizeF(205.8337F, 23F);
        this.xrReqID.StylePriority.UseBorders = false;
        this.xrReqID.StylePriority.UseFont = false;
        this.xrReqID.Text = "xrReqID";
        // 
        // xrIssueDate
        // 
        this.xrIssueDate.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrIssueDate.Font = new System.Drawing.Font("Verdana", 8F);
        this.xrIssueDate.LocationFloat = new DevExpress.Utils.PointFloat(128.7504F, 151.1667F);
        this.xrIssueDate.Name = "xrIssueDate";
        this.xrIssueDate.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrIssueDate.SizeF = new System.Drawing.SizeF(205.8335F, 23F);
        this.xrIssueDate.StylePriority.UseBorders = false;
        this.xrIssueDate.StylePriority.UseFont = false;
        // 
        // xrLabel11
        // 
        this.xrLabel11.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel11.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(458.5019F, 151.1667F);
        this.xrLabel11.Name = "xrLabel11";
        this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel11.SizeF = new System.Drawing.SizeF(116.4586F, 22.99998F);
        this.xrLabel11.StylePriority.UseBorders = false;
        this.xrLabel11.StylePriority.UseFont = false;
        this.xrLabel11.Text = "Requisition ID";
        // 
        // xrLabel3
        // 
        this.xrLabel3.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel3.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(11.87519F, 151.1667F);
        this.xrLabel3.Name = "xrLabel3";
        this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel3.SizeF = new System.Drawing.SizeF(116.875F, 22.99998F);
        this.xrLabel3.StylePriority.UseBorders = false;
        this.xrLabel3.StylePriority.UseFont = false;
        this.xrLabel3.Text = "Issued Date";
        // 
        // xrLabel2
        // 
        this.xrLabel2.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel2.Font = new System.Drawing.Font("Bookman Old Style", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(160.6669F, 89.41679F);
        this.xrLabel2.Name = "xrLabel2";
        this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel2.SizeF = new System.Drawing.SizeF(414.1668F, 31.33333F);
        this.xrLabel2.StylePriority.UseBorders = false;
        this.xrLabel2.StylePriority.UseFont = false;
        this.xrLabel2.StylePriority.UseTextAlignment = false;
        this.xrLabel2.Text = "TRANSFER ITEMS";
        this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel4
        // 
        this.xrLabel4.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel4.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(22.49999F, 467F);
        this.xrLabel4.Name = "xrLabel4";
        this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel4.SizeF = new System.Drawing.SizeF(366.6667F, 23F);
        this.xrLabel4.StylePriority.UseBorders = false;
        this.xrLabel4.StylePriority.UseFont = false;
        this.xrLabel4.Text = "Security Gaurd Sign______________________";
        // 
        // xrLabel6
        // 
        this.xrLabel6.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel6.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
        this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(494.7917F, 467F);
        this.xrLabel6.Name = "xrLabel6";
        this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel6.SizeF = new System.Drawing.SizeF(281.4192F, 23F);
        this.xrLabel6.StylePriority.UseBorders = false;
        this.xrLabel6.StylePriority.UseFont = false;
        this.xrLabel6.Text = "IssuedBy Sign_______________________";
        // 
        // TopMargin
        // 
        this.TopMargin.HeightF = 8F;
        this.TopMargin.Name = "TopMargin";
        this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // BottomMargin
        // 
        this.BottomMargin.HeightF = 124F;
        this.BottomMargin.Name = "BottomMargin";
        this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // ReportHeader
        // 
        this.ReportHeader.BorderColor = System.Drawing.Color.Black;
        this.ReportHeader.HeightF = 13.29168F;
        this.ReportHeader.Name = "ReportHeader";
        this.ReportHeader.StylePriority.UseBorderColor = false;
        // 
        // ReportFooter
        // 
        this.ReportFooter.HeightF = 0F;
        this.ReportFooter.Name = "ReportFooter";
        // 
        // DeliveryGatePass1
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin,
            this.ReportHeader,
            this.ReportFooter});
        this.BorderColor = System.Drawing.Color.Red;
        this.Margins = new System.Drawing.Printing.Margins(19, 18, 8, 124);
        this.Version = "11.1";
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrDisplayTable)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

    }

    #endregion
}
