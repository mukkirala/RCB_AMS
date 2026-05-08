using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class ViewAssetDocuments : System.Web.UI.Page
{
    SqlConnection myconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void detailGrid_DataSelect(object sender, EventArgs e)
    {
        Session["AssetID"] = (sender as ASPxGridView).GetMasterRowKeyValue();


    }

    protected void DetailGrid_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "View")
        {
      
            SqlDataAdapter myCommand = new SqlDataAdapter("select ImageLocation from [AssetDocumentMapping] where AssetID='" + Session["AssetID"] + "'", myconnection);
            DataTable dt = new DataTable();
            myCommand.Fill(dt);
            if(dt.Rows.Count!=0)
            {
                Session["path"] =dt.Rows[0].ItemArray[0].ToString();
                Response.Redirect("/ViewDocument.aspx");
            }
        }
    }

}