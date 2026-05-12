using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Export;
using DevExpress.XtraGrid.Views.Grid;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalibrationColorCoding : System.Web.UI.Page
{

    public class EmailSettingsModel
    {
        public string SenderName { get; set; }
        public string SenderEmail { get; set; }
        public string SenderPassword { get; set; }
        public string HostName { get; set; }
        public int PortNumber { get; set; }
    }
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
    protected void mailsent_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            ASPxCheckBox chk = sender as ASPxCheckBox;

            if (chk == null)
                return;

            // Get the row container
            GridViewDataItemTemplateContainer container =
                chk.NamingContainer as GridViewDataItemTemplateContainer;

            if (container == null)
                return;

            int rowIndex = container.VisibleIndex;

            // Read row values
            string instrumentName = grid_view.GetRowValues(rowIndex, "MainAssetNumber").ToString();
            string emailID = grid_view.GetRowValues(rowIndex, "EmailID").ToString();
            string calibrationOwner = grid_view.GetRowValues(rowIndex, "CalibrationOwner").ToString();
            DateTime nextCalibrationDate = Convert.ToDateTime(grid_view.GetRowValues(rowIndex, "CalibrationDue"));

            // Email body
            string body =
                "Greetings!<br/><br/>" +
                "This is to inform that the following instrument(s) are due for calibration:<br/><br/>" +
                "<strong>Instrument Name:</strong> " + instrumentName + "<br/>" +
                "<strong>Email ID:</strong> " + emailID + "<br/>" +
                "<strong>Owner:</strong> " + calibrationOwner + "<br/>" +
                "<strong>Next Calibration Date:</strong> " + nextCalibrationDate.ToString("MM/dd/yyyy") + "<br/><br/>" +
                "Thank you,<br/>HAL Koraput Team.";

            // Send email (this calls your existing DB-based mail sender)
            sendMail(emailID, "Instrument Calibration Reminder", body);

            lbl_msg.Text = "Email sent to " + emailID;
        }
        catch (Exception ex)
        {
            lbl_msg.Text = "Error sending email: " + ex.Message;
        }
    }
    protected void sendMail(string toEmail, string subject, string body)
    {
        System.Net.ServicePointManager.SecurityProtocol =
            SecurityProtocolType.Tls13 | SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

        EmailSettingsModel settings = GetEmailSettings();

        if (settings == null)
        {
            lbl_msg.Text = "Error: No active email sender found in database.";
            return;
        }

        SmtpClient client = new SmtpClient
        {
            Host = settings.HostName,
            Port = settings.PortNumber,
            EnableSsl = true,
            Credentials = new NetworkCredential(settings.SenderEmail, settings.SenderPassword)
        };

        MailMessage message = new MailMessage
        {
            From = new MailAddress(settings.SenderEmail, settings.SenderName),
            Subject = subject,
            Body = body,
            IsBodyHtml = true
        };

        message.To.Add(toEmail);

        try
        {
            client.Send(message);
        }
        catch (SmtpException ex)
        {
            lbl_msg.Text = "Mail sending failed: " + ex.Message;
        }
    }

    public EmailSettingsModel GetEmailSettings()
    {
        EmailSettingsModel model = null;

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["INSConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT TOP 1 user_Name, user_EmailID, user_Password, host_Name, port_Name " +
                "FROM AddEmailUser WHERE user_Status = 'Active'", con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                model = new EmailSettingsModel
                {
                    SenderName = dr["user_Name"].ToString(),
                    SenderEmail = dr["user_EmailID"].ToString(),
                    SenderPassword = dr["user_Password"].ToString(),
                    HostName = dr["host_Name"].ToString(),
                    PortNumber = Convert.ToInt32(dr["port_Name"])
                };
            }
        }

        return model;
    }
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        grid_view.DataBind();
        mailSub();
        lbl_msg.Text = "Mail sent successfully";
    }
    protected void mailSub()
    {
        var selectedRows = grid_view.GetSelectedFieldValues("CalibrateHistoryID", "EmailID", "CalibrationOwner", "NextCalibrationDate");

        foreach (var row in selectedRows)
        {
            var rowArray = row as object[];
            if (rowArray != null)
            {
                string calibrateHistoryID = rowArray[0].ToString();
                string emailID = rowArray[1].ToString();
                string calibrationOwner = rowArray[2].ToString();
                DateTime nextCalibrationDate = Convert.ToDateTime(rowArray[3]);

                string body = "Greetings!<br/><br/>" +
                "The Instrument is ready for next Calibration.<br/><br/>" +
                "<strong>Owner Details:</strong><br/>" +
                "Calibrate History ID: " + calibrateHistoryID + "<br/>" +
                "Email ID: " + emailID + "<br/>" +
                "Calibration Owner: " + calibrationOwner + "<br/><br/>" +
                "Next Calibration Date: " + nextCalibrationDate.ToString("MM/dd/yyyy") + "<br/><br/>" +
                "Thank you,<br/>Best Regards,<br/>HAL Calibration Engineer.";

                sendMail(emailID, "Instrument Calibration Reminder", body);
            }
        }
    }


}