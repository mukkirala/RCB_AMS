using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeletedAssetList : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        errormsg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Recover")
        {
            errormsg.Visible = true;
            string SLNO = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SLNO").ToString();
            string query2 = "UPDATE AssetMaster SET Status='AVAL',StatusDesc='Asset Available' Where SLNO='" + SLNO + "'";
            myCommand = new SqlCommand(query2, myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            errormsg.Text = "Asset Recovered  Successfully";
            myConnection.Close();
            ASPxGridView1.DataBind();
           
        }
    }
}