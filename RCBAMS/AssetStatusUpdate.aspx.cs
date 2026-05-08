using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxUploadControl;
using System.IO;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Export;


public partial class AssetStatusUpdate : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

       
    }

    //protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    //{
    //    try
    //    {
    //        if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
    //        string test = (e.GetValue("PrintStatus").ToString());
    //        Session["PrintStatus"] = test;
    //        if (test == "yes")
    //        {
    //            e.Row.BackColor = System.Drawing.Color.FromName("rgb(240, 240, 240)");//207, 207, 207,
    //        }
    //        //if (Session["PrintStatus"].ToString() == "")
    //        //{
    //        //    e.Row.BackColor = System.Drawing.Color.FromName("rgb(157, 244, 249)");
    //        //}
    //    }
    //    catch (Exception ex)
    //    {

    //    }


    //    //if (e.RowType != GridViewRowType.Data) return;
    //    //string ID = e.GetValue("AssetID").ToString();
    //    //string Asset =e.GetValue("MainAssetNumber").ToString();
    //    //string Sub = e.GetValue("AssetSubNumber").ToString();
    //    //string Class = e.GetValue("AssetClass").ToString();


    //}

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (gridlkup_Asset.Text == "")
        {

        }
        else
        {

            AssetDetails.Visible = true;
            string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,CapitalizationDate,FirstAcquisitionDate,CustodianID,concat(Location+' (',Block+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote,StatusDesc FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "' and  Status !='InActive' and StatusDesc !='Asset Deleted'";
            SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
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
                lbl_quantity.Text = dt.Rows[0]["Quantity"].ToString();
                lbl_component.Text = dt.Rows[0]["Component"].ToString();
                lbl_inventorynote.Text = dt.Rows[0]["InventoryNote"].ToString();
                lbl_capitalizationdate.Text = dt.Rows[0]["CapitalizationDate"].ToString();

                lbl_acquisitiondate.Text = dt.Rows[0]["FirstAcquisitionDate"].ToString();
                lbl_deacdate.Text = dt.Rows[0]["Deacdate"].ToString();
                lbl_inventorydate.Text = dt.Rows[0]["Invdate"].ToString();
                cmb_Status.Text= dt.Rows[0]["StatusDesc"].ToString();
            }
        }
    }

    protected void StatusUpdate_Click(object sender, EventArgs e)
    {
        errormsg.Visible = false;
        if (gridlkup_Asset.Text=="")
        {
            errormsg.Text = "Select Asset";
            errormsg.Visible = true;
            return;
        }

        if (cmb_Status.Text == "")
        {
            errormsg.Text = "Select Status";
            errormsg.Visible = true;
            return;
        }

        SqlCommand myCommand = new SqlCommand("update AssetMaster set Status='"+ cmb_Status.Value.ToString()+ "',StatusDesc='"+ cmb_Status.Text+ "' where AssetID = '" + gridlkup_Asset.Value.ToString() + "'", conSAP);
        try
        {
           
            conSAP.Open();
            myCommand.ExecuteNonQuery();
            ASPxGridView1.DataBind();
            Clear();
        }
        catch (Exception ex)
        {

        }

        finally
        {
           
            conSAP.Close();
        }
    }

    private void Clear()
    {
        gridlkup_Asset.Value = "";
        cmb_Status.Value = "";
        AssetDetails.Visible = false;
    }




    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.FileName = "Asset Status Change Data";
        ASPxGridViewExporter1.PageHeader.Center = "View Asset Status Change Data";
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.MaxColumnWidth = 75;
        ASPxGridViewExporter1.Landscape = true;
        ASPxGridViewExporter1.WritePdfToResponse();
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ASPxGridViewExporter1.PageHeader.Font.Bold = true;
        ASPxGridViewExporter1.FileName = "Asset Status Change Data";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }
}