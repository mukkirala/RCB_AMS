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

public partial class AddAssetSapCodeMaster : System.Web.UI.Page
{
    static string myConnectionString = myConnectionString = WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString;
    SqlConnection myConnection = new SqlConnection(myConnectionString);
    SqlCommand myCommand;
    private const string PAGENAME = "AddAssetSapCodeMaster.aspx";
    private const string ASSETSAPNO = "MASTERS-Asset SapCode Master";

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

        if (System.Convert.ToBoolean(ht[ASSETSAPNO].ToString()) == false)
        {
            //Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=You have no access to change the password");
            Response.Redirect("UnAuthorisedUser.aspx");
        } 
        lbl_date.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txt_sapcode.Text == "")
        {
            Messages.SetErrorMessage("2101", null, null, null, Session);
            return;
        }
        myCommand = new SqlCommand("INSERT INTO AssetSapMaster(AssetSapCode,CreatedDate) Values(@AssetSapCode,@Date)", myConnection);
        myCommand.Parameters.AddWithValue("@AssetSapCode", txt_sapcode.Text);
        myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("30242", null, Session);
        txt_sapcode.Text = "";
    }
    
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (txt_sapcode.Text == "")
        {
            Messages.SetErrorMessage("2101", null, null, null, Session);
            return;
        }
        myCommand = new SqlCommand("Update AssetSapMaster set AssetSapCode=@AssetSapCode WHERE AssetSapID=@AssetSapID", myConnection);
        myCommand.Parameters.AddWithValue("@AssetSapCode", txt_sapcode.Text);
        myCommand.Parameters.AddWithValue("@AssetSapID", Session["AssetSapID"].ToString());
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("2095", null,Session);
        txt_sapcode.Text = "";
        btnsave.Visible = true;
        btnupdate.Visible = false;
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["AssetSapID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetSapID").ToString();
        if (btn == "Edit")
        {
            txt_sapcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetSapCode").ToString();
            btnsave.Visible = false;
            btnupdate.Visible = true;
        }
        else if (btn == "Delete")
        {

            myCommand = new SqlCommand("Delete from AssetSapMaster WHERE AssetSapID=@AssetSapID", myConnection);
            myCommand.Parameters.AddWithValue("@AssetSapID", Session["AssetSapID"].ToString());
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            Messages.SetSuccessMessage("2096", null, Session);
            ASPxGridView1.DataBind();
            btnsave.Visible = true;
            btnupdate.Visible = false;
        }
    }
}