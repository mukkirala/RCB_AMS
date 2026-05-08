using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class ViewCalibrationHistory : System.Web.UI.Page
{
    private static string constring = WebConfigurationManager.ConnectionStrings["INSConnectionString"].ConnectionString;

    SqlConnection con = new SqlConnection(constring);
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["InstrumentID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.LeftMargin = 80;
        ASPxGridViewExporter1.RightMargin = 4;
        ASPxGridViewExporter1.PageHeader.Center = "Calibration History of the Instruments";
        ASPxGridViewExporter1.MaxColumnWidth = 180;
        // ASPxGridViewExporter1.GridViewID = ASPxGridView1;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.FileName = "CalibrationHistory";
        ASPxGridViewExporter1.WritePdfToResponse();
    }
    protected void btnXLSX_Click(object sender, EventArgs e)
    {

        ASPxGridViewExporter1.WriteXlsxToResponse();
    }

    protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "view")
        {
            string CalibrateHistoryID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CalibrateHistoryID").ToString();
            SqlDataAdapter SelectQery = new SqlDataAdapter("SELECT ReportPDF from CalibrationHistory where  CalibrateHistoryID='" + CalibrateHistoryID + "'", con);
            DataTable dt = new DataTable();
            SelectQery.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string path = dt.Rows[0].ItemArray[0].ToString();
                Session["CalibratePath"] = path;
                Response.Write("<script>");
                Response.Write("window.open('TempPage.aspx','_blank')");
                Response.Write("</script>");
            }
        }

    }

    protected void ASPxGridView1_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }

    protected void cmb_dept_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_Section.SelectedIndex = -1;
        cmb_instrumenttype.SelectedIndex = -1;
        cmb_instrument.SelectedIndex = -1;
    }

    protected void cmb_Section_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_instrumenttype.SelectedIndex = -1;
        cmb_instrument.SelectedIndex = -1;
    }

    protected void cmb_instrumenttype_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_instrument.SelectedIndex = -1;
    }
}