using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class MonthWiseCalibrationSchedule : System.Web.UI.Page
{
    SqlConnection myconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["INSConnectionString"].ConnectionString);
    SqlConnection sqlcon = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
        Session["startdate"] = null;
        Session["enddate"] = null;
        }
    }


    protected void btn_search_Click(object sender, EventArgs e)
    {
       
      
        DateTime startdate = Convert.ToDateTime(dt_from.Text);
        DateTime enddate = Convert.ToDateTime(dt_to.Text);
        Session["startdate"] = startdate.Date;
        Session["enddate"] = enddate.Date;
        //ASPxGridView1.DataSource = null;
        //ASPxGridView1.DataBind();

    }
    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.LeftMargin = 80;
        ASPxGridViewExporter1.RightMargin = 4;
        ASPxGridViewExporter1.PageHeader.Center = "Month Wise Calibration Schedule";
        ASPxGridViewExporter1.MaxColumnWidth = 180;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.FileName = "MonthWiseSchedule";
        ASPxGridViewExporter1.WritePdfToResponse();
    }
    protected void btnXLSX_Click(object sender, EventArgs e)
    {

        ASPxGridViewExporter1.WriteXlsxToResponse();
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "view")
        {
            string LocURL = Request.Url.Host + ":" + Request.Url.Port.ToString();
            string LocAppPath = Request.ApplicationPath;
            string Loc = "";
            if (LocAppPath == "")
            {
                Loc = "http://" + LocURL + "/PdfReports/CalibrationCertificate" + ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentID").ToString() + ".pdf";
            }
            else
            {
                Loc = "http://" + LocURL + LocAppPath + "/PdfReports/CalibrationCertificate" + ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentID").ToString() + ".pdf";
            }

            Response.Write("<script>");
            string winopen = "window.open('" + Loc + "', '_blank')";
            // Response.Write("window.open(Loc,'_blank')");
            Response.Write(winopen);
            Response.Write("</script>");
        }
    }

    protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }

    protected void Work_Report_Excel_Click(object sender, EventArgs e)
    {

        ASPxGridViewExporter2.WriteXlsxToResponse();
    }

    protected void Work_Report_PDF_Click(object sender, EventArgs e)
    {
       
        ASPxGridViewExporter2.LeftMargin =100;
        ASPxGridViewExporter2.RightMargin = 100;
        ASPxGridViewExporter2.PageHeader.Center = "Month Wise work Report";
        ASPxGridViewExporter2.MaxColumnWidth =150;
        //ASPxGridViewExporter2.Landscape = true;
        ASPxGridViewExporter2.FileName = "MonthWiseWorkReport";
        ASPxGridViewExporter2.WritePdfToResponse();

    }
}