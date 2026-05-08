using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class ViewAssetRequest : System.Web.UI.Page
{
    static string EmailId;
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["UserID"]==null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
    }

    protected void DetailGrid_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["AssetRequestID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }



    //protected void RejDetailGrid_BeforePerformDataSelect(object sender, EventArgs e)
    //{
    //    Session["RejAssetRequestID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    //}
}