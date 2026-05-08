using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Collections;
public partial class DefectMaster : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    private const string PAGENAME = "Masters-Add_Defects";
    private const string PAGEURL = "DefectMaster.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        //ARP.BusinessLogic.Misc.Utilities.Authentication(PAGENAME, PAGEURL);     
        //string TaskType = WebConfigurationManager.AppSettings.Get("TaskType");
        //cmb_Dep.DataSource = TaskType.Split(',');
        cmb_Dep.DataBind();
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
          btn_save.Visible = true;
        }
        //if (Session["UserID"] != null)
        //{
        //   //cmb_createdby.Text = Session["UserID"].ToString();
        //}
        //else
        //{
        //    Response.Redirect("ErrorPage.aspx");
        //}
    }

    protected void clear()
    {
        TxtTaskName.Text = ""; cmb_Dep.Text = ""; Memo_Desc.Text = "";
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (TxtTaskName.Text == "")
        {
            
            Messages.SetErrorMessage("0068", null, null, null, Session);
            return;
        }
        if (cmb_Dep.Text == "")
        {
            Messages.SetErrorMessage("0050", null, null, null, Session);
            return;
        }
        string Query = "INSERT INTO TaskListMaster([TaskName],TaskDescription,TaskType,Status)values(@TaskName,@TaskDescription,@TaskType,@Status)";
        myCommand = new SqlCommand(Query,myConnection);
        myCommand.Parameters.AddWithValue("@TaskName", TxtTaskName.Text);
        myCommand.Parameters.AddWithValue("@TaskDescription", Memo_Desc.Text);
        myCommand.Parameters.AddWithValue("@TaskType", cmb_Dep.Text);
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("0059", null, Session);        
        clear();

    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            Session["TaskID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "TaskID").ToString();
            TxtTaskName.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "TaskName").ToString();
            Memo_Desc.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "TaskDescription").ToString();
            cmb_Dep.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "TaskType").ToString();
            btn_Update.Visible = true;
            btn_save.Visible = false;
        }
        if (btn == "Delete")
        {
            string defectID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "TaskID").ToString();
            //myCommand = new SqlCommand("Delete From [dbo].[BreakDownIssues] Where TaskID='" + defectID + "'", myConnection);
            //myConnection.Open();
            //myCommand.ExecuteNonQuery();
            //myConnection.Close();
            //myCommand = new SqlCommand("Delete From [dbo].[MaintenanceTransaction] Where TaskID='" + defectID + "'", myConnection);
            //myConnection.Open();
            //myCommand.ExecuteNonQuery();
            //myConnection.Close();

            //myCommand = new SqlCommand("Delete From [dbo].[JobMaster] Where TaskID='" + defectID + "'", myConnection);
            //myConnection.Open();
            //myCommand.ExecuteNonQuery();
            //myConnection.Close();
            myCommand = new SqlCommand("UPDATE [dbo].[TaskListMaster] SET Status='InActive' Where TaskID='" + defectID + "'", myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            Messages.SetSuccessMessage("0061", null, Session);
        }
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        if (TxtTaskName.Text == "")
        {
            Messages.SetErrorMessage("0068", null, null, null, Session);
            return;
        }
        if (cmb_Dep.Text == "")
        {
            Messages.SetErrorMessage("0050", null, null, null, Session);
            return;
        }
        myCommand = new SqlCommand("UPDATE  [dbo].[TaskListMaster]  SET TaskName='" + TxtTaskName.Text + "',TaskDescription='" + Memo_Desc.Text + "',TaskType='" + cmb_Dep.Text + "' Where TaskID='" + Session["TaskID"].ToString() + "'", myConnection);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        btn_Update.Visible = false;
        btn_save.Visible = true;
        Messages.SetSuccessMessage("0060", null, Session);
        clear();
    }

    
}