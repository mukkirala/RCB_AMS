using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewBarCodes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPxGridView2.Visible = false;
    }

    protected void GetAssetData_Click(object sender, EventArgs e)
    {
        string Client=Client_gridlookup.Value.ToString();
        string AssetClass = Assetclass_gridlookup.Value.ToString();
        Session["Client"] = Client;
        Session["AssetClass"] = AssetClass;
        ASPxGridView2.Visible = true;
    }
}