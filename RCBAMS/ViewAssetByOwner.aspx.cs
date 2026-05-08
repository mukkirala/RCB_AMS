using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAssetByOwner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.PageHeader.Center = "View Assets By Asset Owner";
        ASPxGridViewExporter1.FileName = "Assets by Owner";
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();
        // lblmsg.Text = "PDF is downloaded.";
        //string script = "window.onload = function() { showAlert('PDF is downloaded.'); };";
        //ClientScript.RegisterStartupScript(this.GetType(), "DownloadCompleteScript", script, true);
        //ScriptManager.RegisterStartupScript(this, GetType(), "alert", "showAlert('PDF is downloaded.');", true); // For PDF
        // ScriptManager.RegisterStartupScript(this, GetType(), "alert", "showAlert('Excel is downloaded.');", true); // For Excel
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "DownloadCompleteScript",
        //   "alert('PDF is downloaded.');", true);
        //        hdnExportType.Value = "PDF";
        //        string script = "alert('PDF is downloaded.');";
        //        ClientScript.RegisterStartupScript(this.GetType(), "PDFDownloadScript", script, true);
        lblmsg.Text = "PDF is downloaded.";
        //string script = "alert('PDF is downloaded.');";
        //script += "document.getElementById('" + lblmsg.ClientID + "').style.color = 'red';";
        //ClientScript.RegisterStartupScript(this.GetType(), "PDFDownloadScript", script, true);
        lblmsg.ForeColor = System.Drawing.Color.Red;
    }
    //}
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.FileName = "Assets by Owner";
        ASPxGridViewExporter1.WriteXlsToResponse();
        lblmsg.Text = "Excel  is downloaded.";
        // ScriptManager.RegisterStartupScript(this, GetType(), "alert", "showAlert('Excel is downloaded.');", true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "DownloadCompleteScript",
        //  "alert('Excel is downloaded.');", true);
        lblmsg.Text = "Excel is downloaded.";
        lblmsg.ForeColor = System.Drawing.Color.Blue;
        //string script = "alert('Excel is downloaded.');";
        //script += "document.getElementById('" + lblmsg.ClientID + "').style.color = 'blue';";
        //ClientScript.RegisterStartupScript(this.GetType(), "ExcelDownloadScript", script, true);
    }
}