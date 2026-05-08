using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using DevExpress.XtraCharts.Web;
using DevExpress.Web.ASPxObjectContainer;
using EnvDTE;
using System.Activities.Expressions;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

public partial class ViewBargraphofAssest : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conCommon = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void search_Click(object sender, ImageClickEventArgs e)
    {
        AllAssets();
    }
    protected void AllAssets()
    {
        DateTime systemdate = System.DateTime.Now;
        string date = systemdate.ToString("yyyy-MM-dd");
        // DateTime dtt = ASPxDateEdit1.Date;
        //string date2 = dtt.ToString("yyyy-MM-dd");
        //All Schools Class Wise Total Strength
        string select4 = "SELECT COUNT(AssetMaster.AssetDesc)as NoOfAssets,AssetDesc   FROM AssetMaster  where YearofPurchase='" + cmb_Dep.Text + "'   group by AssetDesc  order by AssetDesc ASC ";
        SqlDataAdapter da4 = new SqlDataAdapter(select4, conSAP);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        WebChartControl1.DataSource = dt4;
        WebChartControl1.DataBind();
        conSAP.Open();
        DataTable OutputDt = new DataTable();
        OutputDt.Columns.Add("AssetDesc", typeof(string));
        //  OutputDt.Columns.Add("TotalStudents", typeof(int));
        //  OutputDt.Columns.Add("Presentees", typeof(int));
        // OutputDt.Columns.Add("Percent", typeof(double));
        conSAP.Close();
    }
}