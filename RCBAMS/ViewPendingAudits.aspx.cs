using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;

public partial class ViewPendingAudits : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlDataAdapter da,da1;
    DataTable dt = new DataTable(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;

        }
        else
        {
            string query = "select AuditID from AuditMaster where AuditStatus='Active' except select distinct AuditID from AuditDetails ";
            da = new SqlDataAdapter(query, myConnection);
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    string AuditID = dt.Rows[i].ItemArray[0].ToString();
                    string query1 = "select * from AuditMaster inner join RCBAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID where AuditID='" + AuditID + "'";
                    da1 = new SqlDataAdapter(query1, myConnection);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {

                        string AuditName = dt1.Rows[0]["AuditName"].ToString();
                        string AuditDescription = dt1.Rows[0]["AuditDescription"].ToString();
                        string AuditBy = dt1.Rows[0]["AuditBy"].ToString();
                        string AuditDate = Convert.ToDateTime(dt1.Rows[0]["AuditDate"]).ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
                        string Location = dt1.Rows[0]["Location"].ToString();
                        //string Block = dt1.Rows[0]["BLOCK"].ToString();
                        //string LocationCode = dt1.Rows[0]["LocationCode"].ToString();
                        string Status = dt1.Rows[0]["Status"].ToString();
                        string AuditStatus = dt1.Rows[0]["AuditStatus"].ToString();

                        AddData(AuditID, AuditName, AuditDescription, AuditBy, AuditDate, Location,  Status, AuditStatus);

                    }

                }
            }
        }
    }

    private void AddData(string AuditID, string AuditName, string AuditDescription, string AuditBy, string AuditDate, string Location, string Status, string AuditStatus)
    {
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        if (AddTask != null)
        {
            AddTask.Rows.Add(AuditID, AuditName, AuditDescription, AuditBy, AuditDate, Location, Status, AuditStatus);
            ViewState["AddTask"] = AddTask;
            ASPxGridView2.DataSource = AddTask;
            ASPxGridView2.DataBind();
            ViewState["AddTask"] = AddTask as DataTable;
        }
        if (AddTask == null)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("AuditID");
            dt.Columns.Add("AuditName");
            dt.Columns.Add("AuditDescription");
            dt.Columns.Add("AuditBy");
            dt.Columns.Add("AuditDate");
            dt.Columns.Add("Location");
            dt.Columns.Add("Status");
            dt.Columns.Add("AuditStatus");
            
            dt.Rows.Add(AuditID, AuditName, AuditDescription, AuditBy, AuditDate, Location, Status, AuditStatus);
            ASPxGridView2.DataSource = dt;
            ASPxGridView2.DataBind();
            ViewState["AddTask"] = dt as DataTable;
        }
    }

    protected void btnexporttoxls_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.FileName = "PendingAudits";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.FileName = "PendingAudits";
        ASPxGridViewExporter1.MaxColumnWidth = 200;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.LeftMargin = ASPxGridViewExporter1.RightMargin = 2;
        ASPxGridViewExporter1.DataBind();
        ASPxGridViewExporter1.WritePdfToResponse();

        ASPxGridViewExporter1.WritePdfToResponse();
    }
}