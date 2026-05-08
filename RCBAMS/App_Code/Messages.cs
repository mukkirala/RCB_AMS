using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
//using Microsoft.Practices.EnterpriseLibrary.Data;
    /// <summary>
    /// Summary description for ErrorMessages
    /// </summary>
    public class Messages
    {
        /*private static DataTable MessageTable = new DataTable();
        private static DataView MessagesView = new DataView();

        public static void LoadError()
        {
            SqlCommand Command = new SqlCommand("Select * From Messages");
            Database db = DatabaseFactory.CreateDatabase();

            DataSet temp = db.ExecuteDataSet(Command);
            if(temp.Tables.Count > 0)
            {
                MessageTable = temp.Tables[0];
                MessagesView = MessageTable.DefaultView();
            }
        }*/

        public Color forecolor
        {

            get { return forecolor ; }
            set { forecolor = value; }
        }


        string a;

        public static string GetErrorMessage(string ErrorCode)
        {
            return GetErrorMessage(ErrorCode, null);
        }

        public static string GetErrorMessage(string ErrorCode, string[] Parameters)
        {
            string ErrorMessage = "";
            try
            {
                ErrorMessage = System.Web.HttpContext.GetGlobalResourceObject("Messages", ErrorCode).ToString();
            }
            finally
            {
            }

            if (ErrorMessage == "")
                return "Error: " + ErrorCode + " Not Found";

            if (Parameters != null && Parameters.Length > 0)
            {
                //ErrorMessage = ErrorCode + "&nbsp;" + String.Format(ErrorMessage, Parameters);
                ErrorMessage = String.Format(ErrorMessage, Parameters);
            }
            else
            {
               // ErrorMessage = ErrorCode + "&nbsp;" + ErrorMessage;
                ErrorMessage = ErrorMessage;
            }

            return CleanParams(ErrorMessage);
        }
          
        private static string CleanParams(string ErrorMessage)
        {
            ErrorMessage = ErrorMessage.Replace("{ ", "{");
            ErrorMessage = ErrorMessage.Replace(" }", "}");
            ErrorMessage = ErrorMessage.Replace("{\t", "{");
            ErrorMessage = ErrorMessage.Replace("\t}", "}");

            for (int i = 0; i < 100; i++)
            {
                ErrorMessage = ErrorMessage.Replace("{" + i.ToString() + "}", "");
            }

            return ErrorMessage;
        }

        public static void SetSuccessMessage(string Code, string[] Params, System.Web.SessionState.HttpSessionState Session)
        {
            Hashtable Errors = (Hashtable)Session["BLSuccess"];
            if (Errors == null)
            Errors = new Hashtable();           
           Errors.Add(Errors.Count + 1, new ErrorRecord(Code, Params, null, null));
            Session["BLSuccess"] = Errors;
        }

        public static void SetErrorMessage(string Code,string[] Params, string[] Ctrls, System.Web.UI.Page Page, System.Web.SessionState.HttpSessionState Session)
        {
            Hashtable Errors = (Hashtable)Session["BLErrors"];
            if (Errors == null)
                Errors = new Hashtable();
          
          Errors.Add(Errors.Count + 1, new ErrorRecord(Code, Params, Ctrls, Page));
           
            Session["BLErrors"] = Errors;
        }

    
        
        public static void SetInfoMessage(string Code, string[] Params, System.Web.SessionState.HttpSessionState Session)
        {
            Hashtable Errors = (Hashtable)Session["BLInfo"];
            if (Errors == null)
                Errors = new Hashtable();

            Errors.Add(Errors.Count + 1, new ErrorRecord(Code, Params, null, null));
            Session["BLInfo"] = Errors;
        }
    }
