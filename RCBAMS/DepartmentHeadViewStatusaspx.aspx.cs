using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DepartmentHeadViewStatusaspx : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadRequests();
        }
    }

    protected void LoadRequests()
    {
        string query = @"
    SELECT 
        PRD.[ReqDetailsID],
        PRD.[ReqID],
        PRD.[ItemID],
        ATM.AssetClassName AS AssetClass,
        ATM.AssetTypeName AS AssetType,
        PRD.[Quantity],
        PRD.[Status],
        ISNULL(PRD.[ApproverQuantity],0) AS ApproverQuantity
    FROM POSRequisitionDetails PRD
    INNER JOIN [RCBSAP].[dbo].[AssetTypeMaster] ATM
        ON PRD.ItemID = ATM.AssetTypeID
    ORDER BY PRD.ReqDetailsID DESC";

        SqlDataAdapter da = new SqlDataAdapter(query, conAMS);

        DataTable dt = new DataTable();
        da.Fill(dt);

        ASPxGridView1.DataSource = dt;
        ASPxGridView1.DataBind();
    }
}