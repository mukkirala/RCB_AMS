using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;

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

    }

    protected void grid_view_HtmlRowPrepared(
        object sender,
        ASPxGridViewTableRowEventArgs e)
    {
        if (e.RowType != GridViewRowType.Data)
            return;

        object dueObj = e.GetValue("CalibrationDue");

        if (dueObj == null || dueObj == DBNull.Value)
            return;

        DateTime calibDue =
            Convert.ToDateTime(dueObj);

        if (calibDue < DateTime.Today)
        {
            e.Row.BackColor = Color.Red;
            e.Row.ForeColor = Color.White;
        }
        else if (calibDue <= DateTime.Today.AddDays(30))
        {
            e.Row.BackColor = Color.Orange;
            e.Row.ForeColor = Color.White;
        }
        else
        {
            e.Row.BackColor = Color.LightGreen;
            e.Row.ForeColor = Color.Black;
        }
    }

    protected void ASPxButton1_Click(
        object sender,
        EventArgs e)
    {
        lbl_msg.Text = "";

        try
        {
            SendSelectedMails();
        }
        catch (Exception ex)
        {
            lbl_msg.Text =
                "MAIN ERROR : <br/>" +
                ex.ToString();
        }
    }

    protected void SendSelectedMails()
    {
        int successCount = 0;
        int failCount = 0;
        bool anyRowSelected = false;

        for (int i = 0; i < grid_view.VisibleRowCount; i++)
        {
            ASPxCheckBox chk =
                grid_view.FindRowCellTemplateControl(
                    i,
                    null,
                    "mailsent") as ASPxCheckBox;

            if (chk != null && chk.Checked)
            {
                anyRowSelected = true;

                try
                {
                    string calibrationID =
                        Convert.ToString(
                            grid_view.GetRowValues(
                                i,
                                "CalibrationID"));

                    string assetID =
    Convert.ToString(
        grid_view.GetRowValues(
            i,
            "assetid"));

                    string mainAssetNumber =
                        Convert.ToString(
                            grid_view.GetRowValues(
                                i,
                                "MainAssetNumber"));

                    DateTime calibrationDue =
                        Convert.ToDateTime(
                            grid_view.GetRowValues(
                                i,
                                "CalibrationDue"));

                    if (string.IsNullOrWhiteSpace(assetID))
                    {
                        lbl_msg.Text +=
                            "<br/>AssetID Missing In Grid.";

                        failCount++;
                        continue;
                    }

                    string custodianID =
                        GetCustodianID(assetID);

                    if (string.IsNullOrWhiteSpace(custodianID))
                    {
                        lbl_msg.Text +=
                            "<br/>Custodian ID Not Found For Asset ID : " +
                            assetID;

                        failCount++;
                        continue;
                    }

                    string emailID =
                        GetCustodianMail(custodianID);

                    if (string.IsNullOrWhiteSpace(emailID))
                    {
                        lbl_msg.Text +=
                            "<br/>Email Not Found For Custodian ID : " +
                            custodianID;

                        failCount++;
                        continue;
                    }

                    string body =
                        "Greetings!<br/><br/>" +

                        "This is to inform that the following equipment is due for calibration." +

                        "<br/><br/>" +

                        "<strong>Calibration Details</strong><br/><br/>" +

                        "<strong>Calibration ID :</strong> " +
                        calibrationID + "<br/>" +

                        "<strong>Instrument Number :</strong> " +
                        mainAssetNumber + "<br/>" +

                        "<strong>Custodian ID :</strong> " +
                        custodianID + "<br/>" +

                        "<strong>Calibration Due Date :</strong> " +
                        calibrationDue.ToString("dd-MMM-yyyy") +

                        "<br/><br/>Please complete calibration before due date." +

                        "<br/><br/>Thank You,<br/>" +
                        "RCM Material Management and Inventory Control.";

                    bool result =
                        SendMail(
                            emailID,
                            "Equipment Calibration Reminder",
                            body);

                    if (result)
                    {
                        successCount++;
                    }
                    else
                    {
                        failCount++;
                    }
                }
                catch (Exception ex)
                {
                    failCount++;

                    lbl_msg.Text +=
                        "<br/>ROW ERROR : <br/>" +
                        ex.ToString();
                }
            }
        }

        if (!anyRowSelected)
        {
            lbl_msg.Text =
                "Please select atleast one row.";

            return;
        }

        if (failCount == 0)
        {
            lbl_msg.Text =
                "Mail Sent Successfully.";
        }
        else
        {
            lbl_msg.Text =
                "Mail Process Completed." +

                "<br/>Success : " + successCount +

                "<br/>Failed : " + failCount;
        }
    }

    public string GetCustodianID(
        string assetID)
    {
        string custodianID = "";

        try
        {
            using (SqlConnection con =
                new SqlConnection(
                    ConfigurationManager.ConnectionStrings[
                        "RCBSAPConnectionString"]
                        .ConnectionString))
            {
                string query =
                    "SELECT CustodianID " +
                    "FROM dbo.AssetMaster " +
                    "WHERE AssetID=@AssetID";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@AssetID",
                        assetID);

                    con.Open();

                    object result =
                        cmd.ExecuteScalar();

                    if (result != null &&
                        result != DBNull.Value)
                    {
                        custodianID =
                            result.ToString().Trim();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lbl_msg.Text +=
                "<br/>CUSTODIAN FETCH ERROR : <br/>" +
                ex.ToString();
        }

        return custodianID;
    }

    public string GetCustodianMail(
        string custodianID)
    {
        string email = "";

        try
        {
            using (SqlConnection con =
                new SqlConnection(
                    ConfigurationManager.ConnectionStrings[
                        "RCBAMSConnectionString"]
                        .ConnectionString))
            {
                string query =
                    "SELECT email " +
                    "FROM CustodianMaster " +
                    "WHERE CustodianID=@CustodianID";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@CustodianID",
                        custodianID);

                    con.Open();

                    object result =
                        cmd.ExecuteScalar();

                    if (result != null &&
                        result != DBNull.Value)
                    {
                        email =
                            result.ToString().Trim();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lbl_msg.Text +=
                "<br/>EMAIL FETCH ERROR : <br/>" +
                ex.ToString();
        }

        return email;
    }

    public EmailSettingsModel GetEmailSettings()
    {
        EmailSettingsModel model =
            new EmailSettingsModel();

        model.SenderName =
            ConfigurationManager.AppSettings[
                "EmailFromName"];

        model.SenderEmail =
            ConfigurationManager.AppSettings[
                "EmailFromAddress"];

        model.SenderPassword =
            ConfigurationManager.AppSettings[
                "AppCredentialPassword"];

        model.HostName =
            ConfigurationManager.AppSettings[
                "EmailHost"];

        model.PortNumber =
            Convert.ToInt32(
                ConfigurationManager.AppSettings[
                    "EmailPort"]);

        return model;
    }

    protected bool SendMail(
       string toEmail,
       string subject,
       string body)
    {
        try
        {
            SmtpClient client =
                new SmtpClient();

            MailMessage message =
                new MailMessage();

            string EmailHost =
                WebConfigurationManager.AppSettings.Get(
                    "EmailHost");

            client.Host = EmailHost;

            string EmailPort =
                WebConfigurationManager.AppSettings.Get(
                    "EmailPort");

            client.Port =
                int.Parse(EmailPort);

            string EmailFromAddress =
                WebConfigurationManager.AppSettings.Get(
                    "EmailFromAddress");

            string EmailFromName =
                WebConfigurationManager.AppSettings.Get(
                    "EmailFromName");

            MailAddress fromAddress =
                new MailAddress(
                    EmailFromAddress,
                    EmailFromName);

            message.From = fromAddress;

            message.To.Add(toEmail);

            message.Subject = subject;

            message.IsBodyHtml = true;

            message.Body = body;

            string AppCredentialPassword =
                WebConfigurationManager.AppSettings.Get(
                    "AppCredentialPassword");

            client.Credentials =
                new System.Net.NetworkCredential(
                    EmailFromAddress,
                    AppCredentialPassword);

            client.EnableSsl = true;

            client.Send(message);

            lbl_msg.Text =
                "Mail Sent Successfully.";

            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            lbl_msg.Text +=
                "<br/>SMTP ERROR : <br/>" +
                ex.ToString();

            return false;
        }
        catch (Exception ex)
        {
            lbl_msg.Text +=
                "<br/>GENERAL ERROR : <br/>" +
                ex.ToString();

            return false;
        }
    }

    protected void mailsent_CheckedChanged(
        object sender,
        EventArgs e)
    {

    }
}