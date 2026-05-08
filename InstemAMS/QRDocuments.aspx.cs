using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;


public partial class QRDocuments : System.Web.UI.Page
{
    SqlConnection myConnection1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);

    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string AID = Request.QueryString["ID"];
        AssetDetails.Visible = true;
        string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(LocationDesc+' (',Location+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote FROM [AssetMaster] where AssetID = '" + AID + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, myConnection2);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
            lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
            lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
            lbl_Assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
            lbl_assetlocation.Text = dt.Rows[0]["Location"].ToString();
            lbl_assetstatus.Text = dt.Rows[0]["Status"].ToString();
            //lbl_quantity.Text = dt.Rows[0]["Quantity"].ToString();
            //lbl_component.Text = dt.Rows[0]["Component"].ToString();
            //lbl_inventorynote.Text = dt.Rows[0]["InventoryNote"].ToString();
            //lbl_capitalizationdate.Text = dt.Rows[0]["AssetCapitalizationDate"].ToString();
            //lbl_acquisitiondate.Text = dt.Rows[0]["FirstAcquisitionDate"].ToString();
            //lbl_deacdate.Text = dt.Rows[0]["Deacdate"].ToString();
            lbl_inventorydate.Text = dt.Rows[0]["Invdate"].ToString();
        }
        string query1 = "select DocumentMapID,DocumentName,ImageLocation from AssetDocumentMapping inner join DocumentMaster on AssetDocumentMapping.DocumentID = DocumentMaster.DocumentID WHERE AssetDocumentMapping.AssetID ='" + AID + "'";
        SqlDataAdapter dadoc = new SqlDataAdapter(query1, myConnection1);
        DataTable dtdoc = new DataTable();
        dadoc.Fill(dtdoc);
        if (dtdoc.Rows.Count > 0)
        {
            grid_documets.DataSource = dtdoc;
            grid_documets.DataBind();
        }
        string query2 = "SELECT ImagesMapId,ImageLocation as Assetimage from AssetImageMapping where AssetID='" + AID + "'";
        SqlDataAdapter dadoc1 = new SqlDataAdapter(query2, myConnection1);
        DataTable dtdoc1 = new DataTable();
        dadoc1.Fill(dtdoc1);
        if (dtdoc1.Rows.Count > 0)
        {
            ASPxRoundPanel1.Visible = true;
            string filename = dtdoc1.Rows[0].ItemArray[1].ToString();
            AspxImage2.ImageUrl = filename;

        }
        else
        {
            ASPxRoundPanel1.Visible = false;
        }
    }

    //protected void btn_search_Click(object sender, EventArgs e)
    //{
    //    if (gridlkup_Asset.Text == "")
    //    {

    //    }
    //    else
    //    {

           
    //    }
    //}

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        //  string id = Grid_Performance.GetRowValuesByKeyValue(e.KeyValue, "DocMappingID").ToString();

        if (btn == "View")
        {
            Session["path"] = "";

            string path = grid_documets.GetRowValuesByKeyValue(e.KeyValue, "ImageLocation").ToString();
            Session["path"] = path;
            string files = Path.GetFileName(Path.GetDirectoryName(path));
            string filename = Path.GetFileName(path);
            Response.Redirect("~/" + files + "/" + filename + "");
        }
    }
}