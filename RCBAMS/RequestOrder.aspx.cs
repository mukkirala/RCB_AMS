using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DevExpress.Web.ASPxGridView;
using System.Web.DataAccess;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Imaging;
using System.Drawing;
using DevExpress.Web.ASPxUploadControl;
using System.Drawing.Drawing2D;
using System.IO;
using DevExpress.Web.ASPxEditors;
using System.Xml;
using System.Net.Mail;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraReports.UI.PivotGrid;
using DevExpress.XtraReports.Web;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrinting.Drawing;
using System.Runtime.InteropServices;
using System.Collections;
using DevExpress.SharePoint;

public partial class RequestOrder : System.Web.UI.Page
{
    static string myConnectionString = WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    SqlConnection myConnection = new SqlConnection(myConnectionString);
    SqlCommand myCommand;
    DataTable dt = new DataTable();
    DataTable dt1 = new DataTable();
    DataTable dt2 = new DataTable();
    DataTable ReOrderTable = new DataTable();
    string date = System.DateTime.Now.ToString("yyyy-MM-dd");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            //lbl_user.Text = Session["UserID"].ToString();
            //lbl_user.Text = Session["GodownName"].ToString();
            //lbl_unitname.Text = Session["UnitName"].ToString();
            //lbl_category.Text = Session["DivisionName"].ToString();


        }
        else
        {
            Response.Redirect("Errorpage.aspx");
        }
        //string DivisionName = Session["DivisionName"].ToString();

        lbldate.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");

        ASPxGridView1.DataSource = ViewState["Itemtbl"] as DataTable;
        ASPxGridView1.DataBind();


        //if (!IsPostBack)
        //{
        //    txtsubject.Text = WebConfigurationManager.AppSettings.Get("VEmailSubject");

        //    ASPxMemo1.Text = WebConfigurationManager.AppSettings.Get("VRStaticDataLocation");

        //}
    }

    protected void lbl_add_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        //if (ASPxGridLookup3.Text == "")
        //{
        //    //Messages.SetErrorMessage("2153", null, null, null, Session);
        //    lbl_error.Text = "Please Select Warehouse";
        //    return;
        //}
        //if (ASPxGridLookup1.Text == "")
        //{
        //   // Messages.SetErrorMessage("2147", null, null, null, Session);
        //    lbl_error.Text = "Please select Item";
        //    return;
        //}
        if (ASPxGridLookup1.Text == "")
        {
            lbl_error.Text = "Please Select ItemName";
            return;
        }
        if (Convert.ToInt32(txt_Qty.Text) <= 0)
        {
            lbl_error.Text = "Please enter alteast One Quantity ";
            return;
        }
        if (txt_Qty.Text == "")
        {
            txt_Qty.Text = "1";
        }
        string AssetID = ASPxGridLookup1.Value.ToString();

        string MainAssetNumber =
        ASPxGridLookup1.GridView.GetRowValues(
        ASPxGridLookup1.GridView.FocusedRowIndex,
        "MainAssetNumber").ToString();

        string AssetSubNumber =
        ASPxGridLookup1.GridView.GetRowValues(
        ASPxGridLookup1.GridView.FocusedRowIndex,
        "AssetSubNumber").ToString();

        string AssetDesc =
        ASPxGridLookup1.GridView.GetRowValues(
        ASPxGridLookup1.GridView.FocusedRowIndex,
        "AssetDesc").ToString();

        string SerialNumber =
        ASPxGridLookup1.GridView.GetRowValues(
        ASPxGridLookup1.GridView.FocusedRowIndex,
        "SerialNumber").ToString();

        string Location =
        ASPxGridLookup1.GridView.GetRowValues(
        ASPxGridLookup1.GridView.FocusedRowIndex,
        "Location").ToString();

        string Department =
        ASPxGridLookup1.GridView.GetRowValues(
        ASPxGridLookup1.GridView.FocusedRowIndex,
        "Department").ToString();

        BindItems(
            AssetID,
            MainAssetNumber,
            AssetSubNumber,
            AssetDesc,
            SerialNumber,
            Location,
            Department,
            txt_Qty.Text);

        Clear();
        ASPxGridLookup1.Focus();
    }
    protected void Clear()
    {
        ASPxGridLookup1.Value = -1;
        txt_Qty.Text = "";
    }
    protected void BindItems(
string AssetID,
string MainAssetNumber,
string AssetSubNumber,
string AssetDesc,
string SerialNumber,
string Location,
string Department,
string Qty)
    {
        DateTime date = System.DateTime.Now;

        DataTable newItemtbl = new DataTable();
        newItemtbl = ViewState["Itemtbl"] as DataTable;

        if (newItemtbl != null)
        {
            newItemtbl.Rows.Add(
                AssetID,
                MainAssetNumber,
                AssetSubNumber,
                AssetDesc,
                SerialNumber,
                Location,
                Department,
                Qty,
                date);

            Data(newItemtbl);
        }

        if (newItemtbl == null)
        {
            if (dt1.Columns.Count == 0)
            {
                Itemdate();
            }

            dt1.Rows.Add(
                AssetID,
                MainAssetNumber,
                AssetSubNumber,
                AssetDesc,
                SerialNumber,
                Location,
                Department,
                Qty,
                date);

            Data(dt1);
        }
    }
    protected void Data(DataTable dt)
    {
        DataView dv = dt.DefaultView;
        dv.Sort = "Date DESC";
        ASPxGridView1.DataSource = dv;
        ASPxGridView1.DataBind();
        ViewState["Itemtbl"] = dt as DataTable;
    }

    protected void btnsendmail_Click(object sender, EventArgs e)
    {
        if (ASPxMemo2.Text == "")
        {
            ASPxLabel2.Text = "Please write some Descripton";
            Messages.SetErrorMessage("2129", null, null, null, Session);
            return;
        }
        if (ASPxGridView1.VisibleRowCount <= 0)
        {
            lbl_error.Text = "Please Add Items";
            return;
        }
        int Count = 0;

        int Count1 = Save(Count);

        Count = getpdf(Count1);

        //if (Count > 2)
        //{
        //    string subject = txtsubject.Text.ToString();
        //    string body = ASPxMemo1.Text;
        //    try
        //    {
        //        string vendoremail = ASPxGridLookup3.GridView.GetRowValues(ASPxGridLookup3.GridView.FocusedRowIndex, "EmailId").ToString();
        //        string PID = Session["reqid"].ToString();
        //        Session["mail"] = vendoremail.ToString();
        //        int result=sendMail(vendoremail, subject, body, PID);
        //        if (result == 1)
        //        {
        //           // Messages.SetSuccessMessage("20013", null, Session);
        //        }
        //        else if(result==0)
        //        {
        //            Messages.SetSuccessMessage("2169", null, Session);
        //        }

        //    }

        //    catch
        //    {
        //       // ASPxGridView1.CallbackError = "function(s, e){alert('Session expired!'); location.href='Login.aspx';}";
        //        Messages.SetErrorMessage("2169", null, null, null, Session);
        //        return;
        //    }
        FullClear();
        ASPxLabel2.Text = "Requisition No:" + " " + " " + Session["reqid"] + "";
        //}
        //else
        //{
        //    Messages.SetErrorMessage("20012", null, null, null, Session);
        //    return;
        //}

    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        if (ASPxMemo2.Text == "")
        {
            Messages.SetErrorMessage("2129", null, null, null, Session);
            return;
        }
        int Count = 0;

        int Count1 = Save(Count);

        Count = getpdf(Count1);

        if (Count > 2)
        {
            Messages.SetSuccessMessage("30242", null, Session);
            FullClear();
            ASPxLabel2.Text = "Requisition No:" + " " + " " + Session["reqid"] + "";
        }
        else
        {
            Messages.SetErrorMessage("20012", null, null, null, Session);
            return;
        }


    }
    protected int Save(int reqidpt)
    {
        if (ASPxMemo2.Text == "")
        {
            ASPxLabel2.Text = "Please write some Description";
            return 0;
        }

        try
        {
            myConnection.Open();

            string query2 = "INSERT INTO POSRequisitionParent(Date,Description,sendby,Status,ReqSendBy) " +
                            "VALUES(@date,@Description,@sendby,@Status,@ReqSendBy) " +
                            "SELECT CAST(scope_identity() AS int)";

            myCommand = new SqlCommand(query2, myConnection);

            myCommand.Parameters.AddWithValue("@date", System.DateTime.Now);
            myCommand.Parameters.AddWithValue("@Description", ASPxMemo2.Text);
            myCommand.Parameters.AddWithValue("@sendby", lbl_user.Text);
            myCommand.Parameters.AddWithValue("@Status", "Requisition Sent to POadmin");
            myCommand.Parameters.AddWithValue("@ReqSendBy", Session["GodownID"].ToString());

            reqidpt = (Int32)myCommand.ExecuteScalar();

            Session["reqid"] = reqidpt;

            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                string AssetID = ASPxGridView1.GetRowValues(i, "AssetID").ToString();

                string Quantity =
                ASPxGridView1.GetRowValues(i, "RequiredQuantity").ToString();

                myCommand = new SqlCommand(
                "INSERT INTO POSRequisitionDetails(ReqID,ItemID,Quantity,Status) " +
                "VALUES (@ReqID,@ItemID,@Quantity,@Status)",
                myConnection);

                myCommand.Parameters.AddWithValue("@ReqID", reqidpt);
                myCommand.Parameters.AddWithValue("@ItemID", AssetID);
                myCommand.Parameters.AddWithValue("@Quantity", Quantity);
                myCommand.Parameters.AddWithValue("@Status", "Requisition Sent to POadmin");

                myCommand.ExecuteNonQuery();
            }

            myConnection.Close();

            return reqidpt;
        }
        catch (Exception ex)
        {
            myConnection.Close();
            lbl_error.Text = ex.Message;
            return 0;
        }
    }
    protected int getpdf(int count)
    {
        string requestid = count.ToString();

        Session["reqid"] = requestid;

        dt2 = ViewState["Itemtbl"] as DataTable;

        string[] values =
        {
        System.DateTime.Now.ToString("dd-MM-yyyy"),
        "",
        "",
        "",
        requestid,
        "",
        lbl_user.Text
    };

        RequestOrderReport report = new RequestOrderReport(dt2, values);

        report.CreateDocument();

        report.ExportToPdf(Server.MapPath(
        @"PdfReports//RequestOrder//Requestorder_" +
        requestid.Trim() + ".pdf"));

        Response.Write("<script>");
        Response.Write("window.open('RequestOrderPdf.aspx','_blank')");
        Response.Write("</script>");

        string Location =
        "Requestorder_" + requestid.Trim() + ".pdf";

        string UpdateQuery =
        "Update POSRequisitionParent Set Location='" +
        Location +
        "' Where ReqID='" +
        requestid + "' ";

        myConnection.Open();

        myCommand = new SqlCommand(UpdateQuery, myConnection);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        count = count + 1;

        return count;
    }
    //public int sendMail(String ClientEmailID, String subject, String body, String PID)
    //{
    //    SmtpClient client = new SmtpClient();
    //    MailMessage message = new MailMessage();
    //    string EmailHost = WebConfigurationManager.AppSettings.Get("EmailHost");
    //    client.Host = EmailHost;
    //    client.Port = 587;
    //    string EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
    //    string EmailFromName = WebConfigurationManager.AppSettings.Get("EmailFromName");
    //    MailAddress fromAddress = new MailAddress(EmailFromAddress, EmailFromName);
    //    message.From = fromAddress;
    //    message.To.Add(Session["mail"].ToString());
    //    message.Subject = subject;


    //    message.Attachments.Add(new Attachment(Server.MapPath(@"PdfReports//RequestOrder//Requestorder_" + PID + ".pdf")));


    //    if (txt_Cc.Text != "")
    //    {
    //        string cc = txt_Cc.Text;
    //        string[] CCId = cc.Split(',');

    //        foreach (string CCEmail in CCId)
    //        {
    //            message.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
    //        }
    //    }

    //    string bcc = WebConfigurationManager.AppSettings.Get("BCC");

    //    //if (txt_Bcc.Text != "")
    //    //{
    //    //   bcc = bcc + "," + txt_Bcc.Text;
    //    //    string[] bccid = bcc.Split(',');

    //    //    foreach (string bccEmailId in bccid)
    //    //    {
    //    //        message.Bcc.Add(new MailAddress(bccEmailId)); //Adding Multiple BCC email Id
    //    //    }
    //    //}
    //    //else
    //    //{

    //    //    string[] bccid = bcc.Split(',');

    //    //    foreach (string bccEmailId in bccid)
    //    //    {
    //    //        message.Bcc.Add(new MailAddress(bccEmailId)); //Adding Multiple BCC email Id
    //    //    }
    //    //}



    //    message.IsBodyHtml = false;
    //    message.Body = body;
    //    EmailFromAddress = WebConfigurationManager.AppSettings.Get("EmailFromAddress");
    //    string AppCredentialPassword = WebConfigurationManager.AppSettings.Get("CredentialPass");
    //    client.Credentials = new System.Net.NetworkCredential(EmailFromAddress, AppCredentialPassword);
    //    client.EnableSsl = false;

    //    try
    //    {
    //        client.Send(message);

    //        UpDateEmailStatus(PID);
    //        Response.Write("<script>");
    //        Response.Write("</script>");
    //        return 1;

    //    }
    //    catch (System.Net.Mail.SmtpException ex)
    //    {

    //        Messages.SetErrorMessage("20012", null, null, null, Session);
    //        return 0;

    //    }
    //}
    protected void UpDateEmailStatus(string PID)
    {

        try
        {


            String myInsertQuery = "UPDATE POSRequisitionParent set EmailStatus=@EmailStatus WHERE ReqID=@PID";
            myCommand = new SqlCommand(myInsertQuery, myConnection);
            myConnection.Open();
            myCommand.Parameters.AddWithValue("@EmailStatus", true);
            myCommand.Parameters.AddWithValue("@PID", PID);
            myCommand.ExecuteNonQuery();
            myCommand.Connection.Close();
        }
        catch (SqlException ex)
        {
            Messages.SetErrorMessage("20012", null, null, null, Session);
        }

    }


    protected void FullClear()
    {
        Clear();
        //txt_Bcc.Text = txt_Cc.Text = "";
        ASPxMemo2.Text = "";
        dt1 = new DataTable();
        ViewState["Itemtbl"] = dt1 as DataTable;
        dt2 = new DataTable();
        ViewState["Itemtbl2"] = dt2 as DataTable;
        //ASPxGridLookup3.Value = -1;
        ASPxGridView1.DataSource = null;
        ASPxGridView1.DataBind();
        Response.AppendHeader("Refresh", "10;url=RequestOrder.aspx");

    }
    protected void Itemdate()
    {
        dt1.Columns.Add("AssetID");
        dt1.Columns.Add("MainAssetNumber");
        dt1.Columns.Add("AssetSubNumber");
        dt1.Columns.Add("AssetDesc");
        dt1.Columns.Add("SerialNumber");
        dt1.Columns.Add("Location");
        dt1.Columns.Add("Department");
        dt1.Columns.Add("RequiredQuantity");
        dt1.Columns.Add("Date");
    }
    protected void Supplierdata()
    {
        dt2.Columns.Add("SupplierVendorID");
        dt2.Columns.Add("SupplierVendorName");
        dt2.Columns.Add("ContactPerson");
        dt2.Columns.Add("PhoneNumber");
        dt2.Columns.Add("EMailID");


    }
    protected void btn_Clear_Click(object sender, EventArgs e)
    {
        FullClear();
    }

    protected void ASPxGridView1_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        dt1 = ViewState["Itemtbl"] as DataTable;
        string btn = e.CommandArgs.CommandName.ToString();
        string AssetID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        if (btn == "Delete")
        {

            var row = dt1.Select("AssetID='" + AssetID + "'");

            foreach (var ro in row)
            {
                ro.Delete();
                dt1.AcceptChanges();
            }
            ViewState["Itemtbl"] = dt1 as DataTable;
            ASPxGridView1.DataSource = ViewState["Itemtbl"];
            ASPxGridView1.DataBind();
        }
    }
}