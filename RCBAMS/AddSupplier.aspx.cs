using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.IO;
using System.Data;
using DevExpress.Web.ASPxGridView;
using System.Configuration;
using System.Collections;

public partial class VendorMaster : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    private const string PAGENAME = "Masters-Add_Supplier";
    private const string PAGEURL = "AddSupplier.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        //ARP.BusinessLogic.Misc.Utilities.Authentication(PAGENAME, PAGEURL);          
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
        ASPxGridView1.DataBind();
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }
    protected void clear()
    {
        txt_spcode.Text = txt_cmpname.Text = txt_cntprsname.Text= txt_cntprsno.Text = txt_adress.Text=txt_area.Text =txt_pincode.Text =txt_mobile.Text =txt_faxno.Text =txt_mail.Text ="";
        cmb_state.SelectedIndex=cmb_city.SelectedIndex =-1;
       // gridviewMaterial.Selection.UnselectAll();
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {

        string myConnectionString = "";
        if (txt_spcode.Text == string.Empty)
        {
            Messages.SetErrorMessage("0070", null, null, null, Session);
            return;

        }
        if (txt_cmpname.Text == string.Empty)
        {
            Messages.SetErrorMessage("0071", null, null, null, Session);
            return;
        }

        if (txt_cntprsname.Text == string.Empty)
        {
            Messages.SetErrorMessage("0072", null, null, null, Session);
            return;

        }
        if (txt_cntprsno.Text == string.Empty)
        {
            Messages.SetErrorMessage("0073", null, null, null, Session);
            return;

        }
        if (txt_mobile.Text == string.Empty)
        {
            Messages.SetErrorMessage("0074", null, null, null, Session);
            return;

        }
        string Query = "INSERT INTO SupplierMaster([VendorCode],[CompanyName],[ContactPerson],[ContactNumber],[Address],[Area],[State],[City],[Pincode],[PhoneNumber],[Fax],[EMail],[Status])Values(@VendorCode,@CompanyName,@ContactPerson,@ContactNumber,@Address,@Area,@State,@City,@Pincode,@PhoneNumber,@Fax,@E_Mail,@Status)" + "Select Scope_Identity()";
        myCommand = new SqlCommand(Query, myConnection);
        myCommand.Parameters.AddWithValue("@VendorCode", txt_spcode.Text);
        myCommand.Parameters.AddWithValue("@CompanyName", txt_cmpname.Text);
        myCommand.Parameters.AddWithValue("@ContactPerson", txt_cntprsname.Text);
        myCommand.Parameters.AddWithValue("@ContactNumber", txt_cntprsno.Text);
        myCommand.Parameters.AddWithValue("@Address", txt_adress.Text);
        myCommand.Parameters.AddWithValue("@Area", txt_area.Text);
        myCommand.Parameters.AddWithValue("@State", cmb_state.Text);
        myCommand.Parameters.AddWithValue("@City", cmb_city.Text);
        myCommand.Parameters.AddWithValue("@Pincode", txt_pincode.Text);
        myCommand.Parameters.AddWithValue("@PhoneNumber", txt_mobile.Text);
        myCommand.Parameters.AddWithValue("@Fax", txt_faxno.Text);
        myCommand.Parameters.AddWithValue("@E_Mail", txt_mail.Text);
        myCommand.Parameters.AddWithValue("@Status", "Active");
        myConnection.Open();
        int id = Convert.ToInt32(myCommand.ExecuteScalar());

        Messages.SetSuccessMessage("0059", null, Session);
        myConnection.Close();
        ASPxGridView1.DataBind();
        clear();
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string SupplierID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SupplierID").ToString();
            Session["SupplierID"] = SupplierID;
            txt_spcode.Text= ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "VendorCode").ToString();
            txt_cmpname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CompanyName").ToString();
            txt_cntprsname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ContactPerson").ToString();
            txt_cntprsno.Text= ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ContactNumber").ToString();
            txt_adress.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Address").ToString();
            txt_area.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Area").ToString();
            cmb_state.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "State").ToString();
            cmb_city.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "City").ToString();
            txt_pincode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Pincode").ToString();
            txt_mobile.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "PhoneNumber").ToString();
            txt_faxno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Fax").ToString();
            txt_mail.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "EMail").ToString();
            btn_Update.Visible = true;
            btn_save.Visible = false;

        }
        if (btn == "Delete")
        {
            
            string SupplierID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SupplierID").ToString();
            string Query2 = "UPDATE [SupplierMaster] SET Status='InActive' Where SupplierID='" + SupplierID + "'";
            myCommand = new SqlCommand(Query2, myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            btn_Update.Visible = false;
            btn_save.Visible = true;
            Messages.SetSuccessMessage("0061", null, Session);
            clear();
        }
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {

        if (txt_spcode.Text == string.Empty)
        {
            Messages.SetErrorMessage("0070", null, null, null, Session);
            return;

        }
        if (txt_cmpname.Text == string.Empty)
        {
            Messages.SetErrorMessage("0071", null, null, null, Session);
            return;
        }

        if (txt_cntprsname.Text == string.Empty)
        {
            Messages.SetErrorMessage("0072", null, null, null, Session);
            return;

        }
        if (txt_cntprsno.Text == string.Empty)
        {
            Messages.SetErrorMessage("0073", null, null, null, Session);
            return;

        }
        if (txt_mobile.Text == string.Empty)
        {
            Messages.SetErrorMessage("0074", null, null, null, Session);
            return;

        }
        myCommand = new SqlCommand("UPDATE SupplierMaster SET  VendorCode='" + txt_spcode.Text +"',CompanyName = '" + txt_cmpname.Text + "',ContactPerson='" + txt_cntprsname.Text + "', ContactNumber='" + txt_cntprsno.Text +"', Address ='" + txt_adress.Text + "',Area='" + txt_area.Text + "',State='" + cmb_state.Text + "',City='" + cmb_city.Text + "',Pincode='" + txt_pincode.Text + "',PhoneNumber='" + txt_mobile.Text + "',Fax='" + txt_faxno.Text + "',Email='" + txt_mail.Text + "' WHERE SupplierID='" + Session["SupplierID"] + "'", myConnection);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("0060", null, Session);
        clear();
    }
    protected void cmb_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        ASPxComboBox cmb = (ASPxComboBox)sender;
        Session["state"] = cmb.SelectedItem.Text;
    }
    //protected void ASPxGridView2_DataSelect(object sender, EventArgs e)
    //{
    //    String supplierid = (sender as ASPxGridView).GetMasterRowKeyValue().ToString();
    //    Session["supplierid"] = supplierid;
    //}
}