using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Data;

/// <summary>
/// Summary description for PurchaseOrderReport
/// </summary>
public class PurchaseOrderReport : DevExpress.XtraReports.UI.XtraReport
{
	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
	private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRLabel xrLabel1;
    private XRLabel xrLabel2;
    private XRLabel xrTdate;
    private XRLabel xrLabel4;
    private XRLabel xrSdate;
    private XRLabel xrLabel6;
    private XRLabel xrEdate;
    private XRLabel xrCity;
    private XRLabel xrState;
    private XRLabel xrAddress1;
    private XRLabel xrName;
    private XRLabel xrCompanyName;
    private XRLabel xrsubject;
    private XRLabel xrLabel8;
    private XRLabel xrLabel27;
    private XRLabel xrLabel5;
    private XRTable xrTable1;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell2;
    private XRTableCell xrTableCell3;
    private XRTableCell xrTableCell4;
    private XRTableCell xrTableCell5;
    private XRLabel xrLabel9;
	/// <summary>
	/// Required designer variable.
	/// </summary>
	private System.ComponentModel.IContainer components = null;
    //private DataSet VenderDs;
    private DataTable dt;
    private XRLabel xrMobile;
    private XRLabel xrLabel3;
    private XRLine xrLine1;
    private XRLine xrLine2;
    private string[] Values;	

