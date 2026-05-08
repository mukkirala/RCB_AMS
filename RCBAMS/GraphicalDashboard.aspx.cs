using DevExpress.Web.ASPxEditors;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using DevExpress.Web.ASPxObjectContainer;
using EnvDTE;
using System.Activities.Expressions;
using System.Web.UI.DataVisualization.Charting;

public partial class GraphicalDashboard : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection myCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);

    //SqlConnection sqlcon = new SqlConnection(myConnection);
    SqlCommand myCommand;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (fromDate.Text == "")
        //{
        //    lbl_msg.Text = "please select date";
        //    return;
        //}
        //string fromdate = fromDate.Date.ToString("yyyy-MM-dd");
        //string todaydate = todate.Date.ToString("yyyy-MM-dd");
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT AssetDesc, COUNT(AssetDesc) AS NOOFASSETS FROM AssetMaster GROUP BY AssetDesc", myConnection);
        da.Fill(ds);

        DataTable ChartData = ds.Tables[0];
        if (ChartData.Rows.Count > 0)
        {
            if (ChartData.Rows[0]["AssetDesc"].ToString() != "")
            {
                //storing total rows count to loop on each Record                          
                string[] XPoints = new string[ChartData.Rows.Count];

                int[] YPOints = new int[ChartData.Rows.Count];

                for (int count = 0; count < ChartData.Rows.Count; count++)
                {
                    // store values for X axis  
                    XPoints[count] = ChartData.Rows[count]["AssetDesc"].ToString();
                    //store values for Y Axis  
                    YPOints[count] = Convert.ToInt32(ChartData.Rows[count]["NOOFASSETS"]);

                }
                //YPOints[0] = Convert.ToInt32(100);
                //YPOints[1] = Convert.ToInt32(100);
                //binding chart control  
                Chart1.Series[0].Points.DataBindXY(XPoints, YPOints);

                //Setting width of line  
                Chart1.Series[0].BorderWidth = 5;
                //setting Chart type   
                Chart1.Series[0].ChartType = SeriesChartType.Pie;

                //enable to show legend
                Chart1.Legends[0].Enabled = true;

                //show pie chart in 3d
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                //anusha
            }

        }

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
        string select4 = "SELECT COUNT(AssetMaster.AssetDesc)as NoOfAssets,AssetDesc   FROM AssetMaster  where YearofPurchase='"+ txt_search.Text+ "'   group by AssetDesc  order by AssetDesc ASC ";
        SqlDataAdapter da4 = new SqlDataAdapter(select4, myConnection);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        WebChartControl1.DataSource = dt4;
        WebChartControl1.DataBind();
        myConnection.Open();
        DataTable OutputDt = new DataTable();
        OutputDt.Columns.Add("AssetDesc", typeof(string));
        //  OutputDt.Columns.Add("TotalStudents", typeof(int));
        //  OutputDt.Columns.Add("Presentees", typeof(int));
        // OutputDt.Columns.Add("Percent", typeof(double));
        myConnection.Close();
    }




}