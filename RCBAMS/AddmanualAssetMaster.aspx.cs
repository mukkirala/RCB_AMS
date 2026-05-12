using DevExpress.CodeParser;
using DevExpress.XtraPrinting.Export.Pdf;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddmanualAssetMaster : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand;
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter da;
    string currentDateTime = System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
        ASPxGridView1.DataBind();
        string AssetClass = WebConfigurationManager.AppSettings.Get("AssetClass");
        //cmb_AssetClass.DataSource = AssetClass.Split(',');
        //cmb_AssetClass.DataBind();
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());

    }


    protected void btn_save_Click(object sender, EventArgs e)
    {

        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());

        lbl_msg.Visible = false;
        //if (txtCompany.Text == "")
        //{
        //    lbl_msg.Text = "Enter Company";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtplant.Text == "")
        //{
        //    lbl_msg.Text = "Enter Plant";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        if (cmb_supplier.Text == "")
        {
            lbl_msg.Text = "Select Supplier";
            lbl_msg.Visible = true;
            return;
        }
        if (cmb_institute.Text == "")
        {
            lbl_msg.Text = "Select Institute";
            lbl_msg.Visible = true;
            return;
        }
        if (txtAssetID.Text == "")
        {
            lbl_msg.Text = "Enter AssetID";
            lbl_msg.Visible = true;
            return;
        }
        if (txtMainAssetID.Text == "")
        {
            lbl_msg.Text = "Enter Equipment Number";
            lbl_msg.Visible = true;
            return;
        }
        //if (txtsubassetno.Text == "")
        //{
        //    lbl_msg.Text = "Enter SUBAsset Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        if (cmb_AssetClass.Text == "")
        {
            lbl_msg.Text = "Please Select Asset Class";
            lbl_msg.Visible = true;
            return;
        }
        if (txtAssetDesc.Text == "")
        {
            lbl_msg.Text = "Enter Asset Name ";
            lbl_msg.Visible = true;
            return;
        }
        if (txtAssetOwner.Text == "")
        {
            lbl_msg.Text = "Enter AssetOwner";
            lbl_msg.Visible = true;
            return;
        }

       
       
        //if (txtStaffNumber.Text == "")
        //{
        //    lbl_msg.Text = "Enter main Staff Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txttxtSerial.Text == "")
        //{
        //    lbl_msg.Text = "Enter main Serial Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtMAcid.Text == "")
        //{
        //    lbl_msg.Text = "Enter MacID";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtmodel.Text == "")
        //{
        //    lbl_msg.Text = "Enter Model Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtgrnumber.Text == "")
        //{
        //    lbl_msg.Text = "Enter GR Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}

        //if (cmb_yearofpurchase.Text == "")
        //{
        //    lbl_msg.Text = "Enter Year Of Purchase";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txt_locationid.Text == "")
        //{
        //    lbl_msg.Text = "Enter Location ID";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        if (txtLocationid.Text == "")
        {
            lbl_msg.Text = "Select Wing";
            lbl_msg.Visible = true;
            return;
        }
        if (txtbolck.Text == "")
        {
            lbl_msg.Text = "Select Floor";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_lab.Text == "")
        {
            lbl_msg.Text = "Select LAB";
            lbl_msg.Visible = true;
            return;
        }
        //if (cmb_Capitalizationdate.Text == "")
        //{
        //    lbl_msg.Text = "Enter Capitailzation Date";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        if (txt_indentno.Text == "")
        {
            lbl_msg.Text = "Enter Indent Number";
            lbl_msg.Visible = true;
            return;
        }
        if (txt_cost.Text == "")
        {
            lbl_msg.Text = "Enter Cost";
            lbl_msg.Visible = true;
            return;
        }
        //if (txtcostno.Text == "")
        //{
        //    lbl_msg.Text = "Enter Cost Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtmaterialno.Text == "")
        //{
        //    lbl_msg.Text = "Enter Equipment Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}
       
        //if (cmb_Acceptdatebyuser.Text == "")
        //{
        //    lbl_msg.Text = "Enter Accept Date By User";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtpono.Text == "")
        //{
        //    lbl_msg.Text = "Enter PONO For Reference";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtAssetUser.Text == "")
        //{
        //    lbl_msg.Text = "Enter Asset User";
        //    lbl_msg.Visible = true;
        //   return;
        //}
        if (Dep_ComboBox1.Text == "")
        {
            lbl_msg.Text = "Select Department ";
            lbl_msg.Visible = true;
            return;
        }
        if (txtxcode.Text == "")
        {
            lbl_msg.Text = "Enter Code ";
            lbl_msg.Visible = true;
            return;
        }

        SqlDataAdapter daa5 = new SqlDataAdapter("select AssetID From AssetMaster where AssetID='" + txtAssetID.Text + "' and Status != 'InActive' and StatusDesc != 'Asset Deleted' ", myConnection);
        DataTable dt4 = new DataTable();
        daa5.Fill(dt4);
        if (dt4.Rows.Count > 0)
        {
            lbl_msg.Text = " AssetID already exists";
            lbl_msg.Visible = true;
            return;
        }
        SqlDataAdapter daa1 = new SqlDataAdapter("SELECT count(AssetID) FROM AssetMaster WHERE Status !='InActive' and StatusDesc !='Asset Deleted'", myConnection);
        DataTable dtt1 = new DataTable();
        daa1.Fill(dtt1);
        // int k = 0;
        if (dtt1.Rows.Count > 5500)
        {
            lbl_msg.Visible = true;
            lbl_msg.Text = "Assest Limit As Exceeded ";
            return;
        }
        SqlDataAdapter daa = new SqlDataAdapter("SELECT * FROM AssetMaster WHERE MainAssetNumber='" + txtMainAssetID.Text + "' AND AssetSubNumber='" + txtsubassetno.Text + "'  ", myConnection);
        DataTable dtt = new DataTable();
        daa.Fill(dtt);
        if (dtt.Rows.Count > 0)
        {
            lbl_msg.Text = "Combination of MainAsset And SUbAssest ID  is Already Available ,Enter Different Combination ";
            lbl_msg.Visible = true;
            return;
        }
        SqlDataAdapter daa2 = new SqlDataAdapter("select * From AssetMaster where AssetID='" + txtAssetID.Text + "' and Status !='InActive' and StatusDesc !='Asset Deleted' ", myConnection);
        DataTable dt1 = new DataTable();
        if (dt1.Rows.Count > 0)
        {
            lbl_msg.Text = " Enter Different AssetID";
            return;
        }
        SqlDataAdapter daa3 = new SqlDataAdapter("select CustodianID From CustodianMaster where CustodianID='" + custodianlookup.Value + "' ", myConnection);
        DataTable dt2 = new DataTable();
        if (dt1.Rows.Count > 0)
        {
            lbl_msg.Text = " Enter  Valid Staff Number";
            return;
        }
        SqlDataAdapter daa4 = new SqlDataAdapter("select MainAssetNumber From AssetMaster where MainAssetNumber='" + txtMainAssetID.Text + "' and Status != 'InActive' and StatusDesc != 'Asset Deleted' ", myConnection);
        DataTable dt3 = new DataTable();
        daa4.Fill(dt3);
        if (dt3.Rows.Count > 0)
        {
            lbl_msg.Text = " Equipment Number already exists";
            lbl_msg.Visible = true;
            return;
        }
        


        SqlCommand myCommand1 = new SqlCommand("IF(NOT EXISTS(SELECT * FROM AssetTypeMaster WHERE AssetTypeName = @AssetTypeName))BEGIN INSERT INTO AssetTypeMaster(AssetTypeName,AssetClassName)VALUES(@AssetTypeName,@AssetClassName)END", myConnection);
        myCommand1.Parameters.AddWithValue("AssetTypeName", txtAssetDesc.Text);
        myCommand1.Parameters.AddWithValue("AssetClassName", cmb_AssetClass.Text);
        myConnection.Open(); 
        myCommand1.ExecuteNonQuery();
        myConnection.Close();

        //SqlCommand selectQuery = new SqlCommand("select Company,Plant,AssetID,MainAssetNumber,AssetSubNumber,AssetDesc,AssetOwner,AssetUser,StaffNumber,SerialNumber,MACID,LocationID,BLOCK,Model,GRNumber,YearofPurchase,CapitalizationDate,AssetClass,CostCenter,MaterialNumber,AcceptDatebyUser,PONoforReference,WBSNumberforReference,InstallationDateforReference,Remarks,Department,CreationDate,Status,StatusDesc where MainAssetNumber=@MainAssetNumber And AssetSubNumber=@AssetSubNumber";
        //SqlCommand selectCommand = new SqlCommand(selectQuery, myConnection);
        //selectCommand.Parameters.AddWithValue("MainAssetNumber", txtMainAssetID.Text);
        //selectCommand.Parameters.AddWithValue("AssetSubNumber", txtsubassetno.Text);
        //if (dt.Rows.Count > 0)
        //{
       
    
        myCommand = new SqlCommand("IF(NOT EXISTS(SELECT * FROM AssetMaster WHERE MainAssetNumber = @MainAssetNumber And AssetSubNumber=@AssetSubNumber))BEGIN Insert into AssetMaster(Company,Plant,SupplierID,InstitutePKID,AssetID,MainAssetNumber,AssetSubNumber,CustodianID,AssetDesc,AssetOwner,AssetUser,SerialNumber,MACID,LocationID,Location,BLOCK,LocationDesc,Model,GRNumber,YearofPurchase,CapitalizationDate,AssetClass,CostCenter,Indentor,IndentNumber,Cost,WarrantyDate,AcceptDatebyUser,PONoforReference,PODate,Make,WBSNumberforReference,InstallationDateforReference,Remarks,Department,Code,CreationDate,Status,StatusDesc)values(@Company,@Plant,@SupplierID,@InstitutePKID,@AssetID,@MainAssetNumber,@AssetSubNumber,@CustodianID,@AssetDesc,@AssetOwner,@AssetUser,@SerialNumber,@MACID,@LocationID,@Location,@BLOCK,@LocationDesc,@Model,@GRNumber,@YearofPurchase,@CapitalizationDate,@AssetClass,@CostCenter,@Indentor,@IndentNumber,@Cost,@WarrantyDate,@AcceptDatebyUser,@PONoforReference,@PODate,@Make,@WBSNumberforReference,@InstallationDateforReference,@Remarks,@Department,@Code,@CreationDate,@Status,@StatusDesc)END", myConnection);
        myCommand.Parameters.AddWithValue("@Company", txtCompany.Text);
        myCommand.Parameters.AddWithValue("@Plant", txtplant.Text);
        myCommand.Parameters.AddWithValue("@SupplierID", cmb_supplier.Value);
        myCommand.Parameters.AddWithValue("@InstitutePKID", cmb_institute.Value);
        myCommand.Parameters.AddWithValue("@AssetID", txtAssetID.Text);
        myCommand.Parameters.AddWithValue("@MainAssetNumber", txtMainAssetID.Text);
        myCommand.Parameters.AddWithValue("@AssetSubNumber", txtsubassetno.Text);
        myCommand.Parameters.AddWithValue("@AssetDesc", txtAssetDesc.Text);
        myCommand.Parameters.AddWithValue("@AssetOwner", txtAssetOwner.Text);
        myCommand.Parameters.AddWithValue("@AssetUser", custodianlookup.Text);
        //myCommand.Parameters.AddWithValue("StaffNumber", txtStaffNumber.Text);
        if (custodianlookup.Value!=null)
        {
            myCommand.Parameters.AddWithValue("@CustodianID", custodianlookup.Value);
            myCommand.Parameters.AddWithValue("@Status", "LTRF");
            myCommand.Parameters.AddWithValue("@StatusDesc", "Asset Location Transferred");
        }
        else
        {
            myCommand.Parameters.AddWithValue("@CustodianID", DBNull.Value);
            myCommand.Parameters.AddWithValue("@Status", "AVAL");
            myCommand.Parameters.AddWithValue("@StatusDesc", "Asset Available");
        }

        myCommand.Parameters.AddWithValue("SerialNumber", txttxtSerial.Text);
        myCommand.Parameters.AddWithValue("MACID", txtMAcid.Text);
        myCommand.Parameters.AddWithValue("LocationID", txt_lab.Value);
        myCommand.Parameters.AddWithValue("Location", txtLocationid.Text);
        myCommand.Parameters.AddWithValue("BLOCK", txtbolck.Text);
        myCommand.Parameters.AddWithValue("LocationDesc", txt_lab.Text);
        myCommand.Parameters.AddWithValue("Model", txtmodel.Text);
        myCommand.Parameters.AddWithValue("GRNumber", txtgrnumber.Text);
            
        myCommand.Parameters.AddWithValue("YearofPurchase", cmb_yearofpurchase.Text);
      //  myCommand.Parameters.AddWithValue("CapitalizationDate", cmb_Capitalizationdate.Date.ToString("yyyy-MM-dd"));
        if (cmb_Capitalizationdate.Date.ToString()!="" )
        {
            myCommand.Parameters.AddWithValue("CapitalizationDate", cmb_Capitalizationdate.Date.ToString("yyyy-MM-dd"));
        }
        else 
        {
            myCommand.Parameters.AddWithValue("CapitalizationDate", DBNull.Value);
        }
        myCommand.Parameters.AddWithValue("AssetClass", cmb_AssetClass.Text);
        myCommand.Parameters.AddWithValue("CostCenter", txtcostno.Text);
        //myCommand.Parameters.AddWithValue("MaterialNumber", txtmaterialno.Text);
        myCommand.Parameters.AddWithValue("Indentor", txt_indentor.Text);
        myCommand.Parameters.AddWithValue("IndentNumber", txt_indentno.Text);
        myCommand.Parameters.AddWithValue("Cost", txt_cost.Text);
        if (cmb_warrantydate.Date.ToString() != "")
        {
            myCommand.Parameters.AddWithValue("WarrantyDate", cmb_warrantydate.Date.ToString("yyyy-MM-dd"));
        }
        else
        {
            myCommand.Parameters.AddWithValue("WarrantyDate", DBNull.Value);
        }
        //   myCommand.Parameters.AddWithValue("AcceptDatebyUser", cmb_Acceptdatebyuser.Date.ToString("yyyy - MM - dd"));
        if (cmb_Acceptdatebyuser.Date.ToString() != "")
        {
            myCommand.Parameters.AddWithValue("AcceptDatebyUser", cmb_Acceptdatebyuser.Date.ToString("yyyy-MM-dd"));
        }
        else
        {
            myCommand.Parameters.AddWithValue("AcceptDatebyUser", DBNull.Value);
        }
        myCommand.Parameters.AddWithValue("PONoforReference", txtpono.Text);
        myCommand.Parameters.AddWithValue("WBSNumberforReference", txtwnfr.Text);
        myCommand.Parameters.AddWithValue("PODate", cmb_podate.Date.ToString("yyyy - MM - dd"));
        myCommand.Parameters.AddWithValue("Make", txt_make.Text);
        // myCommand.Parameters.AddWithValue("InstallationDateforReference", cmb_IDFR.Date.ToString("yyyy-MM-dd"));
        if (cmb_IDFR.Date.ToString() != "")
        {
            myCommand.Parameters.AddWithValue("InstallationDateforReference", cmb_IDFR.Date.ToString("yyyy-MM-dd"));
        }
        else
        {
            myCommand.Parameters.AddWithValue("InstallationDateforReference", DBNull.Value);
        }
        myCommand.Parameters.AddWithValue("Remarks", txtremark.Text);
        myCommand.Parameters.AddWithValue("Department", Dep_ComboBox1.Text);
        myCommand.Parameters.AddWithValue("Code", txtxcode.Text);
        myCommand.Parameters.AddWithValue("CreationDate", currentDateTime);
        //myCommand.Parameters.AddWithValue("@Status", "AVAL");
        //myCommand.Parameters.AddWithValue("@StatusDesc", "Asset Available");

        myConnection.Open(); 
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        string ID = txtAssetID.Text;
        string Asset = txtMainAssetID.Text;
        string Sub = txtsubassetno.Text;
        string Class = cmb_AssetClass.Text;
        string SN = "0" + Sub + "";
        string myList = "" + ID + "-RCB-" + Asset + "-" + SN + "";
        //ArrayList myList = new ArrayList();
        //// Adding elements to ArrayList 
        //myList.Add(ID);
        //myList.Add(Asset);
        //myList.Add(Sub);
        //myList.Add(Class);
        int avl = QRExist(Asset, Sub);
        if (avl == 0)
        {
            string equname = ID;
            //string space = equname.Replace(" ", "");
            //string QRCode = space.Substring(0, 7);
            string QRCode = Asset;
            QRUtilities.GenerateMyQCCode(equname, QRCode, Asset);
            string location = "QRImages/" + ID + ".jpg";
            cmd = new SqlCommand("Insert into  QRCodeMaster(QRCode,QRImage,CreatedBy,CreatedDate,MainAssetNumber,AssetSubNumber,AssetID)values(@QRCode,@QRImage,@CreatedBy,@CreatedDate,@MainAssetNumber,@AssetSubNumber,@AssetID)", conAMS);
            cmd.Parameters.AddWithValue("@QRCode", ID);
            cmd.Parameters.AddWithValue("@QRImage", location);
            cmd.Parameters.AddWithValue("@CreatedBy", Session["UserID"].ToString());
            DateTime date = DateTime.Now;
            cmd.Parameters.AddWithValue("@CreatedDate", date);
            cmd.Parameters.AddWithValue("@MainAssetNumber", Asset);
            cmd.Parameters.AddWithValue("@AssetSubNumber", Sub);
            cmd.Parameters.AddWithValue("@AssetID", ID);
            conAMS.Open();
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            conAMS.Close();
        }
        if (avl == 1)
        {

        }



        ASPxGridView1.DataBind();
        lbl_msg.Text = "Data Saved Successfully";
        lbl_msg.Visible = true;
        Clear();
    }

    public int QRExist(string Main, string Sub)
    {
        int result = 0;
        string query = "Select * from QRCodeMaster where MainAssetNumber='" + Main + "' and AssetSubNumber='" + Sub + "'; SELECT SCOPE_IDENTITY();";
        da = new SqlDataAdapter(query, conAMS);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            result = 1;
        }
        else
        {

        }
        return result;
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        //lbl_msg.Visible = false;
        //if (txtCompany.Text == "")
        //{
        //    lbl_msg.Text = "Enter Company";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtplant.Text == "")
        //{
        //    lbl_msg.Text = "Enter Plant";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtAssetID.Text == "")
        //{
        //    lbl_msg.Text = "Enter AssetID";
        //    lbl_msg.Visible = true;
        //    return;
        //}
        //if (txtMainAssetID.Text == "")
        //{
        //    lbl_msg.Text = "Enter main Asset Number";
        //    lbl_msg.Visible = true;
        //    return;
        //}

        if (custodianlookup.Value != null)
        {
            myCommand = new SqlCommand("UPDATE AssetMaster SET  Status='LTRF',StatusDesc='Asset Location Transferred',Company='" + txtCompany.Text + "',Plant='" + txtplant.Text + "',AssetID='" + txtAssetID.Text + "',SupplierID='" + cmb_supplier.Value + "',InstitutePKID= '" + cmb_institute.Value + "',MainAssetNumber = '" + txtMainAssetID.Text + "',AssetSubNumber='" + txtsubassetno.Text + "',AssetDesc='" + txtAssetDesc.Text + "' ,AssetOwner='" + txtAssetOwner.Text + "',AssetUser='" + custodianlookup.Text + "',CustodianID='" + custodianlookup.Value + "',SerialNumber ='" + txttxtSerial.Text + "',MACID='" + txtMAcid.Text + "',LocationID='" + txt_lab.Value + "',Location='" + txtLocationid.Text + "',BLOCK='" + txtbolck.Text + "',LocationDesc='" + txt_lab.Text + "',Model='" + txtmodel.Text + "',GRNumber='" + txtgrnumber.Text + "',YearofPurchase='" + cmb_yearofpurchase.Text + "',PODate='" + cmb_podate.Date.ToString("yyyy-MM-dd") + "',Make='" + txt_make.Text + "',CapitalizationDate = '" + cmb_Capitalizationdate.Date.ToString("yyyy-MM-dd") + "',AssetClass='" + cmb_AssetClass.Text + "',CostCenter='" + txtcostno.Text + "',Indentor='" + txt_indentor.Text + "',IndentNumber='" + txt_indentno.Text + "',Cost='" + txt_cost.Text + "',WarrantyDate='" + cmb_warrantydate.Date.ToString("yyyy - MM - dd") + "',AcceptDatebyUser='" + cmb_Acceptdatebyuser.Date.ToString("yyyy - MM - dd") + "',PONoforReference='" + txtpono.Text + "',WBSNumberforReference='" + txtwnfr.Text + "',InstallationDateforReference='" + cmb_IDFR.Date.ToString("yyyy-MM-dd") + "',Department='" + Dep_ComboBox1.Text + "',Code='" + txtxcode.Text + "',Remarks='" + txtremark.Text + "',CreationDate='" + System.DateTime.Now.ToString("yyyy-MM-dd") + "' WHERE SLNO='" + Session["SLNO"] + "' ", myConnection);

            
        }
        else
        {
            myCommand = new SqlCommand("UPDATE AssetMaster SET  Company='" + txtCompany.Text + "',Plant='" + txtplant.Text + "',AssetID='" + txtAssetID.Text + "',SupplierID='" + cmb_supplier.Value + "',InstitutePKID= '" + cmb_institute.Value + "',MainAssetNumber = '" + txtMainAssetID.Text + "',AssetSubNumber='" + txtsubassetno.Text + "',AssetDesc='" + txtAssetDesc.Text + "' ,AssetOwner='" + txtAssetOwner.Text + "',AssetUser='" + custodianlookup.Text + "',CustodianID='" + custodianlookup.Value + "',SerialNumber ='" + txttxtSerial.Text + "',MACID='" + txtMAcid.Text + "',LocationID='" + txt_lab.Value + "',Location='" + txtLocationid.Text + "',BLOCK='" + txtbolck.Text + "',LocationDesc='" + txt_lab.Text + "',Model='" + txtmodel.Text + "',GRNumber='" + txtgrnumber.Text + "',YearofPurchase='" + cmb_yearofpurchase.Text + "',PODate='" + cmb_podate.Date.ToString("yyyy-MM-dd") + "',Make='" + txt_make.Text + "',CapitalizationDate = '" + cmb_Capitalizationdate.Date.ToString("yyyy-MM-dd") + "',AssetClass='" + cmb_AssetClass.Text + "',CostCenter='" + txtcostno.Text + "',Indentor='" + txt_indentor.Text + "',IndentNumber='" + txt_indentno.Text + "',Cost='" + txt_cost.Text + "',WarrantyDate='" + cmb_warrantydate.Date.ToString("yyyy - MM - dd") + "',AcceptDatebyUser='" + cmb_Acceptdatebyuser.Date.ToString("yyyy - MM - dd") + "',PONoforReference='" + txtpono.Text + "',WBSNumberforReference='" + txtwnfr.Text + "',InstallationDateforReference='" + cmb_IDFR.Date.ToString("yyyy-MM-dd") + "',Department='" + Dep_ComboBox1.Text + "',Code='" + txtxcode.Text + "',Remarks='" + txtremark.Text + "',CreationDate='" + System.DateTime.Now.ToString("yyyy-MM-dd") + "' WHERE SLNO='" + Session["SLNO"] + "' ", myConnection);

           
        }

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        //txtAssetDesc.ReadOnly = false;
        ASPxGridView1.DataBind();
        Messages.SetSuccessMessage("0060", null, Session);
        //SqlCommand myCommand2 = new SqlCommand("UPDATE AssetTypeMaster SET AssetTypeName='"+ txtAssetDesc.Text + "' WHERE SLNO='" + Session["SLNO"] + "'", myConnection);
        //myConnection.Open();
        //myCommand2.ExecuteNonQuery();
        //myConnection.Close();
        lbl_msg.Text = "Data Updated Successfully";
        Clear();
        btn_Update.Visible = false;
        btn_save.Visible = true;
        lbl_msg.Text = "Data Updated Successfully";
    }
   









    ////  protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    //  {
    //      lbl_msg.Visible = false;
    //      string btn = e.CommandArgs.CommandName.ToString();
    //      if (btn == "Edit")
    //      {
    //          string SLNO = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SLNO").ToString();
    //Session["SLNO"] = SLNO;
    //          txtCompany.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Company").ToString();
    //txtplant.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Plant").ToString();
    //txtAssetID.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
    //txtMainAssetID.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MainAssetNumber").ToString();
    //txtsubassetno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetSubNumber").ToString();
    //txtAssetDesc.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetDesc").ToString();
    //txtAssetOwner.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetOwner").ToString();
    //txtAssetUser.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetUser").ToString();
    //txtStaffNumber.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "StaffNumber").ToString();
    //txttxtSerial.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SerialNumber").ToString();
    //txtMAcid.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MACID").ToString();
    //txtLocationid.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LocationID").ToString();
    //txtbolck.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "BLOCK").ToString();
    //txtmodel.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Model").ToString();
    //txtgrnumber.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "GRNumber").ToString();
    //cmb_yearofpurchase.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "YearofPurchase").ToString();
    //cmb_Capitalizationdate.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CapitalizationDate").ToString();
    //txtassetclass.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetClass").ToString();
    //txtcostno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CostCenter").ToString();
    //txtmaterialno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MaterialNumber").ToString();
    //cmb_Acceptdatebyuser.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AcceptDatebyUser").ToString();
    //txtpono.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "PONoforReference").ToString();
    //txtwnfr.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WBSNumberforReference").ToString();
    //cmb_IDFR.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstallationDateforReference").ToString();
    //txtremark.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Remarks").ToString();



    // if (btn == "delete")
        

    //lbl_msg.text = "";
    //string slno = aspxgridview1.getrowvaluesbykeyvalue(e.keyvalue, "slno").tostring();
    //string query2 = "update [assetmaster] set status='inactive' where slno='" + slno + "'";
    //mycommand = new sqlcommand(query2, myconnection);
    //myconnection.open();
    //mycommand.executenonquery();
    //myconnection.close();
    //aspxgridview1.databind();
    //btn_update.visible = false;
    //btn_save.visible = true;
    //// messages.setsuccessmessage("0061", null, session);
    //clear();

      

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        lbl_msg.Visible = false;
             string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {

            lbl_msg.Visible = false;
            string SLNO = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SLNO").ToString();
            Session["SLNO"] = SLNO;

            //string warrantyDateString = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WarrantyDate").ToString();

            //if (!string.IsNullOrEmpty(warrantyDateString))
            //{
            //    DateTime warrantyDate;
            //    // Specify the expected date format(s). Adjust the format string as needed.
            //    string[] formats = { "yyyy-MM-dd" };

            //    if (DateTime.TryParseExact(warrantyDateString, formats,
            //        System.Globalization.CultureInfo.InvariantCulture,
            //        System.Globalization.DateTimeStyles.None, out warrantyDate))
            //    {
            //        cmb_warrantydate.Date = warrantyDate;
            //    }
            //    else
            //    {
            //        // Handle the case where the date string is not in a valid format
            //        // For example, set to a default date or show an error message
            //        cmb_warrantydate.Date = DateTime.MinValue; // or any default date
            //                                                   // Optionally, log the error or inform the user
            //    }
            //}
            //else
            //{
            //    // Handle the case where the date string is null or empty
            //    // For example, set to a default date or show an error message
            //    cmb_warrantydate.Date = DateTime.MinValue; // or any default date
            //                                               // Optionally, log the error or inform the user
            //}


            txtCompany.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Company").ToString();
            txtplant.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Plant").ToString();
            cmb_supplier.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SupplierID").ToString();
            cmb_institute.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstitutePKID").ToString();
            txtAssetID.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetID").ToString();
            txtMainAssetID.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MainAssetNumber").ToString();
            txtsubassetno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetSubNumber").ToString();
            txtAssetDesc.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetDesc").ToString();
            txtAssetOwner.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetOwner").ToString();
            //txtAssetUser.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetUser").ToString();
            custodianlookup.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            txttxtSerial.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SerialNumber").ToString();
            txtMAcid.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MACID").ToString();
            txt_lab.Value = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LocationID").ToString();
            txtLocationid.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Location").ToString();
            txtbolck.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "BLOCK").ToString();
            txt_lab.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "LocationDesc").ToString();
            txtmodel.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Model").ToString();
            txtgrnumber.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "GRNumber").ToString();
            cmb_yearofpurchase.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "YearofPurchase").ToString();
            cmb_Capitalizationdate.Date = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CapitalizationDate").ToString());
            cmb_AssetClass.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AssetClass").ToString();
            txtcostno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CostCenter").ToString();
            //txtmaterialno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "MaterialNumber").ToString();
            txt_indentor.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Indentor").ToString();
            txt_indentno.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "IndentNumber").ToString();
            txt_cost.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Cost").ToString();

            //string warrantyDateString = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WarrantyDate").ToString();

            //DateTime warrantyDate;
            if (ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WarrantyDate").ToString() != "")
            {
                cmb_warrantydate.Date = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WarrantyDate").ToString());
            }
            else
            {
                cmb_warrantydate.Value = null; // or any default value or logic as needed
            }

            //cmb_warrantydate.Date = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WarrantyDate").ToString());
            cmb_Acceptdatebyuser.Date = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "AcceptDatebyUser").ToString());
            txtpono.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "PONoforReference").ToString();
            txt_make.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Make").ToString();
            cmb_podate.Date= Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "PODate").ToString());
            txtwnfr.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "WBSNumberforReference").ToString();
            cmb_IDFR.Date = Convert.ToDateTime(ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstallationDateforReference").ToString());
            txtremark.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Remarks").ToString();
            Dep_ComboBox1.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Department").ToString();
            txtxcode.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Code").ToString();
            // txtCustodianID.Text= ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
            btn_Update.Visible = true;
            btn_save.Visible = false;
           // txtAssetDesc.ReadOnly = true;


        }
        if (btn == "Delete")
        {
            //string message = "Do you want to Delete?";
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append("return confirm('");
            //sb.Append(message);
            //sb.Append("');");
            //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());

            lbl_msg.Visible = false;
            lbl_msg.Visible = true;
            string SLNO = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "SLNO").ToString();
            string query2 = "UPDATE AssetMaster SET Status='InActive',StatusDesc='Asset Deleted' Where SLNO='" + SLNO + "'";
            myCommand = new SqlCommand(query2, myConnection);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            lbl_msg.Text = "Data Deleted Successfully";
            myConnection.Close();
            ASPxGridView1.DataBind();
            btn_Update.Visible = false;
            btn_save.Visible = true;
        }
    }
    protected void Clear()
    {
        txtCompany.Text = "";
        txtplant.Text = "";
        txtAssetID.Text = "";
        txtMainAssetID.Text = "";
        txtsubassetno.Text = "";
        txtAssetDesc.Text = "";
        txtAssetOwner.Text = "";
        //txtAssetUser.Text = "";
        custodianlookup.Value = null;
        txttxtSerial.Text = "";
        txtMAcid.Text = "";
        //txt_locationid.Text = "";
        txtLocationid.Text = "";
        txtbolck.Text = "";
        txt_lab.Text = "";
        txtmodel.Text = "";
        txtgrnumber.Text = "";
        cmb_yearofpurchase.Text = "";
        cmb_Capitalizationdate.Value = "";
        cmb_AssetClass.Text = "";
        txtcostno.Text = "";
        //txtmaterialno.Text = "";
        txt_indentor.Text = "";
        txt_indentno.Text = "";
        txt_cost.Text = "";
        cmb_warrantydate.Value = "";
        cmb_Acceptdatebyuser.Value = "";
        txtpono.Text = "";
        txtwnfr.Text = "";
        cmb_IDFR.Value = "";
        txtremark.Text = "";
        Dep_ComboBox1.Text = "";
        cmb_podate.Text = "";
        txt_make.Text = "";
        cmb_supplier.Value = "";
        cmb_institute.Value = "";
        txtxcode.Text = "";
       // txtCustodianID.Text = "";
    }

    protected void txtLocationid_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtbolck.SelectedIndex = -1;
        txt_lab.SelectedIndex = -1;

    }
    protected void txtbolck_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_lab.SelectedIndex = -1;

    }
    protected void cmb_AssetClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtAssetDesc.DataBind();
        txtAssetDesc.SelectedIndex = -1;
    }

}