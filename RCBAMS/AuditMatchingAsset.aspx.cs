using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AuditMatchingAsset : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    static int srno = 0;
    SqlCommand myCommand;
    static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["data"] = null;
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataBind();
        }
    }

    protected void cmb_AuditID_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable datatable1 = new DataTable();
        datatable1.Columns.Add("MainAssetNumber");
        datatable1.Columns.Add("QRCode");
        datatable1.Columns.Add("QRImage");
        datatable1.Columns.Add("Status");
        datatable1.Columns.Add("Comments");
        datatable1.Columns.Add("AuditName");
        datatable1.Columns.Add("Location");
        datatable1.Columns.Add("AuditDate");

        string query = " SELECt distinct AuditDetails.MainAssetNumber,QRCode,QRImage,AuditDetails.Status,Comments,AuditName,Location,AuditDate FROM AuditDetails inner join QRCodeMaster on QRCodeMaster.MainAssetNumber = AuditDetails.MainAssetNumber inner join AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID inner join LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID WHERE AuditDetails.AuditID = '" + cmb_AuditID.Value + "'";
        SqlDataAdapter dtauditdata = new SqlDataAdapter(query, con);
        DataTable dtaudittable = new DataTable();
        dtauditdata.Fill(dtaudittable);
        if (dtaudittable.Rows.Count > 0)
        {
            ASPxGridView1.DataSource = dtaudittable;
            ASPxGridView1.DataBind();
            ViewState["data"] = dtaudittable;
        }

    }

    //    DataTable datatable1 = new DataTable();
    //    datatable1.Columns.Add("AssetID");
    //    datatable1.Columns.Add("AssetName");
    //    datatable1.Columns.Add("location");
    //    datatable1.Columns.Add("date");
    //    datatable1.Columns.Add("Status");
    //    string query = "SELECt distinct AssetMaster.AssetID,AssetMaster.AssetName,locationmaster.location,auditdetails.date,'Found' as available FROM AssetMaster inner join auditdetails on AuditDetails.AssetID = AssetMaster.ImageLocation inner join locationmaster on locationmaster.LocationID=AssetMaster.LocationID WHERE AssetMaster.ImageLocation IN (SELECT AssetID FROM AuditDetails WHERE AuditID='" + cmb_AuditID.Value + "') and Assetmaster.LocationID = '" + cmb_location.Value + "'";
    //    SqlDataAdapter dtauditdata = new SqlDataAdapter(query, con);
    //    DataTable dtaudittable = new DataTable();
    //    dtauditdata.Fill(dtaudittable);
    //    if (dtaudittable.Rows.Count > 0)
    //    {
    //        for (int i = 0; i < dtaudittable.Rows.Count; i++)
    //        {
    //            string AssetID = dtaudittable.Rows[i].ItemArray[0].ToString();
    //            string AssetName = dtaudittable.Rows[i].ItemArray[1].ToString();
    //            string location = dtaudittable.Rows[i].ItemArray[2].ToString();
    //            DateTime dt = Convert.ToDateTime(dtaudittable.Rows[i].ItemArray[3]);
    //            string date1 = dt.ToString("dd-MM-yyyy");
    //            string status = dtaudittable.Rows[i].ItemArray[4].ToString();
    //            datatable1.Rows.Add(AssetID, AssetName, location, date1, status);
    //        }
    //        ViewState["data"] = datatable1;

    //    }
    //    ASPxGridView1.DataSource = ViewState["data"] as DataTable;
    //    ASPxGridView1.DataBind();
    //    string query1 = "select AssetMaster.AssetID,AssetMaster.AssetName,locationmaster.location,'Not Found' as available from assetmaster inner join locationmaster on locationmaster.LocationID=AssetMaster.LocationID WHERE AssetMaster.ImageLocation NOT IN (SELECT AuditDetails.AssetID FROM AuditDetails  WHERE AuditID='" + cmb_AuditID.Value + "') and Assetmaster.LocationID = '" + cmb_location.Value + "'";
    //    SqlDataAdapter dtauditdata1 = new SqlDataAdapter(query1, con);
    //    DataTable dtaudittable1 = new DataTable();
    //    dtauditdata1.Fill(dtaudittable1);
    //    if (dtaudittable1.Rows.Count > 0)
    //    {
    //        for (int i = 0; i < dtaudittable1.Rows.Count; i++)
    //        {
    //            string AssetID = dtaudittable1.Rows[i].ItemArray[0].ToString();
    //            string AssetName = dtaudittable1.Rows[i].ItemArray[1].ToString();
    //            string location = dtaudittable1.Rows[i].ItemArray[2].ToString();
    //            //DateTime dt = Convert.ToDateTime(dtaudittable.Rows[i].ItemArray[3]);
    //            //string date1 =dt.ToString("dd-MM-yyyy");
    //            string status = dtaudittable1.Rows[i].ItemArray[3].ToString();
    //            datatable1.Rows.Add(AssetID, AssetName, location, "", status);
    //        }
    //        ViewState["data"] = datatable1;

    //    }
    //    ASPxGridView1.DataSource = ViewState["data"] as DataTable;
    //    ASPxGridView1.DataBind();
}