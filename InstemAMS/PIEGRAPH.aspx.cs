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
using System.Drawing;
using System.Text;
public partial class PIEGRAPH : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection myCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);

    //SqlConnection sqlcon = new SqlConnection(myConnection);
    SqlCommand myCommand;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Get the data from the database
            DataTable assetData = GetDataFromDatabase();

            // Set the data source for the chart
            Chart1.DataSource = assetData;
            Chart1.DataBind();

            // Assign colors to each asset dynamically and display them in the legend
            AssignColorsToAssets(assetData);

            // Display the names and colors below the pie chart
            DisplayNamesAndColors(assetData);
        }
    }

   private void DisplayNamesAndColors(DataTable assetData)
{
    StringBuilder sb = new StringBuilder();
    foreach (DataRow row in assetData.Rows)
    {
        string assetName = row["AssetDesc"].ToString();
        int assetCount = Convert.ToInt32(row["NOOFASSETS"]);

        // Find the data point with the matching asset name
        DataPoint dataPoint = FindDataPointByAssetName(Chart1.Series["Series1"], assetName);
        if (dataPoint != null)
        {
            Color color = dataPoint.Color;

            sb.AppendFormat("<span style='background-color: {0}; padding: 5px;'>{1} ({2})</span><br />", ColorToHexString(color), assetName, assetCount);
        }
    }

    namesAndColorsContainer.InnerHtml = sb.ToString();
}

    private string ColorToHexString(Color color)
    {
        return $"#{color.R:X2}{color.G:X2}{color.B:X2}";
    }
    private DataTable GetDataFromDatabase()
    {
        DataTable dataTable = new DataTable();

        string query = "SELECT AssetDesc, COUNT(AssetDesc) AS NOOFASSETS FROM AssetMaster GROUP BY AssetDesc";

        using (SqlConnection connection = new SqlConnection(myConnection.ConnectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                myCommand = command; // Assign the command to myCommand variable

                using (SqlDataAdapter adapter = new SqlDataAdapter(myCommand))
                {
                    adapter.Fill(dataTable);
                }
            }
        }

        return dataTable;
    }

    private void AssignColorsToAssets(DataTable assetData)
    {
        foreach (DataRow row in assetData.Rows)
        {
            string assetName = row["AssetDesc"].ToString();
            Color color = GenerateRandomColor(); // Generate a random color or use any other logic

            // Find the data point with the matching asset name
            DataPoint dataPoint = FindDataPointByAssetName(Chart1.Series["Series1"], assetName);
            if (dataPoint != null)
            {
                dataPoint.Color = color;

                // Add the asset and color to the legend
                LegendItem legendItem = new LegendItem();
                legendItem.Name = assetName;
                legendItem.Color = color;
                Chart1.Legends["Default"].CustomItems.Add(legendItem);
            }
        }
    }


    private DataPoint FindDataPointByAssetName(Series series, string assetName)
    {
        // Find the data point with the matching asset name in the specified series
        foreach (DataPoint dataPoint in series.Points)
        {
            if (dataPoint.XValue.Equals(assetName))
            {
                return dataPoint;
            }
        }
        return null; // Data point not found
    }

    private Color GenerateRandomColor()
    {
        // Generate a random color using RGB values
        Random random = new Random();
        Color color = Color.FromArgb(random.Next(256), random.Next(256), random.Next(256));
        return color;
    }
}