    public PurchaseOrderReport(DataTable dt, string[] Values)
    {
        InitializeComponent();
        // TODO: Complete member initialization
        //this.VenderDs = VenderDs;
        this.dt = dt;
        this.Values = Values;

        this.xrTdate.Text = Values[0];
        this.xrSdate.Text = Values[1];
        this.xrEdate.Text = Values[2];
        this.xrCompanyName.Text = Values[3];
        this.xrName.Text=Values[4];
        this.xrMobile.Text = Values[5];
        this.xrAddress1.Text=Values[6];
        this.xrCity.Text = Values[7];
        this.xrState.Text=Values[8];
        this.xrsubject.Text = Values[9];
        
     

        XRTableRow row;
        XRTableCell cell1;
        XRTableCell cell2;
        XRTableCell cell3;
        XRTableCell cell4;
        XRTableCell cell5;

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            row = new XRTableRow();
            {
                cell1 = new XRTableCell();
                row.Cells.SetChildIndex(cell1, 0);
                cell1.Text = dt.Rows[i][0].ToString();
                row.Cells.Add(cell1);
                cell1.WidthF = 100f;

                cell2 = new XRTableCell();
                row.Cells.SetChildIndex(cell2, 1);
                cell2.Text = dt.Rows[i][1].ToString();
                row.Cells.Add(cell2);
                cell2.WidthF = 100f;

                cell3 = new XRTableCell();
                row.Cells.SetChildIndex(cell3, 2);
                cell3.Text = dt.Rows[i][2].ToString();
                row.Cells.Add(cell3);
                cell3.WidthF = 200f;

                cell4 = new XRTableCell();
                row.Cells.SetChildIndex(cell4, 3);
                cell4.Text = dt.Rows[i][3].ToString();
                row.Cells.Add(cell4);
                cell4.WidthF = 100f;

                cell5 = new XRTableCell();
                row.Cells.SetChildIndex(cell5, 4);
                cell5.Text = dt.Rows[i][3].ToString();
                row.Cells.Add(cell5);
                cell5.WidthF = 100f;
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
            string resourceFileName = "PurchaseOrderReport.resx";
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.xrMobile = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
            this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
            this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell5 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrsubject = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel27 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrCity = new DevExpress.XtraReports.UI.XRLabel();
            this.xrState = new DevExpress.XtraReports.UI.XRLabel();
            this.xrAddress1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrName = new DevExpress.XtraReports.UI.XRLabel();
            this.xrCompanyName = new DevExpress.XtraReports.UI.XRLabel();
            this.xrEdate = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrSdate = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrTdate = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
            this.xrLine2 = new DevExpress.XtraReports.UI.XRLine();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLine1,
            this.xrLabel3,
            this.xrMobile,
            this.xrLabel9,
            this.xrTable1,
            this.xrsubject,
            this.xrLabel8,
            this.xrLabel27,
            this.xrLabel5,
            this.xrCity,
            this.xrState,
            this.xrAddress1,
            this.xrName,
            this.xrCompanyName,
            this.xrEdate,
            this.xrLabel6,
            this.xrSdate,
            this.xrLabel4,
            this.xrTdate,
            this.xrLabel2});
            this.Detail.HeightF = 450F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrMobile
            // 
            this.xrMobile.Font = new System.Drawing.Font("Calibri", 8F);
            this.xrMobile.LocationFloat = new DevExpress.Utils.PointFloat(0F, 151.4583F);
            this.xrMobile.Name = "xrMobile";
            this.xrMobile.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrMobile.SizeF = new System.Drawing.SizeF(100F, 17.79F);
            this.xrMobile.StylePriority.UseFont = false;
            this.xrMobile.Text = "xrMobile";
            // 
            // xrLabel9
            // 
            this.xrLabel9.Font = new System.Drawing.Font("Verdana", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(0F, 289.5417F);
            this.xrLabel9.Name = "xrLabel9";
            this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel9.SizeF = new System.Drawing.SizeF(153.125F, 23F);
            this.xrLabel9.StylePriority.UseFont = false;
            this.xrLabel9.Text = "PRODUCT LIST";
            // 
            // xrTable1
            // 
            this.xrTable1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 327.0833F);
            this.xrTable1.Name = "xrTable1";
            this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
            this.xrTable1.SizeF = new System.Drawing.SizeF(600F, 25F);
            this.xrTable1.StylePriority.UseBorders = false;
            this.xrTable1.StylePriority.UseTextAlignment = false;
            this.xrTable1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrTableRow1
            // 
            this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell3,
            this.xrTableCell4,
            this.xrTableCell5});
            this.xrTableRow1.Name = "xrTableRow1";
            this.xrTableRow1.Weight = 1D;
            // 
            // xrTableCell1
            // 
            this.xrTableCell1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell1.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrTableCell1.Name = "xrTableCell1";
            this.xrTableCell1.StylePriority.UseBorders = false;
            this.xrTableCell1.StylePriority.UseFont = false;
            this.xrTableCell1.StylePriority.UseTextAlignment = false;
            this.xrTableCell1.Text = "Product Id";
            this.xrTableCell1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell1.Weight = 1D;
            // 
            // xrTableCell2
            // 
            this.xrTableCell2.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell2.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrTableCell2.Name = "xrTableCell2";
            this.xrTableCell2.StylePriority.UseBorders = false;
            this.xrTableCell2.StylePriority.UseFont = false;
            this.xrTableCell2.StylePriority.UseTextAlignment = false;
            this.xrTableCell2.Text = "Product Code";
            this.xrTableCell2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell2.Weight = 1D;
            // 
            // xrTableCell3
            // 
            this.xrTableCell3.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell3.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrTableCell3.Name = "xrTableCell3";
            this.xrTableCell3.StylePriority.UseBorders = false;
            this.xrTableCell3.StylePriority.UseFont = false;
            this.xrTableCell3.StylePriority.UseTextAlignment = false;
            this.xrTableCell3.Text = "Product Name";
            this.xrTableCell3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell3.Weight = 1.9999999999999998D;
            // 
            // xrTableCell4
            // 
            this.xrTableCell4.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell4.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrTableCell4.Name = "xrTableCell4";
            this.xrTableCell4.StylePriority.UseBorders = false;
            this.xrTableCell4.StylePriority.UseFont = false;
            this.xrTableCell4.StylePriority.UseTextAlignment = false;
            this.xrTableCell4.Text = "Quantity";
            this.xrTableCell4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell4.Weight = 0.99999996019212811D;
            // 
            // xrTableCell5
            // 
            this.xrTableCell5.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell5.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrTableCell5.Name = "xrTableCell5";
            this.xrTableCell5.StylePriority.UseBorders = false;
            this.xrTableCell5.StylePriority.UseFont = false;
            this.xrTableCell5.StylePriority.UseTextAlignment = false;
            this.xrTableCell5.Text = "Amount";
            this.xrTableCell5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell5.Weight = 1.0000000206640107D;
            // 
            // xrsubject
            // 
            this.xrsubject.Font = new System.Drawing.Font("Calibri", 9.75F);
            this.xrsubject.LocationFloat = new DevExpress.Utils.PointFloat(37.5F, 191.6667F);
            this.xrsubject.Multiline = true;
            this.xrsubject.Name = "xrsubject";
            this.xrsubject.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrsubject.SizeF = new System.Drawing.SizeF(197.5003F, 23F);
            this.xrsubject.StylePriority.UseFont = false;
            this.xrsubject.StylePriority.UseTextAlignment = false;
            this.xrsubject.Text = "xrsubject";
            this.xrsubject.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrLabel8
            // 
            this.xrLabel8.Font = new System.Drawing.Font("Calibri", 10F);
            this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(0F, 229.1667F);
            this.xrLabel8.Name = "xrLabel8";
            this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel8.SizeF = new System.Drawing.SizeF(69.79165F, 23F);
            this.xrLabel8.StylePriority.UseFont = false;
            this.xrLabel8.Text = "Dear Sir,";
            // 
            // xrLabel27
            // 
            this.xrLabel27.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.xrLabel27.LocationFloat = new DevExpress.Utils.PointFloat(0F, 252.1667F);
            this.xrLabel27.Name = "xrLabel27";
            this.xrLabel27.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel27.SizeF = new System.Drawing.SizeF(594.3331F, 22.99998F);
            this.xrLabel27.StylePriority.UseFont = false;
            this.xrLabel27.Text = "We are pleased to sent you the  Purchase Order as requested by you.";
            // 
            // xrLabel5
            // 
            this.xrLabel5.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(0F, 191.6667F);
            this.xrLabel5.Name = "xrLabel5";
            this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel5.SizeF = new System.Drawing.SizeF(31.25F, 23F);
            this.xrLabel5.StylePriority.UseFont = false;
            this.xrLabel5.Text = "Sub:";
            // 
            // xrCity
            // 
            this.xrCity.CanShrink = true;
            this.xrCity.Font = new System.Drawing.Font("Calibri", 8F);
            this.xrCity.LocationFloat = new DevExpress.Utils.PointFloat(0F, 117.9583F);
            this.xrCity.Name = "xrCity";
            this.xrCity.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrCity.SizeF = new System.Drawing.SizeF(353.1248F, 15.70833F);
            this.xrCity.StylePriority.UseFont = false;
            this.xrCity.Text = "xrCity";
            // 
            // xrState
            // 
            this.xrState.Font = new System.Drawing.Font("Calibri", 8F);
            this.xrState.LocationFloat = new DevExpress.Utils.PointFloat(0F, 133.6666F);
            this.xrState.Name = "xrState";
            this.xrState.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrState.SizeF = new System.Drawing.SizeF(217.292F, 17.79167F);
            this.xrState.StylePriority.UseFont = false;
            this.xrState.Text = "xrState";
            // 
            // xrAddress1
            // 
            this.xrAddress1.Font = new System.Drawing.Font("Calibri", 8F);
            this.xrAddress1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 102.1667F);
            this.xrAddress1.Multiline = true;
            this.xrAddress1.Name = "xrAddress1";
            this.xrAddress1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrAddress1.SizeF = new System.Drawing.SizeF(267.292F, 15.79165F);
            this.xrAddress1.StylePriority.UseFont = false;
            this.xrAddress1.Text = "xrAddress";
            // 
            // xrName
            // 
            this.xrName.AutoWidth = true;
            this.xrName.Font = new System.Drawing.Font("Calibri", 8F);
            this.xrName.LocationFloat = new DevExpress.Utils.PointFloat(0F, 84.37503F);
            this.xrName.Name = "xrName";
            this.xrName.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrName.SizeF = new System.Drawing.SizeF(264.167F, 17.79166F);
            this.xrName.StylePriority.UseFont = false;
            this.xrName.Text = "xrName";
            // 
            // xrCompanyName
            // 
            this.xrCompanyName.Font = new System.Drawing.Font("Calibri", 8F);
            this.xrCompanyName.LocationFloat = new DevExpress.Utils.PointFloat(0F, 69.70834F);
            this.xrCompanyName.Name = "xrCompanyName";
            this.xrCompanyName.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrCompanyName.SizeF = new System.Drawing.SizeF(264.1671F, 14.66667F);
            this.xrCompanyName.StylePriority.UseFont = false;
            this.xrCompanyName.Text = "xrCompanyName";
            // 
            // xrEdate
            // 
            this.xrEdate.Font = new System.Drawing.Font("Calibri", 10F);
            this.xrEdate.LocationFloat = new DevExpress.Utils.PointFloat(350F, 32.99999F);
            this.xrEdate.Name = "xrEdate";
            this.xrEdate.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrEdate.SizeF = new System.Drawing.SizeF(81.25F, 23F);
            this.xrEdate.StylePriority.UseFont = false;
            this.xrEdate.Text = "xrEdate";
            // 
            // xrLabel6
            // 
            this.xrLabel6.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(221.875F, 33.00002F);
            this.xrLabel6.Name = "xrLabel6";
            this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel6.SizeF = new System.Drawing.SizeF(128.125F, 23F);
            this.xrLabel6.StylePriority.UseFont = false;
            this.xrLabel6.Text = "Contract End Date";
            // 
            // xrSdate
            // 
            this.xrSdate.Font = new System.Drawing.Font("Calibri", 10F);
            this.xrSdate.LocationFloat = new DevExpress.Utils.PointFloat(140.625F, 32.99999F);
            this.xrSdate.Name = "xrSdate";
            this.xrSdate.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrSdate.SizeF = new System.Drawing.SizeF(81.25F, 23F);
            this.xrSdate.StylePriority.UseFont = false;
            this.xrSdate.Text = "xrSdate";
            // 
            // xrLabel4
            // 
            this.xrLabel4.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(0F, 33.00002F);
            this.xrLabel4.Name = "xrLabel4";
            this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel4.SizeF = new System.Drawing.SizeF(140.625F, 23F);
            this.xrLabel4.StylePriority.UseFont = false;
            this.xrLabel4.Text = "Contract Start Date";
            // 
            // xrTdate
            // 
            this.xrTdate.Font = new System.Drawing.Font("Calibri", 10F);
            this.xrTdate.LocationFloat = new DevExpress.Utils.PointFloat(140.625F, 10.00001F);
            this.xrTdate.Name = "xrTdate";
            this.xrTdate.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrTdate.SizeF = new System.Drawing.SizeF(81.25F, 23F);
            this.xrTdate.StylePriority.UseFont = false;
            this.xrTdate.Text = "xrTdate";
            // 
            // xrLabel2
            // 
            this.xrLabel2.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(0F, 10.00001F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(140.625F, 23F);
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.Text = "Date ";
            // 
            // TopMargin
            // 
            this.TopMargin.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLine2,
            this.xrLabel1});
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrLabel1
            // 
            this.xrLabel1.Font = new System.Drawing.Font("Verdana", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(241.6666F, 44.00001F);
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(158.3334F, 23F);
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.StylePriority.UseTextAlignment = false;
            this.xrLabel1.Text = "PURCHASE ORDER ";
            this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // BottomMargin
            // 
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrLabel3
            // 
            this.xrLabel3.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(400F, 397.875F);
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 96F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(66.66666F, 23F);
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.Text = "Signature";
            // 
            // xrLine1
            // 
            this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(466.6667F, 397.875F);
            this.xrLine1.Name = "xrLine1";
            this.xrLine1.SizeF = new System.Drawing.SizeF(133.3333F, 23F);
            // 
            // xrLine2
            // 
            this.xrLine2.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 67.00001F);
            this.xrLine2.Name = "xrLine2";
            this.xrLine2.SizeF = new System.Drawing.SizeF(629.9999F, 23F);
            // 
            // PurchaseOrderReport
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
            this.Version = "11.1";
            ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}

	#endregion
}
