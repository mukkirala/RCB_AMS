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

        string ReqID = ASPxGridLookup1.Value.ToString();

        Myconnection.Open();

        SqlTransaction trans = Myconnection.BeginTransaction();

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
                    ReceiveQty = Convert.ToInt32(qty.Value);
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

                cmd.Parameters.AddWithValue("@ReqID", ReqID);
                cmd.Parameters.AddWithValue("@ItemID", ItemID);
                cmd.Parameters.AddWithValue("@Quantity", ReceiveQty);

                cmd.ExecuteNonQuery();
            }

            SqlCommand parent =
                new SqlCommand(

                "UPDATE POSRequisitionParent " +
                "SET Status='Received' " +
                "WHERE ReqID=@ReqID",

                Myconnection,
                trans);

            parent.Parameters.AddWithValue("@ReqID", ReqID);

            parent.ExecuteNonQuery();

            trans.Commit();

            Myconnection.Close();

            // GENERATE PDF
            getpdf(ReqID);

            lbl_error.Text = "Items Received Successfully";

            Response.Write("<script>");
            Response.Write("alert('Received Successfully');");
            Response.Write("window.open('RequestOrderPdf.aspx','_blank');");
            Response.Write("window.location='ReceiveItems.aspx';");
            Response.Write("</script>");
        }
        catch (Exception ex)
        {
            trans.Rollback();

            Myconnection.Close();

            lbl_error.Text = ex.Message;
        }
    }
    protected void getpdf(string ReqID)
    {
        Session["reqid"] = ReqID;

        DataTable dt = new DataTable();

        SqlDataAdapter da = new SqlDataAdapter(

        "SELECT " +
        "PRD.ItemID AS AssetID, " +
        "ATM.AssetTypeName AS AssetName, " +
        "ATM.AssetTypeCode AS AssetCode, " +
        "PRD.Quantity AS RequiredQuantity, " +
        "GETDATE() AS Date " +
        "FROM POSRequisitionDetails PRD " +
        "INNER JOIN [RCBSAP].[dbo].[AssetTypeMaster] ATM " +
        "ON PRD.ItemID = ATM.AssetTypeID " +
        "WHERE PRD.ReqID=@ReqID",

        Myconnection);

        da.SelectCommand.Parameters.AddWithValue("@ReqID", ReqID);

        da.Fill(dt);

        // GET SAME DETAILS LIKE REQUEST ORDER
        SqlCommand cmdDetails = new SqlCommand(

 "SELECT " +
 "P.Description, " +
 "C.CustodianID, " +
 "C.CustodianName, " +
 "C.PhoneNo, " +
 "C.email, " +
 "C.CustodianDepartmentCode " +
 "FROM POSRequisitionParent P " +
 "INNER JOIN CustodianMaster C " +
 "ON P.ReqSendBy = C.CustodianID " +
 "WHERE P.ReqID=@ReqID",

 Myconnection);

        cmdDetails.Parameters.AddWithValue("@ReqID", ReqID);

        DataTable dtDetails = new DataTable();

        SqlDataAdapter daDetails =
            new SqlDataAdapter(cmdDetails);

        daDetails.Fill(dtDetails);

        string UserName = "";
        string PhoneNo = "";
        string Email = "";
        string Department = "";
        string Description = "";

        if (dtDetails.Rows.Count > 0)
        {
            UserName =
                dtDetails.Rows[0]["CustodianName"].ToString();

            PhoneNo =
                dtDetails.Rows[0]["PhoneNo"].ToString();

            Email =
                dtDetails.Rows[0]["email"].ToString();

            Department =
                dtDetails.Rows[0]["CustodianDepartmentCode"].ToString();

            Description =
                dtDetails.Rows[0]["Description"].ToString();
        }

        // SAME VALUES LIKE REQUEST ORDER
        string[] values =
        {
        System.DateTime.Now.ToString("dd-MM-yyyy"),
        UserName,
        PhoneNo,
        Email,
        Department,
        ReqID,
        Description,
        dtDetails.Rows[0]["CustodianID"].ToString()
    };

        RequestOrderReport report =
            new RequestOrderReport(dt, values);

        report.CreateDocument();

        string FileName =
            "Requestorder_" + ReqID + ".pdf";

        string path =
            Server.MapPath(
            @"PdfReports//RequestOrder//" + FileName);

        report.ExportToPdf(path);

        Myconnection.Open();

        SqlCommand cmd =
            new SqlCommand(

            "UPDATE POSRequisitionParent " +
            "SET Location=@Location " +
            "WHERE ReqID=@ReqID",

            Myconnection);

        cmd.Parameters.AddWithValue("@Location", FileName);
        cmd.Parameters.AddWithValue("@ReqID", ReqID);

        cmd.ExecuteNonQuery();

        Myconnection.Close();
    }
}