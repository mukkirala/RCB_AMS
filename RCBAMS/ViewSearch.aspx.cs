using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows.Forms;

public partial class ViewSearch : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        Grid.DataSource = ViewState["dt"];
        Grid.DataBind();

    }
    protected void search_Click(object sender, ImageClickEventArgs e)
    {
        if (txt_search.Value == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Text');", true);
            return;
        }

        //SqlCommand myCommand = new SqlCommand("SELECT AssetInventory.[AssetInventoryID], AssetInventory.[Mode], AssetInventory.[AssetType], AssetInventory.[AssetSerialNo],AssetInventory.[AssetName],AssetInventory. [AssetDescription], AssetInventory.[WarrantyDate],AssetInventory. [Status],AssetInventory. [Location],AssetInventory.[ReceivedDate],AssetInventory.[CurrentUserName],TransactionMaster.[IndentOfficerName],TransactionMaster.BudgetCode,TransactionMaster.Supplier,ManufactureExistingProduct.EmployeeName,ManufactureExistingProduct.BatchCode FROM [AssetInventory] LEFT JOIN TransactionMaster ON AssetInventory.TransactionID = TransactionMaster.TransactionID LEFT JOIN ManufactureExistingProduct ON AssetInventory.AssetSerialNo = ManufactureExistingProduct.AssetSerialNo Where (AssetInventory. AssetName like '%" + txt_search.Text + "%' or AssetInventory.Mode like '%" + txt_search.Text + "%' or AssetInventory. AssetType like '%" + txt_search.Text + "%' or AssetInventory.AssetSerialNo like '%" + txt_search.Text + "%' or AssetInventory.AssetDescription like  '%" + txt_search.Text + "%' or AssetInventory.Status like  '%" + txt_search.Text + "%' or AssetInventory.CurrentUserName like  '%" + txt_search.Text + "%'  or AssetInventory.Location like  '%" + txt_search.Text + "%'  or TransactionMaster.IndentOfficerName like  '%" + txt_search.Text + "%' or TransactionMaster.BudgetCode like  '%" + txt_search.Text + "%' or TransactionMaster.BudgetCode like  '%" + txt_search.Text + "%' or TransactionMaster.Supplier like  '%" + txt_search.Text + "%' or ManufactureExistingProduct.EmployeeName like  '%" + txt_search.Text + "%'or ManufactureExistingProduct.BatchCode like  '%" + txt_search.Text + "%') And AssetInventoryStatus= 'Active'  ",myConnection);
        SqlCommand myCommand = new SqlCommand("Select AssetMaster.[SLNO],AssetMaster.[Company],AssetMaster.[Plant],AssetMaster.[AssetID],AssetMaster.[MainAssetNumber],AssetMaster.[AssetSubNumber],AssetMaster.[AssetDesc],AssetMaster.[AssetOwner],AssetMaster.[AssetUser],AssetMaster.[Department],AssetMaster.[CustodianID],AssetMaster.[SerialNumber],AssetMaster.[MACID],AssetMaster.[Location],AssetMaster.[LocationDesc],AssetMaster.[BLOCK],AssetMaster.[Model],AssetMaster.[Make],AssetMaster.[GRNumber],AssetMaster.[YearofPurchase],AssetMaster.[CapitalizationDate],AssetMaster.[AssetClass],AssetMaster.[CostCenter],AssetMaster.[MaterialNumber],AssetMaster.[AcceptDatebyUser],AssetMaster.[PONoforReference],AssetMaster.[WBSNumberforReference],AssetMaster.[InstallationDateforReference] from AssetMaster  where (AssetMaster.Company like '%" + txt_search.Text + "%' or AssetMaster.Plant like '%" + txt_search.Text + "%' or AssetMaster. AssetID like '%" + txt_search.Text + "%' or AssetMaster.MainAssetNumber like '%" + txt_search.Text + "%' or AssetMaster.AssetSubNumber like '%" + txt_search.Text + "%' or AssetMaster.AssetDesc like  '%" + txt_search.Text + "%' or AssetMaster.AssetOwner like  '%" + txt_search.Text + "%'  or AssetMaster.AssetUser like  '%" + txt_search.Text + "%'  or AssetMaster.Department like  '%" + txt_search.Text + "%' or AssetMaster.CustodianID like  '%" + txt_search.Text + "%' or AssetMaster.SerialNumber like  '%" + txt_search.Text + "%' or AssetMaster.MACID like  '%" + txt_search.Text + "%' or AssetMaster.LocationDesc like  '%" + txt_search.Text + "%' or AssetMaster.BLOCK like  '%" + txt_search.Text + "%' or AssetMaster.Model like '%" + txt_search.Text + "%' or AssetMaster.Make like '%" +txt_search.Text +"%' or AssetMaster.GRNumber like '%" + txt_search.Text + "%' or AssetMaster.YearofPurchase like '%" + txt_search.Text + "%' or AssetMaster.CapitalizationDate  like '%" + txt_search.Text + "%' or AssetMaster.AssetClass  like '%" + txt_search.Text + "%' or AssetMaster.CostCenter like '%" + txt_search.Text + "%' or AssetMaster.MaterialNumber like '%" + txt_search.Text + "%' or AssetMaster.AcceptDatebyUser like '%" + txt_search.Text + "%' or AssetMaster.PONoforReference like '%" + txt_search.Text + "%' or AssetMaster.WBSNumberforReference like '%" + txt_search.Text + "%' or AssetMaster.InstallationDateforReference like '%" + txt_search.Text + "%' or AssetMaster.AssetUser like '%" + txt_search.Text + "%' or AssetMaster.Department like '%" + txt_search.Text + "%' ) And Status !='InActive' ", myConnection);
        //SqlCommand myCommand = new SqlCommand("Select AssetMaster.[SLNO],AssetMaster.[Company],AssetMaster.[Plant],AssetMaster.[AssetID],AssetMaster.[MainAssetNumber],AssetMaster.[AssetSubNumber],AssetMaster.[AssetDesc],AssetMaster.[AssetOwner],AssetMaster.[AssetUser],AssetMaster.[Department],AssetMaster.[CustodianID],AssetMaster.[SerialNumber],AssetMaster.[MACID],AssetMaster.[Location],AssetMaster.[LocationDesc],AssetMaster.[BLOCK],AssetMaster.[Model],AssetMaster.[GRNumber],AssetMaster.[YearofPurchase],AssetMaster.[CapitalizationDate],AssetMaster.[AssetClass],AssetMaster.[CostCenter],AssetMaster.[MaterialNumber],AssetMaster.[AcceptDatebyUser],AssetMaster.[PONoforReference],AssetMaster.[WBSNumberforReference],AssetMaster.[InstallationDateforReference] from AssetMaster  where MainAssetNumber='" + gridlkup_Equimentno.Value + "'", myConnection);

        SqlDataAdapter da = new SqlDataAdapter(myCommand);
        DataTable dt = new DataTable();
        da.Fill(dt);
      
        Grid.DataSource = dt;
        ViewState["dt"] = dt;
        Grid.DataBind();
     
       
    }
    protected void ExporttoPDF_Click(object sender, ImageClickEventArgs e)
    {


        gridexport.FileName = "ViewSearchData";
        gridexport.WritePdfToResponse();
    }


    protected void ExporttoExport_Click(object sender, ImageClickEventArgs e)
    {

        gridexport.FileName = "ViewSearchData";
        gridexport.WriteXlsToResponse();
    }



    protected void grid_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Number")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }
}