using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDocument : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {          
            string filepath = null;
            filepath = Session["path"].ToString();
            string path = Server.MapPath(filepath);
            FileInfo fi = new FileInfo(path);
            string file = System.IO.Path.GetFileName(path);

            //D:\TEST_SOURCE\CV\SOURCE CODE\ARMY.Data\ProceduresALL
            Path.GetDirectoryName(path);

            //ProceduresALL
            string dir = Path.GetDirectoryName(path).Split(Path.DirectorySeparatorChar).Last();

            string FilePath = Path.Combine(dir, file);
            ///  if (FilePath != null)
            //{
            //  //  string path = Server.MapPath(FilePath);
            //    Image1.ImageUrl = FilePath;
            //}
            string extn = fi.Extension;
            if (extn == ".htm" || extn == ".html ")
            {
                HttpContext.Current.Response.AddHeader("Content-Type", "text/HTML");
            }
            else if (extn == ".txt")
            {
                HttpContext.Current.Response.AddHeader("Content-Type", "text/plain");
            }
            else if (extn == ".doc" || extn == ".rtf" || extn == ".docx" || extn == ".dotx")
            {
                HttpContext.Current.Response.AddHeader("Content-Type", "Application/msword");
            }
            else if (extn == "xls" || extn == "xlsx")
            {
                HttpContext.Current.Response.AddHeader("Content-Type", "Application/x-msexcel");
            }
            else if (extn == ".jpg" || extn == ".jpeg" || extn == ".png")
            {
                HttpContext.Current.Response.AddHeader("Content-Type", "image/jpeg");
            }
            else if (extn == ".pdf")
            {
                HttpContext.Current.Response.AddHeader("Content-Type", "application/pdf");
            }


            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(path);
            HttpContext.Current.Response.Clear();
            // HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=" + fileName);
            HttpContext.Current.Response.BinaryWrite(buffer);
            HttpContext.Current.Response.End();
        }
        catch (Exception ex)
        {

        }
        finally
        {

        }
    }
}