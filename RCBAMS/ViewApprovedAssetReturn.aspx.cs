using System;
using DevExpress.Web.ASPxGridView;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewApprovedAssetReturn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("/ErrorPage.aspx");
            return;
        }
    }

    protected void DetailGrid1_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["RequestID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void DetailGrid2_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}