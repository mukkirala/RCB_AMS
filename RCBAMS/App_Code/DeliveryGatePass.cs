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
public class DeliveryGatePass : DevExpress.XtraReports.UI.XtraReport
{
	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand Regional;
	private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private ReportHeaderBand ReportHeader;
    private ReportFooterBand ReportFooter;
    private XRLabel xrfromname;
    private XRLabel xrLabel9;
    private XRLabel xrDriverName;
    private XRLabel xrLabel8;
    private XRLabel xrVehicleNo;
    private XRLabel xrLabel1;
    private XRLabel xrLabel12;
    private XRLabel xrLabel10;
    private XRTable xrDisplayTable;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell2;
    private XRTableCell xrTableCell3;
    private XRLabel xrtoname;
    private XRLabel xrIssueDate;
    private XRLabel xrLabel3;
    private XRLine xrLine1;
    private XRLabel xrLabel2;
    private XRLabel xrLabel4;
    private XRLabel xrLabel6;
    private XRLabel xrReqID;
    private XRLabel xrLabel11;
    private XRLabel xrcontactno;
    private XRLabel xrLabel5;
    private XRTableCell xrTableCell4;
    private XRPictureBox xrPictureBox2;
    private XRLabel xrLabel7;
    private XRLabel xrLabel13;

    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    public DeliveryGatePass(DataTable ds1, string name, string contactno, string vehiclenumber, string drivername, string createdby, string receiptno,string Type,string to,string from)
	{
		InitializeComponent();
       // xrPictureBox1.ImageUrl = xrPictureBox1.ImageUrl = WebConfigurationManager.AppSettings.Get("Bibologo").ToString();
        xrLabel2.Text = Type;
        xrfromname.Text = createdby;
        xrIssueDate.Text = System.DateTime.Now.Date.ToString("dd-MM-yyyy");
        xrReqID.Text = receiptno;
        xrtoname.Text = name;       
        xrVehicleNo.Text = vehiclenumber;
        xrDriverName.Text = drivername;
        xrcontactno.Text = contactno;
        xrLabel12.Text = to;
        xrLabel9.Text = from;
        
        if (ds1.Rows.Count > 0)
        {

            for (int i = 0; i < ds1.Rows.Count; i++)
            {
                XRTableRow row = new XRTableRow();
                {
                    XRTableCell c1 = new XRTableCell();
                    c1.WidthF = 138.36F;
                    c1.Text = ds1.Rows[i].ItemArray[0].ToString();
                    row.Cells.Add(c1);

                    XRTableCell c2 = new XRTableCell();
                    c2.WidthF = 119.64F;
                    c2.Text = ds1.Rows[i].ItemArray[1].ToString();
                    row.Cells.Add(c2);

                    XRTableCell c3 = new XRTableCell();
                    c3.WidthF = 301.78F;
                    c3.Text = ds1.Rows[i].ItemArray[2].ToString();
                    row.Cells.Add(c3);

                    XRTableCell c4 = new XRTableCell();
                    c4.WidthF = 89.85F;
                    c4.Text = ds1.Rows[i].ItemArray[3].ToString();
                    row.Cells.Add(c4);

                    //xrDisplayTable.Rows.Add(row);

                }
                this.xrDisplayTable.Rows.Add(row);
            }
            this.xrDisplayTable.EndInit();
        }
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
            string resourceFileName = "DeliveryGatePass.resx";
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.Regional = new DevExpress.XtraReports.UI.TopMarginBand();
            this.xrPictureBox2 = new DevExpress.XtraReports.UI.XRPictureBox();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
            this.xrcontactno = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrfromname = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrDriverName = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrVehicleNo = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrDisplayTable = new DevExpress.XtraReports.UI.XRTable();
            this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
            this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrtoname = new DevExpress.XtraReports.UI.XRLabel();
            this.xrReqID = new DevExpress.XtraReports.UI.XRLabel();
            this.xrIssueDate = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.ReportHeader = new DevExpress.XtraReports.UI.ReportHeaderBand();
            this.ReportFooter = new DevExpress.XtraReports.UI.ReportFooterBand();
            this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
            ((System.ComponentModel.ISupportInitialize)(this.xrDisplayTable)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.HeightF = 202.0833F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // Regional
            // 
            this.Regional.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel13,
            this.xrLabel7,
            this.xrPictureBox2,
            this.xrLabel2,
            this.xrLine1});
            this.Regional.HeightF = 164.7917F;
            this.Regional.Name = "Regional";
            this.Regional.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Regional.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrPictureBox2
            // 
            this.xrPictureBox2.ImageUrl = "~\\Images\\rcblg.png";
            this.xrPictureBox2.LocationFloat = new DevExpress.Utils.PointFloat(42.58385F, 47.91667F);
            this.xrPictureBox2.Name = "xrPictureBox2";
            this.xrPictureBox2.SizeF = new System.Drawing.SizeF(122.3047F, 70.87502F);
            this.xrPictureBox2.Sizing = DevExpress.XtraPrinting.ImageSizeMode.Squeeze;
            // 
            // xrLabel2
            // 
            this.xrLabel2.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel2.Font = new System.Drawing.Font("Bookman Old Style", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(216.9837F, 120.875F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(294.9999F, 20.91666F);
            this.xrLabel2.StylePriority.UseBorders = false;
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.StylePriority.UseTextAlignment = false;
            this.xrLabel2.Text = "Dispatch Gate Pass";
            this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLine1
            // 
            this.xrLine1.BorderColor = System.Drawing.Color.Red;
            this.xrLine1.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(14.08288F, 141.7917F);
            this.xrLine1.Name = "xrLine1";
            this.xrLine1.SizeF = new System.Drawing.SizeF(689.1666F, 23F);
            this.xrLine1.StylePriority.UseBorderColor = false;
            this.xrLine1.StylePriority.UseBorders = false;
            // 
            // xrcontactno
            // 
            this.xrcontactno.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrcontactno.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrcontactno.LocationFloat = new DevExpress.Utils.PointFloat(542.7493F, 38.29181F);
            this.xrcontactno.Name = "xrcontactno";
            this.xrcontactno.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrcontactno.SizeF = new System.Drawing.SizeF(149.4587F, 23F);
            this.xrcontactno.StylePriority.UseBorders = false;
            this.xrcontactno.StylePriority.UseFont = false;
            this.xrcontactno.Text = "xrcontactno";
            // 
            // xrLabel5
            // 
            this.xrLabel5.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel5.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(419.6241F, 38.29181F);
            this.xrLabel5.Name = "xrLabel5";
            this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel5.SizeF = new System.Drawing.SizeF(122.9163F, 23F);
            this.xrLabel5.StylePriority.UseBorders = false;
            this.xrLabel5.StylePriority.UseFont = false;
            this.xrLabel5.Text = "Contact No.";
            // 
            // xrfromname
            // 
            this.xrfromname.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrfromname.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrfromname.LocationFloat = new DevExpress.Utils.PointFloat(543.8746F, 84.29184F);
            this.xrfromname.Name = "xrfromname";
            this.xrfromname.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrfromname.SizeF = new System.Drawing.SizeF(148.3334F, 23F);
            this.xrfromname.StylePriority.UseBorders = false;
            this.xrfromname.StylePriority.UseFont = false;
            this.xrfromname.Text = "xrfromname";
            // 
            // xrLabel9
            // 
            this.xrLabel9.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel9.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(419.7493F, 84.29184F);
            this.xrLabel9.Name = "xrLabel9";
            this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel9.SizeF = new System.Drawing.SizeF(124.1253F, 23F);
            this.xrLabel9.StylePriority.UseBorders = false;
            this.xrLabel9.StylePriority.UseFont = false;
            this.xrLabel9.Text = "SendBy";
            // 
            // xrDriverName
            // 
            this.xrDriverName.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrDriverName.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrDriverName.LocationFloat = new DevExpress.Utils.PointFloat(164.2089F, 63.37484F);
            this.xrDriverName.Name = "xrDriverName";
            this.xrDriverName.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrDriverName.SizeF = new System.Drawing.SizeF(148.3333F, 23.00002F);
            this.xrDriverName.StylePriority.UseBorders = false;
            this.xrDriverName.StylePriority.UseFont = false;
            this.xrDriverName.Text = "xrDriverName";
            // 
            // xrLabel8
            // 
            this.xrLabel8.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel8.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(42.58385F, 63.37484F);
            this.xrLabel8.Name = "xrLabel8";
            this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel8.SizeF = new System.Drawing.SizeF(121.6249F, 22.99995F);
            this.xrLabel8.StylePriority.UseBorders = false;
            this.xrLabel8.StylePriority.UseFont = false;
            this.xrLabel8.Text = "Driver Name";
            // 
            // xrVehicleNo
            // 
            this.xrVehicleNo.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrVehicleNo.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrVehicleNo.LocationFloat = new DevExpress.Utils.PointFloat(543.8746F, 61.29176F);
            this.xrVehicleNo.Name = "xrVehicleNo";
            this.xrVehicleNo.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrVehicleNo.SizeF = new System.Drawing.SizeF(148.3333F, 23F);
            this.xrVehicleNo.StylePriority.UseBorders = false;
            this.xrVehicleNo.StylePriority.UseFont = false;
            this.xrVehicleNo.Text = "xrVehicleNo";
            // 
            // xrLabel1
            // 
            this.xrLabel1.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel1.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(419.7493F, 61.29176F);
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(124.1253F, 23F);
            this.xrLabel1.StylePriority.UseBorders = false;
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.Text = "Vehicle No.";
            // 
            // xrLabel12
            // 
            this.xrLabel12.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel12.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(42.58385F, 40.37501F);
            this.xrLabel12.Name = "xrLabel12";
            this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel12.SizeF = new System.Drawing.SizeF(121.6249F, 23F);
            this.xrLabel12.StylePriority.UseBorders = false;
            this.xrLabel12.StylePriority.UseFont = false;
            this.xrLabel12.Text = "To Whom ";
            // 
            // xrLabel10
            // 
            this.xrLabel10.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel10.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(53.62544F, 118.9584F);
            this.xrLabel10.Name = "xrLabel10";
            this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel10.SizeF = new System.Drawing.SizeF(235.8333F, 23F);
            this.xrLabel10.StylePriority.UseBorders = false;
            this.xrLabel10.StylePriority.UseFont = false;
            this.xrLabel10.Text = "ASSETS LIST";
            // 
            // xrDisplayTable
            // 
            this.xrDisplayTable.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrDisplayTable.BorderWidth = 1;
            this.xrDisplayTable.LocationFloat = new DevExpress.Utils.PointFloat(53.62542F, 141.9583F);
            this.xrDisplayTable.Name = "xrDisplayTable";
            this.xrDisplayTable.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
            this.xrDisplayTable.SizeF = new System.Drawing.SizeF(649.6241F, 25F);
            this.xrDisplayTable.StylePriority.UseBackColor = false;
            this.xrDisplayTable.StylePriority.UseBorders = false;
            this.xrDisplayTable.StylePriority.UseBorderWidth = false;
            this.xrDisplayTable.StylePriority.UseTextAlignment = false;
            this.xrDisplayTable.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrTableRow1
            // 
            this.xrTableRow1.BorderColor = System.Drawing.Color.Black;
            this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell3,
            this.xrTableCell4});
            this.xrTableRow1.Name = "xrTableRow1";
            this.xrTableRow1.StylePriority.UseBorderColor = false;
            this.xrTableRow1.Weight = 1D;
            // 
            // xrTableCell1
            // 
            this.xrTableCell1.BackColor = System.Drawing.Color.Transparent;
            this.xrTableCell1.BorderColor = System.Drawing.Color.Black;
            this.xrTableCell1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrTableCell1.ForeColor = System.Drawing.Color.Black;
            this.xrTableCell1.Name = "xrTableCell1";
            this.xrTableCell1.StylePriority.UseBackColor = false;
            this.xrTableCell1.StylePriority.UseBorderColor = false;
            this.xrTableCell1.StylePriority.UseFont = false;
            this.xrTableCell1.StylePriority.UseForeColor = false;
            this.xrTableCell1.StylePriority.UseTextAlignment = false;
            this.xrTableCell1.Text = "BARCODE";
            this.xrTableCell1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell1.Weight = 0.68465929898348721D;
            // 
            // xrTableCell2
            // 
            this.xrTableCell2.BackColor = System.Drawing.Color.Transparent;
            this.xrTableCell2.BorderColor = System.Drawing.Color.Black;
            this.xrTableCell2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrTableCell2.ForeColor = System.Drawing.Color.Black;
            this.xrTableCell2.Name = "xrTableCell2";
            this.xrTableCell2.StylePriority.UseBackColor = false;
            this.xrTableCell2.StylePriority.UseBorderColor = false;
            this.xrTableCell2.StylePriority.UseFont = false;
            this.xrTableCell2.StylePriority.UseForeColor = false;
            this.xrTableCell2.StylePriority.UseTextAlignment = false;
            this.xrTableCell2.Text = "SAP NO";
            this.xrTableCell2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell2.Weight = 0.59204479727104664D;
            // 
            // xrTableCell3
            // 
            this.xrTableCell3.BackColor = System.Drawing.Color.Transparent;
            this.xrTableCell3.BorderColor = System.Drawing.Color.Black;
            this.xrTableCell3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrTableCell3.ForeColor = System.Drawing.Color.Black;
            this.xrTableCell3.Name = "xrTableCell3";
            this.xrTableCell3.StylePriority.UseBackColor = false;
            this.xrTableCell3.StylePriority.UseBorderColor = false;
            this.xrTableCell3.StylePriority.UseFont = false;
            this.xrTableCell3.StylePriority.UseForeColor = false;
            this.xrTableCell3.StylePriority.UseTextAlignment = false;
            this.xrTableCell3.Text = "ASSET DESCRIPTION";
            this.xrTableCell3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell3.Weight = 1.4933358961961754D;
            // 
            // xrTableCell4
            // 
            this.xrTableCell4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrTableCell4.Name = "xrTableCell4";
            this.xrTableCell4.StylePriority.UseFont = false;
            this.xrTableCell4.StylePriority.UseTextAlignment = false;
            this.xrTableCell4.Text = "QUANTITY";
            this.xrTableCell4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            this.xrTableCell4.Weight = 0.44459529963919309D;
            // 
            // xrtoname
            // 
            this.xrtoname.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrtoname.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrtoname.LocationFloat = new DevExpress.Utils.PointFloat(164.2089F, 40.37514F);
            this.xrtoname.Name = "xrtoname";
            this.xrtoname.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrtoname.SizeF = new System.Drawing.SizeF(148.3333F, 23F);
            this.xrtoname.StylePriority.UseBorders = false;
            this.xrtoname.StylePriority.UseFont = false;
            this.xrtoname.Text = "xrtoname";
            // 
            // xrReqID
            // 
            this.xrReqID.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrReqID.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrReqID.LocationFloat = new DevExpress.Utils.PointFloat(164.2089F, 2.791468F);
            this.xrReqID.Name = "xrReqID";
            this.xrReqID.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrReqID.SizeF = new System.Drawing.SizeF(147.9165F, 23F);
            this.xrReqID.StylePriority.UseBorders = false;
            this.xrReqID.StylePriority.UseFont = false;
            this.xrReqID.Text = "xrReqID";
            // 
            // xrIssueDate
            // 
            this.xrIssueDate.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrIssueDate.Font = new System.Drawing.Font("Verdana", 8F);
            this.xrIssueDate.LocationFloat = new DevExpress.Utils.PointFloat(543.6241F, 2.791468F);
            this.xrIssueDate.Name = "xrIssueDate";
            this.xrIssueDate.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrIssueDate.SizeF = new System.Drawing.SizeF(149.4587F, 23F);
            this.xrIssueDate.StylePriority.UseBorders = false;
            this.xrIssueDate.StylePriority.UseFont = false;
            // 
            // xrLabel11
            // 
            this.xrLabel11.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel11.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(42.16709F, 2.791468F);
            this.xrLabel11.Name = "xrLabel11";
            this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel11.SizeF = new System.Drawing.SizeF(122.0419F, 23F);
            this.xrLabel11.StylePriority.UseBorders = false;
            this.xrLabel11.StylePriority.UseFont = false;
            this.xrLabel11.Text = "Receipt Number";
            // 
            // xrLabel3
            // 
            this.xrLabel3.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel3.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(420.6241F, 2.791468F);
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(122.9163F, 23F);
            this.xrLabel3.StylePriority.UseBorders = false;
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.Text = "Issued Date";
            // 
            // xrLabel4
            // 
            this.xrLabel4.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel4.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(53.62542F, 219.0835F);
            this.xrLabel4.Name = "xrLabel4";
            this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel4.SizeF = new System.Drawing.SizeF(302.7923F, 23F);
            this.xrLabel4.StylePriority.UseBorders = false;
            this.xrLabel4.StylePriority.UseFont = false;
            this.xrLabel4.Text = "Security Gaurd Sign______________________";
            // 
            // xrLabel6
            // 
            this.xrLabel6.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel6.Font = new System.Drawing.Font("Verdana", 8F, System.Drawing.FontStyle.Bold);
            this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(399.167F, 219.0835F);
            this.xrLabel6.Name = "xrLabel6";
            this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel6.SizeF = new System.Drawing.SizeF(298.958F, 23F);
            this.xrLabel6.StylePriority.UseBorders = false;
            this.xrLabel6.StylePriority.UseFont = false;
            this.xrLabel6.Text = "IssuedBy Sign_______________________";
            // 
            // BottomMargin
            // 
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // ReportHeader
            // 
            this.ReportHeader.BorderColor = System.Drawing.Color.Black;
            this.ReportHeader.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel5,
            this.xrLabel11,
            this.xrLabel3,
            this.xrIssueDate,
            this.xrLabel12,
            this.xrtoname,
            this.xrLabel8,
            this.xrDriverName,
            this.xrReqID,
            this.xrcontactno,
            this.xrLabel1,
            this.xrVehicleNo,
            this.xrLabel9,
            this.xrfromname,
            this.xrDisplayTable,
            this.xrLabel10,
            this.xrLabel4,
            this.xrLabel6});
            this.ReportHeader.HeightF = 330.625F;
            this.ReportHeader.Name = "ReportHeader";
            this.ReportHeader.StylePriority.UseBorderColor = false;
            // 
            // ReportFooter
            // 
            this.ReportFooter.HeightF = 87.5F;
            this.ReportFooter.Name = "ReportFooter";
            // 
            // xrLabel7
            // 
            this.xrLabel7.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel7.Font = new System.Drawing.Font("Bookman Old Style", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(164.8885F, 63.41672F);
            this.xrLabel7.Name = "xrLabel7";
            this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel7.SizeF = new System.Drawing.SizeF(475.2242F, 27.16666F);
            this.xrLabel7.StylePriority.UseBorders = false;
            this.xrLabel7.StylePriority.UseFont = false;
            this.xrLabel7.StylePriority.UseTextAlignment = false;
            this.xrLabel7.Text = "Regional Centre for Biotechnology Faridabad";
            this.xrLabel7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel13
            // 
            this.xrLabel13.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel13.Font = new System.Drawing.Font("Bookman Old Style", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(180.5253F, 90.58337F);
            this.xrLabel13.Name = "xrLabel13";
            this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel13.SizeF = new System.Drawing.SizeF(400.9042F, 28.20832F);
            this.xrLabel13.StylePriority.UseBorders = false;
            this.xrLabel13.StylePriority.UseFont = false;
            this.xrLabel13.StylePriority.UseTextAlignment = false;
            this.xrLabel13.Text = "Material Management and Inventory Control";
            this.xrLabel13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // DeliveryGatePass
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Regional,
            this.Detail,
            this.BottomMargin,
            this.ReportHeader,
            this.ReportFooter});
            this.BorderColor = System.Drawing.Color.Red;
            this.Margins = new System.Drawing.Printing.Margins(58, 67, 165, 100);
            this.Version = "11.1";
            ((System.ComponentModel.ISupportInitialize)(this.xrDisplayTable)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}

	#endregion
}
