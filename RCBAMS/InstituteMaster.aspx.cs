using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting;
using System.Configuration;
using System.Collections;
using DevExpress.Web.ASPxGridView.Export;
using DevExpress.CodeParser;
using DevExpress.Office;
using DevExpress.XtraEditors.Design.TasksSolution;
using DevExpress.XtraExport;
using DevExpress.SharePoint;
using DevExpress.Utils.OAuth.Provider;
using System;
using System.Web.Mail;
public partial class InstituteMaster : System.Web.UI.Page
{

    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlCommand cmd;
    SqlCommand myCommand;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            ASPxButton1.Visible = true;
        }
        ASPxGridView1.DataBind();
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        if (InstID.Text == "")
        {
            errormsg.Text = "Please Enter Institute ID";
            return;
        }
        if (InstName.Text == "")
        {
            errormsg.Text = "Please Enter Institute Name";
            return;
        }
        if (EmailID.Text == "")
        {
            errormsg.Text = "Please Enter Email Id";
            return;
        }
        if (Adress.Text == "")
        {

            errormsg.Text = "Please Enter Address";
            return;
        }
        if (PhnNo.Text == "")
        {
            errormsg.Text = "Please Enter PhoneNo";
            return;
        }
        try
        {
            string check = "select InstituteID from InstituteMaster where InstituteID ='" + InstID.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(check, conAMS);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                errormsg.Text = "With this Institute ID, there is already another Institute.";
                return;
            }
            else
            {

                myCommand = new SqlCommand("insert into InstituteMaster(InstituteID, InstituteName, EmailID, PhoneNo, Address, Status, CreateDate)Values(@InstituteID, @InstituteName, @EmailID, @PhoneNo, @Address, @Status,@CreatedDate)", conAMS);

                myCommand.Parameters.AddWithValue("InstituteID", InstID.Text);
                myCommand.Parameters.AddWithValue("InstituteName", InstName.Text);
                //myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
                myCommand.Parameters.AddWithValue("EmailID", EmailID.Text.ToString());
                myCommand.Parameters.AddWithValue("PhoneNo", PhnNo.Text.ToString());
                myCommand.Parameters.AddWithValue("Address", Adress.Text);
                myCommand.Parameters.AddWithValue("Status", "Active");
                myCommand.Parameters.AddWithValue("CreatedDate", System.DateTime.Now);
                conAMS.Open();
                myCommand.ExecuteNonQuery();
                Clear();
                ASPxGridView1.DataBind();
                errormsg.Text = "Data Submitted Successfully";
            }
        }
        catch
        {

        }
        finally
        {
            conAMS.Close();
        }
    }

    private void Clear()
    {
        InstID.Text = "";
        InstName.Text = "";
        EmailID.Text = "";
        PhnNo.Text = "";
        Adress.Text = "";
    }
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        InstID.Text = "";
        InstName.Text = "";
        EmailID.Text = "";
        PhnNo.Text = "";
        Adress.Text = "";
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        if (InstID.Text == "")
        {
            errormsg.Text = "Please Enter Institute ID";
            return;
        }
        if (InstName.Text == "")
        {
            errormsg.Text = "Please Enter Institute Name";
            return;
        }
        if (EmailID.Text == "")
        {
            errormsg.Text = "Please Enter Email Id";
            return;
        }
        if (Adress.Text == "")
        {

            errormsg.Text = "Please Enter Address";
            return;
        }
        if (PhnNo.Text == "")
        {
            errormsg.Text = "Please Enter PhoneNo";
            return;
        }
        //myCommand = new SqlCommand("insert into InstituteMaster(InstituteID, InstituteName, EmailID, PhoneNo, Address, Status, CreateDate)Values(@InstituteID, @InstituteName, @EmailID, @PhoneNo, @Address, @Status,@CreatedDate)", conAMS);

        // myCommand = new SqlCommand("UPDATE InstituteMaster SET  InstituteID='" + InstID.Value + "',InstituteName='" + InstName.Value + "',EmailID='" + EmailID.Text + "',PhoneNo='" + PhnNo.Text + "',Address='" + Adress.Text + "' WHERE InstituteID='" + Session["InstituteID"] + "'", conAMS);
        // Define your SQL command with parameters
        string sqlUpdate = "UPDATE InstituteMaster SET InstituteID = @InstituteID, InstituteName = @InstituteName, EmailID = @EmailID, PhoneNo = @PhoneNo, Address = @Address WHERE InstitutePKID = @SessionInstitutePKID";

        // Create a new SqlCommand with the parameterized query and connection
        SqlCommand myCommand = new SqlCommand(sqlUpdate, conAMS);

        // Add parameters to the SqlCommand
        myCommand.Parameters.AddWithValue("@InstituteID", InstID.Text);
        myCommand.Parameters.AddWithValue("@InstituteName", InstName.Text);
        myCommand.Parameters.AddWithValue("@EmailID", EmailID.Text);
        myCommand.Parameters.AddWithValue("@PhoneNo", PhnNo.Text);
        myCommand.Parameters.AddWithValue("@Address", Adress.Text);
        myCommand.Parameters.AddWithValue("@SessionInstitutePKID", Session["InstitutePKID"]);

        // Execute the command
        conAMS.Open();
        myCommand.ExecuteNonQuery();
   
        errormsg.Text = "Data Updated Successfully";
        conAMS.Close();
        ASPxGridView1.DataBind();
        //Messages.SetSuccessMessage("0060", null, Session);
        //errormsg.Text = "Data Updated Successfully";
        Clear();
        btn_Update.Visible = false;
        ASPxButton1.Visible = true;
        ASPxButton2.Visible = false;


    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        errormsg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string InstitutePKID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstitutePKID").ToString();
            Session["InstitutePKID"] = InstitutePKID;
            InstID.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstituteID").ToString();
            InstName.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstituteName").ToString();
            EmailID.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "EmailID").ToString();
            Adress.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Address").ToString();
            PhnNo.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "PhoneNo").ToString();
           
            btn_Update.Visible = true;
            ASPxButton2.Visible = true;
            ASPxButton1.Visible = false;
        }
        if (btn == "Delete")
        {
            errormsg.Visible = true;
            string InstitutePKID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstitutePKID").ToString();
            
            string query = "UPDATE InstituteMaster SET Status = @Status WHERE InstitutePKID = @InstitutePKID";

            SqlCommand myCommand = new SqlCommand(query, conAMS);

            // Add parameters to the SqlCommand
            myCommand.Parameters.AddWithValue("@Status", "InActive");
            myCommand.Parameters.AddWithValue("@InstitutePKID", InstitutePKID);

            //string query2 = "UPDATE InstituteMaster SET Status='InActive' Where InstitutePKID='" + InstitutePKID + "'";
            //myCommand = new SqlCommand(query2, conAMS);
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            errormsg.Text = "Data Deleted Successfully";
            conAMS.Close();
            ASPxGridView1.DataBind();
            btn_Update.Visible = false;
            ASPxButton2.Visible = false;
            ASPxButton1.Visible = true;
        }
    }
}