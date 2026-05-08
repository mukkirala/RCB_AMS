using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalibrationStatusofInstrmentithColor : System.Web.UI.Page
{
    string nextdate;
    string todate;
    DateTime NextCalibrationDate;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void grid_view_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        if (e.RowType!=DevExpress.Web.ASPxGridView.GridViewRowType.Data)
        {
            return;
        }
        string InstrumentID = (e.GetValue("InstrumentID").ToString());
        string caldate = (e.GetValue("NextCalibrationDate").ToString());
        nextdate = "";
        int i = e.VisibleIndex;
       //int i= Convert.ToInt32(e.Row.ToString());
        if (caldate != "")
        {
             NextCalibrationDate = Convert.ToDateTime(caldate);
            nextdate = NextCalibrationDate.ToString("MM-yyyy");
        }
        DateTime todaydate = System.DateTime.Today;
        todate = todaydate.ToString("MM-yyyy");
        string date = todaydate.ToString("yyyy-MM-dd");
        string InstrumentStatus = (e.GetValue("InstrumentStatus").ToString());
        Label Status = (Label)grid_view.FindRowCellTemplateControl(i, grid_view.Columns["Status"] as GridViewDataColumn, "Label1");
        //string CalibrationStatus =(e.GetValue("CalibrationStatus").ToString());
        if (InstrumentStatus == "Un-Serviceable")
        {
            e.Row.BackColor = System.Drawing.Color.Red;
            // e.Row.BackColor = System.Drawing.Color.Cyan;

            Status.Text = "Un-Serviceable";
           // string status = (e.GetValue("NextCalibrationDate").ToString());

        }
        //else
        //if (InstrumentStatus == "Serviceable")
        //{
        //    e.Row.BackColor = System.Drawing.Color.Green;
        //}
        else
        if (nextdate == todate)
        {
            e.Row.BackColor = System.Drawing.Color.Yellow;
            Status.Text = "Calibration Falling this Month";
        }
        else
        if (NextCalibrationDate < todaydate)
        {
            e.Row.BackColor = System.Drawing.Color.Orange;
            Status.Text = "Calibration Past Due";
        }
        else
        if (NextCalibrationDate > todaydate)
        {
            e.Row.BackColor = System.Drawing.Color.FromName("#4fe84f");
            Status.Text = "Calibrated";
        }
        else
        {
            e.Row.BackColor = System.Drawing.Color.FromName("#4fe84f");
        }
    }

    protected void btnXLSX_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btnPDF_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WritePdfToResponse();
    }
}