using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Windows.Forms;

public partial class CreateAudit : System.Web.UI.Page
{

    static string cs = WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    SqlCommand cmd;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        //lbl_requestername.Text = Session["USR_NAME"].ToString();
        //reqid.Text = Session["UserID"].ToString();
        //reqdept.Text = Session["DepartmentName"].ToString();
        //reqdesign.Text = Session["DESIGNATION"].ToString();
        //reqdeptcode.Text = Session["DepartmentCode"].ToString();
        //AuditList.Visible = false;
        string ServiceType = WebConfigurationManager.AppSettings.Get("AuditStatus");
        cmb_status.DataSource = ServiceType.Split(',');
        cmb_status.DataBind();
        if (!IsPostBack)
        {
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lbl_Error.Visible = false;
        Lbl_Display.Visible = false;
        if (txtAuditName.Text == "")
        {
            lbl_Error.Text = "Enter Audit Name";
            lbl_Error.Visible = true;
            return;
        }
        if (cmb_status.Text == "")
        {
            lbl_Error.Text = "Select Status";
            lbl_Error.Visible = true;
            return;
        }

        if (cmb_location.Text == "")
        {
            lbl_Error.Text = "Select Wing";
            lbl_Error.Visible = true;
            return;
        }
        if (txt_AuditDiscription.Text == "")
        {
            lbl_Error.Text = "Enter Audit Description";
            lbl_Error.Visible = true;
            return;
        }
        //if (Cmb_AuditBy.Text == "")
        //{
        //    lbl_Error.Text = "Select Audit By";
        //    lbl_Error.Visible = true;
        //    return;
        //}

        string AuditName = txtAuditName.Text.ToString();
        cmd = new SqlCommand("insert into AuditMaster(AuditDate,AuditName,AuditDescription,Auditby,LocationID,Status,AuditStatus) values(@AuditDate,@AuditName,@AuditDescription,@AuditBy,@LocationID,@Status,@AuditStatus)", con);
        cmd.Parameters.AddWithValue("@AuditDate", System.DateTime.Now.ToString("yyyy-MM-dd"));
        cmd.Parameters.AddWithValue("@AuditName", AuditName);
        cmd.Parameters.AddWithValue("@AuditDescription", txt_AuditDiscription.Text);

        cmd.Parameters.AddWithValue("@LocationID", cmb_location.Value);
        cmd.Parameters.AddWithValue("@AuditBy", Session["UserID"].ToString());
        cmd.Parameters.AddWithValue("@Status", "Started");
        cmd.Parameters.AddWithValue("@AuditStatus", "Active");
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Lbl_Display.Visible = true;
            Lbl_Display.Text = "Data Saved Successfully";
            AuditList.Visible = true;
            AuditList.DataBind();
            clear();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

    }
    public void clear()
    {
        txtAuditName.Text = "";
        txt_AuditDiscription.Text = "";
        cmb_location.Value = "";
       
        cmb_status.Text = "";



    }

    protected void AuditList_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        lbl_Error.Visible = false;
        Lbl_Display.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();

        if (btn == "Edit")
        {
            string AuditID = AuditList.GetRowValuesByKeyValue(e.KeyValue, "AuditID").ToString();
            ViewState["AuditID"] = AuditID;
            txtAuditName.Text = AuditList.GetRowValuesByKeyValue(e.KeyValue, "AuditName").ToString();
            cmb_status.Text = AuditList.GetRowValuesByKeyValue(e.KeyValue, "AuditStatus").ToString();
            cmb_location.Value = AuditList.GetRowValuesByKeyValue(e.KeyValue, "LocationID").ToString();
            //Cmb_AuditBy.Text = AuditList.GetRowValuesByKeyValue(e.KeyValue, "EmployeeName").ToString();
            txt_AuditDiscription.Text = AuditList.GetRowValuesByKeyValue(e.KeyValue, "AuditDescription").ToString();
            btnUpdate.Visible = true;
            btnSave.Visible = false;
        }
        //if (btn == "Delete")
        //{
        //    string AuditID = AuditList.GetRowValuesByKeyValue(e.KeyValue, "AuditID").ToString();
        //    cmd = new SqlCommand("delete from AuditMaster where AuditID=@AuditID", con);
        //    cmd.Parameters.AddWithValue("@AuditID", AuditID);
        //    try
        //    {
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        //Lbl_Display.Visible = true;
        //        //Lbl_Display.Text = "Data Deleted Successfully";
        //        AuditList.Visible = true;
        //        AuditList.DataBind();

        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //    finally
        //    {
        //        con.Close();
        //    }


        //}
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lbl_Error.Visible = false;
        Lbl_Display.Visible = false;
        if (txtAuditName.Text == "")
        {
            lbl_Error.Text = "Enter Audit Name";
            lbl_Error.Visible = true;
            return;
        }
        if (cmb_status.Text == "")
        {
            lbl_Error.Text = "Select date";
            lbl_Error.Visible = true;
            return;
        }

        if (cmb_location.Text == "")
        {
            lbl_Error.Text = "Select Location";
            lbl_Error.Visible = true;
            return;
        }
        //if (Cmb_AuditBy.Text == "")
        //{
        //    lbl_Error.Text = "Select Audit By";
        //    lbl_Error.Visible = true;
        //    return;
        //}
        string AuditID = ViewState["AuditID"].ToString();
        cmd = new SqlCommand("update AuditMaster set  AuditName=@AuditName,AuditDescription=@AuditDescription,LocationID=@LocationID,AuditBy=@AuditBy,AuditStatus=@AuditStatus where AuditID=@AuditID", con);
        cmd.Parameters.AddWithValue("@AuditID", AuditID);
        cmd.Parameters.AddWithValue("@AuditName", txtAuditName.Text);
        cmd.Parameters.AddWithValue("@AuditDescription", txt_AuditDiscription.Text);

        cmd.Parameters.AddWithValue("@LocationID", cmb_location.Value);
        cmd.Parameters.AddWithValue("@AuditBy", Session["UserID"].ToString());
        cmd.Parameters.AddWithValue("@AuditStatus", cmb_status.Text);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Lbl_Display.Visible = true;
            Lbl_Display.Text = "Data Updated Successfully";
            AuditList.Visible = true;
            AuditList.DataBind();
            btnUpdate.Visible = false;
            btnSave.Visible = true;
            clear();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

    }
}