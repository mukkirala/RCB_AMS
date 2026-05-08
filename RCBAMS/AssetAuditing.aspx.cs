using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web;
using System.Configuration;
using System.Collections;

public partial class AssetAuditing : System.Web.UI.Page
{
    SqlConnection myconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlCommand myCommand;
    DataTable dtItems = new DataTable();
    DataTable dt3 = new DataTable();
    private const string PAGENAME = "AssetAuditing.aspx";
    private const string SCANBARCODE = "ASSET AUDITING-Asset Auditing";

    protected void Page_Load(object sender, EventArgs e)
    {
        string sPrivList = "";

        sPrivList = Session["PRIVLIST"] + "";

        if (sPrivList == "")
        {
            Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=Session expired. Please login again");
        }

        Hashtable ht = ARP.BusinessLogic.Misc.Utilities.GetRightsForPage(PAGENAME, sPrivList);

        if (ht == null)
        {
            Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=Page not found");
        }

        //if (System.Convert.ToBoolean(ht[SCANBARCODE].ToString()) == false)
        //{
        //    //Response.Redirect(ConfigurationSettings.AppSettings["Root"].ToString() + "ErrorPage.aspx?msg=You have no access to change the password");
        //   // Response.Redirect("UnAuthorisedUser.aspx");
        //}
        if (!IsPostBack)
        {
            Session["AuditID"] = null;
            ASPxGridView1.DataBind();
        }
        txt_scanneddate.Date = System.DateTime.Now;

    }

