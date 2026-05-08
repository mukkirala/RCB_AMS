using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Assign_traingSession_Faculty : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["AttendanceManagementConnectionString"].ConnectionString);
    SqlCommand myCommand1;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Assign_Click(object sender, EventArgs e)
    {
        if (btn_Assign.Text == "Assign")
        {

            SqlCommand myCommand1 = new SqlCommand("INSERT INTO Fac_ClassMapping(FacultyID,ClassID,FromDate,ToDate,Status) VALUES(@FacultyID,@ClassID,@FromDate,@ToDate,@Status)");
            myCommand1.Parameters.AddWithValue("@FacultyID", cmb_Fac.Value);
            myCommand1.Parameters.AddWithValue("@ClassID", cmb_Class.Value);
            myCommand1.Parameters.AddWithValue("@FromDate", from_Date.Text);
            myCommand1.Parameters.AddWithValue("@ToDate", To_Date.Text);
            myCommand1.Parameters.AddWithValue("@Status", "Active");
            DatabaseConnection db1 = new DatabaseConnection();
            db1.ExecuteNonQuery(myCommand1);
            lbl_Msg.Text = "Faculty Assigned  sucessfully!";
            ASPxGridView1.DataBind();
            clear();
        }
        if (btn_Assign.Text == "Update")
        {
            string id = Session["Fac_ClassMappingID"].ToString();
            SqlCommand myCommand1 = new SqlCommand("Update Fac_ClassMapping SET  FacultyID='" + cmb_Fac.SelectedItem.Value + "',ClassID='" + cmb_Class.SelectedItem.Value + "',FromDate='" + from_Date.Text + "',ToDate='" + To_Date.Text + "'  WHERE  Fac_ClassMappingID='" + id + "'");
            DatabaseConnection db = new DatabaseConnection();
            db.ExecuteNonQuery(myCommand1);
            //string id2 = Session["StudentID"].ToString();
            //SqlCommand myCommand2 = new SqlCommand("Update Stud_ClassMapping SET ClassID='" + cmb_Class.SelectedItem.Value + "' WHERE  StudentID='" + id2 + "'");
            //DatabaseConnection db2 = new DatabaseConnection();
            //db.ExecuteNonQuery(myCommand2);
            lbl_Msg.Text = "Data updated successfully";
            btn_Assign.Text = "Save";
            ASPxGridView1.DataBind();
            clear();
        }
    }


  
    protected void clear()
    {
        cmb_Fac.Text="";
        cmb_Fac.SelectedIndex =-1;
        cmb_Class.Text = "";
        cmb_Class.SelectedIndex = -1;
        from_Date.Text = "";
        To_Date.Text = "";

    }

   

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            //string StudentID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "StudentID").ToString();
            //Session["StudentID"] = StudentID;
            string Fac_ClassMappingID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Fac_ClassMappingID").ToString();
            Session["Fac_ClassMappingID"] = Fac_ClassMappingID;
            cmb_Fac.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "FacultyID").ToString();
            cmb_Class.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ClassID").ToString();
            from_Date.DataBind();
            from_Date.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "FromDate").ToString();
            from_Date.DataBind();
            To_Date.DataBind();
            To_Date.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ToDate").ToString();
            To_Date.DataBind();
            btn_Assign.Text = "Update";
        }
        if (btn == "Delete")
        {
            string Fac_ClassMappingID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Fac_ClassMappingID").ToString();
            Session["Fac_ClassMappingID"] = Fac_ClassMappingID;
            SqlCommand myCommand = new SqlCommand("Delete from [Fac_ClassMapping] WHERE  Fac_ClassMappingID='" + Fac_ClassMappingID + "'");
            DatabaseConnection db = new DatabaseConnection();
            db.ExecuteNonQuery(myCommand);
            lbl_Msg.Text = "Data deleted successfully";
            btn_Assign.Text = "Save";
            ASPxGridView1.DataBind();
        }
    }
}