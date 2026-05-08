using System;

using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class AuditCompletion : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        AuditDetails.Visible = false;
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (Audit_Gridlookup.Text == "")
        {

        }
        else
        {
            AuditDetails.Visible = true;
            string query = " select * from InstemAMS..AuditMaster left join InstemAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID where AuditID = '" + Audit_Gridlookup.Value  + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, myConnection);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lbl_Auditname.Text = dt.Rows[0]["AuditName"].ToString();
                lbl_Auditdesc.Text = dt.Rows[0]["AuditDescription"].ToString();
                lbl_Auditby.Text = dt.Rows[0]["AuditBy"].ToString();
                lbl_Auditlocation.Text = dt.Rows[0]["Location"].ToString();
                lbl_Auditdate.Text = dt.Rows[0]["AuditDate"].ToString();
                lbl_Auditstatus.Text = dt.Rows[0]["AuditStatus"].ToString();

            }
        }
    }

    protected void AuditComplete_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (Audit_Gridlookup.Text=="")
        {
            lbl_msg.Text = "Select Audit";
            lbl_msg.Visible = true;
            return;
        }
        if(cmb_completiondate.Text=="")
        {
            lbl_msg.Text = "Select Date";
            lbl_msg.Visible = true;
            return;
        }

        SqlCommand cmd = new SqlCommand("update AuditMaster set  Status=@Status,AuditStatus=@AuditStatus,CompletionDate=@CompletionDate,AdminRemarks=@AdminRemarks where AuditID=@AuditID", myConnection);
        cmd.Parameters.AddWithValue("@AuditID", Audit_Gridlookup.Value);
        cmd.Parameters.AddWithValue("@Status","Completed");
        cmd.Parameters.AddWithValue("@AuditStatus", "InActive");

        cmd.Parameters.AddWithValue("@CompletionDate", cmb_completiondate.Date);
        cmd.Parameters.AddWithValue("@AdminRemarks", txt_cmt.Text);
       
        try
        {
            myConnection.Open();
            cmd.ExecuteNonQuery();
            lbl_msg.Visible = true;
            lbl_msg.Text = "Data Updated Successfully";
            
            AuditList.DataBind();
            clear();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            myConnection.Close();
        }
    }

    private void clear()
    {
        Audit_Gridlookup.Value = "";
        cmb_completiondate.Text = "";
        txt_cmt.Text = "";
    }
}