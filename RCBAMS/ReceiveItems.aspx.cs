using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class ReceiveItems : System.Web.UI.Page
{
    SqlConnection Myconnection =
        new SqlConnection(
        WebConfigurationManager
        .ConnectionStrings["RCBAMSConnectionString"]
        .ConnectionString);

    SqlCommand myCommand;
    SqlTransaction trans;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";

        if (ASPxGridLookup1.Value == null)
        {
            lbl_error.Text =
                "Please Select Requisition";

            return;
        }

        Session["ReqID"] =
            ASPxGridLookup1.Value.ToString();

        ASPxGridView1.DataBind();
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";

        if (ASPxGridLookup1.Value == null)
        {
            lbl_error.Text = "Please Select Requisition";
            return;
        }

        string ReqID =
            ASPxGridLookup1.Value.ToString();

        Myconnection.Open();

        SqlTransaction trans =
            Myconnection.BeginTransaction();

        try
        {
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                string ItemID =
                    ASPxGridView1
                    .GetRowValues(i, "ItemID")
                    .ToString();

                ASPxSpinEdit qty =
                    ASPxGridView1.FindRowCellTemplateControl(
                    i,
                    ASPxGridView1.Columns[8]
                    as GridViewDataColumn,
                    "txt_qty") as ASPxSpinEdit;

                int ReceiveQty = 0;

                if (qty != null && qty.Value != null)
                {
                    ReceiveQty =
                        Convert.ToInt32(qty.Value);
                }

                SqlCommand cmd =
                    new SqlCommand(

                    "UPDATE POSRequisitionDetails " +
                    "SET " +
                    "Status='Received', " +
                    "Quantity=@Quantity " +
                    "WHERE ReqID=@ReqID " +
                    "AND ItemID=@ItemID",

                    Myconnection,
                    trans);

                cmd.Parameters.AddWithValue(
                    "@ReqID",
                    ReqID);

                cmd.Parameters.AddWithValue(
                    "@ItemID",
                    ItemID);

                cmd.Parameters.AddWithValue(
                    "@Quantity",
                    ReceiveQty);

                cmd.ExecuteNonQuery();
            }

            SqlCommand parent =
                new SqlCommand(

                "UPDATE POSRequisitionParent " +
                "SET Status='Received' " +
                "WHERE ReqID=@ReqID",

                Myconnection,
                trans);

            parent.Parameters.AddWithValue(
                "@ReqID",
                ReqID);

            parent.ExecuteNonQuery();

            trans.Commit();

            lbl_error.Text =
                "Items Received Successfully";

            ASPxGridView1.DataBind();

            ASPxGridLookup1.Value = null;

            Response.Write(
            @"<script>
        alert('Received Successfully');
        window.location='ReceiveItems.aspx';
        </script>");
        }
        catch (Exception ex)
        {
            trans.Rollback();

            lbl_error.Text = ex.Message;
        }
        finally
        {
            Myconnection.Close();
        }
    }
}