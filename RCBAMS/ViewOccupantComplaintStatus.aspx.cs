using DevExpress.SharePoint;
using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Data.Sql;


public partial class ViewOccupantComplaintStatus : System.Web.UI.Page
{

    private static string connection = ConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString;
    private SqlConnection con = new SqlConnection(connection);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
        //SqlDataAdapter da = new SqlDataAdapter("select OccupantID from tblUSER where USR_ID='" + Session["UserID"] + "'", con);
        SqlDataAdapter da = new SqlDataAdapter("select AssetClassID from RCBAMS..[ComplaintRegistration] where EmployeeID='" + Session["EmployeeID"] + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
          
            Session["OccupantID"] = dt.Rows[0]["OccupantID"].ToString();
        }
    }
    protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }

    //protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    //{
    //    Session["ComplaintID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ComplaintID").ToString();
    //    Response.Redirect("~/GEPendingComplaintsDetails.aspx");
    //}

    //protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    //{
    //    string btn = e.CommandArgs.CommandName.ToString();
    //    if (btn == "Escalate")
    //    {
    //        Panel1.Visible = true;
    //        Session["ID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ComplaintID").ToString();
            



    //    }
    //}

    protected void btn_save_Click(object sender, EventArgs e)
    {
        if( escalateremarks.Text =="")
        {
            lbl_msg.Text = "Please enter description";
        }
        con.Open();

        SqlCommand cmd = new SqlCommand("Update ComplaintRegistration set Status = 'Escalated',EscalateRemarks='" + escalateremarks.Text + "' where ComplaintID = '" + Session["ID"] + "'", con);

        cmd.ExecuteNonQuery();
        SqlCommand cmd2 = new SqlCommand("Update ComplaintTransaction set Status = 'Escalated',EscalateRemarks='" + escalateremarks.Text + "'  where ComplaintID =  '" + Session["ID"] + "'", con);
        cmd2.ExecuteNonQuery();
        con.Close();
        escalateremarks.Text = "";
        Panel1.Visible = false;
        lbl_msg.Text = "Complaint Escalated Successfully";
       // Response.Redirect("~/ViewOccupantComplaintStatus.aspx");
    }

    protected void btnexporttoxls_Click(object sender, ImageClickEventArgs e)
    {
       
       
        ASPxGridViewExporter1.FileName = "All Complaits ";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    protected void btn_pdf_Click(object sender, ImageClickEventArgs e)
    {
       
        ASPxGridViewExporter1.FileName = " All Complaints  ";
        ASPxGridViewExporter1.MaxColumnWidth = 100;
        ASPxGridViewExporter1.WritePdfToResponse();
    }

  
    protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
    {
        ASPxGridView gridView = (ASPxGridView)sender;
        string AssetID = e.GetValue("ComplaintID").ToString();
        string Status = e.GetValue("Status").ToString();
       // string ComplaintStatus = e.GetValue("ComplaintStatus").ToString();
        if (e.DataColumn.FieldName == "Status")
        {
            if (Status == "Pending")
            {
                e.Cell.BackColor = System.Drawing.Color.Red;
            }
            else if (Status == "Resolved")
            {
                e.Cell.BackColor = System.Drawing.Color.Green;
            }
            else if (Status== "Work In Progress")
            {
                e.Cell.BackColor = System.Drawing.Color.Orange;
            }
       // }
        //if(e.DataColumn.FieldName == "ComplaintStatus")
        //{
             else if(Status == "Re_open")
            {
                e.Cell.BackColor = System.Drawing.Color. Yellow;
            }
            else if(Status == "Assign")
            {
                e.Cell.BackColor = System.Drawing.Color.Violet;
            }
        }
    }
}