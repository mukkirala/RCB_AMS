using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using DevExpress.Xpo.DB.Helpers;

public partial class AddAssetTypeMaster : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    string date = System.DateTime.Now.Date.ToString("yyyy-MM-dd");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
        //string AssetClass = WebConfigurationManager.AppSettings.Get("AssetClass");
        //cmb_AssetClass.DataSource = AssetClass.Split(',');
        //cmb_AssetClass.DataBind();
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());

    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        lbl_dsplay.Visible = false;
        if (txt_assetname.Text == "")
        {
            lbl_dsplay.Text = "Enter Asset Type";
            lbl_dsplay.Visible = true;
            return;
        }
        if (cmb_AssetClass.Text == "")
        {
            lbl_dsplay.Text = "Enter Asset Class";
            lbl_dsplay.Visible = true;
            return;
        }
        string query = "select AssetTypeName from AssetTypeMaster";
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(query, myConnection);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (txt_assetname.Text == dt.Rows[i]["AssetTypeName"].ToString())
                {
                    lbl_dsplay.Text = "An Asset With Same Name is Exists ";
                    lbl_dsplay.Visible = true;
                    return;
                }
            }
                    //string insertq = "insert into AssetTypeMaster ([AssetTypeName],[AssetTypeCode],[CreatedDate],[Status]) Values (@AssetTypeName,@AssetTypeCode,@CreatedDate,@Status)";
            string insertq = "insert into AssetTypeMaster ([AssetTypeName],[AssetClassName],[CreatedDate],[Status]) Values (@AssetTypeName,@AssetClassName,@CreatedDate,@Status)";

            myCommand = new SqlCommand(insertq, myConnection);
                    myCommand.Parameters.AddWithValue("@AssetTypeName", txt_assetname.Text);
             myCommand.Parameters.AddWithValue("@AssetClassName", cmb_AssetClass.Value);
            myCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    myCommand.Parameters.AddWithValue("@Status", "Active");
                    myConnection.Open();
                    myCommand.ExecuteNonQuery();
                    myConnection.Close();
                    ASPxGridView1.DataBind();
                    lbl_dsplay.Text = "Data Saved Successfully";
                    lbl_dsplay.Visible = true;
                    Clear();
        }
        else
        {
            //string insertq = "insert into AssetTypeMaster ([AssetTypeName],[AssetTypeCode],[CreatedDate],[Status]) Values (@AssetTypeName,@AssetTypeCode,@CreatedDate,@Status)";
            string insertq = "insert into AssetTypeMaster ([AssetTypeName],[AssetClassName],[CreatedDate],[Status]) Values (@AssetTypeName,@AssetClassName,@CreatedDate,@Status)";

            myCommand = new SqlCommand(insertq, myConnection);
            myCommand.Parameters.AddWithValue("@AssetTypeName", txt_assetname.Text);
            // myCommand.Parameters.AddWithValue("@AssetTypeCode", txt_assetcode.Text);
            myCommand.Parameters.AddWithValue("@AssetClassName", cmb_AssetClass.Value);
            myCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            myCommand.Parameters.AddWithValue("@Status", "Active");
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            lbl_dsplay.Text = "Data Saved Successfully";
            lbl_dsplay.Visible = true;
            Clear();
        }       
    }
    protected void Clear()
    {
        cmb_AssetClass.Text = "";
        txt_assetname.Text = "";
    }

    protected void btn_Update_Click(object sender, EventArgs e)
    {

        if (txt_assetname.Text == "")
        {
            lbl_dsplay.Text = "Enter Asset Type";
            lbl_dsplay.Visible = true;
            return;
        }
        //myCommand = new SqlCommand("UPDATE AssetTypeMaster SET  AssetTypeName='" + txt_assetname.Text + "',AssetTypeCode='" + txt_assetcode.Text + "' WHERE AssetTypeID='" + Session["AssetTypeID"] + "'", myConnection);
        myCommand = new SqlCommand("UPDATE AssetTypeMaster SET  AssetTypeName='" + txt_assetname.Text + "',AssetClassName='" + cmb_AssetClass.Text + "' WHERE AssetTypeID='" + Session["AssetTypeID"] + "'", myConnection);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        btn_Update.Visible = false;
        btn_save.Visible = true;
        Messages.SetSuccessMessage("0060", null, Session);
        Clear();
        ASPxGridView1.DataBind();
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string AssetTypeID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeID").ToString();
            Session["AssetTypeID"] = AssetTypeID;
            txt_assetname.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeName").ToString();
            //txt_assetcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeCode").ToString();
            string query = "select AssetClassName from AssetTypeMaster  WHERE AssetTypeID= AssetTypeID";
            SqlDataAdapter da = new SqlDataAdapter(query, myConnection);
            //myConnection.Open();
           // myCommand.ExecuteNonQuery();
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    cmb_AssetClass.Value = dt.Rows[i]["AssetClassName"].ToString();
                }
            }
            btn_Update.Visible = true;
            btn_save.Visible = false;

        }
        if (btn == "Delete")
        {

            string AssetTypeID = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetTypeID").ToString();
            string Query2 = "UPDATE [AssetTypeMaster] SET Status='InActive' Where AssetTypeID='" + AssetTypeID + "'";
            myCommand = new SqlCommand(Query2, myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            ASPxGridView1.DataBind();
            btn_Update.Visible = false;
            btn_save.Visible = true;
            Clear();
            lbl_dsplay.Visible = false;
            Messages.SetSuccessMessage("0061", null, Session);

        }
    }

   

}