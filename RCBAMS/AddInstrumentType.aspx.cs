using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Collections;
using System.IO;



public partial class AddInstrumentType : System.Web.UI.Page
{
    DatabaseConnection Db = new DatabaseConnection();
    SqlCommand cmd;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Upload_image.HasFile)
        {
            Upload_image.SaveAs(Server.MapPath("~/InstrumentTypeImages/") + Upload_image.PostedFile.FileName);
            AspxImage2.ImageUrl = "/InstrumentTypeImages/" + Upload_image.PostedFile.FileName;
            string path = string.Format("/InstrumentTypeImages/" + Upload_image.PostedFile.FileName);
            Session["InstrumentTypeImages"] = path;

            //string filename1 = Upload_image.PostedFile.FileName;
            
            //Image filename = Image.FromFile("filename1");
            //string extention = System.IO.Path.GetExtension(filename);
            //string image = filename + extention;
            var imgbyte = ImageToByteArray(AspxImage2);

            //byte[] bytearray = System.Text.Encoding.UTF8.GetBytes(filename1);
           

            // byte[] path1 = readAllByte(path);
                string dfgfgf = Convert.ToBase64String(imgbyte);
            //Session["InstrumentTypeImages"] = bytearray;
            ViewState["InstrumentTypeBase64Image"] = dfgfgf;


            ////get the size of image file.
            System.Drawing.Bitmap img = new System.Drawing.Bitmap(Upload_image.PostedFile.InputStream, false);
            int height = img.Height;
            // get the height of image in pixel.
            int width = img.Width;
            // get the width of image in pixel.
            int fileSize = (Upload_image.PostedFile.ContentLength) / 1024;
            if (height >= 100 && width >= 100 && fileSize > 100)
            {
                //lbl_msg.BackColor = System.Drawing.Color.Red;
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "File size not be exceed than 100 KB,100x100 px";
                return;
            }


        }

       

        lbl_date.Text = System.DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
        //string message = "Do you want to submit?";
        //ClientScript.RegisterOnSubmitStatement(this.GetType(), "confirm", "return confirm('" + message + "');");

    }
    public byte[] ImageToByteArray(Image img)
    {
        try
        {
            return File.ReadAllBytes(Server.MapPath(img.ImageUrl));
        }
        catch(Exception ex)
        {
            return new byte[0];
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
       

      

        if (Upload_image.HasFile)
        {
            Upload_image.SaveAs(Server.MapPath("~/InstrumentTypeImages/") + Upload_image.PostedFile.FileName);
            AspxImage2.ImageUrl = "/InstrumentTypeImages/" + Upload_image.PostedFile.FileName;
            string path = string.Format("/InstrumentTypeImages/" + Upload_image.PostedFile.FileName);
            Session["InstrumentTypeImages"] = path;
            // Session["InstrumentTypeBase64Image"] = string.Format( "/InstrumentTypeImages/" + Upload_image.PostedFile.FileName);

            // string filename = Upload_image.PostedFile.FileName;
            // string extention = System.IO.Path.GetExtension(filename);
            // string image = filename + extention;


            // byte[] bytearray = System.Text.Encoding.UTF8.GetBytes(image);
            // //Session["InstrumentTypeImages"] = path;

            // // byte[] path1 = readAllByte(path)
            //string dfgfgf = Convert.ToBase64String(bytearray);
            // Session["InstrumentTypeImages"] = dfgfgf;

            //string filename1 = Upload_image.PostedFile.FileName;

            //Image filename = Image.FromFile("filename1");
            //string extention = System.IO.Path.GetExtension(filename);
            //string image = filename + extention;
            var imgbyte = ImageToByteArray(AspxImage2);

            //byte[] bytearray = System.Text.Encoding.UTF8.GetBytes(filename1);


            // byte[] path1 = readAllByte(path);
            string dfgfgf = Convert.ToBase64String(imgbyte);
            //Session["InstrumentTypeImages"] = bytearray;
            ViewState["InstrumentTypeBase64Image"] = dfgfgf;

          

        }

        else if (Session["InstrumentTypeImages"] == null)
        {
             lbl_msg.Text = "Please Upload image";
            return;
        }
        else
        {
           
            AspxImage2.ImageUrl = Session["InstrumentTypeImages"].ToString();

            string base64 = ViewState["InstrumentTypeBase64Image"].ToString();
        }
        if (txt_typename.Text == "")
        {
            lbl_msg.Text = "Please Enter The InstrumentType Name";
            return;
        }

        ////get the size of image file.
        //System.Drawing.Bitmap img = new System.Drawing.Bitmap(Upload_image.PostedFile.InputStream, false);
        //int height = img.Height;
        //// get the height of image in pixel.
        //int width = img.Width;
        //// get the width of image in pixel.
        //int fileSize = (Upload_image.PostedFile.ContentLength) / 1024;
        //if (height >= 100 && width >= 100 && fileSize > 100)
        //{
        //    //lbl_msg.BackColor = System.Drawing.Color.Red;
        //    lbl_msg.ForeColor = System.Drawing.Color.Red;
        //    lbl_msg.Text = "Uploaded image has not be exceed than 100 KB";
        //    return;
        //}


        cmd = new SqlCommand("INSERT INTO InstrumentTypeMaster(InstrumentTypeName,Description,Createddate,Created_by,Status,InstrumentTypeImage,InstrumentTypeBase64Image) Values(@InstrumentTypeName,@Description,@Createddate,@Created_by,@Status,@InstrumentTypeImage,@InstrumentTypeBase64Image)");
            cmd.Parameters.AddWithValue("@InstrumentTypeName", txt_typename.Text);
            cmd.Parameters.AddWithValue("@Description", memo_desc.Text);
            cmd.Parameters.AddWithValue("@Createddate", System.DateTime.Now);
            cmd.Parameters.AddWithValue("@Created_by", "Admin");
            cmd.Parameters.AddWithValue("@Status", "Active");
            cmd.Parameters.AddWithValue("@InstrumentTypeImage", Session["InstrumentTypeImages"]);
            cmd.Parameters.AddWithValue("@InstrumentTypeBase64Image", ViewState["InstrumentTypeBase64Image"]);
            Db.OpenConnection();
            Db.ExecuteNonQuery(cmd);
            Db.CloseConnection();
            ASPxGridView1.DataBind();
            lbl_msg.Text = "Data Saved Successfully!";
            Clear();
            Session["InstrumentTypeImages"].ToString();
            Session.Clear();
        

       
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        //AspxImage2.ImageUrl = Session["InstrumentTypeImages"].ToString();
        //if (Upload_image.HasFile)
        //{
        //    Upload_image.SaveAs(Server.MapPath("~/InstrumentTypeImages/") + Upload_image.PostedFile.FileName);
        //    AspxImage2.ImageUrl = "~/InstrumentTypeImages/" + Upload_image.PostedFile.FileName;
        //    Session["InstrumentTypeImages"] = "~/InstrumentTypeImages/" + Upload_image.PostedFile.FileName;
        //}

        //else if (Session["InstrumentTypeImages"] == null)
        //{
        //    // lbl_msg1.Text = "Please Upload ID Proof ";
        //    return;
        //}
        //else
        //{
        //    AspxImage2.ImageUrl = Session["InstrumentTypeImages"].ToString();
        //}
        if (txt_typename.Text == "")
        {
            lbl_msg.Text = "Please Enter The InstrumentType Name";
            return;
        }
        

        cmd = new SqlCommand("UPDATE InstrumentTypeMaster SET InstrumentTypeName=@InstrumentTypeName,Description=@Description,InstrumentTypeImage=@InstrumentTypeImage,InstrumentTypeBase64Image=@InstrumentTypeBase64Image WHERE InstrumentTypeID=@InstrumentTypeID ");
        cmd.Parameters.AddWithValue("@InstrumentTypeName", txt_typename.Text);
        cmd.Parameters.AddWithValue("@Description", memo_desc.Text);
        cmd.Parameters.AddWithValue("@InstrumentTypeID", Session["InstrumentTypeID"].ToString());
        cmd.Parameters.AddWithValue("@InstrumentTypeImage", AspxImage2.ImageUrl);
        cmd.Parameters.AddWithValue("@InstrumentTypeBase64Image", ViewState["InstrumentTypeBase64Image"]);
        Db.OpenConnection();
        Db.ExecuteNonQuery(cmd);
        Db.CloseConnection();
        ASPxGridView1.DataBind();

        
        lbl_msg.Text = "Data Updated Successfully!";
        Clear();
        btnsave.Visible = true;
        btnupdate.Visible = false;
    }
    protected void Clear()
    {
        txt_typename.Text = memo_desc.Text = "";
        AspxImage2.ImageUrl = null;
        ViewState["InstrumentTypeBase64Image"] = null;
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        Session["InstrumentTypeID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentTypeID").ToString();
        if (btn == "Edit")
        {
            lbl_msg.Text = "Edit  data";
            txt_typename.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentTypeName").ToString();
            memo_desc.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Description").ToString();
            AspxImage2.ImageUrl = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "InstrumentTypeImage").ToString();
            btnsave.Visible = false;
            btnupdate.Visible = true;
            ASPxGridView1.DataBind();
        
        }
        else if (btn == "Delete")
        {
            cmd = new SqlCommand("Update  InstrumentTypeMaster Set Status='InActive' Where InstrumentTypeID=@InstrumentTypeID");
            cmd.Parameters.AddWithValue("@InstrumentTypeID", Session["InstrumentTypeID"].ToString());
            Db.OpenConnection();
            Db.ExecuteNonQuery(cmd);
            Db.CloseConnection();
            ASPxGridView1.DataBind();
            lbl_msg.Text = "Data Deleted Successfully!";
           
            btnsave.Visible = true;
            btnupdate.Visible = false;
        }


    }

    public static byte[] readAllByte(string path)
    {
        byte[] bytes = new byte[] { };
        try
        {
            bytes = File.ReadAllBytes(path);
        }
        catch (Exception e)
        {

        }
        return bytes;
    }
}