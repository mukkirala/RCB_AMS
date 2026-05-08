using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView.Export;

public partial class ViewLocationList : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        DataTable dtm = new DataTable();
        // exporting dept data code starts....
        string query = "select * from LocationMaster";
        da = new SqlDataAdapter(query, con);
        da.Fill(dtm);
        for (int i = 0; i < dtm.Rows.Count; i++)
        {
            string LocationID = dtm.Rows[i]["LocationID"].ToString();
            string Location = dtm.Rows[i]["Location"].ToString();
            string Block = dtm.Rows[i]["Block"].ToString();
            string LocationCode = dtm.Rows[i]["LocationCode"].ToString();
            cmd = new SqlCommand("IF(NOT EXISTS(SELECT * FROM LocationMaster WHERE LocationID = @LocationID))BEGIN INSERT INTO LocationMaster(LocationID,Location,Block,LocationCode)VALUES(@LocationID,@Location,@Block,@LocationCode)END", conAMS);
            cmd.Parameters.AddWithValue("@LocationID", LocationID);
            cmd.Parameters.AddWithValue("@Location", Location);
            cmd.Parameters.AddWithValue("@Block", Block);
            cmd.Parameters.AddWithValue("@LocationCode", LocationCode);
          
            conAMS.Open();
            cmd.ExecuteNonQuery();
            conAMS.Close();
        }
    }

    protected void btnexporttoxls_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "Location List";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Location List";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();
    }
}