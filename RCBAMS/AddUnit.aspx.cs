using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Collections;

public partial class AddUnit : System.Web.UI.Page
{

    string myConnectionString = "";
    SqlConnection myConnection;
    SqlCommand myCommand;
    private const string PAGENAME = "AddUnit.aspx";
    private const string UNITMASTER = "MASTERS-Unit Master";
    protected void Page_Load(object sender, EventArgs e)
    {
        string sPrivList = "";

        sPrivList = Session["PRIVLIST"] + "";

        if (sPrivList == "")
        {
            Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=Session expired. Please login again");
        }

        Hashtable ht = ARP.BusinessLogic.Misc.Utilities.GetRightsForPage(PAGENAME, sPrivList);

        if (ht == null)
        {
            Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=Page not found");
        }

        if (System.Convert.ToBoolean(ht[UNITMASTER].ToString()) == false)
        {
            //Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=You have no access to change the password");
            Response.Redirect("UnAuthorisedUser.aspx");
        }   
        lbl_date.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (txt_Unitcode.Text == "")
        {
            Messages.SetErrorMessage("2097", null, null, null, Session);
            return;
        }
        if (txt_Unitname.Text == "")
        {
            Messages.SetErrorMessage("2098", null, null, null, Session);
            return;
        }
        if (myConnectionString == "")
        {
            myConnectionString = WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString;

        }
        myConnection = new SqlConnection(myConnectionString);
        myCommand = new SqlCommand("insert into UnitMaster(UnitCode,UnitName,UnitAddress,ContactNo,FaxNo,Email,ContactPerson,CreatedDate) values(@UnitCode,@UnitName,@UnitAddress,@ContactNo,@FaxNo,@Email,@ContactPerson,@Date)", myConnection);
       // myCommand.Parameters.AddWithValue("@CreatedDate", txt_createddate.Date.ToString("yyyy-MM-dd"));
        myCommand.Parameters.AddWithValue("@UnitCode",txt_Unitcode.Text);       
        myCommand.Parameters.AddWithValue("@UnitName", txt_Unitname.Text);
        myCommand.Parameters.AddWithValue("@UnitAddress", txt_address.Text);
        myCommand.Parameters.AddWithValue("@ContactNo", txt_contactno.Text);
        myCommand.Parameters.AddWithValue("@FaxNo", txt_Faxno.Text);
        myCommand.Parameters.AddWithValue("@Email", txt_emailid.Text);
        myCommand.Parameters.AddWithValue("@ContactPerson",txt_contactperson.Text);
        myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("30242", null, Session);
        Clear();
    }
    protected void Clear()
    {
       
        txt_Unitcode.Text = "";
        txt_Unitname.Text = "";
        txt_address.Text = "";
        txt_contactno.Text = "";
        txt_Faxno.Text = "";
        txt_emailid.Text = "";
        //lbl_msg.Visible = false;
        txt_contactperson.Text = "";
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        if (txt_Unitcode.Text == "")
        {
            Messages.SetErrorMessage("2097", null, null, null, Session);
            return;
        }
        if (txt_Unitname.Text == "")
        {
            Messages.SetErrorMessage("2098", null, null, null, Session);
            return;
        }

        if (myConnectionString == "")
        {
            myConnectionString = WebConfigurationManager.ConnectionStrings["PentagonLogistixPvtLtdConnectionString"].ConnectionString;

        }
        myConnection = new SqlConnection(myConnectionString);
        myCommand = new SqlCommand("Update UnitMaster Set UnitCode=@UnitCode,UnitName=@UnitName,UnitAddress=@UnitAddress,ContactNo=@ContactNo,FaxNo=@FaxNo,Email=@Email,ContactPerson=@ContactPerson WHERE UnitNo=@UnitNo", myConnection);
        // myCommand.Parameters.AddWithValue("@CreatedDate", txt_createddate.Date.ToString("yyyy-MM-dd"));
        myCommand.Parameters.AddWithValue("@UnitCode", txt_Unitcode.Text);
        myCommand.Parameters.AddWithValue("@UnitName", txt_Unitname.Text);
        myCommand.Parameters.AddWithValue("@UnitAddress", txt_address.Text);
        myCommand.Parameters.AddWithValue("@ContactNo", txt_contactno.Text);
        myCommand.Parameters.AddWithValue("@FaxNo", txt_Faxno.Text);
        myCommand.Parameters.AddWithValue("@Email", txt_emailid.Text);
        myCommand.Parameters.AddWithValue("@ContactPerson", txt_contactperson.Text);
        myCommand.Parameters.AddWithValue("@UnitNo", Session["UnitNo"].ToString());
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("2095", null, Session);
        Clear();
        btn_save.Visible = true;
        btn_update.Visible = false;
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["UnitNo"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "UnitNo").ToString();
        string UnitNo = Session["UnitNo"].ToString();
        String btn = e.CommandArgs.CommandName.ToString();
        
        
        if (btn == "Edit")
        {
            txt_Unitcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "UnitCode").ToString();
            txt_Unitname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "UnitName").ToString();
            txt_address.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "UnitAddress").ToString();
            txt_contactno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ContactNo").ToString();
            txt_Faxno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "FaxNo").ToString();
            txt_emailid.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Email").ToString();
            txt_contactperson.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ContactPerson").ToString();            
            ASPxGridView1.DataBind();
            btn_save.Visible = false;
            btn_update.Visible = true;
        }
        else if (btn == "Delete")
        {
            if (myConnectionString == "")
            {
                myConnectionString = WebConfigurationManager.ConnectionStrings["PentagonLogistixPvtLtdConnectionString"].ConnectionString;

            }
            myConnection = new SqlConnection(myConnectionString);
            myCommand = new SqlCommand("Delete From UnitMaster Where UnitNo='"+ UnitNo +"'",myConnection);
            //myCommand.Parameters.AddWithValue("@UnitNo", UnitNo);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            Messages.SetSuccessMessage("2096", null,Session);
            ASPxGridView1.DataBind();
            btn_save.Visible = true;
            btn_update.Visible = false;
        }
        

    }
}