using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;

/// <summary>
/// Summary description for MailSending
/// </summary>
public class MailSending
{
   static SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
   static  SqlConnection myConnectionString = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);

    public MailSending()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string GetReportingMail(string custid)
    {
        string rmail = "";
        string query = "SELECT email FROM [vEmpDtlsAssetApp] where CustodianID = '" + custid + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, myConnectionString);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            rmail = dt.Rows[0]["email"].ToString();
        }
        return rmail;       
    }
    public static string GetReportingName(string custid)
    {
        string name = "";
        string query = "SELECT CustodianName FROM [vEmpDtlsAssetApp] where CustodianID = '" + custid + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, myConnectionString);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            name = dt.Rows[0]["CustodianName"].ToString();
        }
        return name;
    }
    public static string GetAdminMail(string custid)
    {
        string rmail = "";
        string query = "SELECT email FROM [vEmpDtlsAssetApp] where CustodianID = '" + custid + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(query, myConnectionString);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        if (dt2.Rows.Count > 0)
        {
            rmail = dt2.Rows[0]["email"].ToString();
        }
        return rmail;
    }
    public static string GetAdminName(string custid)
    {
        string name = "";
        string query1 = "SELECT CustodianName FROM [vEmpDtlsAssetApp] where CustodianID = '" + custid + "'";
        SqlDataAdapter da1 = new SqlDataAdapter(query1, myConnectionString);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            name = dt1.Rows[0]["CustodianName"].ToString();
        }
        return name;
    }
    public static string GetRequesterMail(string custid)
    {
        string rmail = "";
        string query = "SELECT email FROM [vEmpDtlsAssetApp] where CustodianID = '" + custid + "'";
        SqlDataAdapter da3 = new SqlDataAdapter(query, myConnectionString);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            rmail = dt3.Rows[0]["email"].ToString();
        }
        return rmail;
    }
    public static string GetRequesterName(string custid)
    {
        string name = "";
        string query = "SELECT CustodianName FROM [vEmpDtlsAssetApp] where CustodianID = '" + custid + "'";
        SqlDataAdapter da4 = new SqlDataAdapter(query, myConnectionString);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        if (dt4.Rows.Count > 0)
        {
            name = dt4.Rows[0]["CustodianName"].ToString();
        }
        return name;
    }

    //mail with attachment
    public static Boolean sendMailAttach(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string approvername = GetReportingName(custodianid);
        string approvermail = GetReportingMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = approvermail;
       // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }     
        message.Subject = subject;
        message.IsBodyHtml = true;        
        string msg1 = "<h3>Dear " + approvername + ",</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() + "  click here" + "</a>" + "<br/>" + "" + msg5;       
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }

    public static Boolean AdminsendMailAttach(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        //string AdminName = GetAdminName(custodianid);
        string Adminmail = GetAdminMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = Adminmail;
        // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
         
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear Admin</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() + "  click here" + "</a>" + "<br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }
    public static Boolean RejectsendMailAttach(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string requestername = GetRequesterName(custodianid);
        string requestermail = GetRequesterMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = requestermail;
        // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear " + requestername + ",</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }

    public static bool SendMailComp(string custodianid, string subject, string body)
    {
        try
        {
            string approvermail = GetReportingMail(custodianid);
            SmtpClient client = new SmtpClient("172.195.126.161");
            client.Port = 25; // or the appropriate SMTP port for your Exchange Server configuration

 

            // Set the credentials for the Exchange Server
            NetworkCredential credentials = new NetworkCredential("assetadmin@bstc.bel.com", "P@ssword");
            client.Credentials = credentials;

 

            // Set the sender and recipient email addresses
            MailAddress fromAddress = new MailAddress("assetadmin@bstc.bel.com");
            MailAddress toAddress = new MailAddress(approvermail);

 

            // Create the MailMessage object
            MailMessage message = new MailMessage(fromAddress, toAddress);
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = true;

 

            // Send the email
            client.Send(message);

 

            return true;
        }
        catch (Exception ex)
        {
            // Handle any exceptions that occur during sending
            Console.WriteLine("Error sending email: " + ex.Message);
            return false;
        }
    }

    public static Boolean sendMailAttach1(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string approvername = GetReportingName(custodianid);
        string approvermail = GetReportingMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl); 
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = approvermail;
        // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear " + approvername + ",</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() + "  click here" + "</a>" + "<br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }
    public static Boolean sendMailToEmp(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string approvername = GetReportingName(custodianid);
        string approvermail = GetReportingMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = approvermail;
        // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear" + approvername + ",</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() + "  click here" + "</a>" + "<br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }
    public static Boolean sendMailToEng(String custodianid, String subject, String body)
    {

        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string approvername = GetReportingName(custodianid);
        string approvermail = GetReportingMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = approvermail;
        // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear " + approvername + ",</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() + "  click here" + "</a>" + "<br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }

    public static Boolean sendMailToApr(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string approvername = GetReportingName(custodianid);
        string approvermail = GetReportingMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//nrl
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);//neemus
        //client.EnableSsl = true;//neemus
        string appr = approvermail;
        // string appr = "vishnu.vardhan103@gmail.com";

        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear " + approvername + ",</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() + "  click here" + "</a>" + "<br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }
    public static Boolean sendMailBuy(String custodianid, String subject, String body)
    {
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc0 | 0x300 | 0xc00);
        string authname = GetReportingName(custodianid);
        string authmail = GetReportingMail(custodianid);

        SmtpClient client = new SmtpClient();
        MailMessage message = new MailMessage();
        string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
        string host = HttpContext.Current.Request.Url.Host;
        int port = HttpContext.Current.Request.Url.Port;
        // string Port = WebConfigurationManager.AppSettings.Get("EmailHost");
        string emailport = WebConfigurationManager.AppSettings.Get("EmailPort");
        client.Host = EmailHost;
        client.Port = Convert.ToInt32(emailport);

        string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
        MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
        message.From = fromAddress;
        EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
        string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("AppCredentialPassword");
        client.Credentials = new System.Net.NetworkCredential("EmailFromAddress", AppCredentialPassword);
        string mailSsl = WebConfigurationManager.AppSettings.Get("EnableSsl");
        client.EnableSsl = Convert.ToBoolean(mailSsl);
        //client.UseDefaultCredentials = true;
        string appr = authmail;
        //string appr = "puttasnehapriya@gmail.com;vishnu.vardhan103@gmail.com;devajit.jaradhara@nrl.co.in";
        foreach (var address in appr.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries))
        {
            message.To.Add(address);
        }
        message.Subject = subject;
        message.IsBodyHtml = true;
        string msg1 = "<h3>Dear " + authname + "</h3><br/>";
        string msg4 = body;
        string msg5 = "<br/><br/>" + " Thanks and Regards, <br/>" + "INSTEM Asset Track";
        message.Body = msg1 + "<br/>" + msg4 + " <br/>" + "http://" + host + ":" + port.ToString() +"click here" + "</a>" + "<br/>" + "" + msg5;
        try
        {
            client.Send(message);
            return true;
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            return false;
        }
    }

}