    protected void rbtnlt_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnlt_type.SelectedItem.Text == "New")
        {
            lbl_Auditname.Visible = false;
            grdlp_AuditID.Visible = false;
            btn_Audit.Visible = false;
            btn_AuditSave.Visible = true;
            btnsearch.Visible = true;
        }
        else if (rbtnlt_type.SelectedItem.Text == "Existing")
        {
            lbl_Auditname.Visible = true;
            grdlp_AuditID.Visible = true;
            btn_Audit.Visible = true;
            btn_AuditSave.Visible = false;
            btnsearch.Visible = false;
        }
    }
    protected void btn_Audit_Click(object sender, EventArgs e)
    {
        if (grdlp_AuditID.Text == "")
        {
            Messages.SetErrorMessage("2124", null, null, null, Session);
            return;
        }
        Session["AuditID"] = grdlp_AuditID.Value.ToString();
        ViewState["AuditID"] = grdlp_AuditID.Value.ToString();
        myCommand = new SqlCommand("Select AuditDetails.Barcode,AssetMaster.ImageLocation,AssetSapNo,AssetDescription,SerialNo,CaptureDate,AquisitionValue,AuditDetails.Status,AuditDetails.Comments from AssetMaster INNER JOIN AuditDetails on AuditDetails.Barcode=AssetMaster.Barcode Where AuditID='" + grdlp_AuditID.Value + "'  ", myconnection);
        myconnection.Open();
        SqlDataReader dr1 = myCommand.ExecuteReader();
        int Count = 0;
        while (dr1.Read())
            Count++;
        lbl_Scancount.Text = Count.ToString();

        myconnection.Close();

        myCommand = new SqlCommand("Select AuditDate,UnitCode,UnitName,AssetGroupDescription,AuditName,AuditBy,AuditDiscription,ISNULL(TotalStock,0) As TotalStock from UnitMaster  right JOIN AuditMaster On UnitMaster.UnitCode=AuditMaster.UnitNo Left Join AssetGroupMaster On AuditMaster.AssetGroup=AssetGroupMaster.AssetGroupCode Where AuditStatus='AuditInProgress' And AuditID='" + grdlp_AuditID.Value + "'  ", myconnection);
        myconnection.Open();
        SqlDataReader dr = myCommand.ExecuteReader();
        DataTable dt = new DataTable();
        while (dr.Read())
        {
            txt_scanneddate.Date = Convert.ToDateTime(dr["AuditDate"].ToString());
            cmb_Unit.Value = dr["UnitCode"].ToString();
            cmb_Unit.Text = dr["UnitName"].ToString();
            cmb_Assetgroup.Text = dr["AssetGroupDescription"].ToString();
            txt_auditname.Text = dr["AuditName"].ToString();
            cmb_auditedby.Text = dr["AuditBy"].ToString();
            txt_discription.Text = dr["AuditDiscription"].ToString();
            lbl_totalstock.Text = dr["TotalStock"].ToString();
            txt_scanneddate.ReadOnly = cmb_Unit.ReadOnly = cmb_Assetgroup.ReadOnly = txt_auditname.ReadOnly = cmb_auditedby.ReadOnly = txt_discription.ReadOnly = true;

        }
        myconnection.Close();
        lbl_Balleft.Text = (Convert.ToDouble(lbl_totalstock.Text) - Convert.ToDouble(lbl_Scancount.Text)).ToString();

    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string Unitcode = "";
        string GroupCode = "";
        if (cmb_Unit.Text != "")
        {
            Unitcode = cmb_Unit.Value.ToString();
        }
        if (cmb_Assetgroup.Text != "")
        {
            GroupCode = cmb_Assetgroup.Value.ToString();
        }
        DataTable TCdt = new DataTable();
        SqlDataAdapter TCda = new SqlDataAdapter("SELECT COUNT(Barcode) FROM AssetMaster WHERE UnitCode Like '%" + Unitcode + "%' AND AssetGroupCode like '%" + GroupCode + "%' AND Status!='Scrap' AND Status!='OutBound' AND Status!='DeActivate' AND Status!='PendingQA' AND Status!='Transfered'", myconnection);
        TCda.Fill(TCdt);
        if (TCdt.Rows.Count != 0)
        {
            lbl_totalstock.Text = TCdt.Rows[0].ItemArray[0].ToString();
        }
        else
        {
            lbl_totalstock.Text = "0.00";
        }
    }

    protected void btn_AuditSave_Click(object sender, EventArgs e)
    {
        string Unitcode = "";
        string PlantName = "";
        if (cmb_Unit.Text == "")
        {
            Messages.SetErrorMessage("2108", null, null, null, Session);
            return;
        }
        if (cmb_Unit.Text != "")
        {
            Unitcode = cmb_Unit.Value.ToString();
            PlantName = cmb_Unit.Text.ToString();
        }
        if (txt_auditname.Text == "")
        {
            Messages.SetErrorMessage("2127", null, null, null, Session);
            return;
        }

        //string UnitNo = cmb_unitname.Value.ToString();

        myCommand = new SqlCommand("INSERT INTO AuditMaster (AuditDate,AuditName,AuditDiscription,UnitNo,AuditBy,Statuss,AuditStatus,TotalStock,AssetGroup)VALUES (@AuditDate,@AuditName,@AuditDiscription,@UnitNo,@AuditBy,@Statuss,@AuditStatus,@TotalStock,@AssetGroup)" + "SELECT Scope_Identity()", myconnection);
        myCommand.Parameters.AddWithValue("@AuditDate", txt_scanneddate.Date.ToString("yyyy-MM-dd"));
        myCommand.Parameters.AddWithValue("@AuditName", txt_auditname.Text);
        myCommand.Parameters.AddWithValue("@AuditDiscription", txt_discription.Text);
        myCommand.Parameters.AddWithValue("@UnitNo", Unitcode);
        myCommand.Parameters.AddWithValue("@AuditBy", cmb_auditedby.Text);
        myCommand.Parameters.AddWithValue("@Statuss", "Enable");
        string tstock = lbl_totalstock.Text;
        if (lbl_totalstock.Text == "")
        {
            lbl_totalstock.Text = "0";
        }
        myCommand.Parameters.AddWithValue("@TotalStock", lbl_totalstock.Text);
        myCommand.Parameters.AddWithValue("@AuditStatus", "AuditInProgress");
        myCommand.Parameters.AddWithValue("@AssetGroup", cmb_Assetgroup.Value);
        myconnection.Open();
        int Audit_ID = Convert.ToInt32(myCommand.ExecuteScalar());
        myconnection.Close();
        ViewState["AuditID"] = Audit_ID;
        Session["AuditID"] = Audit_ID;
        AuditHistory();
        Clear();
    }

    protected void txt_ScanBarcode_TextChanged(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        string barcode = txt_ScanBarcode0.Text;
        string auditID = "";
        if (rbtnlt_type.SelectedItem.Text == "New")
        {
            auditID = ViewState["AuditID"].ToString();
        }
        else if (rbtnlt_type.SelectedItem.Text == "Existing")
        {
            if (grdlp_AuditID.Text == "")
            {
                lbl_error.Text = "Please Select Audit No";
                return;
            }
            auditID = grdlp_AuditID.GridView.GetRowValues(grdlp_AuditID.GridView.FocusedRowIndex, "AuditID").ToString();

        }
        SqlDataAdapter daasset = new SqlDataAdapter("Select AssetMaster.Barcode,AssetDescription from AssetMaster INNER JOIN AuditDetails on AuditDetails.Barcode=AssetMaster.Barcode Where AuditID='" + auditID + "' and AuditDetails.Barcode='" + barcode + "';Select AssetDescription,AquisitionValue from AssetMaster  Where  Barcode='" + barcode + "' And [Status]='Available' and UnitCode='" + cmb_Unit.Value + "';Select * from AuditDetails where AuditID='" + auditID + "'", myconnection);
        DataSet dtasset = new DataSet();
        daasset.Fill(dtasset);
        if (dtasset.Tables[0].Rows.Count > 0)
        {
            lbl_error.Text = "Asset Already Audited";
            txt_ScanBarcode0.Text = "";
            txt_ScanBarcode0.Focus();
            lbl_Scancount.Text = dtasset.Tables[2].Rows.Count.ToString();
            lbl_Balleft.Text = (Convert.ToDouble(lbl_totalstock.Text) - Convert.ToDouble(lbl_Scancount.Text)).ToString();
            return;
        }
        else
        {
            if (dtasset.Tables[1].Rows.Count > 0)
            {
                lbl_Scancount.Text = (dtasset.Tables[2].Rows.Count + 1).ToString();
                lbl_Balleft.Text = (Convert.ToDouble(lbl_totalstock.Text) - Convert.ToDouble(lbl_Scancount.Text)).ToString();
            }
            else
            {
                lbl_error.Text = "Asset Not Found Or you are scanning From Other Group/Unit";
                txt_ScanBarcode0.Text = "";
                txt_ScanBarcode0.Focus();
                return;
            }
        }

        if (txt_ScanBarcode0.Text == String.Empty)
        {
            Messages.SetErrorMessage("2120", null, null, null, Session);
            return;
        }

        myCommand = new SqlCommand("INSERT INTO AuditDetails (AuditID,Barcode,Status,Comments,Date)VALUES (@AuditID,@Barcode,@Status,@Comments,@Date)", myconnection);
        myCommand.Parameters.AddWithValue("@AuditID", ViewState["AuditID"]);
        myCommand.Parameters.AddWithValue("@Barcode", txt_ScanBarcode0.Text);
        myCommand.Parameters.AddWithValue("@Status", "Available");
        myCommand.Parameters.AddWithValue("@Comments", "");
        myCommand.Parameters.AddWithValue("@Date", System.DateTime.Now.ToString("yyyy-MM-dd"));
        myconnection.Open();
        myCommand.ExecuteNonQuery();
        txt_ScanBarcode0.Text = "";
        txt_ScanBarcode0.Focus();
        ASPxGridView1.DataBind();
        myconnection.Close();

    }

   
    protected void btn_Complete_Click(object sender, EventArgs e)
    {

        string auditID = "";
        if (rbtnlt_type.SelectedItem.Text == "New")
        {
            if (!string.IsNullOrEmpty(Session["AuditID"] as string))
            {
                auditID = Session["AuditID"].ToString();
            }
        }
        else if (rbtnlt_type.SelectedItem.Text == "Existing")
        {
            auditID = grdlp_AuditID.Value.ToString();
        }
      
        lbl_error.Text = "";
        SqlCommand mycommand = new SqlCommand("Update AuditMaster Set AuditStatus='AuditComplete' Where AuditID='" + auditID + "'", myconnection);
        myconnection.Open();
        mycommand.ExecuteNonQuery();
        myconnection.Close();
        btn_print.Visible = true;

    }
    protected void btn_print_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Session["AuditID"] as string))
        {
            string Unitcode = "";
            string PlantName = "";
            if (cmb_Unit.Text != "")
            {
                Unitcode = cmb_Unit.Value.ToString();
                PlantName = cmb_Unit.Text.ToString();
            }

            dt3.Columns.Add("Barcode");
            dt3.Columns.Add("SAPNo");
            dt3.Columns.Add("AssetDescription");
            dt3.Columns.Add("Status");
            dt3.Columns.Add("Remarks");
            dt3.Columns.Add("Capt.Date");
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                string barcode = ASPxGridView1.GetRowValues(i, "Barcode").ToString();
                string SAPNO = ASPxGridView1.GetRowValues(i, "AssetSapNo").ToString();
                string AssetDec = ASPxGridView1.GetRowValues(i, "AssetDescription").ToString();
                string Status = ASPxGridView1.GetRowValues(i, "Status").ToString();
                string Remarks = ASPxGridView1.GetRowValues(i, "Comments").ToString();
                DateTime Capdate = Convert.ToDateTime(ASPxGridView1.GetRowValues(i, "CaptureDate").ToString());
                dt3.Rows.Add(barcode, SAPNO, AssetDec, Status, Remarks, Capdate);
            }

            Session["ReportID"] = ViewState["AuditID"];
            string[] Values = { txt_scanneddate.Date.ToString("dd-MM-yyyy"), lbl_totalstock.Text, lbl_Scancount.Text, lbl_Balleft.Text, PlantName, Unitcode };
            PhysicalVerificationReport report = new PhysicalVerificationReport(dt3, Values);
            report.CreateDocument();
            Session["Today_datetime"] = txt_scanneddate.Date.ToString("dd-MM-yyyy");
            report.ExportToPdf(Server.MapPath(@"PdfReports//AssetAuditing//AuditNo_" + Session["Today_datetime"] + "_" + ViewState["AuditID"] + ".pdf"));

            string reporturl = "AuditNo_" + Session["Today_datetime"] + "_" + ViewState["AuditID"] + ".pdf";
            Session["ID"] = reporturl;
            myCommand = new SqlCommand("INSERT INTO ReportMaster([CreatedDate],[ReportName],[Location],Audit_ID)VALUES(@CreatedDate,@ReportName,@Location,@Audit_ID)", myconnection);
            myCommand.Parameters.AddWithValue("@CreatedDate", txt_scanneddate.Date.ToString("yyyy-MM-dd"));
            myCommand.Parameters.AddWithValue("@ReportName", "Physical Verification");
            myCommand.Parameters.AddWithValue("@Location", reporturl);
            myCommand.Parameters.AddWithValue("@Audit_ID", ViewState["AuditID"]);
            myconnection.Open();
            myCommand.ExecuteNonQuery();
            myconnection.Close();
            Clear();
            Response.Write("<script>");
            Response.Write("window.open('PysicalVerificationPDF.aspx','_blank')");
            Response.Write("</script>");
            Response.AppendHeader("Refresh", "15;url=AssetAuditing.aspx");
        }
    }
    protected void Clear()
    {
        lbl_Balleft.Text = lbl_Scancount.Text = lbl_totalstock.Text = "";
        txt_auditname.Text = txt_discription.Text = txt_ScanBarcode0.Text = txt_scanneddate.Text = "";
        cmb_auditedby.Text = "";
        //cmb_unitname.Text = "";        
        cmb_Unit.Value = "";
        cmb_Assetgroup.Value = "";
        grdlp_AuditID.Value="";
    }
    protected void btn_AuditClose_Click(object sender, EventArgs e)
    {
        AuditHistory();

        Response.AppendHeader("Refresh", "3;url=AssetAuditing.aspx");
    }
    protected void AuditHistory()
    {
        if (!string.IsNullOrEmpty(Session["AuditID"] as string))
        {
           lbl_error.Text = "";
            if (lbl_Scancount.Text == "")
                lbl_Scancount.Text = "0";
            myCommand = new SqlCommand("INSERT INTO AuditHistory(AuditID,UpdatedAuditDate,TotalStock,ScannedStock) Values(@AuditID,@UpdatedAuditDate,@TotalStock,@ScannedStock)", myconnection);
            myCommand.Parameters.AddWithValue("@AuditID", ViewState["AuditID"]);
            myCommand.Parameters.AddWithValue("@UpdatedAuditDate", System.DateTime.Now.ToString("yyyy-MM-dd"));
            myCommand.Parameters.AddWithValue("@TotalStock", lbl_totalstock.Text);
            myCommand.Parameters.AddWithValue("@ScannedStock", lbl_Scancount.Text);
            myconnection.Open();
            myCommand.ExecuteNonQuery();
            myconnection.Close();
        }
    }
}