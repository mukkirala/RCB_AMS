using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.SessionState;

using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Design;
using System.Drawing.Text;
using System.Drawing.Drawing2D;
using BarCode;
using System.Drawing.Printing;
using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode;
using GenCode128;
using System.Collections;
using DevExpress.XtraReports;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.UI.PivotGrid;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrinting.Drawing;
using System.Xml;
using ZXing;
using ZXing.QrCode;

/// <summary>
/// Summary description for Utilities
/// </summary>
public class QRUtilities
    {
    public QRUtilities()
        {
        }
    static SqlDataAdapter adapter = new SqlDataAdapter();
    static SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);


    public static string picturecall(DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

        string Event1 = e.Parameter.ToString();
        string[] EventArray = Event1.Split('#');
        string Photoqstring, Notesqstring;
        //Utilities.GetImage(EventArray);
        if (EventArray[1] == "DetailedGrid")
            {
            Photoqstring = "Select ImageLocation From DisplayDetails Where DisplayDetailsID='" + EventArray[0] + "'";
            Notesqstring = "Select DisplayID, Direction from DisplayDetails where DisplayDetailsID='" + EventArray[0] + "'";

            }
        else
            {
            Photoqstring = "Select ImageLocation From DisplayMaster Where ID='" + EventArray[0] + "'";
            Notesqstring = "Select DisplayLocation, Landmark from DisplayMaster where ID='" + EventArray[0] + "'";

            }
        return Photoqstring + "#" + Notesqstring;


        }

    public static byte[] FindImage(string Photoqstring)
        {

        SqlCommand Findimage = new SqlCommand();
        Findimage.CommandType = CommandType.Text;
        Findimage.CommandText = Photoqstring;
        DataSet objDs1 = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter(Findimage.CommandText, sqlcon);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            dAdapter.Fill(objDs1);
            if (objDs1.Tables[0].Rows.Count > 0)
                {
                HttpContext context = HttpContext.Current;
                string imageurl = context.Server.MapPath(objDs1.Tables[0].Rows[0][0] as string);
                Image newImage = Image.FromFile(imageurl);

                return ImageToByte(newImage) as byte[];
                }
            }
        finally
            {
            sqlcon.Close();
            }
        return null;
        }
    public static byte[] ImageToByte(Image img)
        {
        ImageConverter converter = new ImageConverter();
        return (byte[])converter.ConvertTo(img, typeof(byte[]));
        }

    public static string GetNotes(string Notesqstring)
        {
        SqlCommand FindNotes = new SqlCommand();
        FindNotes.CommandType = CommandType.Text;
        FindNotes.CommandText = Notesqstring;
        DataSet objDs1 = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter(FindNotes.CommandText, sqlcon);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            dAdapter.Fill(objDs1);
            if (objDs1.Tables[0].Rows.Count > 0)
                {
                return objDs1.Tables[0].Rows[0][0] + ":" + objDs1.Tables[0].Rows[0][1];
                }
            }
        finally
            {
            sqlcon.Close();
            }

        return null;
        }

    public static Image Inscribe(Image image, int size)
        {
        return Inscribe(image, size, size);
        }
    public static Image Inscribe(Image image, int width, int height)
        {
        Bitmap result = new Bitmap(width, height);
        using (Graphics graphics = Graphics.FromImage(result))
            {
            double factor = 1.0 * width / image.Width;
            if (image.Height * factor < height)
                factor = 1.0 * height / image.Height;
            Size size = new Size((int)(width / factor), (int)(height / factor));
            Point sourceLocation = new Point((image.Width - size.Width) / 2, (image.Height - size.Height) / 2);

            SmoothGraphics(graphics);
            graphics.DrawImage(image, new Rectangle(0, 0, width, height), new Rectangle(sourceLocation, size), GraphicsUnit.Pixel);
            }
        return result;
        }
    static void SmoothGraphics(Graphics g)
        {
        g.SmoothingMode = SmoothingMode.AntiAlias;
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        g.PixelOffsetMode = PixelOffsetMode.HighQuality;
        }


    public static void SaveToJpeg(Image image, Stream output)
        {
        image.Save(output, ImageFormat.Jpeg);
        }

    public static void SaveToJpeg(Image image, string fileName)
        {
        image.Save(fileName, ImageFormat.Jpeg);
        }

    public static bool CreateUser(int roleID, string designation, string userName, string login, string pass, string email, DateTime date, string Role)
        {
        bool created = false;
        SqlCommand cmdUser = new SqlCommand("sp_CreateUser", sqlcon);
        cmdUser.CommandType = CommandType.StoredProcedure;
        cmdUser.Parameters.AddWithValue("USR_ROLEID", roleID);
        cmdUser.Parameters.AddWithValue("@DESIGNATION", designation);
        cmdUser.Parameters.AddWithValue("USR_NAME", userName);
        cmdUser.Parameters.AddWithValue("USR_LOGIN", login);
        cmdUser.Parameters.AddWithValue("USR_PASSWORD", EncryptTripleDES(pass));
        cmdUser.Parameters.AddWithValue("EmailId", email);
        cmdUser.Parameters.AddWithValue("CREATED_DATE", date);
        cmdUser.Parameters.AddWithValue("Role", Role);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            return created = cmdUser.ExecuteNonQuery() == 0 ? false : true;
            }
        finally
            {
            sqlcon.Close();
            }
        }

    public static DataTable GetDataTab(string query)
        {
        try
            {
            if (sqlcon.State == ConnectionState.Broken || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, sqlcon);

            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            }
        finally
            {
            sqlcon.Close();
            }
        }
    public static bool UpdateRole(string roleName, string roleDesc, string priv, string status, string roleID)
        {
        System.Collections.Hashtable Errors = new System.Collections.Hashtable();
        SqlCommand sqlCmd1 = new SqlCommand("sp_UpdateRole", sqlcon);
        sqlCmd1.CommandType = CommandType.StoredProcedure;
        sqlCmd1.Parameters.Clear();
        sqlCmd1.Parameters.AddWithValue("@ROLE_DESC", roleDesc);
        sqlCmd1.Parameters.AddWithValue("@status", status);
        sqlCmd1.Parameters.AddWithValue("@ROLE_PRIVILEGES", priv);
        sqlCmd1.Parameters.AddWithValue("@ROLE_NAME", roleName);
        sqlCmd1.Parameters.AddWithValue("@ROLE_ID", roleID);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                { sqlcon.Close(); }
            sqlcon.Open();
            sqlCmd1.ExecuteNonQuery(); return true;
            }
        catch (Exception e)
            {
            //Errors.Add(Errors.Count + 1, new ErrorRecord("0019", new[] { e.Message }));
            HttpContext.Current.Session["BLErrors"] = Errors;
            return false;
            }
        finally
            {

            sqlcon.Close();
            }
        }
    public static bool AuthenticateUser(string pageUrl, string DeptName, object Table)
        {
        System.Collections.Hashtable Errors = new System.Collections.Hashtable();
        try
            {
            DataTable data = (DataTable)Table;
            DataRow[] dr = data.Select("PageUrl='" + pageUrl.Remove(0, 2) + "' and DeptName='" + DeptName + "'");
            if (dr.Length != 1)
                { return false; }
            return true;
            }
        catch (Exception e)
            {
            //Errors.Add(Errors.Count + 1, new ErrorRecord("0019", new[] { e.Message }));
            HttpContext.Current.Session["BLErrors"] = Errors;
            return false;
            }
        }
    public static bool UpdateUser(string loginName, string userName, string designation, int roleID, string email, string status)
        {
        bool updated = false;
        SqlCommand sqlCmd1 = new SqlCommand("UPDATE tblUSER SET USR_NAME=@USR_NAME, DESIGNATION=@DESIGNATION,USR_ROLEID=@USR_ROLEID, EmailId=@EmailId, USR_STATUS=@USR_STATUS  WHERE USR_LOGIN=@USR_LOGIN ", sqlcon);
        sqlCmd1.Parameters.AddWithValue("@USR_NAME", userName);
        sqlCmd1.Parameters.AddWithValue("@DESIGNATION", designation);
        sqlCmd1.Parameters.AddWithValue("@USR_ROLEID", roleID);
        sqlCmd1.Parameters.AddWithValue("@EmailId", email);
        sqlCmd1.Parameters.AddWithValue("@USR_STATUS", status);
        sqlCmd1.Parameters.AddWithValue("@USR_LOGIN", loginName);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                { sqlcon.Close(); }
            sqlcon.Open();
            return updated = sqlCmd1.ExecuteNonQuery() == 0 ? false : true;
            }
        finally
            {
            sqlcon.Close();
            }
        }

    public static bool CreateRole(string roleName, string roleDesc, string rolePriv, DateTime date)
        {
        bool created = false;
        SqlCommand cmdRole = new SqlCommand("sp_NewRole", sqlcon);
        cmdRole.CommandType = CommandType.StoredProcedure;
        cmdRole.Parameters.AddWithValue("ROLE_NAME", roleName);
        cmdRole.Parameters.AddWithValue("ROLE_DESC", roleDesc);
        cmdRole.Parameters.AddWithValue("ROLE_PRIVILEGES", rolePriv);
        cmdRole.Parameters.AddWithValue("CREATE_DATE", date);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            return created = cmdRole.ExecuteNonQuery() == 0 ? false : true;
            }
        finally
            {
            sqlcon.Close();
            }
        }

    public static bool ChangePassword(string userLogin, string oldpass, string newpass)
        {
        bool updated = false;
        SqlCommand cmd = new SqlCommand("update tblUser set USR_PASSWORD=@newpass where USR_LOGIN=@USR_LOGIN AND USR_PASSWORD=@oldpass", sqlcon);
        cmd.Parameters.AddWithValue("@USR_LOGIN", userLogin);
        cmd.Parameters.AddWithValue("@newpass", newpass);
        cmd.Parameters.AddWithValue("@oldpass", oldpass);

        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            return updated = Convert.ToInt32(cmd.ExecuteNonQuery()) == 0 ? false : true;
            }
        finally
            {
            sqlcon.Close();
            }
        }

    public static bool ChangePassword(string userLogin, string newpass)
        {
        bool updated = false;
        SqlCommand cmd = new SqlCommand("update tblUser set USR_PASSWORD=@USR_PASSWORD where USR_LOGIN=@USR_LOGIN", sqlcon);
        cmd.Parameters.AddWithValue("USR_LOGIN", userLogin);
        cmd.Parameters.AddWithValue("USR_PASSWORD", newpass);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            return updated = Convert.ToInt32(cmd.ExecuteNonQuery()) == 0 ? false : true;
            }
        finally
            {
            sqlcon.Close();
            }
        }

    public static int CheckPass(string userLogin, string pass)
        {
        int passed = 0;
        SqlCommand cmd = new SqlCommand("select USR_ROLEID from tblUser where USR_LOGIN=@USR_LOGIN and USR_PASSWORD=@USR_PASSWORD", sqlcon);
        cmd.Parameters.AddWithValue("USR_LOGIN", userLogin);
        cmd.Parameters.AddWithValue("USR_PASSWORD", pass);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            DataSet objDs1 = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(objDs1);
            if (objDs1.Tables[0].Rows.Count > 0)
                {
                passed = Convert.ToInt16(objDs1.Tables[0].Rows[0].ItemArray[0]);
                }
            return passed;  //= Convert.ToInt32(cmd.ExecuteScalar());
            }
        finally
            {
            sqlcon.Close();
            }
        }

    public static DataTable GetPrivlegeForUser(String USER_ID, int User_RoleID)
        {
        String[] PageId = { "" };
        DataTable dtable1 = new DataTable();
        dtable1.Columns.Add("PageId", typeof(string));
        SqlCommand cmd1 = new SqlCommand("Select ROLE_PRIVILEGES from tblROLE where ROLE_ID='" + User_RoleID + "'", sqlcon);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();

            DataSet objDs1 = new DataSet();
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            ad1.Fill(objDs1);
            if (objDs1.Tables[0].Rows.Count > 0)
                {
                PageId = ((objDs1.Tables[0].Rows[0].ItemArray[0]).ToString()).Split('#');


                for (int i = 0; i < PageId.Length; i++)
                    {
                    if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                        {
                        sqlcon.Close();
                        }
                    sqlcon.Open();
                    SqlCommand cmd2 = new SqlCommand("Insert Into tempTable([PageId]) values(@PageId)", sqlcon);
                    cmd2.Parameters.AddWithValue("@PageId", PageId[i]);
                    cmd2.ExecuteNonQuery();
                    cmd2.Connection.Close();
                    //DataRow NewRow1 = dtable1.NewRow();
                    //NewRow1["PageId"] = PageId[i];
                    //dtable1.Rows.Add(NewRow1);
                    //dtable1.AcceptChanges();

                    }
                }


            }
        finally
            {
            sqlcon.Close();
            }
        SqlCommand cmd = new SqlCommand("select *from PageIDTable Where PageId IN(Select PageId from tempTable)", sqlcon);
        //cmd.Parameters.AddWithValue("USR_LOGIN", USER_ID);
        try
            {
            if (sqlcon.State == ConnectionState.Open || sqlcon.State == ConnectionState.Broken)
                {
                sqlcon.Close();
                }
            sqlcon.Open();
            DataSet objDs = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(objDs);
            //Delete from temp table
            SqlCommand deleteCmd = new SqlCommand("Delete from tempTable", sqlcon);
            deleteCmd.ExecuteNonQuery();
            deleteCmd.Connection.Close();

            return objDs.Tables[0];



            }
        finally
            {
            sqlcon.Close();
            }

        }

    private static byte[] KEY_192 = { 42, 16, 93, 156, 78, 4, 218, 32, 15, 167, 44, 80, 26, 250, 155, 112, 2, 94, 11, 204, 119, 35, 184, 197 };
    private static byte[] IV_192 = { 55, 103, 246, 79, 36, 99, 167, 3 };//, 42, 5, 62, 83, 184, 7, 209, 13, 145, 23, 200, 58, 173, 10, 121, 222 }; 
    public static string EncryptTripleDES(string value)
        {
        TripleDESCryptoServiceProvider cryptoProvider = new TripleDESCryptoServiceProvider();
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, cryptoProvider.CreateEncryptor(KEY_192, IV_192), CryptoStreamMode.Write);
        StreamWriter sw = new StreamWriter(cs);
        sw.Write(value);
        sw.Flush();
        cs.FlushFinalBlock();
        ms.Flush();
        return Convert.ToBase64String(ms.GetBuffer(), 0, Convert.ToInt32(ms.Length));
        }

    public static string SaveQRCode(ArrayList QRcodetext, string location)
        {
        HttpContext context = HttpContext.Current;
        string qrcode = "";
        for (int i = 0; i < QRcodetext.Count; i++)
            {
            qrcode += QRcodetext[i];
            if (i == QRcodetext.Count - 1)
                {
                qrcode = qrcode;
                }
            else
                {
                qrcode += ",";
                }

            }

        // string[] qrcode = { Convert.ToString(QRcodetext.Split(',')) };
        string qr = Convert.ToString(qrcode);
        QRCodeEncoder encoder = new QRCodeEncoder();
        Bitmap QRImage = encoder.Encode(qr);
        string fileName = QRcodetext[0] + ".jpg";
        QRImage.Save(context.Server.MapPath("~/" + location + "//" + fileName), ImageFormat.Jpeg);
        return qr;
        }

    public static void printQRCode(string[] QRcodetext)
        {
        HttpContext context = HttpContext.Current;
        string qrcode = "";
        for (int i = 0; i < QRcodetext.Length; i++)
            {
            qrcode += QRcodetext[i];
            qrcode += ",";
            }
        string qr = Convert.ToString(qrcode);
        QRCodeEncoder encoder = new QRCodeEncoder();
        context.Session["QRCode"] = qrcode;
        PrintDocument pdbr = new PrintDocument();
        pdbr.PrintPage += new PrintPageEventHandler(pqr);
        pdbr.Print();
        }
    public static void pqr(object o, PrintPageEventArgs e)
        {
        HttpContext context = HttpContext.Current;
        string qr = context.Session["QRCode"].ToString();
        QRCodeEncoder encoder = new QRCodeEncoder();
        Bitmap QRImage = encoder.Encode(qr);
        System.Drawing.Image i1 = QRImage;
        Point p1 = new Point(100, 100);
        e.Graphics.DrawImage(i1, p1);
        }

    public static void pbr(object o, PrintPageEventArgs e)
        {
        HttpContext context = HttpContext.Current;

        string LocURL = context.Request.Url.Host + ":" + context.Request.Url.Port.ToString();
        string LocAppPath = context.Request.ApplicationPath;
        string Loc = "";
        if (LocAppPath == "")
            {
            Loc = "http://" + LocURL + "/Images/Astra_Logo_image.jpg";
            }
        else
            {
            Loc = "http://" + LocURL + LocAppPath + "/Images/Astra_Logo_image.jpg";
            }

        string weight = "1";
        string barcode = context.Session["Barcode"].ToString();
        System.Drawing.Image i = Code128Rendering.MakeBarcodeImage(barcode, int.Parse(weight), true);
        string fileName = barcode + ".jpg";
        Image codeimg = CreateBitmapImage(barcode);
        string HbLocation = context.Session["HubLocation"].ToString();
        Image Hublocation = CreateBitmapImage(HbLocation);
        Image secondimg = i;
        string path = context.Server.MapPath("~/Images/");
        string imagefile = path + "Astra_Logo_image.jpg";
        Image Firstimg = Image.FromFile(imagefile);
        System.Drawing.Image finalImage = MergeFourImages(Firstimg, secondimg, codeimg, Hublocation);
        Point p = new Point(65, 0);
        e.Graphics.DrawImage(finalImage, p);
        }
    //sneha
    public static void GenerateMyQCCode(string QCText, string size, string QRcodetext)
        {
        QrCodeEncodingOptions options = new QrCodeEncodingOptions();
        if (size == "1/2 inch")
            {
            options = new QrCodeEncodingOptions
                {
                DisableECI = true,
                CharacterSet = "UTF-8",
                Width = 250,
                Height = 250,

                };
            }
        else
            {
            options = new QrCodeEncodingOptions
                {
                DisableECI = true,
                CharacterSet = "UTF-8",
                Width = 300,
                Height = 300,

                };
            }
        //string qrcode = "";
        //for (int i = 0; i < QRcodetext.Count; i++)
        //{
        //    qrcode += QRcodetext[i];
        //    if (i == QRcodetext.Count - 1)
        //    {
        //        qrcode = qrcode;
        //    }
        //    else
        //    {
        //        qrcode += ",";
        //    }

        //}

        // string[] qrcode = { Convert.ToString(QRcodetext.Split(',')) };
        string qr = Convert.ToString(QRcodetext);

        var QCwriter = new BarcodeWriter();
        QCwriter.Options = options;
        QCwriter.Format = BarcodeFormat.QR_CODE;
        var result = QCwriter.Write(qr);

       // string path = System.Web.HttpContext.Current.Server.MapPath("~/QRImages/" + QCText + ".jpg");
        var barcodeBitmap = new Bitmap(result);
        string path1 = "  " + size;
        Image codeimg = CreateBitmapImage(path1);
        //System.Drawing.Image finalImage = MergeTwoImages(barcodeBitmap, codeimg);
        System.Drawing.Image finalImage = barcodeBitmap;
        //changed from 64 to 62
        System.Drawing.Image barcode = Inscribe(finalImage, 100, 100);
        //using (MemoryStream memory = new MemoryStream())
        //    {
        //    using (FileStream fs = new FileStream(path,
        //       FileMode.Create, FileAccess.ReadWrite))
        //        {
        //        barcode.Save(memory, ImageFormat.Jpeg);
        //        byte[] bytes = memory.ToArray();
        //        fs.Write(bytes, 0, bytes.Length);
        //        }

        //    }

        string logopath = System.Web.HttpContext.Current.Server.MapPath("~/Images/NRLLOGOQRT.png");
        byte[] logobytes = File.ReadAllBytes(logopath);
        MemoryStream ms = new MemoryStream(logobytes);
        System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
        Image Logo = Inscribe(img, 40, 40);

        //string qrpath = path;
        //byte[] qrbytes = File.ReadAllBytes(qrpath);
        //MemoryStream qrms = new MemoryStream(qrbytes);
        //System.Drawing.Image qrimg = System.Drawing.Image.FromStream(qrms);
        //Image QRLogo = Inscribe(qrimg, 62, 62);

        System.Drawing.Image logofinalImage = NRLMergeTwoImages(Logo, barcode);

        //string imgname = "NRL" + QCText + "";
        string fullqrpath = System.Web.HttpContext.Current.Server.MapPath("~/QRImages/" + QCText + ".jpg");

        barcode.Save(fullqrpath, ImageFormat.Jpeg);
        //imgageQRCode.Visible = true;
        //imgageQRCode.ImageUrl = "~/images/MyQRImage.jpg";
        //return QCText;
    }
    public static Bitmap NRLMergeTwoImages(Image secondImage, Image codeimg)
    {

        if (secondImage == null)
        {
            throw new ArgumentNullException("secondImage");
        }
        if (codeimg == null)
        {
            throw new ArgumentNullException("codeimg");
        }


        //int outputImageWidth = firstImage.Width > secondImage.Width ? firstImage.Width : secondImage.Width;
        int outputImageWidth = codeimg.Width + codeimg.Width - 10;
        int outputImageHeight = codeimg.Height;

        Bitmap outputImage = new Bitmap(outputImageWidth, outputImageHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
        //modified from 96 to 126
        outputImage.SetResolution(96.0F, 96.0F);

        using (Graphics graphics = Graphics.FromImage(outputImage))
        {
            Rectangle rec1 = new Rectangle(new Point(), codeimg.Size);
            SolidBrush blueBrush = new SolidBrush(Color.White);
            graphics.FillRectangle(blueBrush, rec1);
            graphics.DrawImage(secondImage, rec1, rec1, GraphicsUnit.Pixel);
            Rectangle rec2 = new Rectangle(new Point(codeimg.Height-10), codeimg.Size);

            graphics.FillRectangle(blueBrush, rec2);

            graphics.DrawImage(codeimg, rec2, rec1, GraphicsUnit.Pixel);
        }
        return outputImage;

    }



    public static void printBarCode(string barcode)
        {
        HttpContext context = HttpContext.Current;
        context.Session["Barcode"] = barcode;
        PrintDocument pdbr = new PrintDocument();
        pdbr.PrintPage += new PrintPageEventHandler(pbr);
        pdbr.Print();

        }
    public static Bitmap MergeTwoImages(Image secondImage, Image codeimg)
        {

        if (secondImage == null)
            {
            throw new ArgumentNullException("secondImage");
            }
        if (codeimg == null)
            {
            throw new ArgumentNullException("codeimg");
            }


        //int outputImageWidth = firstImage.Width > secondImage.Width ? firstImage.Width : secondImage.Width;
        int outputImageWidth = secondImage.Width;
        int outputImageHeight = secondImage.Height + codeimg.Height;

        Bitmap outputImage = new Bitmap(outputImageWidth, outputImageHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
        //modified from 96 to 126
        outputImage.SetResolution(96.0F, 96.0F);

        using (Graphics graphics = Graphics.FromImage(outputImage))
            {
            Rectangle rec1 = new Rectangle(new Point(), secondImage.Size);
            SolidBrush blueBrush = new SolidBrush(Color.White);
            graphics.FillRectangle(blueBrush, rec1);
            graphics.DrawImage(secondImage, rec1, rec1, GraphicsUnit.Pixel);
            Rectangle rec2 = new Rectangle(new Point(0, secondImage.Height - 20), secondImage.Size);

            graphics.FillRectangle(blueBrush, rec2);

            graphics.DrawImage(codeimg, rec2, rec1, GraphicsUnit.Pixel);
            }
        return outputImage;

        }
    public static void saveAWBBarcodeHub(string barcode, string location, string hublocation)
        {

        HttpContext context = HttpContext.Current;
        string weight = "1";
        string qr = Convert.ToString(barcode);
        QRCodeEncoder encoder = new QRCodeEncoder();
        System.Drawing.Image i = Code128Rendering.MakeBarcodeImage(barcode, int.Parse(weight), true);
        string fileName = barcode + ".jpg";
        Image codeimg = CreateBitmapImage(barcode);
        Image Hublocation = CreateBitmapImage(hublocation);
        Image secondimg = i;
        string path = context.Server.MapPath("~/Images/");
        string imagefile = path + "Astra_Logo_image.jpg";
        Image Firstimg = Image.FromFile(imagefile);
        System.Drawing.Image finalImage = MergeFourImages(Firstimg, secondimg, codeimg, Hublocation);
        finalImage.Save(context.Server.MapPath("~/" + location + "/" + fileName), ImageFormat.Jpeg);
        }
    public static void saveBarcode(string barcode, string location)
        {
        HttpContext context = HttpContext.Current;
        string weight = "1";
        string qr = Convert.ToString(barcode);
        QRCodeEncoder encoder = new QRCodeEncoder();
        System.Drawing.Image i = Code128Rendering.MakeBarcodeImage(barcode, int.Parse(weight), true);
        string fileName = barcode + ".jpg";
        Image codeimg = CreateBitmapImage(barcode);
        Image secondimg = i;
        string path = context.Server.MapPath("~/Images/");
        string imagefile = "    " + path + "Astra_logo2.png";
        Image Firstimg = Image.FromFile(imagefile);
        System.Drawing.Image finalImage = MergeThreeImages(Firstimg, secondimg, codeimg);
        finalImage.Save(context.Server.MapPath("~/" + location + "/" + fileName), ImageFormat.Jpeg);
        }
    public static string SaveQRCode(string QRcodetext, string location, int id)
        {
        HttpContext context = HttpContext.Current;
        string qrcode = QRcodetext;
        // for (int i = 0; i < QRcodetext.Count; i++)
        //  {
        //     qrcode += QRcodetext[i];
        //     if (i == QRcodetext.Count - 1)
        //      {

        //    qrcode = qrcode;
        //   }
        //    else
        //    {
        //   qrcode += ",";
        //     }

        // }

        // string[] qrcode = { Convert.ToString(QRcodetext.Split(',')) };
        string qr = Convert.ToString(qrcode);
        QRCodeEncoder encoder = new QRCodeEncoder();
        Bitmap QRImage = encoder.Encode(qr);
        string fileName = id + ".jpg";
        QRImage.Save(context.Server.MapPath("~/" + location + "//" + fileName), ImageFormat.Jpeg);
        return qr;
        }

    public static void saveBarcode(string barcode, string location, int ImageFont, string imageurl)
        {
        if (imageurl == "")
            imageurl = "Astra_logo2.png";
        HttpContext context = HttpContext.Current;
        string weight = "1";
        string qr = Convert.ToString(barcode);
        QRCodeEncoder encoder = new QRCodeEncoder();
        System.Drawing.Image i = Code128Rendering.MakeBarcodeImage(barcode, double.Parse(weight), true);
        string fileName = barcode + ".Png";
        Image codeimg = CreateBitmapImage("  " + barcode, ImageFont);
        Image secondimg = i;
        string path = context.Server.MapPath("~/Images/");
        // Image codeimg1 = CreateBitmapImage("    ");
        string imagefile = path + imageurl;
        Image Firstimg = Image.FromFile(imagefile);
        System.Drawing.Image finalImage = MergeThreeImages(Firstimg, secondimg, codeimg);

        finalImage.Save(context.Server.MapPath("~/" + location + "/" + fileName), ImageFormat.Png);
        }

    string[] decodeQRCode(System.Drawing.Image qrcodeimage)
        {

        QRCodeDecoder qd = new QRCodeDecoder();
        QRCodeEncoder qn = new QRCodeEncoder();
        MessagingToolkit.QRCode.Codec.Data.QRCodeImage QRCodeImg = (MessagingToolkit.QRCode.Codec.Data.QRCodeImage)qrcodeimage;
        string QRCode = qd.Decode(QRCodeImg).ToString();
        string[] decodedstrings = { Convert.ToString(QRCode.Split(',')) };
        return decodedstrings;
        }
    public static Bitmap MergeFourImages(Image firstImage, Image secondImage, Image codeimg, Image Hublocation)
        {
        if (firstImage == null)
            {
            throw new ArgumentNullException("firstImage");
            }

        if (secondImage == null)
            {
            throw new ArgumentNullException("secondImage");
            }
        if (codeimg == null)
            {
            throw new ArgumentNullException("codeimg");
            }



        //int outputImageWidth = firstImage.Width > secondImage.Width ? firstImage.Width : secondImage.Width;
        int outputImageWidth = secondImage.Width;
        int outputImageHeight = firstImage.Height + secondImage.Height + codeimg.Height + Hublocation.Height;

        Bitmap outputImage = new Bitmap(outputImageWidth, outputImageHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);

        using (Graphics graphics = Graphics.FromImage(outputImage))
            {
            Rectangle rec1 = new Rectangle(new Point(), secondImage.Size);

            SolidBrush blueBrush = new SolidBrush(Color.White);
            graphics.FillRectangle(blueBrush, rec1);
            graphics.DrawImage(firstImage, rec1, rec1, GraphicsUnit.Pixel);

            Rectangle rec2 = new Rectangle(new Point(0, firstImage.Height + 1), secondImage.Size);

            graphics.FillRectangle(blueBrush, rec2);
            graphics.DrawImage(secondImage, rec2, rec1, GraphicsUnit.Pixel);


            Rectangle rec3 = new Rectangle(new Point(0, firstImage.Height + secondImage.Height), secondImage.Size);

            graphics.FillRectangle(blueBrush, rec3);
            graphics.DrawImage(codeimg, rec3, rec1, GraphicsUnit.Pixel);

            Rectangle rec4 = new Rectangle(new Point(0, firstImage.Height + secondImage.Height + codeimg.Height), secondImage.Size);
            graphics.FillRectangle(blueBrush, rec4);
            graphics.DrawImage(Hublocation, rec4, rec1, GraphicsUnit.Pixel);


            }
        return outputImage;

        }
    public static Bitmap MergeThreeImages(Image firstImage, Image secondImage, Image codeimg)
        {
        if (firstImage == null)
            {
            throw new ArgumentNullException("firstImage");
            }

        if (secondImage == null)
            {
            throw new ArgumentNullException("secondImage");
            }
        if (codeimg == null)
            {
            throw new ArgumentNullException("codeimg");
            }


        //int outputImageWidth = firstImage.Width > secondImage.Width ? firstImage.Width : secondImage.Width;
        int outputImageWidth = secondImage.Width;
        int outputImageHeight = firstImage.Height + secondImage.Height + codeimg.Height;

        Bitmap outputImage = new Bitmap(outputImageWidth, outputImageHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
        outputImage.SetResolution(96.0F, 96.0F);

        using (Graphics graphics = Graphics.FromImage(outputImage))
            {
            Rectangle rec1 = new Rectangle(new Point(), secondImage.Size);

            SolidBrush blueBrush = new SolidBrush(Color.White);
            graphics.FillRectangle(blueBrush, rec1);
            graphics.DrawImage(firstImage, rec1, rec1, GraphicsUnit.Pixel);

            Rectangle rec2 = new Rectangle(new Point(0, firstImage.Height + 1), secondImage.Size);

            graphics.FillRectangle(blueBrush, rec2);
            graphics.DrawImage(secondImage, rec2, rec1, GraphicsUnit.Pixel);

            Rectangle rec3 = new Rectangle(new Point(0, firstImage.Height + secondImage.Height), secondImage.Size);

            graphics.FillRectangle(blueBrush, rec3);
            graphics.DrawImage(codeimg, rec3, rec1, GraphicsUnit.Pixel);



            }
        return outputImage;

        }

    public static Bitmap CreateBitmapImage(string sImageText)
    {
        Bitmap objBmpImage = new Bitmap(1, 1);
        //modified from 96 to 126
        objBmpImage.SetResolution(96.0F, 96.0F);
        int intWidth = 0;
        int intHeight = 0;
        // Create the Font object for the image text drawing.
        //changed 20 to 50
      
        Font objFont = new Font("Arial", 50, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel);




        // Create a graphics object to measure the text's width and height.

        Graphics objGraphics = Graphics.FromImage(objBmpImage);



        // This is where the bitmap size is determined.

        intWidth = (int)objGraphics.MeasureString(sImageText, objFont).Width;

        intHeight = (int)objGraphics.MeasureString(sImageText, objFont).Height;



        // Create the bmpImage again with the correct size for the text and font.

        objBmpImage = new Bitmap(objBmpImage, new Size(intWidth, intHeight));



        // Add the colors to the new bitmap.

        objGraphics = Graphics.FromImage(objBmpImage);



        // Set Background color

        objGraphics.Clear(Color.White);

        objGraphics.SmoothingMode = SmoothingMode.AntiAlias;

        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;

        objGraphics.DrawString(sImageText, objFont, new SolidBrush(Color.FromArgb(0, 0, 0)), 0, 0);

        objGraphics.Flush();
        return (objBmpImage);
        }
    public static Bitmap CreateBitmapImage(string sImageText, int ImageFont)
        {
        if (ImageFont == 0)
            ImageFont = 20;
        Bitmap objBmpImage = new Bitmap(1, 1);

        objBmpImage.SetResolution(96.0F, 96.0F);

        int intWidth = 0;

        int intHeight = 0;



        // Create the Font object for the image text drawing.

        Font objFont = new Font("Arial Narrow", ImageFont, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel);




        // Create a graphics object to measure the text's width and height.

        Graphics objGraphics = Graphics.FromImage(objBmpImage);



        // This is where the bitmap size is determined.

        intWidth = (int)objGraphics.MeasureString(sImageText, objFont).Width;

        intHeight = (int)objGraphics.MeasureString(sImageText, objFont).Height;



        // Create the bmpImage again with the correct size for the text and font.

        objBmpImage = new Bitmap(objBmpImage, new Size(intWidth, intHeight));



        // Add the colors to the new bitmap.

        objGraphics = Graphics.FromImage(objBmpImage);



        // Set Background color

        objGraphics.Clear(Color.White);

        objGraphics.SmoothingMode = SmoothingMode.AntiAlias;

        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;

        objGraphics.DrawString(sImageText, objFont, new SolidBrush(Color.FromArgb(0, 0, 0)), 0, 0);

        objGraphics.Flush();
        return (objBmpImage);
        }


    }