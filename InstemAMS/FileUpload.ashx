<%@ WebHandler Language="C#" Class="FileUpload" %>

using System;
using System.Web;
using System.IO;

public class FileUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest (HttpContext context)
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string fname;
                if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                {
                    string[] testfiles = file.FileName.Split(new char[] { '\\' });
                    fname = testfiles[testfiles.Length - 1];
                }
                else
                {
                    fname = file.FileName;
                }
              
               
                string extension = Path.GetExtension(fname);
                string  name = fname.Substring(0, fname.Length - extension.Length);
                string filenam1 = name + DateTime.Now.ToString("yyyyMMddHHmmssfff");               
                fname=context.Server.MapPath(@"~/AssetDocuments/"+ filenam1+extension);
                //if (context.Session["filename"] != null)
                //fname = context.Session["filename"].ToString();
                HttpContext.Current.Session["filename"]=fname;
                string filename = @"~/AssetDocuments/" + filenam1+extension;
                HttpContext.Current.Session["filepath"] = filename;
                file.SaveAs(fname);
            }
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}