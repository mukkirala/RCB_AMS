using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using DevExpress.XtraCharts.Native;
using System.Web.UI.HtmlControls;

public partial class ApproverDashboard : System.Web.UI.Page
{
    static string myconnectionString = WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    SqlConnection con = new SqlConnection(myconnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            LoadPendingRequests();
        }
    }

    private void LoadPendingRequests()
    {
        try
        {
            string selectcmd = @"SELECT ReqID, 
                    Date as Date, 
                    Description, 
                    sendby , 
                    Status, 
                    CONCAT('Request:', Description) as text 
                    FROM POSRequisitionParent
                    WHERE Status IN ('Requisition Sent to POInc')
                    ORDER BY Date DESC";

            using (SqlCommand cmd = new SqlCommand(selectcmd, con))
            {
               // cmd.Parameters.AddWithValue("@GodownId", Session["GodownID"]);
                // Note: @DivisionID is not used in the SQL query, so don't add it as a parameter

                using (SqlDataAdapter daa = new SqlDataAdapter(cmd)) // Use cmd here, not selectcmd
                {
                    DataTable dtt = new DataTable();
                    daa.Fill(dtt);

                    if (dtt.Rows.Count > 0)
                    {
                        requestCount.InnerText = dtt.Rows.Count.ToString();
                        noRequests.Visible = false;

                        // Clear existing rows except header
                        myTable.Rows.Clear();

                        // Add header row
                        TableRow headerRow = new TableRow();
                        headerRow.CssClass = "table-header";

                        TableCell descHeader = new TableCell();
                        descHeader.Text = "Request Description";
                        descHeader.CssClass = "fw-bold";
                        headerRow.Cells.Add(descHeader);

                        TableCell dateHeader = new TableCell();
                        dateHeader.Text = "Date";
                        dateHeader.CssClass = "fw-bold";
                        headerRow.Cells.Add(dateHeader);

                        TableCell statusHeader = new TableCell();
                        statusHeader.Text = "Status";
                        statusHeader.CssClass = "fw-bold";
                        headerRow.Cells.Add(statusHeader);

                        myTable.Rows.Add(headerRow);

                        foreach (DataRow row in dtt.Rows)
                        {
                            TableRow tableRow = new TableRow();
                            tableRow.CssClass = "request-item";

                            // Description with link
                            TableCell descCell = new TableCell();
                            HyperLink link = new HyperLink();
                            link.Text = row["text"].ToString();
                            link.ID = row["ReqID"].ToString();
                            link.NavigateUrl = "~/ApprovePage.aspx?id=" + link.ID;
                            link.CssClass = "request-link";
                            descCell.Controls.Add(link);
                            tableRow.Cells.Add(descCell);

                            // Date
                            TableCell dateCell = new TableCell();
                            if (row["Date"] != DBNull.Value)
                            {
                                DateTime requestDate = Convert.ToDateTime(row["Date"]);
                                dateCell.Text = requestDate.ToString("MMM dd, yyyy HH:mm");
                            }
                            dateCell.CssClass = "request-date";
                            tableRow.Cells.Add(dateCell);

                            // Status badge
                            TableCell statusCell = new TableCell();
                            Label statusLabel = new Label();
                            statusLabel.Text = row["Status"].ToString();
                            statusLabel.CssClass = "badge badge-warning";
                            statusCell.Controls.Add(statusLabel);
                            tableRow.Cells.Add(statusCell);

                            myTable.Rows.Add(tableRow);
                        }
                    }
                    else
                    {
                        requestCount.InnerText = "0";
                        noRequests.Visible = true;
                        noRequests.Style["display"] = "block";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(@"Error loading pending requests: {ex.Message}");
            noRequests.Visible = true;
            noRequests.Style["display"] = "block";
            noRequests.InnerHtml = "<div class='text-center text-danger p-4'><i class='fas fa-exclamation-triangle fa-2x mb-3'></i><p>Error loading requests</p></div>";
        }
    }
}