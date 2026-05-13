using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        //Response.Cache.SetNoStore();
        //Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1d);
        //Response.Expires = -1500;
        //Response.CacheControl = "no-cache";
        //Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);

        string username, UserID, Rolename;
        if (Session["UserID"] != null)
        {
            lblusername.Text = Session["USR_NAME"].ToString();
            username = Session["USR_NAME"].ToString();
            // User.Text = username;
            UserID = Session["UserID"].ToString();
            //Type = Session["Type"].ToString();
            Rolename = Session["ROLE_NAME"].ToString();
            lblrolename.Text = "Role : " + Rolename;

            if (Rolename == "Admin") // Admin 3
            {
                admin.Visible = true;
                auditor.Visible = false;
                requester.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
                DepartmentHead.Visible = false;

            }
            else if (Rolename == "IT-Admin") // IT Admin 4 
            {
                ITHRAdmin.Visible = true;
                buyback.Visible = true;
                admin.Visible = false;
                auditor.Visible = false;
                requester.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
                DepartmentHead.Visible = false;

            }
            else if (Rolename == "Engineer") // Engineer
            {

                admin.Visible = false;
                auditor.Visible = false;
                requester.Visible = false;
                Approver.Visible = false;
                DepartmentHead.Visible = false;

            }
            else if (Rolename == "HR-Admin") //  HR admin 5
            {
                ITHRAdmin.Visible = true;
                buyback.Visible = false;
                admin.Visible = false;
                auditor.Visible = false;
                requester.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
                DepartmentHead.Visible = false;

            }
            else if (Rolename == "Auditor") // Auditor 1
            {
                auditor.Visible = true;
                requester.Visible = false;
                admin.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
                DepartmentHead.Visible = false;
            }
            else if (Rolename == "Approver") //Approver 2
            {
                Approver.Visible = true;
                auditor.Visible = false;
                requester.Visible = false;
                admin.Visible = false;
                Engineer.Visible = false;
                DepartmentHead.Visible = false;

            }
            else if (Rolename == "DepartmentHead") // Department Head
            {
                DepartmentHead.Visible = true;

                auditor.Visible = false;
                requester.Visible = false;
                admin.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
            }
            else if (Rolename == "StoreIncharge") // Store Incharge
            {
                StoreIncharge.Visible = true;

                admin.Visible = false;
                auditor.Visible = false;
                requester.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
                PO.Visible = false;
                DepartmentHead.Visible = false;

            }
            else if (Rolename == "POAdmin") // Store Incharge
            {
                PO.Visible = true;

                admin.Visible = false;
                auditor.Visible = false;
                requester.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;

            }
            else  //Requestor
            {
                requester.Visible = true;
                admin.Visible = false;
                auditor.Visible = false;
                Approver.Visible = false;
                Engineer.Visible = false;
                StoreIncharge.Visible = false;
                DepartmentHead.Visible = false;

            }
        }

        else
        {
            Response.Redirect("ErrorPage.aspx");
        }
    }
}