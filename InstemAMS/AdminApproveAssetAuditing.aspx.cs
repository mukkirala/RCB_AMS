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
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting;
using System.Configuration;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using System.Globalization;

public partial class AdminApproveAssetAuditing : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlCommand myCommand2;
    SqlCommand myCommand3;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;

        }
    }

   

    protected void AddAssets_Click(object sender, EventArgs e)
    {

        for (int i = 0; i < grid.VisibleRowCount; i++)

        {

            if (grid.Selection.IsRowSelected(i))
            {
                
                string AuditDetailsID = grid.GetRowValues(i, "AuditDetailsID").ToString();
                string AssetID = grid.GetRowValues(i, "AssetID").ToString();
                string MainAssetNumber = grid.GetRowValues(i, "MainAssetNumber").ToString();
                string AssetClass = grid.GetRowValues(i, "AssetClass").ToString();
                string AssetDesc = grid.GetRowValues(i, "AssetDesc").ToString();
                string AuditName = grid.GetRowValues(i, "AuditName").ToString();
                string AuditBy = grid.GetRowValues(i, "AuditBy").ToString();
                string Comments = grid.GetRowValues(i, "Comments").ToString();

                DateTime Auditdate = Convert.ToDateTime(grid.GetRowValues(i, "AuditedDate").ToString());
                 string AuditedDate = Auditdate.ToString("dd-MM-yyyy");


                string AuditStatus = grid.GetRowValues(i, "AuditStatus").ToString();
                string StatusName = grid.GetRowValues(i, "StatusName").ToString();
                string Location = grid.GetRowValues(i, "Location").ToString();
                string LocationDesc = grid.GetRowValues(i, "LocationDesc").ToString();
                string CustodianID = grid.GetRowValues(i, "CustodianID").ToString();
                string AssetCustodian = grid.GetRowValues(i, "AssetCustodian").ToString();
                string AuditID = grid.GetRowValues(i, "AuditID").ToString();

                AddData(AuditDetailsID,AssetID,MainAssetNumber,AssetClass,AssetDesc,AuditName,AuditBy,Comments,AuditedDate,AuditStatus,StatusName,Location,LocationDesc,CustodianID,AssetCustodian,AuditID);


            }
        }

    }

    private void AddData(string AuditDetailsID, string AssetID, string MainAssetNumber, string AssetClass, string AssetDesc, string AuditName, string AuditBy, string Comments, string AuditedDate, string AuditStatus, string StatusName,string Location,string LocationDesc, string CustodianID, string AssetCustodian,string AuditID)
    {
        err_msg.Visible = false;
        int temp = 0;
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        
        
        if (AddTask != null)
        {
            for (int i = 0; i < AddTask.Rows.Count; i++)
            {
                if (AddTask.Rows[i].ItemArray[0].Equals(AuditDetailsID))
                {
                    temp++;
                    break;
                }
            }
            if (temp > 0)
            {

            }
            else
            {
                AddTask.Rows.Add(AuditDetailsID, AssetID, MainAssetNumber, AssetClass, AssetDesc, AuditName, AuditBy, Comments, AuditedDate, AuditStatus, StatusName, Location, LocationDesc, CustodianID, AssetCustodian,AuditID);
                ViewState["AddTask"] = AddTask;
                ASPxGridView1.DataSource = AddTask;
                ASPxGridView1.DataBind();
                ViewState["AddTask"] = AddTask as DataTable;
            }
        }
        if (AddTask == null)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("AuditDetailsID");
            dt.Columns.Add("AssetID");
            dt.Columns.Add("MainAssetNumber");
            dt.Columns.Add("AssetClass");
            dt.Columns.Add("AssetDesc");
            dt.Columns.Add("AuditName");
            dt.Columns.Add("AuditBy");
            dt.Columns.Add("Comments");
            dt.Columns.Add("AuditedDate");
            dt.Columns.Add("AuditStatus");
            dt.Columns.Add("StatusName");
            dt.Columns.Add("Location");
            dt.Columns.Add("LocationDesc");
            dt.Columns.Add("CustodianID");
            dt.Columns.Add("AssetCustodian");
            dt.Columns.Add("AuditID");
            dt.Rows.Add(AuditDetailsID, AssetID, MainAssetNumber, AssetClass, AssetDesc, AuditName, AuditBy, Comments, AuditedDate, AuditStatus, StatusName, Location, LocationDesc, CustodianID, AssetCustodian, AuditID);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = dt as DataTable;
        }
    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Delete")
        {
            int s = e.VisibleIndex;
            DataTable dt2 = (DataTable)ViewState["AddTask"];
            dt2.Rows[s].Delete();
            ASPxGridView1.DataSource = dt2;
            ASPxGridView1.DataBind();
            
        }
    }

    protected void Approve_Click(object sender, EventArgs e)
    {
        err_msg.Visible = false;
        if (Audit_Gridlookup.Text=="")
        {
            err_msg.Text = "Select Audit";
            err_msg.Visible = true;
            return;
        }
        if(ASPxGridView1.VisibleRowCount==0)
        {
            err_msg.Text = "Add Audits To Approve";
            err_msg.Visible = true;
            return;
        }
        else
        {

            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                int AuditDetailsID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AuditDetailsID"));
                int AssetID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AssetID"));
                string MainAssetNumber = ASPxGridView1.GetRowValues(i, "MainAssetNumber").ToString();
                string AuditName = ASPxGridView1.GetRowValues(i, "AuditName").ToString();
                string AuditBy = ASPxGridView1.GetRowValues(i, "AuditBy").ToString();
                string AuditorRemarks = ASPxGridView1.GetRowValues(i, "Comments").ToString();
                string AuditedDate = ASPxGridView1.GetRowValues(i, "AuditedDate").ToString();
                DateTime date = DateTime.ParseExact(AuditedDate, "dd-MM-yyyy", CultureInfo.InvariantCulture);
                string StatusChangedTo = ASPxGridView1.GetRowValues(i, "AuditStatus").ToString();
                string AssetStatus = ASPxGridView1.GetRowValues(i, "StatusName").ToString();
                string LocationChangedTo = ASPxGridView1.GetRowValues(i, "Location").ToString();
                string AssetLocation = ASPxGridView1.GetRowValues(i, "LocationDesc").ToString();
                string CustodianChangedTo = ASPxGridView1.GetRowValues(i, "CustodianID").ToString();
                string AssetCustodian = ASPxGridView1.GetRowValues(i, "AssetCustodian").ToString();
                int AuditID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AuditID"));
                string ApprovedBy = Session["UserID"].ToString();
                string AdminRemarks = txt_cmt.Text;
                DataTable dt = new DataTable();
                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter("select LocationCode from LocationMaster where Location='"+ LocationChangedTo + "'", conAMS);
                da1.Fill(dt1);
                string LocationCode = "";
                if (dt1.Rows.Count > 0)
                {
                    LocationCode = dt1.Rows[0].ItemArray[0].ToString();
                }
                SqlDataAdapter da = new SqlDataAdapter("select StatusCode from StatusMaster where StatusName='" + StatusChangedTo + "'", conAMS);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string StatusCode = dt.Rows[0].ItemArray[0].ToString();
                    myCommand2 = new SqlCommand("insert into AssetAuditHistory(AuditID,AssetID,MainAssetNumber,AssetLocation,AssetCustodian,AssetStatus,LocationChangedTo,CustodianChangedTo,StatusChangedTo,AuditBy,AuditorRemarks,AuditedDate,ApprovedBy,ApproverRemarks,ApprovedDate,AuditDetailsID,AdminDate)values(@AuditID,@AssetID,@MainAssetNumber,@AssetLocation,@AssetCustodian,@AssetStatus,@LocationChangedTo,@CustodianChangedTo,@StatusChangedTo,@AuditBy,@AuditorRemarks,@AuditedDate,@ApprovedBy,@ApproverRemarks,@ApprovedDate,@AuditDetailsID,@AdminDate)", conAMS);
                    myCommand2.Parameters.AddWithValue("@AuditID", AuditID);
                    myCommand2.Parameters.AddWithValue("@AssetID", AssetID);
                    myCommand2.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber);
                    myCommand2.Parameters.AddWithValue("@AssetLocation", AssetLocation);
                    myCommand2.Parameters.AddWithValue("@AssetCustodian", AssetCustodian);
                    myCommand2.Parameters.AddWithValue("@AssetStatus", AssetStatus);
                    myCommand2.Parameters.AddWithValue("@LocationChangedTo", LocationChangedTo);
                    myCommand2.Parameters.AddWithValue("@CustodianChangedTo", CustodianChangedTo);
                    myCommand2.Parameters.AddWithValue("@StatusChangedTo", StatusChangedTo);
                    myCommand2.Parameters.AddWithValue("@AuditBy", AuditBy);
                    myCommand2.Parameters.AddWithValue("@AuditorRemarks", AuditorRemarks);
                    myCommand2.Parameters.AddWithValue("@AuditedDate", date);
                    myCommand2.Parameters.AddWithValue("@ApprovedBy", ApprovedBy);
                    myCommand2.Parameters.AddWithValue("@ApproverRemarks", AdminRemarks);
                    myCommand2.Parameters.AddWithValue("@ApprovedDate", System.DateTime.Now);
                    myCommand2.Parameters.AddWithValue("@AuditDetailsID", AuditDetailsID);
                    myCommand2.Parameters.AddWithValue("@AdminDate", System.DateTime.Now);
                    myCommand = new SqlCommand("update AssetMaster set Status=@Status,StatusDesc=@StatusDesc,Location=@Location,LocationDesc=@LocationDesc,CustodianID=@CustodianID where AssetID=@AssetID", conSAP);
                    myCommand.Parameters.AddWithValue("@Status", StatusCode);
                    myCommand.Parameters.AddWithValue("@StatusDesc", StatusChangedTo);
                    myCommand.Parameters.AddWithValue("@Location", LocationCode);
                    myCommand.Parameters.AddWithValue("@LocationDesc", LocationChangedTo);
                    myCommand.Parameters.AddWithValue("@CustodianID", CustodianChangedTo);
                    myCommand.Parameters.AddWithValue("@AssetID", AssetID);
                    myCommand1 = new SqlCommand("update AuditDetails set Status='Approved',AdminRemarks='" + txt_cmt.Text + "' where AuditDetailsID='" + AuditDetailsID + "'", conAMS);
                    try
                    {
                        conSAP.Open();
                        conAMS.Open();
                        myCommand2.ExecuteNonQuery();
                        myCommand.ExecuteNonQuery();
                        myCommand1.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        txt_cmt.Text = ex.Message.ToString();
                    }
                    finally
                    {
                        conSAP.Close();
                        conAMS.Close();

                    }

                }
            }
        }
        Response.Redirect("/AdminViewAssetAuditing.aspx");

    }
    protected void Reject_Click(object sender, EventArgs e)
    {
        if (ASPxGridView1.VisibleRowCount == 0)
        {
            err_msg.Text = "Add Audits";
            err_msg.Visible = true;
            return;
        }
        for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
        {
            int AuditDetailsID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "AuditDetailsID"));
            myCommand1 = new SqlCommand("update AuditDetails set Status='Rejected',AdminRemarks='" + txt_cmt.Text + "' where AuditDetailsID='" + AuditDetailsID + "'", conAMS);
            try
            {
               conAMS.Open();
                myCommand1.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conAMS.Close();
                txt_cmt.Text = "";
            }

        }
        Response.Redirect("/AdminViewAssetAuditing.aspx");
    }

    protected void cbAll_Init(object sender, EventArgs e)
    {
        ASPxCheckBox chk = sender as ASPxCheckBox;
        ASPxGridView grid = (chk.NamingContainer as GridViewHeaderTemplateContainer).Grid;
        chk.Checked = (grid.Selection.Count == grid.VisibleRowCount);
    }

    protected void cbPage_Init(object sender, EventArgs e)
    {
        ASPxCheckBox chk = sender as ASPxCheckBox;
        ASPxGridView grid = (chk.NamingContainer as GridViewHeaderTemplateContainer).Grid;

        Boolean cbChecked = true;
        Int32 start = grid.VisibleStartIndex;
        Int32 end = grid.VisibleStartIndex + grid.SettingsPager.PageSize;
        end = (end > grid.VisibleRowCount ? grid.VisibleRowCount : end);

        for (int i = start; i < end; i++)
            if (!grid.Selection.IsRowSelected(i))
            {
                cbChecked = false;
                break;
            }

        chk.Checked = cbChecked;
    }

    protected void grid_CustomJSProperties(object sender, ASPxGridViewClientJSPropertiesEventArgs e)
    {
        ASPxGridView grid = sender as ASPxGridView;

        Int32 start = grid.VisibleStartIndex;
        Int32 end = grid.VisibleStartIndex + grid.SettingsPager.PageSize;
        Int32 selectNumbers = 0;
        end = (end > grid.VisibleRowCount ? grid.VisibleRowCount : end);

        for (int i = start; i < end; i++)
            if (grid.Selection.IsRowSelected(i))
                selectNumbers++;

        e.Properties["cpSelectedRowsOnPage"] = selectNumbers;
        e.Properties["cpVisibleRowCount"] = grid.VisibleRowCount;
    }


    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (Audit_Gridlookup.Text == "")
        {
            
        }
        else
        {
            Session["AuditID"] = Audit_Gridlookup.Value.ToString();
        }
       
    }
}