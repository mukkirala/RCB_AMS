<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>
<%@ Register TagPrefix="dxlp" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function closeForm() {
        window.close();
    }
</script>
    <style type="text/css">
        .style1
        {
            width: 209px;
        }
        .style2
        {            width: 50%;
        }
        .style3
        {
            width: 960px;
           
        }
        .style5
        {
           
           
        }
        .style6
        {
           
        }
        .style7
        {
            width: 960px;
           
        }
        .style8
        {
            width: 50%;
            height: 21px;
        }
        .style9
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div align="center">
 <table width="700" border="0" cellpadding="4" cellspacing="0" bgcolor="#eeeeee">
          <tr bgcolor="#a0b8c8">

            <td class="alignment" align="center">
              <font face="arial" size="4">
                <b>
                  Change your Password
                </b>
              </font>
            </td>
          </tr>
        </table>

        <table width="700" border="0" cellpadding="2" bgcolor="#eeeeee">
          <tr>
            <td align="center">
              <font face="arial" size="2">
                Enter your current password and then choose your new password.  Click <b>Save</b> when you're done.
              </font>
            </td>
          </tr>

        </table>
		<table cellpadding="10" cellspacing="0" border="0" width="550" bgcolor="#ffffcc" style="border: solid 1px #e7e7e7;">
	  <tr>
	    <td>
              <font face="arial" size="-1">
                <strong>
                  Please Note:
                </strong> 
                To better protect your account, make sure that your password is memorable for you but difficult for others to guess. Do not share your password with anyone, and never use the same password that you've used in the past. For security purposes, your new password must be a minimum of six characters long. A strong password contains a combination of uppercase and lowercase letters (remember that your password is case sensitive), numbers, and special characters such as +, ?, and *.
               </font> 
            </td>
	  </tr>
        </table>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" width="800px" 
        style="height: 158px">
          <tr>
            <td align="right" class="style2">
              <font face="arial">
              Login:
              </font>
            </td>

            <td class="style3">
                <dx:ASPxTextBox ID="txtUserID" MaxLength="150" runat="server" Width="170px" Enabled="false">
                </dx:ASPxTextBox>
            
            </td>
          </tr>
        
          <tr>
            <td align="right" class="style2">
              <font face="arial">
                Enter your <b>Current&nbsp;Password:</b>
              </font>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtOldPass"  runat="server" Password="True" MaxLength="10" Width="170px">
                </dx:ASPxTextBox>
            </td>
          </tr>
          <tr>
            <td align="right">
              <font face="arial">
                Choose a <b>New Password:</b>

              </font>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtNewPass" runat="server" Width="170px" MaxLength="10" 
                    Password="True">
                </dx:ASPxTextBox>
            </td>   
          </tr>
          <tr>
            <td align="right">
              <font face="arial">

                Confirm your <b>New Password:</b>
              </font>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtConfirmPass" runat="server" Width="170px" MaxLength="150"
                    Password="True">
                </dx:ASPxTextBox>
            </td>
          </tr>
        </table>
        <table width="700" border="0" cellpadding="4" cellspacing="0" bgcolor="#eeeeee">
          <tr>
            <td align="right">
              
                <dx:ASPxButton ID="save" runat="server" OnClick="save_Click" Text="Save" Width="70px">                                         
                    <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}" />
                            </dx:ASPxButton>
                            </td><td>
                            <dx:ASPxButton  ID="cancel" runat="server" OnClick="cancel_Click" Text="Cancel" Width="70px">
                  <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}" />
                  </dx:ASPxButton>
            </td>
          </tr>
        </table>
        <table>
            <tr>
            <td>
                <dx:ASPxLabel ID="lblNotification" runat="server" Text="" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
            </tr>
        </table>
        
 <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lpanel" Modal="True">
                        </dxlp:ASPxLoadingPanel>  

    <br />

</div>
</asp:Content>
