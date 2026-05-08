using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCalibration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["INSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    static DataTable dt2;
    static DataTable dtTotalTask;
    static DataTable DtSchedule;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gridlkup_instrument_TextChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string slect = "select Description, SerialNo,ModelNo,Manufacturer,Location,Createddate   from InstrumentMaster where Status='Available' and InstrumentID='" + gridlkup_instrument.Value.ToString() + "' ";
        SqlDataAdapter da = new SqlDataAdapter(slect, con);
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            lbl_name.Text = dt.Rows[0]["Description"].ToString();
            lbl_manufacturer.Text = dt.Rows[0]["Manufacturer"].ToString();
            lbl_location.Text = dt.Rows[0]["Location"].ToString();
            lbl_calibration.Text = dt.Rows[0]["Createddate"].ToString();
            lbl_modelno.Text = dt.Rows[0]["ModelNo"].ToString();
            lbl_serial.Text = dt.Rows[0]["SerialNo"].ToString();

            //------------calibration_days--------------------

        

        }

    }

    protected void btn_addtask_Click(object sender, EventArgs e)
    {
        lbl_taskerror.Text = "";
        if (cmb_taskID.Text == "")
        {
            lbl_taskerror.Text = "Please select Task";
            return;
        }

        int ScheduleID = 0;
        DataTable Schedule = new DataTable();
        Schedule = ViewState["NewSchedule"] as DataTable;
        if (Schedule != null)
        {
            ScheduleID = 1 + Schedule.Rows.Count;
        }
        else if (Schedule == null)
        {
            ScheduleID = 1;
        }
        //Schedule Task List
        DataTable Addtask = new DataTable();
        Addtask = ViewState["AddTask"] as DataTable;
        if (Addtask != null)
        {
            var row = Addtask.Select("TaskID='" + cmb_taskID.Value + "'");
            if (row.Length == 1)
            {
                lbl_taskerror.Text = "This task is already assigned. Please Choose Another";
                memo_desc.Text = "";
                return;
            }
            else
            {
                Addtask.Rows.Add(cmb_taskID.Value, cmb_taskID.Text, Memo_Remark.Text);
                grid_task.DataSource = Addtask;
                grid_task.DataBind();
                ViewState["AddTask"] = Addtask as DataTable;
            }

        }
        else if (Addtask == null)
        {
            dt2 = new DataTable();
            dt2.Columns.Add("TaskID");
            dt2.Columns.Add("TaskName");
            dt2.Columns.Add("Remarks");
            dt2.Rows.Add(cmb_taskID.Value, cmb_taskID.Text, Memo_Remark.Text);
            grid_task.DataSource = dt2;
            grid_task.DataBind();
            ViewState["AddTask"] = dt2 as DataTable;
        }

        //TotalTask list

        DataTable TotalTasks = new DataTable();
        TotalTasks = ViewState["TotalTask"] as DataTable;
        if (TotalTasks != null)
        {
            TotalTasks.Rows.Add(ScheduleID, cmb_taskID.Value, cmb_taskID.Text, Memo_Remark.Text);
            ViewState["TotalTask"] = TotalTasks as DataTable;
        }
        else if (TotalTasks == null)
        {
            dtTotalTask = new DataTable();
            dtTotalTask.Columns.Add("ScheduleID");
            dtTotalTask.Columns.Add("TaskID");
            dtTotalTask.Columns.Add("TaskName");
            dtTotalTask.Columns.Add("Remarks");
            dtTotalTask.Rows.Add(ScheduleID, cmb_taskID.Value, cmb_taskID.Text, Memo_Remark.Text);
            ViewState["TotalTask"] = dtTotalTask as DataTable;
        }

        cmb_taskID.Value = cmb_taskID.Text = Memo_Remark.Text = "";
        cmb_taskID.Focus();
    }


    protected void RadioBtnLst_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioBtnLst.SelectedIndex == null || RadioBtnLst.SelectedIndex == -1)
        {
            Messages.SetErrorMessage("0021", null, null, null, Session);
            return;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Meter Reading")
        {
            lbl_meter.Visible = true;
            txt_meter.Visible = true;
            lbl_hour.Visible = false;
            time_dueHours.Visible = false;
            lbl_dueDate.Visible = false;
            date_dueDate.Visible = false;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Running hours")
        {
            lbl_hour.Visible = true;
            time_dueHours.Visible = true;
            lbl_dueDate.Visible = false;
            date_dueDate.Visible = false;
            lbl_meter.Visible = false;
            txt_meter.Visible = false;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Date")
        {
            lbl_dueDate.Visible = true;
            date_dueDate.Visible = true;
            lbl_meter.Visible = false;
            txt_meter.Visible = false;
            lbl_hour.Visible = false;
            time_dueHours.Visible = false;
        }
    }

    protected void grid_task_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Delete")
        {
            int s = e.VisibleIndex;
            DataTable dt2 = (DataTable)ViewState["AddTask"];
            dt2.Rows[s].Delete();
            grid_task.DataSource = dt2;
            grid_task.DataBind();
        }
    }

    protected void btn_AddSchedule_Click(object sender, EventArgs e)
    {
        lbl_taskerror.Text = "";
        if (grid_task.VisibleRowCount == 0)
        {
            lbl_taskerror.Text = "Please select atleast Task";
            //Messages.SetErrorMessage("0061", null, null, null, Session);
            return;
        }
        if (gridlkup_instrument.Text == "")
        {
            Messages.SetErrorMessage("0026", null, null, null, Session);
            return;
        }
        if (txt_schedulename.Text == "")
        {
            Messages.SetErrorMessage("0020", null, null, null, Session);
            return;
        }
        if (RadioBtnLst.SelectedIndex == null || RadioBtnLst.SelectedIndex == -1)
        {
            Messages.SetErrorMessage("0021", null, null, null, Session);
            return;
        }
        else
        {
            if (RadioBtnLst.SelectedItem.Text == "Meter Reading" && txt_meter.Text == "")
            {
                Messages.SetErrorMessage("0022", null, null, null, Session);
                return;
            }
            else if (RadioBtnLst.SelectedItem.Text == "Running hours" && time_dueHours.Text == "")
            {
                Messages.SetErrorMessage("0023", null, null, null, Session);
                return;
            }
            else if (RadioBtnLst.SelectedItem.Text == "Date" && date_dueDate.Text == "")
            {
                Messages.SetErrorMessage("0024", null, null, null, Session);
                return;
            }
        }
        string value = "";
        if (RadioBtnLst.SelectedItem.Text == "Meter Reading")
        {
            value = txt_meter.Text;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Running hours")
        {
            value = time_dueHours.Text;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Date")
        {
            value = date_dueDate.Text;
        }

        DataTable NewSchedule = new DataTable();
        NewSchedule = ViewState["NewSchedule"] as DataTable;
        if (NewSchedule != null)
        {
            int scheduleid = 1 + NewSchedule.Rows.Count;
            NewSchedule.Rows.Add(scheduleid, txt_schedulename.Text, RadioBtnLst.SelectedItem.Text, value, memo_desc.Text,"");//, cmb_createdby.Text);
            ViewState["NewSchedule"] = NewSchedule;
            grdvew_Schedule.DataSource = NewSchedule;
            grdvew_Schedule.DataBind();
            ViewState["NewSchedule"] = NewSchedule as DataTable;
        }
        if (NewSchedule == null)
        {
            DtSchedule = new DataTable();
            DtSchedule.Columns.Add("ScheduleID");
            DtSchedule.Columns.Add("ScheduleName");
            DtSchedule.Columns.Add("ScheduleCriteria");
            DtSchedule.Columns.Add("Value");
            DtSchedule.Columns.Add("Description");
            DtSchedule.Columns.Add("CreatedBy");
            DtSchedule.Rows.Add(1, txt_schedulename.Text, RadioBtnLst.SelectedItem.Text, value, memo_desc.Text,""); //,cmb_createdby.Text);
            grdvew_Schedule.DataSource = DtSchedule;
            grdvew_Schedule.DataBind();
            ViewState["NewSchedule"] = DtSchedule as DataTable;
        }
        Clear();
        txt_schedulename.Focus();

    }
    protected void Clear()
    {
        txt_meter.Text = time_dueHours.Text = txt_schedulename.Text = memo_desc.Text = "";
        date_dueDate.Text = "";
        if (RadioBtnLst.SelectedItem.Text == "Meter Reading")
        {
            lbl_meter.Visible = false;
            txt_meter.Visible = false;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Running hours")
        {
            lbl_hour.Visible = false;
            time_dueHours.Visible = false;
        }
        else if (RadioBtnLst.SelectedItem.Text == "Date")
        {
            lbl_dueDate.Visible = false;
            date_dueDate.Visible = false;
        }
        RadioBtnLst.SelectedIndex = -1;
        dt2 = new DataTable();
        ViewState["AddTask"] = null;
        grid_task.DataSource = dt2;
        grid_task.DataBind();
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            if (gridlkup_instrument.Text == "")
            {
                Messages.SetErrorMessage("0026", null, null, null, Session);
                return;
            }
            string CreatedBy = "";
            con.Open();
            for (int i = 0; i < grdvew_Schedule.VisibleRowCount; i++)
            {
                string ScheduleID = grdvew_Schedule.GetRowValues(i, "ScheduleID").ToString();
                string schedulename = grdvew_Schedule.GetRowValues(i, "ScheduleName").ToString();
                string ScheduleCriteria = grdvew_Schedule.GetRowValues(i, "ScheduleCriteria").ToString();
                string Value = grdvew_Schedule.GetRowValues(i, "Value").ToString();
                string Description = grdvew_Schedule.GetRowValues(i, "Description").ToString();
                CreatedBy = grdvew_Schedule.GetRowValues(i, "CreatedBy").ToString();
                string schedule = "insert into MaintenanceSchedule(ScheduleDate, InstrumentID, ScheduleUnit,Due_MeterReading,Due_Hours, Due_Date, Description,CreatedBy,Status,ScheduleName) values (@ScheduleDate,@InstrumentID,@ScheduleUnit,@Due_MeterReading,@Due_Hours,@Due_Date,@Description,@CreatedBy,@Status,@ScheduleName)" + "SELECT Scope_Identity()";
                myCommand = new SqlCommand(schedule, con);
                myCommand.Parameters.AddWithValue("@ScheduleDate","");
                myCommand.Parameters.AddWithValue("@InstrumentID", gridlkup_instrument.Value.ToString());
                myCommand.Parameters.AddWithValue("@ScheduleUnit", ScheduleCriteria);
                if (ScheduleCriteria == "Meter Reading")
                {
                    myCommand.Parameters.AddWithValue("@Due_MeterReading", Value);
                }
                else
                {
                    myCommand.Parameters.AddWithValue("@Due_MeterReading", "");
                }
                if (ScheduleCriteria == "Running hours")
                {
                    myCommand.Parameters.AddWithValue("@Due_Hours", Value);
                }
                else
                {
                    myCommand.Parameters.AddWithValue("@Due_Hours", DBNull.Value);
                }
                if (ScheduleCriteria == "Date")
                {
                    myCommand.Parameters.AddWithValue("@Due_Date", Value);
                }
                else
                {
                    myCommand.Parameters.AddWithValue("@Due_Date", DBNull.Value);
                }
                myCommand.Parameters.AddWithValue("@Description", Description);
                myCommand.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                myCommand.Parameters.AddWithValue("@Status", "Scheduled");
                myCommand.Parameters.AddWithValue("@ScheduleName", schedulename);
                int Schedule_Id = Convert.ToInt32(myCommand.ExecuteScalar());
                DataTable TaskList = new DataTable();
                TaskList = ViewState["TotalTask"] as DataTable;
                if (TaskList != null)
                {
                    var row = TaskList.Select("ScheduleID='" + ScheduleID + "'");
                    foreach (var ro in row)
                    {
                        string taskid = ro["TaskID"].ToString();
                        string remarks = ro["Remarks"].ToString();

                        string SchTskLst = "insert into ScheduleTaskList(ScheduleID,TaskID,Remarks) values (@ScheduleID,@TaskID,@Remarks)";
                        myCommand = new SqlCommand(SchTskLst, con);
                        myCommand.Parameters.AddWithValue("@ScheduleID", Schedule_Id);
                        myCommand.Parameters.AddWithValue("@TaskID", taskid);
                        myCommand.Parameters.AddWithValue("@Remarks", remarks);
                        myCommand.ExecuteNonQuery();
                    }
                }
            }
            string date = System.DateTime.Now.ToString("yyyy-MM-dd");
            DateTime time = DateTime.Now;
            string currenttime = time.ToString("hh:mm");
            myCommand = new SqlCommand("Insert into MaintenanceHistory (InstrumentID,Status,StatusChangedDate,Time,CreatedBy) values(@InstrumentID,@Status,@StatusChangedDate,@Time,@CreatedBy) ", con);
            myCommand.Parameters.AddWithValue("@InstrumentID", gridlkup_instrument.Value.ToString());
            myCommand.Parameters.AddWithValue("@Status", "Scheduled");
            myCommand.Parameters.AddWithValue("@StatusChangedDate", date);
            myCommand.Parameters.AddWithValue("@Time", currenttime);
            myCommand.Parameters.AddWithValue("@CreatedBy", CreatedBy);
            myCommand.ExecuteNonQuery();

            myCommand = new SqlCommand("Insert into CalibrationRecord(InstrumentID,Last_Calibration_date,Next_Calibration_date,Description,Created_by,Status)values(@InstrumentID,@Last_Calibration_date,@Next_Calibration_date,@Description,@Created_by,@Status)", con);
            myCommand.Parameters.AddWithValue("@InstrumentID", gridlkup_instrument.Value.ToString());
            myCommand.Parameters.AddWithValue("@Last_Calibration_date", lbl_calibration.Text);
            myCommand.Parameters.AddWithValue("@Next_Calibration_date", lbl_nextcalibration.Text);
            myCommand.Parameters.AddWithValue("@Description", memo_desc.Text);
            myCommand.Parameters.AddWithValue("@Created_by", "");
            myCommand.Parameters.AddWithValue("@Status", "Active");
            myCommand.ExecuteNonQuery();

            myCommand = new SqlCommand("Update InstrumentMaster set Status='Servicable' where InstrumentID='" + gridlkup_instrument.Value.ToString() + "'",con);
            myCommand.ExecuteNonQuery();
            con.Close();

            Messages.SetSuccessMessage("0027", null, Session);
            FullClear();
        }
        catch (SqlException ex)
        {
            Messages.SetErrorMessage("0028", null, null, null, Session);
            return;
        }
        catch(Exception ex)
        {
            Messages.SetErrorMessage("0029", null, null, null, Session);
            return;
        }
    }
    protected void FullClear()
    {
        gridlkup_instrument.Value = -1;
         lbl_name.Text = lbl_serial.Text = lbl_modelno.Text = lbl_manufacturer.Text = lbl_location.Text = lbl_calibration.Text="";
       
        //cmb_createdby.Text = "";
        ViewState["NewSchedule"] = null;
        ViewState["TotalTask"] = null;
        dt2 = new DataTable();
        grdvew_Schedule.DataSource = dt2;
        grdvew_Schedule.DataBind();
    }
    protected void grdvew_Schedule_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Delete")
        {
            int s = e.VisibleIndex;
            DataTable NewSchedule = (DataTable)ViewState["NewSchedule"];
            NewSchedule.Rows[s].Delete();
            grdvew_Schedule.DataSource = NewSchedule;
            grdvew_Schedule.DataBind();


        }
    }

    protected void RadioBtnLst_calibration_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioBtnLst_calibration.SelectedIndex == null || RadioBtnLst_calibration.SelectedIndex == -1)
        {
            Messages.SetErrorMessage("0021", null, null, null, Session);
            return;
        }
        else if (RadioBtnLst_calibration.SelectedItem.Text == "Days")
        {
            lbl_days.Visible = true;
            txt_days.Visible = true;
            lbl_months.Visible = false;
            txt_months.Visible = false;
           // date_schedule.Visible = false;
        }
        else if (RadioBtnLst_calibration.SelectedItem.Text == "Months")
        {
            lbl_days.Visible = false;
            txt_days.Visible = false;
            lbl_months.Visible = true;
            txt_months.Visible = true;
            //date_schedule.Visible = true;
        }
    }

    protected void txt_days_TextChanged(object sender, EventArgs e)
    {
        DateTime date = Convert.ToDateTime(lbl_calibration.Text);
        string rr = date.ToString("yyyy-MM-dd");
        Session["Date"] = rr;
        int callidays = int.Parse(txt_days.Text);
        DateTime ddt = Convert.ToDateTime(rr);
        DateTime ddtNew = ddt.AddDays(callidays);
        lbl_nextcalibration.Text = ddtNew.ToString("dd-MM-yyyy");
        lbl_nextcalibration.Visible = true;
        lbl_next.Visible = true;
        



    }

    protected void txt_months_TextChanged(object sender, EventArgs e)
    {
        DateTime date = Convert.ToDateTime(lbl_calibration.Text);
        string rr = date.ToString("yyyy-MM-dd");
        Session["Date"] = rr;
        int callidays = int.Parse(txt_months.Text);
        DateTime ddt = Convert.ToDateTime(rr);
        DateTime ddtNew = ddt.AddMonths(callidays);
        lbl_nextcalibration.Text = ddtNew.ToString("dd-MM-yyyy");
        lbl_nextcalibration.Visible = true;
        lbl_next.Visible = true;
    }
}