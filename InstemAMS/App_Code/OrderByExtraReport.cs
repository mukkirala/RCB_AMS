using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for OrderByReport
/// </summary>
public class OrderByExtraReport : DevExpress.XtraReports.UI.XtraReport
{
	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRTable xrTable1;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell2;
    private XRTableCell xrTableCell3;
    private XRTableCell xrTableCell4;
    private XRTableCell xrTableCell5;
    private XRTableCell xrTableCell6;
    private XRTableCell xrTableCell7;
    private XRTableCell xrTableCell8;
    private XRTableCell xrTableCell9;
    private XRTableCell xrTableCell10;
    private XRTableCell xrTableCell11;
    private XRTableCell xrTableCell12;
    private XRRichText xrRichText1;
    private XRControlStyle xrControlStyle1;
   
	/// <summary>
	/// Required designer variable.
	/// </summary>
	private System.ComponentModel.IContainer components = null;

    public OrderByExtraReport(DataTable dt)
    {
        InitializeComponent();
        //
        // TODO: Add constructor logic here
        //

        //this.xrTableCell2.Text = values[0];
        //this.xrTableCell4.Text = values[1];
        //this.xrTableCell6.Text = values[2];
        //this.xrTableCell8.Text = values[3];
        //this.xrTableCell10.Text = values[4];
        //this.xrTableCell12.Text = values[5];
        //this.xrTableCell14.Text = values[6];
        //this.xrTableCell18.Text = values[7];
        //this.xrTableCell20.Text = values[8];
        //this.xrTableCell21.Text = values[9];
        //this.xrTableCell23.Text = values[10];
        //this.xrTableCell25.Text = values[11];
        //this.xrTableCell27.Text = values[12];
        //this.xrTableCell29.Text = values[13];
        //this.xrTableCell31.Text = values[14];
        //this.xrTableCell33.Text = values[15];



        this.xrTable1.Borders = DevExpress.XtraPrinting.BorderSide.All;
        this.xrTable1.BeginInit();
        XRTableRow row;
        XRTableCell cell1;
        XRTableCell cell2;
        XRTableCell cell3;
        XRTableCell cell4;
        XRTableCell cell5;
        XRTableCell cell6;
        XRTableCell cell7;
        XRTableCell cell8;
        XRTableCell cell9;
        XRTableCell cell10;
        XRTableCell cell11;
        XRTableCell cell12;
      

        
       
        row = new XRTableRow();
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
                row.Cells.SetChildIndex(cell2, 1);
                cell2.Text = dt.Rows[i][1].ToString();
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

                cell5 = new XRTableCell();
                row.Cells.SetChildIndex(cell5, 4);
                cell5.Text = dt.Rows[i][4].ToString();
                row.Cells.Add(cell5);
                xrTableCell5.WidthF = 63f;

                cell6 = new XRTableCell();
                row.Cells.SetChildIndex(cell6, 5);
                cell6.Text = dt.Rows[i][5].ToString();
                row.Cells.Add(cell6);
                xrTableCell6.WidthF = 63f;

                cell7 = new XRTableCell();
                row.Cells.SetChildIndex(cell7, 6);
                cell7.Text = dt.Rows[i][6].ToString();
                row.Cells.Add(cell7);
                xrTableCell7.WidthF = 63f;

                cell8 = new XRTableCell();
                row.Cells.SetChildIndex(cell8, 7);
                cell8.Text = dt.Rows[i][7].ToString();
                row.Cells.Add(cell8);
                xrTableCell8.WidthF = 63f;

                cell9 = new XRTableCell();
                row.Cells.SetChildIndex(cell9, 8);
                cell9.Text = dt.Rows[i][8].ToString();
                row.Cells.Add(cell9);
                xrTableCell9.WidthF = 63f;

                cell10 = new XRTableCell();
                row.Cells.SetChildIndex(cell10, 9);
                cell10.Text = dt.Rows[i][9].ToString();
                row.Cells.Add(cell10);
                xrTableCell10.WidthF = 63f;

                cell11 = new XRTableCell();
                row.Cells.SetChildIndex(cell11, 10);
                cell11.Text = dt.Rows[i][10].ToString();
                row.Cells.Add(cell11);
                xrTableCell11.WidthF = 63f;

                cell12 = new XRTableCell();
                row.Cells.SetChildIndex(cell12, 11);
                cell12.Text = dt.Rows[i][11].ToString();
                row.Cells.Add(cell12);
                xrTableCell12.WidthF = 63f;

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
        string resourceFileName = "OrderByExtraReport.resx";
        System.Resources.ResourceManager resources = global::Resources.OrderByExtraReport.ResourceManager;
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell5 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell6 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell7 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell8 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell9 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell10 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell11 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell12 = new DevExpress.XtraReports.UI.XRTableCell();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.xrRichText1 = new DevExpress.XtraReports.UI.XRRichText();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        this.xrControlStyle1 = new DevExpress.XtraReports.UI.XRControlStyle();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrRichText1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrTable1});
        this.Detail.HeightF = 302.0833F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrTable1
        // 
        this.xrTable1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(223)))), ((int)(((byte)(223)))), ((int)(((byte)(223)))));
        this.xrTable1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(12.5F, 12.5F);
        this.xrTable1.Name = "xrTable1";
        this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
        this.xrTable1.SizeF = new System.Drawing.SizeF(811.5001F, 25F);
        this.xrTable1.StylePriority.UseBackColor = false;
        this.xrTable1.StylePriority.UseBorders = false;
        // 
        // xrTableRow1
        // 
        this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell3,
            this.xrTableCell4,
            this.xrTableCell5,
            this.xrTableCell6,
            this.xrTableCell7,
            this.xrTableCell8,
            this.xrTableCell9,
            this.xrTableCell10,
            this.xrTableCell11,
            this.xrTableCell12});
        this.xrTableRow1.Name = "xrTableRow1";
        this.xrTableRow1.Weight = 1D;
        // 
        // xrTableCell1
        // 
        this.xrTableCell1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTableCell1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell1.Name = "xrTableCell1";
        this.xrTableCell1.StylePriority.UseBorders = false;
        this.xrTableCell1.StylePriority.UseFont = false;
        this.xrTableCell1.Text = "Order No";
        this.xrTableCell1.Weight = 0.68749998252810152D;
        // 
        // xrTableCell2
        // 
        this.xrTableCell2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell2.Name = "xrTableCell2";
        this.xrTableCell2.StylePriority.UseFont = false;
        this.xrTableCell2.Text = "First Name";
        this.xrTableCell2.Weight = 0.854166709375747D;
        // 
        // xrTableCell3
        // 
        this.xrTableCell3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell3.Name = "xrTableCell3";
        this.xrTableCell3.StylePriority.UseFont = false;
        this.xrTableCell3.Text = "Last Name";
        this.xrTableCell3.Weight = 0.81249992312364239D;
        // 
        // xrTableCell4
        // 
        this.xrTableCell4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell4.Name = "xrTableCell4";
        this.xrTableCell4.StylePriority.UseFont = false;
        this.xrTableCell4.Text = "City";
        this.xrTableCell4.Weight = 0.65104178858168538D;
        // 
        // xrTableCell5
        // 
        this.xrTableCell5.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell5.Name = "xrTableCell5";
        this.xrTableCell5.StylePriority.UseFont = false;
        this.xrTableCell5.Text = "State";
        this.xrTableCell5.Weight = 0.49218749592322936D;
        // 
        // xrTableCell6
        // 
        this.xrTableCell6.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell6.Name = "xrTableCell6";
        this.xrTableCell6.StylePriority.UseFont = false;
        this.xrTableCell6.Text = "Mobile";
        this.xrTableCell6.Weight = 0.56380161518358662D;
        // 
        // xrTableCell7
        // 
        this.xrTableCell7.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell7.Name = "xrTableCell7";
        this.xrTableCell7.StylePriority.UseFont = false;
        this.xrTableCell7.Text = "Product";
        this.xrTableCell7.Weight = 0.67252595508371549D;
        // 
        // xrTableCell8
        // 
        this.xrTableCell8.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell8.Name = "xrTableCell8";
        this.xrTableCell8.StylePriority.UseFont = false;
        this.xrTableCell8.Text = "Quantity";
        this.xrTableCell8.Weight = 0.63834627690205981D;
        // 
        // xrTableCell9
        // 
        this.xrTableCell9.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell9.Name = "xrTableCell9";
        this.xrTableCell9.StylePriority.UseFont = false;
        this.xrTableCell9.Text = "Amount";
        this.xrTableCell9.Weight = 0.68917300654985869D;
        // 
        // xrTableCell10
        // 
        this.xrTableCell10.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell10.Name = "xrTableCell10";
        this.xrTableCell10.StylePriority.UseFont = false;
        this.xrTableCell10.Text = "Vendor";
        this.xrTableCell10.Weight = 0.57062930155752967D;
        // 
        // xrTableCell11
        // 
        this.xrTableCell11.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell11.Name = "xrTableCell11";
        this.xrTableCell11.StylePriority.UseFont = false;
        this.xrTableCell11.Text = "Logistix";
        this.xrTableCell11.Weight = 0.57177247242818718D;
        // 
        // xrTableCell12
        // 
        this.xrTableCell12.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrTableCell12.Name = "xrTableCell12";
        this.xrTableCell12.StylePriority.UseFont = false;
        this.xrTableCell12.Text = "AWB Number";
        this.xrTableCell12.Weight = 0.390053035861309D;
        // 
        // TopMargin
        // 
        this.TopMargin.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrRichText1});
        this.TopMargin.HeightF = 125F;
        this.TopMargin.Name = "TopMargin";
        this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrRichText1
        // 
        this.xrRichText1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(230)))), ((int)(((byte)(204)))));
        this.xrRichText1.LocationFloat = new DevExpress.Utils.PointFloat(162.5F, 10.00001F);
        this.xrRichText1.Name = "xrRichText1";
        this.xrRichText1.SerializableRtfString = resources.GetString("xrRichText1.SerializableRtfString");
        this.xrRichText1.SizeF = new System.Drawing.SizeF(476.6667F, 90F);
        this.xrRichText1.StylePriority.UseBackColor = false;
        // 
        // BottomMargin
        // 
        this.BottomMargin.HeightF = 203F;
        this.BottomMargin.Name = "BottomMargin";
        this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        // 
        // xrControlStyle1
        // 
        this.xrControlStyle1.Name = "xrControlStyle1";
        // 
        // OrderByExtraReport
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Margins = new System.Drawing.Printing.Margins(16, 0, 125, 203);
        this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
            this.xrControlStyle1});
        this.Version = "11.1";
        this.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.OrderByReport_BeforePrint);
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrRichText1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}

	#endregion

    private void OrderByReport_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {

    }

    private void xrLabel8_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {

    }
}
