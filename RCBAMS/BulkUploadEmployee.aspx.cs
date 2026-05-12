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

public partial class BulkUploadEmployee : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection AMScon = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());

    }

    protected void download_Click(object sender, EventArgs e)
    {
        try
        {
            Response.ContentType = "Application/xlsx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=BulkUploadEmployee.xlsx");
            Response.TransmitFile(Server.MapPath("~/App_Data/BulkUploadEmployee.xlsx"));
            Response.End();
        }
        catch (Exception ex)
        {
            label.Text = ex.Message.ToString();

        }
    }

    protected void save_Click(object sender, EventArgs e)
    {

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
            if(dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    SqlCommand cmd = new SqlCommand("insert into CustodianMaster(CustodianID,CustodianName,Designation,CustodianDepartmentCode,email,LDAP_USERID,CustodianStatus,CreateDate)VALUES(@CustodianID,@CustodianName,@Designation,@CustodianDepartmentCode,@email,@LDAP_USERID,@CustodianStatus,@CreateDate);SELECT SCOPE_IDENTITY();", AMScon);
                    cmd.Parameters.AddWithValue("@CustodianID", dt.Rows[i].ItemArray[0].ToString());
                    cmd.Parameters.AddWithValue("@CustodianName", dt.Rows[i].ItemArray[1].ToString());
                    cmd.Parameters.AddWithValue("@Designation", dt.Rows[i].ItemArray[2].ToString());
                    cmd.Parameters.AddWithValue("@CustodianDepartmentCode", dt.Rows[i].ItemArray[3].ToString());
                    //cmd.Parameters.AddWithValue("@reporting_staff_no", dt.Rows[i].ItemArray[4].ToString());
                    cmd.Parameters.AddWithValue("@email", dt.Rows[i].ItemArray[4].ToString());
                    cmd.Parameters.AddWithValue("@LDAP_USERID", dt.Rows[i].ItemArray[5].ToString());
                    //cmd.Parameters.AddWithValue("@InternalNumber", dt.Rows[i].ItemArray[7].ToString());
                    cmd.Parameters.AddWithValue("@CustodianStatus", "Active");
                    cmd.Parameters.AddWithValue("@CreateDate", System.DateTime.Now);
                    AMScon.Open();
                    cmd.ExecuteNonQuery();
                    AMScon.Close();
                    SqlCommand cmd4 = new SqlCommand("IF(NOT EXISTS(SELECT * FROM CustodianMaster WHERE CustodianDepartmentCode = @CustodianDepartmentCode))BEGIN INSERT INTO CustodianMaster(CustodianDepartmentCode)VALUES(@CustodianDepartmentCode)END", AMScon);
                    cmd4.Parameters.AddWithValue("@CustodianDepartmentCode", dt.Rows[i].ItemArray[3].ToString());
                    

                    AMScon.Open();
                    cmd4.ExecuteNonQuery();
                    AMScon.Close();
                    label.Text = "Bulk Uploaded Sucessfully";
                }



            }
            else
            {
                label.Text = "Enter Valid Excel";
                return;
            }
        }
        else
        {
            label.Text = "Please Upload Excel";
            return;
        }
    }
}