using DevExpress.CodeParser;
using DevExpress.XtraGrid.Frames;
using EnvDTE;
using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BulkUploadAssets : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection AMScon = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void download_Click(object sender, EventArgs e)
    {
        try
        {
            Response.ContentType = "Application/xlsx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=BulkUploadAssets.xlsx");
            Response.TransmitFile(Server.MapPath("~/App_Data/BulkUploadAssets.xlsx"));
            Response.End();
        }
        catch (Exception ex)
        {
            label.Text = ex.Message.ToString();

        }

    }



    protected void save_Click(object sender, EventArgs e)
    {
        int mainno;
        int subno;
        int Assetno;
       
        label.Text = "";

        DataTable dt = new DataTable();
        
        var dataSet = new DataSet();

        
        if (upload_excel.HasFile)
        {
            string fileName = Path.GetFileName(upload_excel.PostedFile.FileName);
            string fileExtension = Path.GetExtension(upload_excel.PostedFile.FileName);
            string fileLocation = Server.MapPath(@"ExcelFile//" + fileName);
            upload_excel.SaveAs(fileLocation);
            if (fileExtension == ".xls" || fileExtension == ".xlsx")
            {
                using (FileStream stream = File.Open(fileLocation, FileMode.Open, FileAccess.Read))
                {
                    ExcelDataReader.IExcelDataReader excelReader;
                    if (Path.GetExtension(fileLocation).ToUpper() == ".XLS")
                    {
                        excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
                    }
                    else
                    {

                        excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
                    }

                    var result = excelReader.AsDataSet();
                    excelReader = ExcelReaderFactory.CreateReader(stream);

                    var conf = new ExcelDataSetConfiguration
                    {
                        ConfigureDataTable = _ => new ExcelDataTableConfiguration
                        {
                            UseHeaderRow = true
                        }
                    };
                    dataSet = excelReader.AsDataSet(conf);

                }
            }
            else
            {
                label.Text = "Please Upload Valid File";
                return;
            }

            if (dataSet.Tables.Count > 0)
            {
                string getExcelSheetName = dataSet.Tables[0].ToString();
                dt = dataSet.Tables[0];
            }
            
            if (dt.Rows.Count > 0)
            {

                

                
                    for(int i = 0; i < dt.Rows.Count; i++)
                    {
                       Assetno = Convert.ToInt32(dt.Rows[i].ItemArray[2]);
                       mainno = Convert.ToInt32(dt.Rows[i].ItemArray[3]);
                        subno = Convert.ToInt32(dt.Rows[i].ItemArray[4]);

                    if(Assetno==0)
                        {
                        label.Text = "Enter AssetNO";
                        label.Visible = true;
                    }
                    if (mainno==0)
                    {
                        label.Text = "Enter MAINNO";
                        label.Visible = true;
                    }
                    if (subno==0)
                    {
                        label.Text = "Enter SUBNO";
                        label.Visible = true;
                    }
                  

                    SqlDataAdapter daa = new SqlDataAdapter("SELECT * FROM AssetMaster WHERE MainAssetNumber='" + mainno + "' AND AssetSubNumber='" + subno + "' ", con);
                        DataTable dtt = new DataTable();
                        daa.Fill(dtt);
                        int k = 0;
                        if (dtt.Rows.Count > 0)
                        {
                            k++;
                        }
                        if (k > 0)
                        {
                            label.Text = "  Combination of  Main Asset & Sub Asset Number Already Available ";
                            return;
                        }
                
                    SqlDataAdapter daa1 = new SqlDataAdapter("SELECT count(AssetID) FROM AssetMaster WHERE Status !='InActive' and StatusDesc !='Asset Deleted'", con);
                    DataTable dtt1 = new DataTable();
                    daa1.Fill(dtt1);
                   // int k = 0;
                    if (dtt1.Rows.Count > 4000)
                    {
                        label.Text = "Assest Limit As Exceeded ";
                        return;
                    }

                    SqlDataAdapter daa2 = new SqlDataAdapter("select * From AssetMaster where AssetID='" + Assetno + "' and Status !='InActive' and StatusDesc !='Asset Deleted' ", con);
                    DataTable dt1 = new DataTable();
                    if (dt1.Rows.Count > 0)
                    {
                        //       k++;
                        //  }
                        // if (k > 0) 
                        // {
                        label.Text = " Enter Different AssetID";
                        return;
                    }

                    label.Visible = false;
                        SqlCommand cmd = new SqlCommand("Insert into  AssetMaster(Company,Plant,AssetID,MainAssetNumber, AssetSubNumber, AssetDesc, AssetOwner,AssetUser,Department, CustodianID,SerialNumber,MACID,Location,LocationDesc,BLOCK,Model,Make,GRNumber,YearofPurchase,AssetClass,Cost,CostCenter, AcceptDatebyUser, PONoforReference, WBSNumberforReference, InstallationDateforReference,Remarks,Code,CreationDate,Status, StatusDesc) values(@Company,@Plant,@AssetID,@MainAssetNumber, @AssetSubNumber, @AssetDesc, @AssetOwner, @AssetUser,@Department, @CustodianID, @SerialNumber, @MACID,@Location ,@LocationDesc, @BLOCK, @Model,@Make, @GRNumber, @YearofPurchase, @AssetClass,@Cost ,@CostCenter,@AcceptDatebyUser,@PONoforReference, @WBSNumberforReference,@InstallationDateforReference,@Remarks,@Code,@CreationDate,@Status,@StatusDesc);SELECT SCOPE_IDENTITY();", con);
                         cmd.Parameters.AddWithValue("@Company", dt.Rows[i].ItemArray[0].ToString());
                         cmd.Parameters.AddWithValue("@Plant", dt.Rows[i].ItemArray[1].ToString());
                          cmd.Parameters.AddWithValue("@AssetID", Assetno);
                         cmd.Parameters.AddWithValue("@MainAssetNumber", mainno);
                        cmd.Parameters.AddWithValue("@AssetSubNumber", subno);
                        //cmd.Parameters.AddWithValue("@CustodianDepartment", cmb_Custodiandpt.Text);
                        cmd.Parameters.AddWithValue("@AssetDesc", dt.Rows[i].ItemArray[5].ToString());
                        cmd.Parameters.AddWithValue("@AssetOwner", dt.Rows[i].ItemArray[6].ToString());
                        cmd.Parameters.AddWithValue("@AssetUser", dt.Rows[i].ItemArray[7].ToString());
                    cmd.Parameters.AddWithValue("@Department", dt.Rows[i].ItemArray[8].ToString());
                   // cmd.Parameters.AddWithValue("@CustodianID", dt.Rows[i].ItemArray[9].ToString());
                    if(dt.Rows[i].ItemArray[9].ToString()!="")
                    {
                        cmd.Parameters.AddWithValue("@CustodianID", dt.Rows[i].ItemArray[9].ToString());
                        cmd.Parameters.AddWithValue("@Status", "LTRF");
                        cmd.Parameters.AddWithValue("@StatusDesc", "Asset Location Transferred");

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CustodianID", DBNull.Value );
                        cmd.Parameters.AddWithValue("@Status", "AVAL");
                        cmd.Parameters.AddWithValue("@StatusDesc", "Asset Available");
                    }
                       cmd.Parameters.AddWithValue("@SerialNumber", dt.Rows[i].ItemArray[10].ToString());
                    //cmd.Parameters.AddWithValue("@Unit", dt.Rows[i].ItemArray[5].ToString());
                    //cmd.Parameters.AddWithValue("@Quantity", dt.Rows[i].ItemArray[4].ToString());

                    //cmd.Parameters.AddWithValue("@CustodianID", cmb_CustodianID.Text);
                    // cmd.Parameters.AddWithValue("@Location", "");
                    // cmd.Parameters.AddWithValue("@LocationDesc", "");
                    cmd.Parameters.AddWithValue("@MACID", dt.Rows[i].ItemArray[11].ToString());
                    cmd.Parameters.AddWithValue("@Location", dt.Rows[i].ItemArray[12].ToString());
                    cmd.Parameters.AddWithValue("@LocationDesc", dt.Rows[i].ItemArray[14].ToString());
                    cmd.Parameters.AddWithValue("@BLOCK", dt.Rows[i].ItemArray[13].ToString());
                     cmd.Parameters.AddWithValue("@Model", dt.Rows[i].ItemArray[15].ToString());
                    //cmd.Parameters.AddWithValue("@Model", dt.Rows[i].ItemArray[15].ToString());
                    cmd.Parameters.AddWithValue("@GRNumber", dt.Rows[i].ItemArray[17].ToString());
                    cmd.Parameters.AddWithValue("@Make", dt.Rows[i].ItemArray[16].ToString());
                    cmd.Parameters.AddWithValue("@YearofPurchase", dt.Rows[i].ItemArray[18].ToString());
                    //if (dt.Rows[i].ItemArray[17].ToString()!="")
                    //{
                    //    cmd.Parameters.AddWithValue("@CapitalizationDate", Convert.ToDateTime(dt.Rows[i].ItemArray[17]).ToString("yyyy-MM-dd"));
                    //}
                    //else
                    //{
                    //    cmd.Parameters.AddWithValue("@CapitalizationDate", DBNull.Value);
                    //}
                  
                     cmd.Parameters.AddWithValue("@AssetClass", dt.Rows[i].ItemArray[19].ToString());
                    cmd.Parameters.AddWithValue("@Cost", dt.Rows[i].ItemArray[21].ToString());
                    cmd.Parameters.AddWithValue("@CostCenter", dt.Rows[i].ItemArray[20].ToString());
                     //cmd.Parameters.AddWithValue("@MaterialNumber", dt.Rows[i].ItemArray[20].ToString());
                    if(dt.Rows[i].ItemArray[22].ToString() != "")
                    {
                        cmd.Parameters.AddWithValue("@AcceptDatebyUser", Convert.ToDateTime(dt.Rows[i].ItemArray[22]).ToString("yyyy-MM-dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@AcceptDatebyUser", DBNull.Value);
                    }
                   
                    cmd.Parameters.AddWithValue("@PONoforReference", dt.Rows[i].ItemArray[23].ToString());
                     cmd.Parameters.AddWithValue("@WBSNumberforReference", dt.Rows[i].ItemArray[24].ToString());
                    if (dt.Rows[i].ItemArray[25].ToString() != "")
                    {
                        cmd.Parameters.AddWithValue("@InstallationDateforReference", Convert.ToDateTime(dt.Rows[i].ItemArray[25]).ToString("yyyy-MM-dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@InstallationDateforReference", DBNull.Value);
                    }


                    cmd.Parameters.AddWithValue("@Remarks", dt.Rows[i].ItemArray[26].ToString());
                    cmd.Parameters.AddWithValue("@Code", dt.Rows[i].ItemArray[27].ToString());
                    cmd.Parameters.AddWithValue("@CreationDate", System.DateTime.Now);
                     

                    //cmd.Parameters.AddWithValue("@ComponentDesc", "");

                    //cmd.Parameters.AddWithValue("@Deacdate", Convert.ToDateTime(dt.Rows[i].ItemArray[13]).ToString("yyyy-Mm-dd"));
                    // cmd.Parameters.AddWithValue("@Invdate", Convert.ToDateTime(dt.Rows[i].ItemArray[11]).ToString("yyyy-Mm-dd"));
                    //  cmd.Parameters.AddWithValue("@InventoryNote", dt.Rows[i].ItemArray[12].ToString());
                    con.Open();
                          int id = Convert.ToInt32(cmd.ExecuteScalar());
                        string Asset = id.ToString();
                        

                        label.Visible = true;

                        con.Close();
                        ASPxGridView1.DataBind();
                    cmd = new SqlCommand("IF(NOT EXISTS(SELECT * FROM AssetTypeMaster WHERE AssetTypeName = @AssetTypeName))BEGIN INSERT INTO AssetTypeMaster(AssetTypeName,AssetClassName)VALUES(@AssetTypeName,@AssetClassName)END", con);
                    cmd.Parameters.AddWithValue("@AssetTypeName", dt.Rows[i].ItemArray[5].ToString());
                    cmd.Parameters.AddWithValue("@AssetClassName", dt.Rows[i].ItemArray[18].ToString());

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    SqlCommand cmd3 = new SqlCommand("IF(NOT EXISTS(SELECT * FROM CustodianMaster WHERE CustodianID = @CustodianID))BEGIN INSERT INTO CustodianMaster(CustodianID,CustodianName)VALUES(@CustodianID,@CustodianName)END", AMScon);
                    cmd3.Parameters.AddWithValue("@CustodianID", dt.Rows[i].ItemArray[9].ToString());
                    cmd3.Parameters.AddWithValue("@CustodianName", dt.Rows[i].ItemArray[7].ToString());
                   // cmd3.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
                    //cmd3.Parameters.AddWithValue("@Status","Active");

                    AMScon.Open();
                    cmd3.ExecuteNonQuery();
                    AMScon.Close();
                    SqlCommand cmd2 = new SqlCommand("IF(NOT EXISTS(SELECT * FROM AssetClassMaster WHERE AssetClassName = @AssetClassName))BEGIN INSERT INTO AssetClassMaster(AssetClassName,CreatedDate,Status)VALUES(@AssetClassName,@CreatedDate,@Status)END", con);
                    cmd2.Parameters.AddWithValue("@AssetClassName", dt.Rows[i].ItemArray[18].ToString());
                   // cmd2.Parameters.AddWithValue("@AssetClassCode", "0000" dt.Rows[i].ItemArray[17].ToString());
                    cmd2.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
                    cmd2.Parameters.AddWithValue("@Status", "Active");

                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    SqlCommand cmd4 = new SqlCommand("IF(NOT EXISTS(SELECT * FROM LocationMaster WHERE LocationCode = @LocationCode and Block=@Block and Status=@Status))BEGIN INSERT INTO LocationMaster(Location,LocationCode,Block,Status)VALUES(@Location,@LocationCode,@Block,@Status)END", AMScon);
                    cmd4.Parameters.AddWithValue("@LocationCode", dt.Rows[i].ItemArray[12].ToString());
                    cmd4.Parameters.AddWithValue("@Location", "BEL Bengaluru office");
                    cmd4.Parameters.AddWithValue("@Block", dt.Rows[i].ItemArray[13].ToString());
                    // cmd3.Parameters.AddWithValue("@CreatedDate", System.DateTime.Now);
                    cmd4.Parameters.AddWithValue("@Status","Active");

                    AMScon.Open();
                    cmd4.ExecuteNonQuery();
                    AMScon.Close();




                    //int avl = QRExist(mainno.ToString(), subno.ToString());
                    //    if (avl == 0)
                    //    {
                    //        string equname = Asset;
                    //        //string space = equname.Replace(" ", "");
                    //        // string QRCode = space.Substring(0, 7); 
                    //        string QRCode = mainno.ToString();
                    //        DateTime date = DateTime.Now;
                    //        //ArrayList myList = new ArrayList();
                    //        //// Adding elements to ArrayList 
                    //        //myList.Add("ID:" + Asset + "");
                    //        //myList.Add("MainAssetNumber:" + MainAssetNumber + "");
                    //        // myList.Add(Asset);
                    //        // myList.Add(MainAssetNumber);
                    //        // myList.Add(AssetSubNumber);
                    //        // myList.Add(AssetClass);
                    //        // myList.Add(Location);
                    //        //myList.Add(Status);


                    //        //string SN = "0" + AssetSubNumber + "";
                    //        string SN = "0" + subno + "";
                    //        string myList = "" + Asset + "-DAE-" + mainno + "-" + SN + "";//original line in neemus 
                    //                                                                      //  string myList = "" + ID + "-DAE-" + Asset + "-" + SN + ""; 
                    //        string location = "QRImages/" + Asset + ".jpg";
                    //        QRUtilities.GenerateMyQCCode(equname, QRCode, myList);
                    //        // QRUtilities.SaveQRCode(myList,Asset);                       
                    //    //    cmd = new SqlCommand("Insert into  QRCodeMaster(QRCode,QRImage,CreatedBy,CreatedDate,MainAssetNumber,AssetSubNumber,AssetID)values(@QRCode,@QRImage,@CreatedBy,@CreatedDate,@MainAssetNumber,@AssetSubNumber,@AssetID)", AMScon);
                    //    //    cmd.Parameters.AddWithValue("@QRCode", Asset);
                    //    //    cmd.Parameters.AddWithValue("@QRImage", location);
                    //    //    cmd.Parameters.AddWithValue("@CreatedBy", Session["UserID"].ToString());
                    //    //    cmd.Parameters.AddWithValue("@CreatedDate", date);
                    //    //    cmd.Parameters.AddWithValue("@MainAssetNumber", mainno);
                    //    //    cmd.Parameters.AddWithValue("@AssetSubNumber", subno);
                    //    //    cmd.Parameters.AddWithValue("@AssetID", Asset);
                    //    //AMScon.Open();
                    //    //    int qrid = Convert.ToInt32(cmd.ExecuteScalar());
                    //    // qrdt.Rows.Add(Asset, MainAssetNumber, AssetSubNumber,Asset, location, date);
                    //    // qrdt.Rows.Add(Asset, MainAssetNumber, AssetSubNumber, CustodianDepartment, AssetDesc, AdditionalDesc, Unit, Quantity, AssetCapitalizationDate, FirstAcquisitionDate, CustodianID, Location, LocationDesc, Status, StatusDesc, AssetClass, Component, ComponentDesc, Deacdate, Invdate, InventoryNote, "");
                    //       AMScon.Close();

                    //    }




                }
                    label.Text = "Bulk Upload Succesful";
                
                
                
            }
            else
            {
                label.Text = "Enter Valid Excel";
                return;
            }

        }
    }
    public int QRExist(string Main, string Sub)
    {
        int result = 0;
        string query = "Select * from QRCodeMaster where MainAssetNumber='" + Main + "' and AssetSubNumber='" + Sub + "'; SELECT SCOPE_IDENTITY();";
        SqlDataAdapter da = new SqlDataAdapter(query, AMScon);
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

    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        try
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            string test = (e.GetValue("PrintStatus").ToString());
            Session["PrintStatus"] = test;
            if (test == "yes")
            {
                e.Row.BackColor = System.Drawing.Color.FromName("rgb(240, 240, 240)");//207, 207, 207,
            }
            //if (Session["PrintStatus"].ToString() == "")
            //{
            //    e.Row.BackColor = System.Drawing.Color.FromName("rgb(157, 244, 249)");
            //}
        }
        catch (Exception ex)
        {

        }
    }
}