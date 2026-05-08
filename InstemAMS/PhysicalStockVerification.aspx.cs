using DevExpress.Web.ASPxGridView.Export;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PhysicalStockVerification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;

        }
        if (!IsPostBack)
        {
            Session["AuditID"] = "";
        }
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        if (gridlkup_Asset.Text == "")
        {
            Session["AuditID"] = "";
        }
        else
        {
            Session["AuditID"] = gridlkup_Asset.Value.ToString();
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Available Assets";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "Available Assets";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void txt_Locationid_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtblock.SelectedIndex = -1;
        txt_Lab.SelectedIndex = -1;
        gridlkup_Asset.SelectedIndex = -1;

        // Clear the data source of the grids
        Session["AuditID"] = "";
        ASPxGridView1.DataBind();

        Session["AuditID"] = "";
        ASPxGridView2.DataBind();
    }

    protected void txtblock_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_Lab.SelectedIndex = -1;
        gridlkup_Asset.SelectedIndex = -1;

        // Clear the data source of the grids
        Session["AuditID"] = "";
        ASPxGridView1.DataBind();

        Session["AuditID"] = "";
        ASPxGridView2.DataBind();
    }

    protected void txt_Lab_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridlkup_Asset.SelectedIndex = -1;

        // Clear the data source of the grids
        Session["AuditID"] = "";
        ASPxGridView1.DataBind();

        Session["AuditID"] = "";
        ASPxGridView2.DataBind();
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter2.FileName = "Missing Assets";
        ASPxGridViewExporter2.MaxColumnWidth = 200;
        ASPxGridViewExporter2.Landscape = true;
        ASPxGridViewExporter2.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter2.DataBind();
        ASPxGridViewExporter2.WritePdfToResponse();

        ASPxGridViewExporter2.WritePdfToResponse();
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter2.DataBind();
        ASPxGridViewExporter2.FileName = "Missing Assets";
        ASPxGridViewExporter2.WriteXlsToResponse();
    }

    protected void gridlkup_Asset_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Clear the data source of the grids
        Session["AuditID"] = "";
        ASPxGridView1.DataBind();

        Session["AuditID"] = "";
        ASPxGridView2.DataBind();
    }



    
}