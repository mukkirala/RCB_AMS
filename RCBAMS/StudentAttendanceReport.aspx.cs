using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentAttendanceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_report_Click(object sender, EventArgs e)
    {
        string classid = cmb_class.Value.ToString();
        string Classname = cmb_class.Text;
        Session["ClassId"] = classid;
        string FacultyName = ASPxGridLookup1.Text.ToString();
        string facultyid = ASPxGridLookup1.Value.ToString();
        string rfid = ASPxGridLookup1.Text.ToString();
        string date = ASPxDateEdit1.Text.ToString();
        string MyConnectionstring = "";
        SqlCommand mycommand;
        SqlDataAdapter da;
        if (MyConnectionstring == "")
        {
            MyConnectionstring = WebConfigurationManager.ConnectionStrings["AttendanceManagementConnectionString"].ConnectionString;
        }
        //SqlConnection MyConnection = new SqlConnection(MyConnectionstring);
        //string selectQuery = "SELECT distinct [EmployeeID] as Facid, [FacultyName],[FacultyMaster].RFIDCardNumber FROM [dbo].[Employee_AttendanceMaster] inner join[FacultyMaster] on[Employee_AttendanceMaster].RFIDCardNumber =[FacultyMaster].RFIDCardNumber where RFIDCardNumber='"++"'";
        //mycommand = new SqlCommand(selectQuery, MyConnection);
        //mycommand.Connection.Open();
        //DataTable dt = new DataTable();
        //da = new SqlDataAdapter(mycommand);
        //da.Fill(dt);
        ////if(dt.Rows.Count>0)
        ////string ClassId = dt.Rows[0].ItemArray[6].ToString();
        //string selectQuery1 = "Select DISTINCT T1.StudentID,S.FirstName,S.LastName From ( select COUNT(*) totalAttandace, StudentID,periodID,ClassID,AcademicYear,MONTH(date) 'Month' from StudentAttendance A WHERE periodID='1'AND Ispresent='0' AND ClassID=Classid group By StudentID,periodID,ClassID,AcademicYear,MONTH(date) ) T1 Inner join StudentMaster S on T1.StudentID=S.EnrollNo WHERE T1.ClassID='" + classid + "' " + "AND" + " T1.AcademicYear='" + cmb_AcadmicYear.Text + "'";
        //mycommand = new SqlCommand(selectQuery1, MyConnection);
        ////mycommand.Connection.Open();
        //DataTable dt1 = new DataTable();
        //da = new SqlDataAdapter(mycommand);
        //da.Fill(dt1);
        //string selectQuery2 = "select *from WorkingDay";
        //mycommand = new SqlCommand(selectQuery2, MyConnection);
        //DataTable dt2 = new DataTable();
        //da = new SqlDataAdapter(mycommand);
        //da.Fill(dt2);


        ////string EnrollNo1 = dt.Rows[0].ItemArray[2].ToString();
        //string selectQ = "Select Standard,Section FROM ClassMaster WHERE ClassID='" + classid + "'";
        //mycommand = new SqlCommand(selectQ, MyConnection);
        //DataTable dt3 = new DataTable();
        //da = new SqlDataAdapter(mycommand);
        //da.Fill(dt3);

        //string Class = dt3.Rows[0].ItemArray[0].ToString();
        //string section = dt3.Rows[0].ItemArray[1].ToString();

        //ReportViewer1.CacheReportDocument += new CacheReportDocumentEventHandler(ReportViewer1_CacheReportDocument);
        //ReportViewer1.RestoreReportDocumentFromCache += new RestoreReportDocumentFromCacheEventHandler(ReportViewer1_RestoreReportDocumentFromCache);

        //string[] value = { Class, section };
        //string username = Session["UserID"].ToString();
        //report = new StudentAttendance_XtraReport(dt, dt1, dt2, value, username);

        //ReportViewer1.Report = report;
        //ReportToolbar1.ReportViewer = ReportViewer1;
        //ReportToolbar1.Visible = true;
        //report.CreateDocument();

        //string rPath = "D:\\T02\\FeeCollectionReport.Pdf";
        //report.ExportToPdf("D:\\T02\\FeeCollectionReport.Pdf");
        //PdfExportOptions pdfoption = report.ExportOptions.Pdf;
        //pdfoption.Compressed = true;
        //pdfoption.ImageQuality = PdfJpegImageQuality.Highest;
        //pdfoption.NeverEmbeddedFonts = "Tahoma;Courier New";
        //pdfoption.DocumentOptions.Application = "Test Application";
        //pdfoption.DocumentOptions.Author = "DX Documentation Team";
        //pdfoption.DocumentOptions.Keywords = "XtraReports, XtraPrinting";
        //pdfoption.DocumentOptions.Subject = "Test Subject";
        //pdfoption.DocumentOptions.Title = "Test Title";
        //Set the pages to be exported.
        //pdfoption.PageRange = "1, 3-7";
        //    report.ExportToPdf(Server.MapPath(@"PdfReports/ViewStudentAttendanceReport" + classid + ".pdf"));

        //    string reporturl = "~//PdfReports//ViewStudentAttendanceReport" + classid + ".pdf";
        //    Response.Write("<script>");
        //    Response.Write("window.open('StudentAttendancePdf.aspx','_blank')");
        //    Response.Write("</script>");
    }

    protected void ASPxGridLookup1_TextChanged(object sender, EventArgs e)
    {
        string rfid = ASPxGridLookup1.Text.ToString();
    }
}