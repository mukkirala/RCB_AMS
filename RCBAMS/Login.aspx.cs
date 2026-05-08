using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows.Forms;
using System.Net;
using System.DirectoryServices;
using System.Text;
using System.Collections;
using System.DirectoryServices.ActiveDirectory;
using System.DirectoryServices.AccountManagement;
public partial class Login : System.Web.UI.Page
{
    Utilities db = new Utilities();
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlDataAdapter da;


    bool returnAuth = false;
    string returnServer = null;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void save_Click(object sender, EventArgs e)
    {
        //PrincipalContext ctx = new PrincipalContext(ContextType.Domain, "172.195.126.171", "DC=sw-group,DC=com");
        //bool isValid = ctx.ValidateCredentials(txtUserID.Value, txtPassword.Value);

        //if (isValid)
        //{
            string emp = txtUserID.Value;
            LoginCheck(emp);


        //}
        //else
        //{
        //    lblNotification.Text = Messages.GetErrorMessage("30081").ToString();
        //}
    }

    //public bool ValidateCredentials(string username, string password)
    //{
    //    bool authenticated = false;
    //    try
    //    {
    //        string domain = "172.195.126.171:50001";
    //        string container = "DC=sw-group,DC=com";
    //        string path = $"LDAP://{domain}/{container}";

    //        using (DirectoryEntry entry = new DirectoryEntry(path, username, password))
    //        {
    //            object nativeObject = entry.NativeObject;
    //            authenticated = true;
    //            DirectorySearcher dsearch = new DirectorySearcher(entry);
    //            SearchResult sResultSet = null;
    //            dsearch.Filter = $"(samaccountname={username})";
    //            sResultSet = dsearch.FindOne();
    //            string custodianID = GetProperty(sResultSet, "extensionAttribute4");
    //            Session["emp"] = custodianID;
    //        }
//               else
//                {
//                    lblNotification.Text = "LDAP authentication failed. Please check your credentials.";
//                }
////    }
//    catch (DirectoryServicesCOMException cex)
//    {
// lblNotification.Text = "An LDAP authentication error occurred.";
//        System.Diagnostics.Debug.WriteLine(cex);

//    }
//    catch (Exception ex)
//    {
// lblNotification.Text = "An error occurred.";
//        System.Diagnostics.Debug.WriteLine(ex);
//    }

//    return authenticated;
//}

public static string GetProperty(SearchResult searchResult, string propertyName)
    {
        if (searchResult.Properties.Contains(propertyName))
        {
            return searchResult.Properties[propertyName][0].ToString();
        }
        else
        {
            return string.Empty;
        }
    }

