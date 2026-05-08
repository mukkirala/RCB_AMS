using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class ChangePassword : System.Web.UI.Page
    {
    //private const string PAGEURL = "ChangePassword.aspx";
    //private const string PAGENAME = "Change your Password";
    protected void Page_Load(object sender, EventArgs e)
        {
        //ARP.BusinessLogic.Misc.Utilities.Authentication(PAGENAME, PAGEURL);
        if (Session["UserID"] != null)
            {
                txtUserID.Text = Session["USR_NAME"].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
           
        }

        protected void save_Click(object sender, EventArgs e)
        {
            if (txtOldPass.Text == String.Empty)
            {
                lblNotification.Text = Messages.GetErrorMessage("20056");
                return;
            }
            if (txtNewPass.Text == String.Empty)
            {
                txtOldPass.Text = txtOldPass.Text;
                lblNotification.Text = Messages.GetErrorMessage("20057");
                return;
            }
            if (txtConfirmPass.Text == String.Empty)
            {
                txtOldPass.Text = txtOldPass.Text;
                txtNewPass.Text = txtNewPass.Text;
                lblNotification.Text = Messages.GetErrorMessage("20058");
                return;
            }
            if (txtNewPass.Text != txtConfirmPass.Text)
            {

                lblNotification.Text = Messages.GetErrorMessage("20059");
                return;
            }


          if (txtOldPass.Text != txtNewPass.Text)
            {
                bool updated = Utilities.ChangePassword(txtUserID.Text, Utilities.EncryptTripleDES(txtOldPass.Text), Utilities.EncryptTripleDES(txtNewPass.Text));
                     if (updated)
                         {
                             //Response.Write("<script language=JavaScript>alert('Password Updated Successfully');</script>");
                             Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('Your password has changed successfully');", true);
                             //Response.Redirect("~/Default.aspx");

                         }
                        else
                        {
                             lblNotification.Text = Messages.GetErrorMessage("20012");

                        }
            }
            else
            {

                lblNotification.Text = Messages.GetErrorMessage("20055");
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            txtOldPass.Text = "";
            txtNewPass.Text = "";
            txtConfirmPass.Text = "";
            lblNotification.Text = "";
        }
    }
