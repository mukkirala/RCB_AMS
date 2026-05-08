using System;

public partial class Site1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime date = System.DateTime.Now;

        lbl_duration.Text = "Login Time :" + date.ToString("dd-MM-yyyy hh:mm tt");
        string username, usertype;
        if (Session["UserID"] != null)
        {
            username = Session["USR_NAME"].ToString();
            User.Text = username;
            usertype = Session["USR_TYPE"].ToString();
           // usertype.Trim();
            if (usertype == "ADMIN")
            {
              //  Home.Visible = true;
                Dashboard.Visible = true;
                Instrument.Visible = true;
                Calibration.Visible = true;
                Reports.Visible = false;
                Masters.Visible = true;
                DailyReport.Visible = false;
                Administration.Visible = true;
                SignOut.Visible = true;
               

            }
            else if (usertype == "USER")
            {
               // Home.Visible = true;
                Dashboard.Visible = true;
                Instrument.Visible = false;
                Calibration.Visible = true;
                Reports.Visible = false;
                DailyReport.Visible = true;
                Masters.Visible = false;
                Administration.Visible = false;
                SignOut.Visible = true;
            }
            else
            {
                Response.Redirect("~/HomePage.aspx");
            }

        }
        }
}
