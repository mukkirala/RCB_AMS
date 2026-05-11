using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalibrationColorCoding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void grid_view_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
    {
        if (e.RowType != GridViewRowType.Data)
            return;

        DateTime calibDue = Convert.ToDateTime(e.GetValue("CalibrationDue"));
        string status;

        if (calibDue < DateTime.Today)
        {
            status = "Overdue";
            e.Row.BackColor = System.Drawing.Color.Red;
            e.Row.ForeColor = System.Drawing.Color.White;
        }
        else if (calibDue >= DateTime.Today && calibDue <= DateTime.Today.AddDays(30))
        {
            status = "Falling";
            e.Row.BackColor = System.Drawing.Color.Orange;
            e.Row.ForeColor = System.Drawing.Color.White;
        }
        else
        {
            status = "Calibrated";
            e.Row.BackColor = System.Drawing.Color.LightGreen;
            e.Row.ForeColor = System.Drawing.Color.Black;
        }


    }


}