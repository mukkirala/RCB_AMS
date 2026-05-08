using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridLookup;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System.Collections;
using DevExpress.Utils;
//using DevExpress.XtraReports.UI;
//using DevExpress.XtraPivotGrid;
//using DevExpress.XtraReports.UI.PivotGrid;
//using DevExpress.XtraReports.Web;
using DevExpress.XtraPrinting;
//using DevExpress.XtraPrinting.Drawing;
using System.Drawing;
using System.Drawing.Text;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing.Design;
using System.Diagnostics;
using DevExpress.Web.ASPxUploadControl;
using System.Xml;


public partial class Default3 : System.Web.UI.Page
{
    const string ThumbnailFileName = "ThumbnailImage.jpg";
    Boolean ImageIsValid = true;
    //Boolean AspxUpload2 = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {

    }
    protected void cmb_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox cmb = (ASPxComboBox)sender;
        Session["state"] = cmb.SelectedItem.Text;
        ASPxBinaryImage1.Value = Session["Image11"];
        ASPxBinaryImage2.Value = Session["Image12"];
        ASPxBinaryImage3.Value = Session["Image13"];
        ASPxBinaryImage4.Value = Session["Image14"];
    }
    protected void stateCombo_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxComboBox cmb = (ASPxComboBox)sender;
        Session["state1"] = cmb.SelectedItem.Text;

    }
    protected void cmb_city_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {

        //ASPxBinaryImage1.Value = Session["Image11"];
        //ASPxBinaryImage2.Value = Session["Image12"];
        //ASPxBinaryImage3.Value = Session["Image13"];
        //ASPxBinaryImage4.Value = Session["Image14"];
        if (Page.FindControl("Image1") != null)
        {
            if (Image1.PostedFile.FileName == string.Empty)
            {
                //Messages.SetErrorMessage("20124", null, null, null, Session);
                //return;
            }
            string Filename1 = Path.GetFileName(Image1.PostedFile.FileName);
            Image1.SaveAs(Server.MapPath("EmployeeImage/" + Filename1));
        }

        if (Page.FindControl("Image2") != null)
        {
            if (Image2.PostedFile.FileName == string.Empty)
            {
                //Messages.SetErrorMessage("20124", null, null, null, Session);
                //return;
            }
            string Filename2 = Path.GetFileName(Image1.PostedFile.FileName);
            Image2.SaveAs(Server.MapPath("EmployeeImage/" + Filename2));
        }

        if (Page.FindControl("Image3") != null)
        {
            if (Image3.PostedFile.FileName == string.Empty)
            {
               // Messages.SetErrorMessage("20124", null, null, null, Session);
                //return;
            }
            string Filename3 = Path.GetFileName(Image1.PostedFile.FileName);
            Image3.SaveAs(Server.MapPath("EmployeeImage/" + Filename3));
        }

        if (Page.FindControl("Image4") != null)
        {
            if (Image4.PostedFile.FileName == string.Empty)
            {
                //Messages.SetErrorMessage("20124", null, null, null, Session);
                //return;
            }
            string Filename4 = Path.GetFileName(Image1.PostedFile.FileName);
            Image4.SaveAs(Server.MapPath("EmployeeImage/" + Filename4));
        }
            
        
        if (txtfirstname.Text == string.Empty)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30007").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please enter first name";
            return;
        }

        if (txtlastname.Text == string.Empty)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30036").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please enter last name";
            return;
        }
        //if (dateofbirth.Text == string.Empty)
        //{
        //    //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30008").ToString();
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter date of birth";
        //    return;
        //}
        if (Radiobtngender.SelectedItem.Text == string.Empty)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30012").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please select gender";
            return;
        }
        if (txtnationality.Text == string.Empty)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30016").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please enter nationality";
            return;
        }
        //if (cmbbloodgroup.Text == string.Empty)
        //{
        //    //cmbbloodgrp.Text = "B+";
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter bloodgroup";
        //}
        //if (ImageIsValid != true)
        //{
        //    //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30040").ToString();
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter bouse Image";
        //    //return;
        //}
        if (txtqualification.Text == string.Empty)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30044").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please enter Qualification";
            //return;
        }

        //if (txtphonenumber.Text == string.Empty)
        //{
        //    //Lbl_Display.Text = "";
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter phone number";

        //}
        if (txtmobilenumber.Text == string.Empty)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "30019").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please enter mobile number";
            //return;
        }
        foreach (char c in txtmobilenumber.Text)
        {
            if (!Char.IsDigit(c))
            {
                //Lbl_Display.Text = GetGlobalResourceObject("Messages", "20053").ToString();
                //Update.Update();
                Lbl_Display.Text = "Please enter correct mobile number";
                return;
            }
        }
        if (txtmobilenumber.Text.Length != 10)
        {
            //Lbl_Display.Text = GetGlobalResourceObject("Messages", "20054").ToString();
            //Update.Update();
            Lbl_Display.Text = "Please enter mobile number in correct formate";
            return;
        }

        //if (txtemailaddress.Text == string.Empty)
        //{
        //    //txtemailaddress.Text = "";
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter Email address";
        //}
        //if (dateofbirth.Text == string.Empty)
        //{
        //   // dateofbirth.Text = "";
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter date of birth";
        //}
        if (cmb_city.Text == string.Empty)
        {
            //cmb_city.Text = "";
            //Update.Update();
            Lbl_Display.Text = "Please select city";
        }
        if (cmb_state.Text == string.Empty)
        {
            //cmb_state.Text = "";
            // Update.Update();
            Lbl_Display.Text = "Please select state";

        }
        if (txtdesignation.Text == string.Empty)
        {
            // txtpincode.Text = "";
            // Update.Update();
            Lbl_Display.Text = "Please select Designation";
        }
        //if (cmb_city.Text == string.Empty)
        //{
        //    //cmb_city.Text = "";
        //    //Update.Update();
        //    Lbl_Display.Text = "Please enter first name";
        //}
        // try
        //{
        string Thumbfile;
        if (Page.FindControl("Image1") != null)
        {
            ASPxUploadControl AspxUpload1 = Image1;
            string FileName = Path.GetFileName(AspxUpload1.PostedFile.FileName);
            Thumbfile = "t_" + FileName;
            string tfileName = Path.Combine(MapPath("EmployeeImage/Thumbnails/"), Thumbfile);
            using (Image ioriginal = Image.FromStream(AspxUpload1.FileContent))
            using (Image ithumbnail = Utilities.Inscribe(ioriginal, 140, 135))
            {
                Utilities.SaveToJpeg(ithumbnail, tfileName);
                AspxUpload1.SaveAs(Server.MapPath("EmployeeImage/" + FileName));
            }
        }
        else
            Thumbfile = "";

        string Thumbfile2;
        if (Page.FindControl("Image2") != null)
        {
              ASPxUploadControl AspxUpload2 = Image2;
            string FileName2 = Path.GetFileName(AspxUpload2.PostedFile.FileName);
            Thumbfile2 = "t_" + FileName2;
            string tfileName2 = Path.Combine(MapPath("EmployeeRC/Thumbnails2/"), Thumbfile2);
            using (Image ioriginal = Image.FromStream(AspxUpload2.FileContent))
            using (Image ithumbnail = Utilities.Inscribe(ioriginal, 345, 245))
            {
                Utilities.SaveToJpeg(ithumbnail, tfileName2);
                AspxUpload2.SaveAs(Server.MapPath("EmployeeRC/" + FileName2));
            }
        }
        else
            Thumbfile2 = "";

        string Thumbfile3;
        if (Page.FindControl("Image3") != null)
        {

            ASPxUploadControl AspxUpload3 = Image3;
            string FileName3 = Path.GetFileName(AspxUpload3.PostedFile.FileName);
            Thumbfile3 = "t_" + FileName3;
            string tfileName3 = Path.Combine(MapPath("EmployeeDL/Thumbnails3/"), Thumbfile3);
            using (Image ioriginal = Image.FromStream(AspxUpload3.FileContent))
            using (Image ithumbnail = Utilities.Inscribe(ioriginal, 375, 245))
            {
                Utilities.SaveToJpeg(ithumbnail, tfileName3);
                AspxUpload3.SaveAs(Server.MapPath("EmployeeDL/" + FileName3));
            }
        }
        else
            Thumbfile3 = "";

        string Thumbfile4;
        if (Page.FindControl("Image4") != null)
        {
            ASPxUploadControl AspxUpload4 = Image4;
            string FileName4 = Path.GetFileName(AspxUpload4.PostedFile.FileName);
            Thumbfile4 = "t_" + FileName4;
            string tfileName4 = Path.Combine(MapPath("AddressProof/Thumbnails4/"), Thumbfile4);
            using (Image ioriginal = Image.FromStream(AspxUpload4.FileContent))
            using (Image ithumbnail4 = Utilities.Inscribe(ioriginal, 370, 165))
            {
                Utilities.SaveToJpeg(ithumbnail4, tfileName4);
                AspxUpload4.SaveAs(Server.MapPath("AddressProof/" + FileName4));
            }
        }
        else
            Thumbfile4 = "";
        
        SqlCommand mycommand;
        SqlConnection myconnection;
        string myConnectionString = "";
        if (myConnectionString == "")
        {
            myConnectionString = WebConfigurationManager.ConnectionStrings["PentagonLogistixPvtLtdConnectionString"].ConnectionString;
        }
        myconnection = new SqlConnection(myConnectionString);
        //SqlDataAdapter da = new SqlDataAdapter("SELECT  ClassID from ClassMaster where Standard='" + cmb_classApplied.Text + "'" + "AND" + " Section='" + cmb_section.SelectedItem.Text + "'", myconnection);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        // string enroll = "select EnrollNo from  StudentMaster Where EnrollNo='" + Txt_EnrollNo.Text + "'";
        //mycommand = new SqlCommand(enroll, myconnection);
        //mycommand.Connection.Open();
        //SqlDataReader dr = mycommand.ExecuteReader();
        //if (dr.Read())
        //{
        //    Lbl_Display.Text = "Sudent Already Exist Please Enter EnrollmentNo";
        //    mycommand.Connection.Close();
        //    return;
        //}
        //mycommand.Connection.Close();

        //if (dt.Rows.Count > 0)
        //{
        string InsertQ = "Insert into EmployeeMaster([FirstName],[LastName],[FatherName],[Gender],[BloodGroup],[DateOfBirth],[DateOfJoining],[Qualification],[PhoneNumber],[MobileNumber],[AlternateMobile],[EmailID],[Address],[Address2],[Area],[City],[State],[Pincode],[Nationality],[AddressProofType],[Designation],[PostingLocation],[EmployeeVerification],[ImageName],[EmployeeRC],[EmployeeDL],[AddressProof])values(@FirstName,@LastName,@FatherName,@Gender,@BloodGroup,@DateOfBirth,@DateOfJoining,@Qualification,@PhoneNumber,@MobileNumber,@AlternateMobile,@EmailID,@Address,@Address2,@Area,@City,@State,@Pincode,@Nationality,@AddressProofType,@Designation,@PostingLocation,@EmployeeVerification,@ImageName,@EmployeeRC,@EmployeeDL,@AddressProof)";
            mycommand = new SqlCommand(InsertQ, myconnection);
            mycommand.Connection = myconnection;
            //mycommand.Parameters.AddWithValue("FirstName", Txt_EnrollNo.Text);

            mycommand.Parameters.AddWithValue("@FirstName", txtfirstname.Text.ToString());
            mycommand.Parameters.AddWithValue("@LastName", txtlastname.Text.ToString());
            mycommand.Parameters.AddWithValue("@FatherName", txtfathername.Text);
            mycommand.Parameters.AddWithValue("@Gender", Radiobtngender.SelectedItem.Text);
            mycommand.Parameters.AddWithValue("@DateofBirth", dateofbirth.Text);

            mycommand.Parameters.AddWithValue("@DateofJoining", dateofjoining.Text);
            mycommand.Parameters.AddWithValue("@BloodGroup", cmbbloodgroup.Text);
            mycommand.Parameters.AddWithValue("@Qualification", txtqualification.Text);

            mycommand.Parameters.AddWithValue("@PhoneNumber", txtphonenumber.Text);
            mycommand.Parameters.AddWithValue("@MobileNumber", txtmobilenumber.Text);
            mycommand.Parameters.AddWithValue("@EmailID", txtemailaddress.Text);

            mycommand.Parameters.AddWithValue("@Address", txtaddress.Text);
            mycommand.Parameters.AddWithValue("@Address2", txtaddress2.Text);
            mycommand.Parameters.AddWithValue("@Area", txtarea.Text);
            mycommand.Parameters.AddWithValue("@City", cmb_city.Text);
            mycommand.Parameters.AddWithValue("@State", cmb_state.Text);
            mycommand.Parameters.AddWithValue("@Pincode", txtpincode.Text);
            mycommand.Parameters.AddWithValue("@Nationality", txtnationality.Text);
            mycommand.Parameters.AddWithValue("@AddressProofType", cmbaddressproof.Text);

            mycommand.Parameters.AddWithValue("@AlternateMobile", txtalternatemobile.Text);
            mycommand.Parameters.AddWithValue("@Designation", txtdesignation.Text);
            mycommand.Parameters.AddWithValue("@PostingLocation", txtpostinglocation.Text);
            mycommand.Parameters.AddWithValue("@EmployeeVerification", radiobtnempverification.SelectedItem.Text);
            mycommand.Parameters.AddWithValue("@ImageName", "EmployeeImage/Thumbnails/" + Thumbfile);
            mycommand.Parameters.AddWithValue("@EmployeeRC", "EmployeeRC/Thumbnails2/" + Thumbfile2);
            mycommand.Parameters.AddWithValue("@EmployeeDL", "EmployeeDL/Thumbnails3/" + Thumbfile3);
            mycommand.Parameters.AddWithValue("@AddressProof", "AddressProof/Thumbnails4/" + Thumbfile4);
            mycommand.Connection.Open();
            mycommand.ExecuteNonQuery();
            mycommand.Connection.Close();
            Lbl_Display.Text = "Record saved successfully";
            clear();
        }
    protected void clear()
    {
        txtfirstname.Text = "";
        txtlastname.Text = "";
        txtfathername.Text = "";
        dateofbirth.Text = "";
        dateofjoining.Text = "";
        cmbbloodgroup.Text = "";
        txtqualification.Text = "";
        txtphonenumber.Text = "";
        txtmobilenumber.Text = "";
        txtemailaddress.Text = "";
        txtaddress.Text = "";
        txtaddress2.Text = "";
        txtarea.Text = "";
        cmb_city.Text = "";
        cmb_state.Text = "";
        txtpincode.Text = "";
        txtnationality.Text = "";
        cmbaddressproof.Text = "";
        txtalternatemobile.Text = "";
        txtdesignation.Text = "";
        txtpostinglocation.Text = "";
        ASPxBinaryImage1.Value = "";
        ASPxBinaryImage2.Value = "";
        ASPxBinaryImage3.Value = "";
        ASPxBinaryImage4.Value = "";
    }
         //    }

         //catch (Exception ex)
         //{

         //}
    

    protected void ASPxUploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        if ((sender as ASPxUploadControl).IsValid)
        {

            ImageIsValid = true;
            //if (ImageIsValid == true)
            //    Session["data"] = (sender as ASPxUploadControl).FileBytes;
            //else
            //    Session["data"] = "";
            if (ImageIsValid == true)
            {
                Session["data"] = (sender as ASPxUploadControl).FileBytes;
                string fname = (sender as ASPxUploadControl).PostedFile.FileName;
                Session["FileName"] = fname;
                if (e.UploadedFile.FileBytes != null)
                    ASPxBinaryImage1.Value = e.UploadedFile.FileBytes;
                Session["Image11"] = ASPxBinaryImage1.Value;
            }
        }
       
    }

    protected void ASPxUploadControl2_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        if ((sender as ASPxUploadControl).IsValid)
        {

            ImageIsValid = true;
            if (ImageIsValid == true)
            {
                Session["data"] = (sender as ASPxUploadControl).FileBytes;
                string fname2 = (sender as ASPxUploadControl).PostedFile.FileName;
                Session["FileName"] = fname2;
                if (e.UploadedFile.FileBytes != null)
                    ASPxBinaryImage2.Value = e.UploadedFile.FileBytes;
                Session["Image12"] = ASPxBinaryImage2.Value;
            }
        }
    }

    protected void ASPxUploadControl3_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        if ((sender as ASPxUploadControl).IsValid)
        {

            ImageIsValid = true;
            if (ImageIsValid == true)
            {
                Session["data"] = (sender as ASPxUploadControl).FileBytes;
                string fname3 = (sender as ASPxUploadControl).PostedFile.FileName;
                Session["FileName"] = fname3;
                if (e.UploadedFile.FileBytes != null)
                    ASPxBinaryImage3.Value = e.UploadedFile.FileBytes;
                Session["Image13"] = ASPxBinaryImage3.Value;
            }
           
        }
    }

    protected void ASPxUploadControl4_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        if ((sender as ASPxUploadControl).IsValid)
        {

            ImageIsValid = true;
            if (ImageIsValid == true)
            {
                Session["data"] = (sender as ASPxUploadControl).FileBytes;
                string fname4 = (sender as ASPxUploadControl).PostedFile.FileName;
                Session["FileName"] = fname4;
                if (e.UploadedFile.FileBytes != null)
                    ASPxBinaryImage4.Value = e.UploadedFile.FileBytes;
                Session["Image14"] = ASPxBinaryImage4.Value;
            }
        }
    }
    protected void btsave_Click1(object sender, EventArgs e)
    {

    }
    protected void cmbaddressproof_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnsave0_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void txtdesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxBinaryImage1.Value = Session["Image11"];
        ASPxBinaryImage2.Value = Session["Image12"];
        ASPxBinaryImage3.Value = Session["Image13"];
        ASPxBinaryImage4.Value = Session["Image14"];
        if (txtdesignation.Text == "CourierBoys")
        {
            lblinfo.Visible = true;
            lblregistrationcard.Visible = true;
            Image2.Visible = true;
            ASPxRoundPanel2.Visible = true;
            lbldriverlicense.Visible = true;
            Image3.Visible = true;
            ASPxRoundPanel3.Visible = true;
        }
        else
        {
            lblinfo.Visible = false;
            lblregistrationcard.Visible = false;
            Image2.Visible = false;
            ASPxRoundPanel2.Visible = false;
            lbldriverlicense.Visible = false;
            Image3.Visible = false;
            ASPxRoundPanel3.Visible = false;
        }
    }
}
