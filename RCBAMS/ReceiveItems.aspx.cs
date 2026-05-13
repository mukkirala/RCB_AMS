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
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class ReceiveItems : System.Web.UI.Page
{

    SqlConnection Myconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlTransaction trans;
    DataTable dt = new DataTable();
    DataTable DtScanItems = new DataTable();
    DataTable reportDt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            if (!IsPostBack)
            {
                //Session["RequestID"] = null;
            }
           // lbl_name.Text = Session["GodownName"].ToString();
          //  lbl_unitname.Text = Session["UnitName"].ToString();
           // lbl_category.Text = Session["DivisionName"].ToString();

        }
        else
        {
            Response.Redirect("ErrorPage.aspx");
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        lbl_TotalItem.Text = lbl_scanItem.Text = "";
        ViewState["itemdetail"] = null as DataTable;
        ASPxGridView2.DataBind();
        if (ASPxGridLookup1.Text == "")
        {
            lbl_error.Text = "Please Select Requisition";
            return;
        }
        
        Session["RequestID"] = ASPxGridLookup1.GridView.GetRowValues(ASPxGridLookup1.GridView.FocusedRowIndex, "ReqID").ToString();
        Session["OutID"] = ASPxGridLookup1.Value.ToString();

        if (ViewState["ItemsNo"] != null)
        {
            ViewState["ItemsNo"] = null;
        }
        //string SelectQuery = "SELECT dbo.POStblOutDeliveryDetails .DeliveryItemId, dbo.POStblOutDeliveryDetails .ItemID, dbo.POStblOutDeliveryDetails .ItemCode, dbo.ItemMaster.ItemName, dbo.POStblOutDeliveryDetails .Quantity,SizeMaster.Code as Size, dbo.ItemMaster.Colour, dbo.ItemMaster.Brand, dbo.POStblOutDelivery.DeliveredType, dbo.POStblOutDelivery.DateTime, dbo.POStblOutDelivery.AWBNO, dbo.POStblOutDelivery.CourierName, dbo.POStblOutDelivery.CourierContactNo, dbo.POStblOutDelivery.VehicleNumber, dbo.POStblOutDelivery.ChallenNumber, dbo.POStblOutDelivery.DriverName, dbo.POStblOutDelivery.DriverMobileNo, dbo.POStblOutDelivery.TransporterName, dbo.POStblOutDelivery.LrDate, dbo.POStblOutDelivery.Status, dbo.ItemMaster.Style,POStblOutDelivery.Reason from  dbo.POStblOutDelivery INNER JOIN  dbo.POSRequisitionParent ON dbo.POStblOutDelivery.ReqID = dbo.POSRequisitionParent.ReqID INNER JOIN dbo.POStblOutDeliveryDetails  ON dbo.POStblOutDeliveryDetails .OutDeliveryID = dbo.POStblOutDelivery.OutDeliveryID INNER JOIN dbo.ItemMaster ON dbo.POStblOutDeliveryDetails .ItemID = dbo.ItemMaster.ItemID INNER JOIN SizeMaster ON ItemMaster.Size=SizeMaster.SizeID WHERE  (dbo.POStblOutDelivery.OutDeliveryID ='" + ASPxGridLookup1.Value.ToString() + "') AND POStblOutDeliveryDetails .Status='Transfered'";
        string SelectQuery = @"SELECT dbo.POStblOutDeliveryDetails .DeliveryItemId, dbo.POStblOutDeliveryDetails .ItemID, dbo.POStblOutDeliveryDetails .ItemCode, dbo.ItemMaster.ItemName, dbo.POStblOutDeliveryDetails .Quantity,ItemMaster.Tax, dbo.ItemMaster.Colour, dbo.ItemMaster.Brand, dbo.POStblOutDelivery.DeliveredType, dbo.POStblOutDelivery.DateTime, dbo.POStblOutDelivery.AWBNO, dbo.POStblOutDelivery.CourierName, dbo.POStblOutDelivery.CourierContactNo, dbo.POStblOutDelivery.VehicleNumber, dbo.POStblOutDelivery.ChallenNumber, dbo.POStblOutDelivery.DriverName, dbo.POStblOutDelivery.DriverMobileNo, dbo.POStblOutDelivery.TransporterName, dbo.POStblOutDelivery.LrDate, dbo.POStblOutDelivery.Status, dbo.ItemMaster.Style,POStblOutDelivery.Reason,POStblOutDelivery.VehicleTypeID,POStblOutDelivery.VehicleID,VehicleTypeMaster.VehicleType,CONCAT( Vehicle_master.VehicleName, ' ,Reg_No:', Vehicle_master.RegistrationNumber) AS vehiclename from  dbo.POStblOutDelivery
INNER JOIN  dbo.POSRequisitionParent ON dbo.POStblOutDelivery.ReqID = dbo.POSRequisitionParent.ReqID 
INNER JOIN dbo.POStblOutDeliveryDetails  ON dbo.POStblOutDeliveryDetails .OutDeliveryID = dbo.POStblOutDelivery.OutDeliveryID
INNER JOIN dbo.ItemMaster ON dbo.POStblOutDeliveryDetails .ItemID = dbo.ItemMaster.ItemID 
				 inner join VehicleTypeMaster on VehicleTypeMaster.VehicleTypeID=POStblOutDelivery.VehicleTypeID
									 inner join Vehicle_master  on Vehicle_master.VehicleID=POStblOutDelivery.VehicleID
WHERE  (dbo.POStblOutDelivery.OutDeliveryID ='" + ASPxGridLookup1.Value.ToString() + "') AND" +
" POStblOutDeliveryDetails .Status='Transfered'";
        SqlDataAdapter da = new SqlDataAdapter(SelectQuery, Myconnection);
        DataTable dt1 = new DataTable();
        da.Fill(dt1);
        int Count = 0;
        if (dt1.Rows.Count > 0)
        {
            lbl_reason.Text = dt1.Rows[0].ItemArray[21].ToString();
            vehicletypeid.Text = dt1.Rows[0].ItemArray[22].ToString();
            cmbVehicleType.Text = dt1.Rows[0].ItemArray[24].ToString();
            vehid.Text = dt1.Rows[0].ItemArray[23].ToString();
            comb_VehNumb.Text = dt1.Rows[0].ItemArray[25].ToString();
            string type = dt1.Rows[0].ItemArray[8].ToString();
            //if (type == "By Truck")
            //{
            //    ASPxPanel1.Visible = false;
            //    ASPxPanel2.Visible = true;

            //   // ASPxRadioButtonList1.SelectedIndex= 1;
            //    txt_vechno.Text = dt1.Rows[0].ItemArray[13].ToString();
            //    txt_challno.Text = dt1.Rows[0].ItemArray[14].ToString();
            //    DateEdit_lrdate.Date =Convert.ToDateTime(dt1.Rows[0].ItemArray[18].ToString());
            //    txt_transporter.Text = dt1.Rows[0].ItemArray[17].ToString();
            //    txt_dname.Text = dt1.Rows[0].ItemArray[15].ToString();
            //    txt_dmobile.Text = dt1.Rows[0].ItemArray[16].ToString();
            //}
            //else if (type == "By Courier")
            //{
            //    ASPxPanel1.Visible = true;
            //    ASPxPanel2.Visible = false;


            //    //ASPxRadioButtonList1.SelectedIndex = 0;
            //    cmb_couriername.Text = dt1.Rows[0].ItemArray[11].ToString();
            //    txt_awbno.Text = dt1.Rows[0].ItemArray[10].ToString();
            //    txt_couriermobile.Text = dt1.Rows[0].ItemArray[12].ToString();
            //}
            for (int i = 0; i < dt1.Rows.Count; i++)
            {

                double Qty = Convert.ToDouble(dt1.Rows[i].ItemArray[4].ToString());
                string ItemID = dt1.Rows[i].ItemArray[1].ToString();
                string ItemCode = dt1.Rows[i].ItemArray[2].ToString();
                string Itemname = dt1.Rows[i].ItemArray[3].ToString();
                //string Size = dt1.Rows[i].ItemArray[5].ToString();
                string Size = "";
                string Color = dt1.Rows[i].ItemArray[6].ToString();
                string Brand = dt1.Rows[i].ItemArray[7].ToString();
                string Style = dt1.Rows[i].ItemArray[20].ToString();
                string Quantity = "1";
               
                if (Qty != 0)
                {
                    int id = 1;
                    for (int q = 0; q < Qty; q++)
                    {
                        if (dt.Columns.Count == 0)
                        {
                            ItemsNo();
                        }
                        dt.Rows.Add(id, ItemID, ItemCode, Itemname, Size, Color, Brand, Style, Quantity, Qty);
                        id++;
                        Count++;
                    }

                }

            }
            ViewState["ItemsNo"] = dt as DataTable;
        }
        lbl_TotalItem.Text = Count.ToString();
        Myconnection.Close();
    }
    protected void ItemsNo()
    {
        dt.Columns.Add("ID");
        dt.Columns.Add("ItemID");
        dt.Columns.Add("ItemCode");
        dt.Columns.Add("ItemName");
        dt.Columns.Add("Size");
        dt.Columns.Add("Color");
        dt.Columns.Add("Brand");
        dt.Columns.Add("Style");
        dt.Columns.Add("Quantity");
        dt.Columns.Add("TQuantity");
    }       
    protected void ASPxRadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ASPxGridLookup1.Text == "")
        {
            lbl_error.Text = "Please Select Requisition";
            return;
        }

        lbl_error.Text = "";
        //if (ASPxRadioButtonList1.SelectedItem.Text == "By Courier")
        //{
        //    ASPxPanel1.Visible = true;
        //    ASPxPanel2.Visible = false;   

        //}
        //else
        //{

        //    ASPxPanel1.Visible = false;
        //    ASPxPanel2.Visible = true;
        //}
    }
    protected void ScanItems()
    {
        DtScanItems.Columns.Add("ItemID");
        DtScanItems.Columns.Add("ItemCode");
        DtScanItems.Columns.Add("ItemName");
        DtScanItems.Columns.Add("Size");
        DtScanItems.Columns.Add("Color");
        DtScanItems.Columns.Add("Brand");
        DtScanItems.Columns.Add("Style");
        DtScanItems.Columns.Add("SQuantity");
        DtScanItems.Columns.Add("Quantity");
        DtScanItems.Columns.Add("Date");

    }
    protected void txt_ScanItem_TextChanged(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        lbl_innererror.Text = "";
        string ItemID = "";
        string Size = "";
        string Color = "";
        string Brand = "";
        string Style = "";
        string SQty = "";
        string Itemname = "";
        int Count = 0;
        if (ASPxGridLookup1.Text == "")
        {
            lbl_error.Text = "Please Select Requisition";
            txt_ScanItem.Text = "";
            return;
        }
        if (ViewState["ItemsNo"] == null)
        {
            lbl_innererror.Text = "Data Not Found please Select Requisition";
            txt_ScanItem.Text = "";
            return;
        }
        else
        {
            lbl_innererror.Text = "";
            dt = ViewState["ItemsNo"] as DataTable;
        }

        var row = dt.Select("ItemCode='" + txt_ScanItem.Text + "'");
        if (row.Length == 0)
        {
            lbl_innererror.Text = "Item not Found";
            txt_ScanItem.Text = "";
            txt_ScanItem.Focus();
            return;
        }
        else
        {
            lbl_innererror.Text = "";
            int aa = 0;
            foreach (var ro in row)
            {

                if (aa == 0)
                {
                    Itemname = ro["ItemName"].ToString();
                    ItemID = ro["ItemID"].ToString();
                    Color = ro["Color"].ToString();
                    Brand = ro["Brand"].ToString();
                    Size = ro["Size"].ToString();
                    Style = ro["Style"].ToString();
                    SQty = ro["TQuantity"].ToString();
                    ro.Delete();
                    dt.AcceptChanges();
                    if (ViewState["CT"] != null)
                    {
                        Count = Convert.ToInt32(ViewState["CT"]);
                    }
                    Count++;
                }
                aa++;
            }
            ViewState["ItemsNo"] = dt as DataTable;
        }
        //Checking For Duplication 
        DataTable itemdetail = new DataTable();
        DateTime date = System.DateTime.Now;
        itemdetail = ViewState["itemdetail"] as DataTable;
        if (itemdetail != null)
        {
            double quan2 = 1;
            int count = 0;
            foreach (DataRow dr in itemdetail.Rows) // search whole table
            {
                if (dr["ItemCode"].ToString() == txt_ScanItem.Text) // if id==2
                {
                    double quan = Convert.ToDouble(dr["Quantity"].ToString());

                    double quan1 = 1;

                    quan2 = quan + quan1;
                    itemdetail.Rows.RemoveAt(count);
                    break;
                }
                count = count + 1;
            }
            itemdetail.Rows.Add(ItemID, txt_ScanItem.Text, Itemname, Size, Color, Brand, Style, SQty,quan2,date);           
            Data(itemdetail);
           
        }
        if (itemdetail == null)
        {
            if (DtScanItems.Columns.Count == 0)
            {
                ScanItems();
            }
            DtScanItems.Rows.Add(ItemID, txt_ScanItem.Text, Itemname, Size, Color, Brand, Style, SQty, "1",date);
            Data(DtScanItems);
           
        }
        lbl_scanItem.Text = Count.ToString();
        ViewState["CT"] = Count.ToString();
        txt_ScanItem.Text = "";
        txt_ScanItem.Focus();
    }
    protected void Data(DataTable dt)
    {
        DataView dv = dt.DefaultView;
        dv.Sort = "Date DESC";
        ASPxGridView2.DataSource = dv;
        ASPxGridView2.DataBind();
        ViewState["itemdetail"] = dt as DataTable;
    
    }
    protected void reportdata()
    {
        reportDt.Columns.Add("ItemCode");
        reportDt.Columns.Add("ItemName");
        reportDt.Columns.Add("Size");
        reportDt.Columns.Add("Color");
        reportDt.Columns.Add("Brand");
        reportDt.Columns.Add("Style");
        reportDt.Columns.Add("RQty");
        reportDt.Columns.Add("SQty");
        reportDt.Columns.Add("Quantity");
    }
    protected void cmbVehicleType_SelectedIndexChanged(object sender, EventArgs e)
    {
        comb_VehNumb.DataBind();
        comb_VehNumb.Value = null;
        //txt_FromRoot.Value = null;
        BindAllDrivers();
    }
    protected void comb_VehNumb_ValueChanged(object sender, EventArgs e)
    {
        if (comb_VehNumb.Value == null) return;
        BindAllDrivers();
        MarkAllocatedDrivers(Convert.ToInt32(comb_VehNumb.Value));
    }
    private void BindAllDrivers()
    {
        using (SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["PentagonLogistixPvtLtdConnectionString"].ConnectionString))
        {
            string query = "SELECT DriverID, DriverName, LicenseNumber, Gender, Age, PhoneNumber FROM DriverMaster WHERE DriverStatus='Active'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            //ASPxGridView1.DataSource = dt;
            //ASPxGridView1.DataBind();
        }
    }
    private void MarkAllocatedDrivers(int vehicleID)
    {
        DataTable allocatedDrivers = new DataTable();
        using (SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["PentagonLogistixPvtLtdConnectionString"].ConnectionString))
        {
            string query = "SELECT DriverID FROM VehicleDriverMapping WHERE VehicleID=@VehicleID AND Status='Active'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.SelectCommand.Parameters.AddWithValue("@VehicleID", vehicleID);
            da.Fill(allocatedDrivers);
        }

        HashSet<int> allocatedDriverIDs = new HashSet<int>();
        foreach (DataRow row in allocatedDrivers.Rows)
            allocatedDriverIDs.Add(Convert.ToInt32(row["DriverID"]));

        for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
        {
            int driverID = Convert.ToInt32(ASPxGridView1.GetRowValues(i, "DriverID"));
            ASPxCheckBox chk = ASPxGridView1.FindRowCellTemplateControl(i, null, "chkIspresent") as ASPxCheckBox;
            if (chk != null) chk.Checked = allocatedDriverIDs.Contains(driverID);
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        if (ASPxGridLookup1.Text == "")
        {
            lbl_msg.Text = "Please Select Requisition";
            lbl_msg.Visible = true;
            return;
        }
        //if (ASPxRadioButtonList1.SelectedItem.Text == "By Courier")
        //{

        //    if (cmb_couriername.Text == string.Empty)
        //    {
        //        Messages.SetErrorMessage("2006", null, null, null, Session);
        //        return;
        //    }
        //    if (txt_awbno.Text == string.Empty)
        //    {
        //        Messages.SetErrorMessage("2041", null, null, null, Session);
        //        return;
        //    }
        //}
        //else
        //{
        //    if (txt_vechno.Text == string.Empty)
        //    {
        //        Messages.SetErrorMessage("2042", null, null, null, Session);
        //        return;
        //    }
        //    if (txt_challno.Text == string.Empty)
        //    {
        //        Messages.SetErrorMessage("2043", null, null, null, Session);
        //        return;
        //    }
        //    if (txt_dmobile.Text == string.Empty)
        //    {
        //        Messages.SetErrorMessage("2044", null, null, null, Session);
        //        return;
        //    }
        //    if (DateEdit_lrdate.Text == string.Empty)
        //    {
        //        Messages.SetErrorMessage("2065", null, null, null, Session);
        //        return;
        //    }
        //}
        double reqqty = 0;
        double sendqty = 0;
        double recqty = 0;
        
        //for (int i = 0; i < ASPxGridView2.VisibleRowCount; i++)
        //{
        //    ASPxSpinEdit proquantity = (ASPxSpinEdit)ASPxGridView2.FindRowCellTemplateControl(i, ASPxGridView2.Columns["txt_qty"] as GridViewDataSpinEditColumn, "txt_qty");
        //    double Qty = Convert.ToDouble(proquantity.Text);
        //    recqty = recqty + Qty;
        //    //double Qty = Convert.ToDouble(ASPxGridView2.GetRowValues(i, "Quantity").ToString());
        //    string SQty = ASPxGridView2.GetRowValues(i, "SQuantity").ToString();
        //    sendqty = sendqty + Convert.ToDouble(SQty);
        //}
        for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
        {
            ASPxSpinEdit proquantity = (ASPxSpinEdit)ASPxGridView1.FindRowCellTemplateControl(i, ASPxGridView1.Columns["txt_qty"] as GridViewDataSpinEditColumn, "txt_qty");
            double Qty = Convert.ToDouble(proquantity.Text);
            recqty = recqty + Qty;
            //double Qty = Convert.ToDouble(ASPxGridView2.GetRowValues(i, "Quantity").ToString());
            string SQty = ASPxGridView1.GetRowValues(i, "Quantity").ToString();
            double dSQTY = Convert.ToDouble(SQty);
            sendqty = sendqty + Convert.ToDouble(SQty);
        }
        if (Convert.ToInt32(recqty) < Convert.ToInt32(sendqty))
        {
            //MessageBox.Show("You are sending less quantity than Ordered quantity");
            Response.Write(@"<script language='javascript'>alert('You are Receiving less quantity than Send quantity." + "'); </script>");
        } if (Convert.ToInt32(recqty) > Convert.ToInt32(sendqty))
        {
            //MessageBox.Show("You are sending less quantity than Ordered quantity");
            Response.Write(@"<script language='javascript'>alert('You are Receiving More quantity than Send quantity." + "'); </script>");
        }
        Myconnection.Open();
        trans = Myconnection.BeginTransaction();
        try
        {
            string ReqID = ASPxGridLookup1.GridView.GetRowValues(ASPxGridLookup1.GridView.FocusedRowIndex, "ReqID").ToString();
            string Query = "INSERT INTO POSInBoundMaster(VehicleTypeID,VehicleID,[DateTime],ReqID,Status)values(@VehicleTypeID,@VehicleID,@DateTime,@ReqID,@Status)" + "Select Scope_Identity()";
            myCommand = new SqlCommand(Query, Myconnection, trans);
           // myCommand.Parameters.AddWithValue("@DeliveredType", ASPxRadioButtonList1.SelectedItem.Text);
            myCommand.Parameters.AddWithValue("@DateTime", System.DateTime.Now.ToString("yyyy-MM-dd"));
            myCommand.Parameters.AddWithValue("@ReqID", ReqID);
            //myCommand.Parameters.AddWithValue("@InBoundType", "Requisition");
            //myCommand.Parameters.AddWithValue("@AWBNO", txt_awbno.Text);
            //myCommand.Parameters.AddWithValue("@CourierName", cmb_couriername.Text);
            //myCommand.Parameters.AddWithValue("@CourierContactNo", txt_couriermobile.Text);
            //myCommand.Parameters.AddWithValue("@VehicleNumber", txt_vechno.Text);
            //myCommand.Parameters.AddWithValue("@ChallenNumber", txt_challno.Text);
            //myCommand.Parameters.AddWithValue("@DriverName", txt_dname.Text);
            //myCommand.Parameters.AddWithValue("@DriverMobileNo", txt_dmobile.Text);
            //myCommand.Parameters.AddWithValue("@Transporter", txt_transporter.Text);
            //myCommand.Parameters.AddWithValue("@LrDate", DateEdit_lrdate.Date.ToString("yyyy-MM-dd"));
            myCommand.Parameters.AddWithValue("@Status", "Received");
            myCommand.Parameters.AddWithValue("@VehicleTypeID", vehicletypeid.Text);
            myCommand.Parameters.AddWithValue("@VehicleID", vehid.Text);
            int Id = Convert.ToInt32(myCommand.ExecuteScalar());
            Session["ID"] = Id;

            //string REQID = ASPxGridLookup1.GridView.GetRowValues(ASPxGridLookup1.GridView.FocusedRowIndex, "ReqID").ToString();
            //for (int i = 0; i < ASPxGridView2.VisibleRowCount; i++)
            //{

            //    string ItemID = ASPxGridView2.GetRowValues(i, "ItemID").ToString();
            //    string ItemCode = ASPxGridView2.GetRowValues(i, "ItemCode").ToString();
            //    string ItemName = ASPxGridView2.GetRowValues(i, "ItemName").ToString();
            //    string Size = ASPxGridView2.GetRowValues(i, "Size").ToString();
            //    string Color = ASPxGridView2.GetRowValues(i, "Color").ToString();
            //    string Brand = ASPxGridView2.GetRowValues(i, "Brand").ToString();
            //    string Style = ASPxGridView2.GetRowValues(i, "Style").ToString();
            //    ASPxSpinEdit proquantity = (ASPxSpinEdit)ASPxGridView2.FindRowCellTemplateControl(i, ASPxGridView2.Columns["txt_qty"] as GridViewDataSpinEditColumn, "txt_qty");
            //    double Qty = Convert.ToDouble(proquantity.Text);
            //   // recqty = recqty + Qty;
            //    //double Qty = Convert.ToDouble(ASPxGridView2.GetRowValues(i, "Quantity").ToString());
            //    string SQty = ASPxGridView2.GetRowValues(i, "SQuantity").ToString();
            //   // sendqty = sendqty + Convert.ToDouble(SQty);

            //    string InsertQuery1 = "INSERT INTO [dbo].[POSInBoundTransaction]([InBoundID],[ItemID],[ItemCode],[Quantity],[Status]) VALUES(@InBoundID,@ItemID,@ItemCode,@Quantity,@Status)" + "Select Scope_Identity()";
            //    myCommand = new SqlCommand(InsertQuery1, Myconnection, trans);
            //    myCommand.Parameters.AddWithValue("@InBoundID", Id);
            //    myCommand.Parameters.AddWithValue("@ItemID", ItemID);
            //    myCommand.Parameters.AddWithValue("@ItemCode", ItemCode);
            //    myCommand.Parameters.AddWithValue("@Quantity", Qty);
            //    myCommand.Parameters.AddWithValue("@Status", "Received");
            //    myCommand.ExecuteNonQuery();





            //    string query = "Select t.TotalQuantity,ISNULL(t.AvgPrice,0) from(SELECT ProductInventory.*,ROW_NUMBER() OVER (PARTITION BY ItemID,GodownId ORDER BY ProductInventoryId DESC) AS RN FROM ProductInventory) AS t INNER JOIN ItemMaster ON t.ItemID = ItemMaster.ItemID INNER JOIN dbo.GodownMaster ON t.GodownId = dbo.GodownMaster.GodownId  WHERE RN=1 AND t.ItemID='" + ItemID + "' AND t.GodownId='" + Session["GodownID"].ToString() + "'  ORDER BY t.ItemID";

            //    SqlDataAdapter da = new SqlDataAdapter(query, Myconnection);
            //    DataTable dt = new DataTable();
            //    da.SelectCommand.Transaction = trans;
            //    da.Fill(dt);
            //    double Totalqty = 0;
            //    double price = 0;
            //    double OldQty = 0;
            //    if (dt.Rows.Count > 0)
            //    {
            //        OldQty = Convert.ToDouble(dt.Rows[0].ItemArray[0].ToString());
            //        price = Convert.ToDouble(dt.Rows[0].ItemArray[1]);
            //    }
            //    else
            //    {
            //        OldQty = 0;
            //    }
            //    Totalqty = OldQty + Qty;

            //    string query11 = "INSERT INTO ProductInventory(ItemID,ProductCode,OldQuantity,ProducedQuantity,TotalQuantity,AvgPrice,DateTime,TransactionId,TransactionTypeId,GodownId) Values(@Id,@ItemCode,@oldqty,@Proqty,@totqty,@AvgPrice,@date,@transactionId,@transactiontypeid,@godownid)";
            //    myCommand = new SqlCommand(query11, Myconnection, trans);
            //    myCommand.Parameters.AddWithValue("@ItemCode", ItemCode);
            //    myCommand.Parameters.AddWithValue("@Id", ItemID);
            //    myCommand.Parameters.AddWithValue("@oldqty", OldQty);
            //    myCommand.Parameters.AddWithValue("@Proqty", Qty);
            //    myCommand.Parameters.AddWithValue("@totqty", Totalqty);
            //    myCommand.Parameters.AddWithValue("@AvgPrice", price);
            //    myCommand.Parameters.AddWithValue("@date", System.DateTime.Now);
            //    myCommand.Parameters.AddWithValue("@transactionId", Id);
            //    myCommand.Parameters.AddWithValue("@transactiontypeid", 14);
            //    myCommand.Parameters.AddWithValue("@godownid", Session["GodownID"].ToString());
            //    myCommand.ExecuteNonQuery();


            //   string SelectQu = "Select Quantity from POSRequisitionDetails WHere ReqID='" + ReqID + "' AND ItemID='" + ItemID + "'";
            //    SqlDataAdapter dareq = new SqlDataAdapter(SelectQu, Myconnection);
            //    DataTable dtreq = new DataTable();
            //    dareq.SelectCommand.Transaction = trans;
            //    dareq.Fill(dtreq);
            //    string RQty = "0";

            //    if (dtreq.Rows.Count > 0)
            //        RQty = dtreq.Rows[0].ItemArray[0].ToString();
            //    reqqty = reqqty + Convert.ToDouble(RQty);

            //    if (reportDt.Columns.Count == 0)
            //    {
            //        reportdata();
            //    }
            //    reportDt.Rows.Add(ItemCode, ItemName, Size, Color, Brand, Style, RQty, SQty, Qty);


            //    //DataTable dtrem = new DataTable();
            //    //dtrem = ViewState["ItemsNo"] as DataTable;

            //    int count = 0;
            //    if (Convert.ToInt32(SQty) >Convert.ToInt32(Qty))
            //    {
            //        //var row = dtrem.Select("ItemID='" + ItemID + "'");

            //        //foreach (var ro in row)
            //        //{
            //        //    count = count + Convert.ToInt32(ro["Quantity"].ToString());

            //        //}
            //        double lQTy = Convert.ToInt32(SQty) - Convert.ToInt32(Qty);
            //        if (count > 0)
            //        {
            //            string InsertQuery = "INSERT INTO POSLostInTransit(ItemID,ItemCode,NoOfItems,ReferenceID,Status,ReferenceType) Values(@ItemID,@ItemCode,@NoOfItems,@ReferenceID,@Status,@ReferenceType)";
            //            myCommand = new SqlCommand(InsertQuery, Myconnection, trans);
            //            myCommand.Parameters.AddWithValue("@ItemID", ItemID);
            //            myCommand.Parameters.AddWithValue("@ItemCode", ItemCode);
            //            myCommand.Parameters.AddWithValue("@NoOfItems", lQTy);
            //            myCommand.Parameters.AddWithValue("@ReferenceID", Id);
            //            myCommand.Parameters.AddWithValue("@Status", "Lost In Transaction");
            //            myCommand.Parameters.AddWithValue("@ReferenceType", "Received");
            //            myCommand.ExecuteNonQuery();
            //        }

            //    }
            //    myCommand = new SqlCommand("Update POStblOutDeliveryDetails  Set Status='Received' from POStblOutDeliveryDetails  INNER JOIN POStblOutDelivery ON POStblOutDelivery.OutDeliveryID=POStblOutDeliveryDetails .OutDeliveryID Where ItemID='" + ItemID + "'  and POStblOutDelivery.OutDeliveryID='" + ASPxGridLookup1.Value.ToString() + "'", Myconnection, trans);
            //    myCommand.ExecuteNonQuery();

            //}
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {

                string ItemID = ASPxGridView1.GetRowValues(i, "ItemID").ToString();
                string ItemCode = ASPxGridView1.GetRowValues(i, "ItemCode").ToString();
                string ItemName = ASPxGridView1.GetRowValues(i, "ItemName").ToString();
                //string Size = ASPxGridView1.GetRowValues(i, "Size").ToString();
                //string Color = ASPxGridView1.GetRowValues(i, "Color").ToString();
                //string Brand = ASPxGridView1.GetRowValues(i, "Brand").ToString();
                //string Style = ASPxGridView1.GetRowValues(i, "Style").ToString();
                ASPxSpinEdit proquantity = (ASPxSpinEdit)ASPxGridView1.FindRowCellTemplateControl(i, ASPxGridView1.Columns["txt_qty"] as GridViewDataSpinEditColumn, "txt_qty");
                double Qty = Convert.ToDouble(proquantity.Text);
                // recqty = recqty + Qty;
                //double Qty = Convert.ToDouble(ASPxGridView2.GetRowValues(i, "Quantity").ToString());
                string SQty = ASPxGridView1.GetRowValues(i, "Quantity").ToString();
                double dSQTY = Convert.ToDouble(SQty);
                // sendqty = sendqty + Convert.ToDouble(SQty);

                string InsertQuery1 = "INSERT INTO [dbo].[POSInBoundTransaction]([InBoundID],[ItemID],[ItemCode],[Quantity],[Status]) VALUES(@InBoundID,@ItemID,@ItemCode,@Quantity,@Status)" + "Select Scope_Identity()";
                myCommand = new SqlCommand(InsertQuery1, Myconnection, trans);
                myCommand.Parameters.AddWithValue("@InBoundID", Id);
                myCommand.Parameters.AddWithValue("@ItemID", ItemID);
                myCommand.Parameters.AddWithValue("@ItemCode", ItemCode);
                myCommand.Parameters.AddWithValue("@Quantity", Qty);
                myCommand.Parameters.AddWithValue("@Status", "Received");
                myCommand.ExecuteNonQuery();





                string query = "Select t.TotalQuantity,ISNULL(t.AvgPrice,0) from(SELECT ProductInventory.*,ROW_NUMBER() OVER (PARTITION BY ItemID,GodownId ORDER BY ProductInventoryId DESC) AS RN FROM ProductInventory) AS t INNER JOIN ItemMaster ON t.ItemID = ItemMaster.ItemID INNER JOIN dbo.GodownMaster ON t.GodownId = dbo.GodownMaster.GodownId  WHERE RN=1 AND t.ItemID='" + ItemID + "' AND t.GodownId='" + Session["GodownID"].ToString() + "'  ORDER BY t.ItemID";

                SqlDataAdapter da = new SqlDataAdapter(query, Myconnection);
                DataTable dt = new DataTable();
                da.SelectCommand.Transaction = trans;
                da.Fill(dt);
                double Totalqty = 0;
                double price = 0;
                double OldQty = 0;
                if (dt.Rows.Count > 0)
                {
                    OldQty = Convert.ToDouble(dt.Rows[0].ItemArray[0].ToString());
                    price = Convert.ToDouble(dt.Rows[0].ItemArray[1]);
                }
                else
                {
                    OldQty = 0;
                }
                Totalqty = OldQty + Qty;

                string query11 = "INSERT INTO ProductInventory(ItemID,ProductCode,OldQuantity,ProducedQuantity,TotalQuantity,AvgPrice,DateTime,TransactionId,TransactionTypeId,GodownId) Values(@Id,@ItemCode,@oldqty,@Proqty,@totqty,@AvgPrice,@date,@transactionId,@transactiontypeid,@godownid)";
                myCommand = new SqlCommand(query11, Myconnection, trans);
                myCommand.Parameters.AddWithValue("@ItemCode", ItemCode);
                myCommand.Parameters.AddWithValue("@Id", ItemID);
                myCommand.Parameters.AddWithValue("@oldqty", OldQty);
                myCommand.Parameters.AddWithValue("@Proqty", Qty);
                myCommand.Parameters.AddWithValue("@totqty", Totalqty);
                myCommand.Parameters.AddWithValue("@AvgPrice", price);
                myCommand.Parameters.AddWithValue("@date", System.DateTime.Now);
                myCommand.Parameters.AddWithValue("@transactionId", Id);
                myCommand.Parameters.AddWithValue("@transactiontypeid", 14);
                myCommand.Parameters.AddWithValue("@godownid", Session["GodownID"].ToString());
                myCommand.ExecuteNonQuery();


                string SelectQu = "Select Quantity from POSRequisitionDetails WHere ReqID='" + ReqID + "' AND ItemID='" + ItemID + "'";
                SqlDataAdapter dareq = new SqlDataAdapter(SelectQu, Myconnection);
                DataTable dtreq = new DataTable();
                dareq.SelectCommand.Transaction = trans;
                dareq.Fill(dtreq);
                string RQty = "0";

                if (dtreq.Rows.Count > 0)
                    RQty = dtreq.Rows[0].ItemArray[0].ToString();
                reqqty = reqqty + Convert.ToDouble(RQty);

                if (reportDt.Columns.Count == 0)
                {
                    reportdata();
                }
                reportDt.Rows.Add(ItemCode, ItemName, "", "", "", "", RQty, SQty, Qty);


                //DataTable dtrem = new DataTable();
                //dtrem = ViewState["ItemsNo"] as DataTable;

                int count = 0;

                if (dSQTY > Qty)
                {
                    //var row = dtrem.Select("ItemID='" + ItemID + "'");

                    //foreach (var ro in row)
                    //{
                    //    count = count + Convert.ToInt32(ro["Quantity"].ToString());

                    //}
                    double lQTy = (dSQTY) - (Qty);
                    if (count > 0)
                    {
                        string InsertQuery = "INSERT INTO POSLostInTransit(ItemID,ItemCode,NoOfItems,ReferenceID,Status,ReferenceType) Values(@ItemID,@ItemCode,@NoOfItems,@ReferenceID,@Status,@ReferenceType)";
                        myCommand = new SqlCommand(InsertQuery, Myconnection, trans);
                        myCommand.Parameters.AddWithValue("@ItemID", ItemID);
                        myCommand.Parameters.AddWithValue("@ItemCode", ItemCode);
                        myCommand.Parameters.AddWithValue("@NoOfItems", lQTy);
                        myCommand.Parameters.AddWithValue("@ReferenceID", Id);
                        myCommand.Parameters.AddWithValue("@Status", "Lost In Transaction");
                        myCommand.Parameters.AddWithValue("@ReferenceType", "Received");
                        myCommand.ExecuteNonQuery();
                    }

                }
                myCommand = new SqlCommand("Update POStblOutDeliveryDetails  Set Status='Received' from POStblOutDeliveryDetails  INNER JOIN POStblOutDelivery ON POStblOutDelivery.OutDeliveryID=POStblOutDeliveryDetails .OutDeliveryID Where ItemID='" + ItemID + "'  and POStblOutDelivery.OutDeliveryID='" + ASPxGridLookup1.Value.ToString() + "'", Myconnection, trans);
                myCommand.ExecuteNonQuery();

            }
            SqlDataAdapter dareq1 = new SqlDataAdapter("Select ItemID from POSRequisitionDetails where  [Status] !='Transfered' or  [Status] is NULL and ReqID='" + ASPxGridLookup1.Value.ToString() + "'", Myconnection);
            DataTable dtreq1 = new DataTable();
            dareq1.SelectCommand.Transaction = trans;
            dareq1.Fill(dtreq1);
           //string ReqID=ASPxGridLookup1.GridView
            if (dtreq1.Rows.Count == 0)
            {
                string UpdateQuery = "Update POSRequisitionParent Set Status='Received' Where ReqID='" + ReqID + "'";
                myCommand = new SqlCommand(UpdateQuery, Myconnection, trans);
                myCommand.ExecuteNonQuery();
            }
            else
            {
                string UpdateQuery = "Update POSRequisitionParent Set Status='PartiallyReceived' Where ReqID='" + ReqID + "'";
                myCommand = new SqlCommand(UpdateQuery, Myconnection, trans);
                myCommand.ExecuteNonQuery();
            }
            SqlDataAdapter daout = new SqlDataAdapter("Select POStblOutDeliveryDetails .ItemID from POStblOutDeliveryDetails  INNER JOIN POStblOutDelivery ON POStblOutDelivery.OutDeliveryID=POStblOutDeliveryDetails .OutDeliveryID Where POStblOutDeliveryDetails .Status='Transfered'  and POStblOutDelivery.OutDeliveryID='" + ASPxGridLookup1.Value.ToString() + "'", Myconnection);
            DataTable dtout = new DataTable();
            daout.SelectCommand.Transaction = trans;
            daout.Fill(dtout);
            if (dtout.Rows.Count == 0)
            {
                string UpdateQuery1 = "Update POStblOutDelivery Set Status='Received' Where ReqID='" + ReqID + "' AND OutDeliveryID='" + ASPxGridLookup1.Value+"' ";
                myCommand = new SqlCommand(UpdateQuery1, Myconnection, trans);
                myCommand.ExecuteNonQuery();
            }
            else
            {
                string UpdateQuery1 = "Update POStblOutDelivery Set Status='PartiallyReceived' Where ReqID='" + ReqID + "' AND OutDeliveryID='" + ASPxGridLookup1.Value + "' ";
                myCommand = new SqlCommand(UpdateQuery1, Myconnection, trans);
                myCommand.ExecuteNonQuery();
            }

            string type = "";
            string name = "";
            string name1 = "";
            string corno = "";
            string corno1 = "";
            string awname = "";
            string awname1 = "";
            string transporter = "";
            string transporter1 = "";
            string lrdate = "";
            string lrdate1 = "";
            string mob = "";
            string mob1 = "";

            //if (ASPxRadioButtonList1.SelectedItem.Text == "By Courier")
            //{
            //    type = "Courier";
            //    name = "CourierName";
            //    name1 = cmb_couriername.Text;
            //    corno = "AWBNO";
            //    corno1 = txt_awbno.Text;
            //    awname = "CourierNumber";
            //    awname1 = txt_couriermobile.Text;
            //}
            //else if (ASPxRadioButtonList1.SelectedItem.Text == "By Truck")
            //{
            //    type = "Truck";
            //    name = "Lr No";
            //    name1 = txt_vechno.Text;
            //    corno = "Invoice No/Dc No";
            //    corno1 = txt_challno.Text;
            //    awname = "Lr Date";
            //    awname1 = DateEdit_lrdate.Text;
            //    transporter = "Transporter Name";
            //    transporter1 = txt_transporter.Text;
            //    lrdate = "Driver Name";
            //    lrdate1 = txt_dname.Text;
            //    mob = "Driver Number";
            //    mob1 = txt_dmobile.Text;
            //}

            string SendGodown = ASPxGridLookup1.GridView.GetRowValues(ASPxGridLookup1.GridView.FocusedRowIndex, "GodownName").ToString();
          // string[] Values = { lbl_name.Text,ReqID, SendGodown, type, name, name1, corno, corno1, awname, awname1, mob, mob1, lrdate, lrdate1, transporter, transporter1,Id.ToString(),reqqty.ToString(),sendqty.ToString(),recqty.ToString()};

            // DeliveryGatePass report = new DeliveryGatePass(reportDt, Values);
            DeliveryGatePass report = new DeliveryGatePass(
     reportDt,
     name,
     mob,
     corno,
     awname,
     lbl_name.Text,
     ReqID,
     type,
     transporter,
     SendGodown
 );
            report.CreateDocument();
            report.ExportToPdf(Server.MapPath(@"PdfReports//ReceivedItems//ReceivedItems_" + Id + ".pdf"));
            Response.Write("<script>");
            Response.Write("window.open('ReceivedItemsPdf.aspx','_blank')");
            Response.Write("</script>");

            string location = "ReceivedItems_" + Id + ".pdf";
            string Update = "Update POSInBoundMaster Set Location='" + location + "' Where InBoundID='" + Id + "' ";
            myCommand = new SqlCommand(Update, Myconnection, trans);
            myCommand.ExecuteNonQuery();
            lbl_error.Text = "Items Received Successfully";
            trans.Commit();

            //Clear All Controls          
            ASPxGridView1.DataBind();
            ViewState["itemdetail"] = null as DataTable;
            ASPxGridView2.DataSource = ViewState["itemdetail"] as DataTable;
            ASPxGridView2.DataBind();
            ASPxGridLookup1.Value = -1;
            //ASPxRadioButtonList1.SelectedIndex = -1;
            //txt_awbno.Text = txt_challno.Text = txt_couriermobile.Text = txt_dmobile.Text = txt_dname.Text = txt_ScanItem.Text = txt_transporter.Text = txt_vechno.Text = "";
            //cmb_couriername.Text = "";
            //DateEdit_lrdate.Text = "";
            lbl_scanItem.Text = lbl_TotalItem.Text = "";
            Response.AppendHeader("Refresh", "10;url=ReceiveItems.aspx");
        }
        catch (SqlException ex)
        {
            lbl_error.Text = "Insertion Went Wrong";
            trans.Rollback();
        }
        catch (Exception ex)
        {
            lbl_error.Text = "Some Problem in Code Please Contact Admin";
            trans.Rollback();
        }
        catch
        {
            lbl_error.Text = "Error in Your Page,Please Contact Admin";
            trans.Rollback();
        }
        Myconnection.Close();       
    }  

}