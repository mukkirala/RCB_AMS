using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Configuration;

public partial class AssetMapView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        else
        {

        }

       

    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["AssetID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
        Session["Main"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MainAssetNumber").ToString();

        Session["AssetDesc"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetDesc").ToString();
        Session["Latitude"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Latitude").ToString();
        Session["Longitude"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Longitude").ToString();

        //Response.Redirect("/OnMapView.aspx");
        Response.Redirect("/AssetGeoLocation.aspx");

    }


}