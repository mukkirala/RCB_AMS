using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCalibrationEngineerSpecificDuration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        if (Start_Date.Text == "")
        {
            lbl_error.Text = "Please Select From Date";
            return;
        }
        if (To_Date.Text == "")
        {
            lbl_error.Text = "Please Select To Date";
            return;
        }
    }
}