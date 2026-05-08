using System;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class UploadPastCalibrationCertificate : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["INSConnectionString"].ConnectionString);
    private SqlCommand myCommand;
    // private SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmb_instrumenttype_TextChanged(object sender, EventArgs e)
    {
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime Date = Convert.ToDateTime(date_calibration.Text);
            string rr = Date.ToString("yyyy-MM-dd");
            string period = "12";
            int callidays = int.Parse(period);
            DateTime ddt = Convert.ToDateTime(rr);
            DateTime ddtNew = ddt.AddMonths(callidays);
            DateTime date2 = Convert.ToDateTime(ddtNew);
            string nextdate = date2.ToString("yyyy-MM-dd");
            string lastdate=Date.ToString("yyyy-MM-dd");
            // Upload_image.SaveAs(Server.MapPath("~/InstrumentImages/") + Upload_image.PostedFile.FileName);

            //string path = "~\\PastCalibrationCertificates\\" + filename.Trim();
            // string data = "Update InstrumentMaster set PastCalibrationCertificate=@PastCalibrationCertificate where InstrumentID='" + cmb_instrument1.Value+"'";
            string data = "Insert into CalibrationHistory(InstrumentID,LastCalibrationDate,NextCalibrationDate,ReportPDF)values(@InstrumentID,@LastCalibrationDate,@NextCalibrationDate,@ReportPDF)"+"Select  Scope_identity()";
            myCommand = new SqlCommand(data, con);
            myCommand.Parameters.AddWithValue("@InstrumentID", cmb_instrument1.Value);
            myCommand.Parameters.AddWithValue("@LastCalibrationDate", Convert.ToDateTime(lastdate));
            myCommand.Parameters.AddWithValue("@NextCalibrationDate", Convert.ToDateTime(nextdate));
            myCommand.Parameters.AddWithValue("@ReportPDF", "");


            con.Open();
            int id=Convert.ToInt32(myCommand.ExecuteScalar());
            con.Close();
            string filename = FileUpload1.FileName;
            string extension = System.IO.Path.GetExtension(filename);

            string result = filename.Substring(0, filename.Length - extension.Length);
            string dd = result.Replace(result, "CalibrationCertificate");
            string result1 = dd + cmb_instrument1.Value+"_"+id;
            string resulte = dd + cmb_instrument1.Value + "_" + id + extension;
            byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(resulte);
            string base64pdf = Convert.ToBase64String(byteArray);
            ViewState["base64pdf"] = base64pdf;
            string path = string.Format(MapPath("//PdfReports//" + result1 + extension));
            string path1 = @"//PdfReports//" + result1 + extension;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("//PdfReports//" + result1 + extension));
           // string path1 = string.Format(Server.MapPath("//PdfReports//" + result1 + extension));
            string update = "Update CalibrationHistory Set ReportPDF=@path,ReportPDFbase64=@ReportPDFbase64 where  CalibrateHistoryID='" + id+"'";
           SqlCommand cmd = new SqlCommand(update, con);
            cmd.Parameters.AddWithValue("@path", path1);
            cmd.Parameters.AddWithValue("@ReportPDFbase64", base64pdf);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            // lblinfo.Text = " Uploaded Successfully ";
            cmb_instrument1.SelectedIndex = 0;
            Clear();
            lbl_msg.Text = "Data Uploaded Successfully!";
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void Clear()
    {
        cmb_dept.Text = "";
        cmb_Section.Text = "";
        cmb_instrumenttype.Text = "";
        cmb_instrument1.Text = "";
        date_calibration.Text = "";
    }

    protected void cmb_dept_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_Section.SelectedIndex = -1;
        cmb_instrumenttype.SelectedIndex = -1;
        cmb_instrument1.SelectedIndex = -1;
        date_calibration.Text = "";
    }

    protected void cmb_Section_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_instrumenttype.SelectedIndex = -1;
        cmb_instrument1.SelectedIndex = -1;
        date_calibration.Text = "";
    }

    protected void cmb_instrumenttype_SelectedIndexChanged(object sender, EventArgs e)
    {
        cmb_instrument1.SelectedIndex = -1;
        date_calibration.Text = "";
    }
}