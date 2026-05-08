using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting;
using System.Configuration;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Export;
using DevExpress.Utils.OAuth.Provider;

public partial class ViewAssetTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
    }

    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {

        ASPxGridViewExporter1.FileName = "AssetTypeWiseList";
        //ASPxGridViewExporter1.DataBind();
        //ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('PDF Downloaded Successfully.');", true);
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "AssetTypeWiseList";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}