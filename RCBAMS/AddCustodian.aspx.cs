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

public partial class AddCustodian : System.Web.UI.Page
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
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        if (EmpName.Text == "")
        {
            errormsg.Text = "Please Enter Employee Name";
            return;
        }
        if (EmpID.Text == "")
        {
            errormsg.Text = "Please Enter Employee Id";
            return;
        }
        if (ASPxComboBox1.Text == "")
        {
            errormsg.Text = "Please Select Department";
            return;
        }
        //if (report_txt.Text == "")
        //{
        //    errormsg.Text = "Please Enter Reporting Authority";
        //    return;
        //}
        //if (empmail.Text == "")
        //{
        //    errormsg.Text = "please Enter Mail";
        //    return;
        //}
        //if (txt_INT.Text == "")
        //{
        //    errormsg.Text = "please Enter Internal Number";
        //    return;
        //}
        if (txt_LDAP.Text == "")
        {
            errormsg.Text = "please Enter Username/Login ID";
            return;
        }
        if (txt_pwd.Text == "")
        {
            errormsg.Text = "please Enter Password";
            return;
        }
        if (txt_conpwd.Text == "")
        {
            errormsg.Text = "please Enter Confirm Password";
            return;
        }
        if (PhnNo.Text == "")
        {
            errormsg.Text = "Please Enter PhoneNo";
            return;
        }
        if (Adress.Text == "")
        {

            errormsg.Text = "Please Enter Address";
            return;
        }
        if (txt_pwd.Text != txt_conpwd.Text)
        {
            errormsg.Text = "Password and Confirm Password should be same";
            return;
        }

        try
        {
            string check = "select CustodianID from CustodianMaster where CustodianID ='" + EmpID.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(check, conAMS);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                errormsg.Text = "With this employee ID, there is already another employee.";
                return;
            }
            else
            { 
            
            myCommand = new SqlCommand("insert into CustodianMaster(CustodianID, CustodianDepartmentCode, CustodianName,PhoneNo, Address, Designation, email,CustodianStatus,CreateDate,LDAP_USERID,LDAP_PWD)Values(@CustodianID, @CustodianDepartmentCode, @CustodianName,@PhoneNo, @Address, @Designation, @email,@CustodianStatus,@CreatedDate,@LDAP_USERID,@LDAP_PWD)", conAMS);

            myCommand.Parameters.AddWithValue("CustodianID", EmpID.Value.ToString());
            myCommand.Parameters.AddWithValue("CustodianDepartmentCode", ASPxComboBox1.Value.ToString());
            //myCommand.Parameters.AddWithValue("CustodianDepartment", reqdept.Text);
            myCommand.Parameters.AddWithValue("CustodianName", EmpName.Text.ToString());
            myCommand.Parameters.AddWithValue("PhoneNo", PhnNo.Value.ToString());
            myCommand.Parameters.AddWithValue("Address", Adress.Text);
            myCommand.Parameters.AddWithValue("Designation", txt_Designation.Text);
            //myCommand.Parameters.AddWithValue("reporting_staff_no", report_txt.Value.ToString());
            myCommand.Parameters.AddWithValue("email", empmail.Text.ToString());
            myCommand.Parameters.AddWithValue("LDAP_USERID", txt_LDAP.Text);                
            //myCommand.Parameters.AddWithValue("InternalNumber", txt_INT.Text);
            myCommand.Parameters.AddWithValue("LDAP_PWD", Utilities.EncryptTripleDES(txt_pwd.Text));

            myCommand.Parameters.AddWithValue("CustodianStatus", "Active");
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
    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        EmpID.Value = "";
        ASPxComboBox1.Value = "";
        EmpName.Text = "";
        txt_Designation.Text = "";
        //report_txt.Value = "";
        empmail.Text = "";
    }
        protected void btn_Update_Click(object sender, EventArgs e)
    {
          errormsg.Visible = true;
        if (EmpID.Text == "")
        {
            errormsg.Text = "Please Enter Employee Id";
            return;
        }
        if (EmpName.Text == "")
        {
            errormsg.Text = "Please Enter Employee Name";
            return;
        }
       
        if (ASPxComboBox1.Text == "")
        {
            errormsg.Text = "Please Select Department";
            return;
        }
        //if (report_txt.Text == "")
        //{
        //    errormsg.Text = "Please Enter Reporting Authority";
        //    return;
        //}
        if (empmail.Text == "")
        {
            errormsg.Text = "please Enter Mail";
            return;
        }
        if (txt_LDAP.Text == "")
        {
            errormsg.Text = "please Enter LDAP-UserName";
            return;
        }
        //if (txt_INT.Text == "")
        //{
        //    errormsg.Text = "please Enter Internal Nmuber";
        //    return;
        //}
        if (txt_pwd.Text == "")
        {
            errormsg.Text = "please Enter Password";
            return;
        }
        if (txt_conpwd.Text == "")
        {
            errormsg.Text = "please Enter Confirm Password";
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
        if (txt_pwd.Text != txt_conpwd.Text)
        {
            errormsg.Text = "Password and Confirm Password should be same";
            return;
        }

        string password = Utilities.EncryptTripleDES(txt_pwd.Text);
        myCommand = new SqlCommand("UPDATE CustodianMaster SET  CustodianID='" + EmpID.Value + "',CustodianDepartmentCode='" + ASPxComboBox1.Value + "',CustodianName='" + EmpName.Text + "',PhoneNo='" + PhnNo.Text +"',Address='" + Adress.Text + "',Designation='" + txt_Designation.Text + "',email='" + empmail.Text + "',LDAP_USERID='" + txt_LDAP.Text + "',LDAP_PWD='" + password + "' WHERE CustodianID='" + Session["CustodianID"] + "'", conAMS);
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
            string CustodianID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            Session["CustodianID"] = CustodianID;
            EmpID.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            ASPxComboBox1.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartmentCode").ToString();
            EmpName.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianName").ToString();
            txt_Designation.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Designation").ToString();
            //report_txt.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "reporting_staff_no").ToString();
            empmail.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "email").ToString();
            txt_LDAP.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LDAP_USERID").ToString();
            Adress.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Address").ToString();
            PhnNo.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "PhoneNo").ToString();
            //txt_INT.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InternalNumber").ToString();
           // txt_pwd.Password=false;
            txt_pwd.Text = Utilities.DecryptTripleDES(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LDAP_PWD").ToString());
            //txt_pwd.Password = true;
            btn_Update.Visible = true;
            ASPxButton2.Visible = true;
            ASPxButton1.Visible = false;
        }
        if (btn == "Delete")
        {
            errormsg.Visible = true;
            string CustodianID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            string query2 = "UPDATE CustodianMaster SET CustodianStatus='InActive' Where CustodianID='" + CustodianID + "'";
            myCommand = new SqlCommand(query2, conAMS);
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
    private void Clear()
        {
        EmpID.Value= "";
        ASPxComboBox1.Value = "";
        EmpName.Text = "";
        txt_Designation.Text = "";
        //report_txt.Value = "";
        empmail.Text = "";
        txt_LDAP.Text = "";
        //txt_INT.Text = "";
        txt_pwd.Text = "";
        txt_conpwd.Text = "";
        Adress.Text = "";
        }
    }