    public void LoginCheck(string custID)
    {
        try
        {
            string myConnectionString = WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString;
            SqlConnection sqlCon = new SqlConnection(myConnectionString);

            if (custID == String.Empty && txtPassword.Value == String.Empty)
            {
                return;
            }

            if (custID == String.Empty)
            {
                lblNotification.Text = "UserID Required.";
                return;
            }

            if (txtPassword.Value == String.Empty)
            {
                lblNotification.Text = "Password Required.";
                return;
            }

            //if (txtPassword.Value != txtUserID.Value)
            //{
            //    lblNotification.Text = "Invalid Credentials.";
            //    return;
            //}
            string passed = Utilities.EncryptTripleDES(txtPassword.Value.ToString());
            //string passed = txtPassword.Value.ToString();
            SqlConnection myConnection = new SqlConnection(myConnectionString);
            string selectQuery = "SELECT CustodianID,CustodianDepartmentCode,DepartmentName,CustodianName,Designation,reporting_staff_no,email FROM CustodianMaster left join DepartmentMaster on DepartmentMaster.DepartmentCode = CustodianMaster.CustodianDepartmentCode where LDAP_USERID='" + custID + "' and LDAP_PWD = '"+ passed+ "'";

            SqlDataAdapter daRole = new SqlDataAdapter(selectQuery, conAMS);
            DataTable dtRole = new DataTable();
            daRole.Fill(dtRole);
            if (dtRole.Rows.Count <= 0)
            {
                string SelectQ = "SELECT CustodianID,CustodianDepartmentCode,DepartmentName,CustodianName,Designation,reporting_staff_no,email FROM CustodianMaster left join DepartmentMaster on DepartmentMaster.DepartmentCode = CustodianMaster.CustodianDepartmentCode where LDAP_USERID='" + txtUserID.Value + "' and LDAP_PWD = '"+txtPassword.Value+"' ";
                SqlDataAdapter da = new SqlDataAdapter(SelectQ, conAMS);
                da.Fill(dtRole);
            }
            //myConnection.Close();
            if (dtRole.Rows.Count > 0)
            {
                string USR_ID = dtRole.Rows[0].ItemArray[0].ToString();
                Session["UserID"] = USR_ID;
                string USR_NAME = dtRole.Rows[0].ItemArray[3].ToString();
                Session["USR_NAME"] = USR_NAME;
                string DESIGNATION = dtRole.Rows[0].ItemArray[4].ToString();
                Session["DESIGNATION"] = DESIGNATION;
                string DepartmentCode = dtRole.Rows[0].ItemArray[1].ToString();
                Session["DepartmentCode"] = DepartmentCode;
                string DepartmentName = dtRole.Rows[0].ItemArray[2].ToString();
                Session["DepartmentName"] = DepartmentName;
                string ReportingAuthority = dtRole.Rows[0].ItemArray[5].ToString();
                Session["ReportingAuthority"] = ReportingAuthority;
                string Mail = dtRole.Rows[0].ItemArray[6].ToString();
                Session["Mail"] = Mail;
                //string Password = dtRole.Rows[0].ItemArray[6].ToString();
                //Session["LDAP_PWD"] = Password;
                string login = logintype.SelectedValue;
                Session["Type"] = login;

                Session["ROLE_NAME"] = logintype.SelectedItem.Text;
                if (logintype.SelectedValue == "0") //Requestor
                {
                    Response.Redirect("CustodianDashboard.aspx");
                }

                else if (logintype.SelectedValue == "1")//Auditor
                {
                    int avl = RoleExist(USR_ID, "Auditor");
                    if (avl == 1)
                    {
                        Response.Redirect("AuditorDashboard.aspx");
                    }
                    else
                    {
                        lblNotification.Text = "UnAuthorized Access";
                        return;
                    }
                }


                else if (logintype.SelectedValue == "2")//Admin
                {
                    int avl = RoleExist(USR_ID, "Admin");
                    if (avl == 1)
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblNotification.Text = "UnAuthorized Access";
                        return;
                    }
                }

                //else if (logintype.SelectedValue == "3")//Approver
                //{
                //    int avl = RoleExist(USR_ID, "Approver");
                //    if (avl == 1)
                //    {
                //        Response.Redirect("ApproverDashboard.aspx");
                //    }
                //    else
                //    {
                //        lblNotification.Text = "UnAuthorized Access";
                //        return;
                //    }

                //}
                    //else if (logintype.SelectedValue == "4")//Engineer
                    //{
                    //    int avl = RoleExist(USR_ID, "Engineer");
                    //    if (avl == 1)
                    //    {
                    //        Response.Redirect("EnginnerViewRegisteredComplaints.aspx");
                    //    }
                    //    else
                    //    {
                    //        lblNotification.Text = "UnAuthorized Access";
                    //        return;
                    //    }

                    //}
                    //else if (logintype.SelectedValue == "4")// IT-Admin
                    //{
                    //    int avl = RoleExist(USR_ID, "IT-Admin");
                    //    if (avl == 1)
                    //    {
                    //        Response.Redirect("AdminDashboard.aspx");
                    //    }
                    //    else
                    //    {
                    //        lblNotification.Text = "UnAuthorized Access";
                    //        return;
                    //    }

                    // }
                    //else if (logintype.SelectedValue == "5")// 
                    //{
                    //    int avl = RoleExist(USR_ID, "NONIT-Admin");
                    //    if (avl == 1)
                    //    {
                    //        Response.Redirect("AdminDashboard.aspx");
                    //    }
                    //    else
                    //    {
                    //        lblNotification.Text = "UnAuthorized Access";
                    //        return;
                    //    }

                    //}

                }
            else
            {
                //lblNotification.Text = "Invalid Credentials!";
                lblNotification.Text = "The user ID or password entered by you is incorrect.";

                return;
            }

        }
        catch (Exception ex)
        {
            lblNotification.Text = ex.Message;
        }
    }


    public int RoleExist(string Cust, string Type)
    {
        int result = 0;
        string query = "Select * from RoleMaster where CustodianID='" + Cust + "' and  ROLE_NAME='" + Type + "' and  ROLE_STATUS='Active'";
        da = new SqlDataAdapter(query, conAMS);
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

 
}