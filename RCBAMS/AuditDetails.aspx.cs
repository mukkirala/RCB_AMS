using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AuditDetails : System.Web.UI.Page
{
    static int srno = 0;
    DataTable dt;
    SqlCommand myCommand;
    SqlCommand myCommand1;
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
        }
        if (!Page.IsPostBack)
        {
            AssetDetails.Visible = false;
            Panel2.Visible = false;
        }
      
    }

    protected void btn_saveDocument_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = true;
        if(cmb_location.Text=="")
        {
            lbl_msg.Text = "Select Wing";
            lbl_msg.Visible = true;
            return;
        }
        if (gd_Audit.Text == "")
        {
            lbl_msg.Text = "Select Audit";
            lbl_msg.Visible = true;
            return;
        }

        if (gridlkup_Asset.Text == string.Empty)
        {
            lbl_msg.Text = "Select Asset";
            lbl_msg.Visible = true;
            Panel2.Visible = true;
            return;
        }
        if(cmb_status.Text=="")
        {
            lbl_msg.Text = "Select Status";
            lbl_msg.Visible = true;
            
            Panel2.Visible = true;
            return;
        }
        string location = "", custodianID = "";
        string Assetlocation = "", Currentcustodian = "";
        string query = "SELECT LocationDesc,CustodianID FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, myConnection2);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Assetlocation = dt.Rows[0]["LocationDesc"].ToString();
            Currentcustodian = dt.Rows[0]["CustodianID"].ToString();
        }
        if (cmb_assetlocation.Text == "")
        {
            location = Assetlocation;
        }
        else
        {
            location = cmb_assetlocation.Text;
        }
        if (Cust_gridlookup.Text == "")
        {
            custodianID = Currentcustodian;
        }
        else
        {
            custodianID = Cust_gridlookup.Text;
        }
        srno = srno + 1;
        int temp = 0;
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        if (AddTask != null)
        {
            for (int i = 0; i < AddTask.Rows.Count; i++)
            {
                if (AddTask.Rows[i].ItemArray[3].Equals(gridlkup_Asset.Value.ToString()))
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
                
                AddTask.Rows.Add(srno, gd_Audit.Value, gd_Audit.Text, gridlkup_Asset.Value, gridlkup_Asset.Text,txt_Cmts.Text,location,custodianID, cmb_status.Text);
                ViewState["AddTask"] = AddTask;
                ASPxGridView1.DataSource = AddTask;
                ASPxGridView1.DataBind();
                ViewState["AddTask"] = AddTask as DataTable;
            }
           
        }
        if (AddTask == null)
        {
            dt = new DataTable();
            dt.Columns.Add("SRNO");
            dt.Columns.Add("AuditID");
            dt.Columns.Add("AuditName");
            dt.Columns.Add("AssetID");
            dt.Columns.Add("MainAssetNumber");
            dt.Columns.Add("Comments");
            dt.Columns.Add("Location");
            dt.Columns.Add("CustodianID");
            dt.Columns.Add("AuditStatus");
            //dt.Columns.Add("LocationCode");
            //dt.Columns.Add("Block");
            dt.Rows.Add(srno, gd_Audit.Value, gd_Audit.Text, gridlkup_Asset.Value, gridlkup_Asset.Text,txt_Cmts.Text, location, custodianID,cmb_status.Text);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = dt as DataTable;
        }
        clear();
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

  
    protected void txtSubmit_Click(object sender, EventArgs e)
    {
        string date = System.DateTime.Now.Date.ToString("yyyy-MM-dd");
        try
        {
            string CustodianName = Session["USR_NAME"].ToString();
            string AuditBy = Session["UserID"].ToString();
            string CustodianDepartment = Session["DepartmentName"].ToString();
            string CustDesignation = Session["DESIGNATION"].ToString();
            string CustDepartmentCode = Session["DepartmentCode"].ToString();

            if (ASPxGridView1.VisibleRowCount == 0)
            {
                Messages.SetErrorMessage("0078", null, null, null, Session);
                return;
            }
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                string SRNO = ASPxGridView1.GetRowValues(i, "SRNO").ToString();
                string AssetID = ASPxGridView1.GetRowValues(i, "AssetID").ToString();
                string Comments = ASPxGridView1.GetRowValues(i, "Comments").ToString();
                string AuditID = ASPxGridView1.GetRowValues(i, "AuditID").ToString();
                string AuditStatus = ASPxGridView1.GetRowValues(i, "AuditStatus").ToString();
                string MainAssetNumber = ASPxGridView1.GetRowValues(i, "MainAssetNumber").ToString();
                string Location = ASPxGridView1.GetRowValues(i, "Location").ToString();
                string CustodianID = ASPxGridView1.GetRowValues(i, "CustodianID").ToString();
                string query = "select * from AuditDetails where AssetID='" + AssetID + "' and AuditID='" + AuditID + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, myConnection);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string query1 = "update AuditDetails set AuditStatus=@AuditStatus,Comments=@Comments,AuditID=@AuditID,Status=@Status,AuditBy=@AuditBy,MainAssetNumber=@MainAssetNumber,Location=@Location,CustodianID=@CustodianID where AssetID=@AssetID";
                    myCommand1 = new SqlCommand(query1, myConnection);
                    myCommand1.Parameters.AddWithValue("@AuditStatus", AuditStatus);
                    myCommand1.Parameters.AddWithValue("@Comments", Comments);
                    myCommand1.Parameters.AddWithValue("@AssetID", AssetID);
                    myCommand1.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber);
                    myCommand1.Parameters.AddWithValue("@AuditID", AuditID);
                    myCommand1.Parameters.AddWithValue("@Status", "Audited");
                    myCommand1.Parameters.AddWithValue("@AuditBy", AuditBy);
                    myCommand1.Parameters.AddWithValue("@Location", Location);
                    myCommand1.Parameters.AddWithValue("@CustodianID", CustodianID);
                    myConnection.Open();
                    myCommand1.ExecuteNonQuery();
                    myConnection.Close();
                    lbl_msg.Text = "Data Saved Successfully";
                    cmb_location.ReadOnly = false;
                    gd_Audit.ReadOnly = false;
                    lbl_msg.Visible = true;
                    clearSubmit();

                }
                else
                {
                    string Query3 = "insert into [AuditDetails](AssetID,AuditStatus,Comments,AuditID,Date,Status,AuditBy,MainAssetNumber,Location,CustodianID)values(@AssetID,@AuditStatus,@Comments,@AuditID,@Date,@Status,@AuditBy,@MainAssetNumber,@Location,@CustodianID)";
                    myCommand = new SqlCommand(Query3, myConnection);
                    myCommand.Parameters.AddWithValue("@AssetID", AssetID);
                    myCommand.Parameters.AddWithValue("@MainAssetNumber", MainAssetNumber);
                    myCommand.Parameters.AddWithValue("@AuditStatus", AuditStatus);
                    myCommand.Parameters.AddWithValue("@Comments", Comments);
                    myCommand.Parameters.AddWithValue("@AuditID", AuditID);
                    myCommand.Parameters.AddWithValue("@Date", DateTime.Now);
                    myCommand.Parameters.AddWithValue("@Status", "Audited");
                    myCommand.Parameters.AddWithValue("@AuditBy", AuditBy);
                    myCommand.Parameters.AddWithValue("@Location", Location);
                    myCommand.Parameters.AddWithValue("@CustodianID", CustodianID);
                    myConnection.Open();
                    myCommand.ExecuteNonQuery();
                    myConnection.Close();
                    lbl_msg.Text = "Data Saved Successfully";
                    cmb_location.ReadOnly = false;
                    gd_Audit.ReadOnly = false;
                    lbl_msg.Visible = true;
                    clearSubmit();
                    //Response.Redirect("AuditDetails.aspx");
                }
               
               
            }
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataBind();
            Messages.SetSuccessMessage("0059", null, Session);
            ViewState["AddTask"] = null;
        }
        catch (SqlException ex)
        {
            Messages.SetErrorMessage("0028", null, null, null, Session);
        }
        catch (Exception ex)
        {
            Messages.SetErrorMessage("0029", null, null, null, Session);
        }
    }

    private void clear()
    {
        AssetDetails.Visible = false;
        gridlkup_Asset.Value = "";
        txt_Cmts.Text = "";
        lbl_AssetNo.Text = "";
        lbl_Assetclass.Text = "";
        lbl_AssetType.Text = "";
        
        cmb_status.Text = "";
        cmb_assetlocation.Text = "";
        Cust_gridlookup.Value = "";

    }

    private void clearSubmit()
    {
        Panel2.Visible = false;
        gridlkup_Asset.Value = "";
        gd_Audit.Text = "";
        cmb_location.Text = "";
        txt_Cmts.Text = "";
        lbl_AssetNo.Text = "";
        lbl_Assetclass.Text = "";
        lbl_AssetType.Text = "";
        
        cmb_status.Text = "";
        cmb_assetlocation.Text = "";
        Cust_gridlookup.Value = "";

    }
  

    protected void StartAuditButton_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        if (cmb_location.Text == "")
        {
            lbl_msg.Text = "Select Location";
            lbl_msg.Visible = true;
            return;
        }
        if (gd_Audit.Text == "")
        {
            lbl_msg.Text = "Select Audit";
            lbl_msg.Visible = true;
            return;
        }
        cmb_location.ReadOnly = true;
        gd_Audit.ReadOnly = true;
        Panel2.Visible = true;

    }


    protected void btn_search_Click(object sender, EventArgs e)
    {
       
        if (gridlkup_Asset.Text == "")
        {
            lbl_msg.Text = "Select Asset";
            lbl_msg.Visible = true;
            Panel2.Visible = true;
            return;
        }
        AssetDetails.Visible = true;
        string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(LocationDesc+' (',Location+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote,Location as AssetLocation,CustodianID FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "'";
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
            lbl_quantity.Text = dt.Rows[0]["Quantity"].ToString();
            lbl_component.Text = dt.Rows[0]["Component"].ToString();
            lbl_inventorynote.Text = dt.Rows[0]["InventoryNote"].ToString();
            lbl_capitalizationdate.Text = dt.Rows[0]["AssetCapitalizationDate"].ToString();
            lbl_acquisitiondate.Text = dt.Rows[0]["FirstAcquisitionDate"].ToString();
            lbl_deacdate.Text = dt.Rows[0]["Deacdate"].ToString();
            lbl_inventorydate.Text = dt.Rows[0]["Invdate"].ToString();
            cmb_assetlocation.Text= dt.Rows[0]["AssetLocation"].ToString();
            Cust_gridlookup.Text= dt.Rows[0]["CustodianID"].ToString();


        }

    }
}