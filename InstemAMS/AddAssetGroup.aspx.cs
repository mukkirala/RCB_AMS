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

public partial class AddAssetGroup : System.Web.UI.Page
{

    static string myConnectionString = myConnectionString = WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString;
    SqlConnection myConnection = new SqlConnection(myConnectionString);
    SqlCommand myCommand;
    private const string PAGENAME = "AddAssetGroup.aspx";
    private const string ASSETGROUPMASTER = "MASTERS-Asset Group Master";
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

        if (System.Convert.ToBoolean(ht[ASSETGROUPMASTER].ToString()) == false)
        {
            //Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=You have no access to change the password");
            Response.Redirect("UnAuthorisedUser.aspx");
        }   
        lbl_date.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txt_assgrpcode.Text == "")
        {
            Messages.SetErrorMessage("2099", null, null, null, Session);
            return;
        }
        if (txt_assgrpdes.Text == "")
        {
            Messages.SetErrorMessage("2100", null, null, null, Session);
            return;
        }
        myCommand = new SqlCommand("INSERT INTO AssetGroupMaster(AssetGroupCode,AssetGroupDescription,CreatedDate) Values(@AssetGroupCode,@AssetGroupDescription,@Date)", myConnection);
        myCommand.Parameters.AddWithValue("@AssetGroupCode", txt_assgrpcode.Text);
        myCommand.Parameters.AddWithValue("@AssetGroupDescription", txt_assgrpdes.Text);
        myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("30242", null, Session);
        Clear();
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (txt_assgrpcode.Text == "")
        {
            Messages.SetErrorMessage("2099", null, null, null, Session);
            return;
        }
        if (txt_assgrpdes.Text == "")
        {
            Messages.SetErrorMessage("2100", null, null, null, Session);
            return;
        }
        myCommand = new SqlCommand("UPDATE AssetGroupMaster SET AssetGroupCode=@AssetGroupCode,AssetGroupDescription=@AssetGroupDescription WHERE AssetGroupID=@AssetGroupID ", myConnection);
        myCommand.Parameters.AddWithValue("@AssetGroupCode", txt_assgrpcode.Text);
        myCommand.Parameters.AddWithValue("@AssetGroupDescription", txt_assgrpdes.Text);
        myCommand.Parameters.AddWithValue("@AssetGroupID", Session["AssetGroupID"].ToString());
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("2095", null, Session);
        Clear();
        btnsave.Visible = true;
        btnupdate.Visible = false;
    }
    protected void Clear()
    {
        txt_assgrpcode.Text = txt_assgrpdes.Text = "";
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["AssetGroupID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetGroupID").ToString();
        if (btn == "Edit")
        {

            txt_assgrpcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetGroupCode").ToString();
            txt_assgrpdes.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetGroupDescription").ToString();
            btnsave.Visible = false;
            btnupdate.Visible = true;
            ASPxGridView1.DataBind();
        
        }
        else if (btn == "Delete")
        {
            myCommand = new SqlCommand("Delete from AssetGroupMaster Where AssetGroupID=@AssetGroupID", myConnection);
            myCommand.Parameters.AddWithValue("@AssetGroupID", Session["AssetGroupID"].ToString());
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            Messages.SetSuccessMessage("2096",null, Session);
            btnsave.Visible = true;
            btnupdate.Visible = false;
        }
    }
}