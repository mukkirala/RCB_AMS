<%@ Page Title="" Language="C#" AutoEventWireup="true"  CodeFile="ErrorPage.aspx.cs" Inherits="Authentication_ErrorPage" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
       <link rel="icon" href="Images/NRLicon.png" type="image/x-icon"/>
    
      <title>Asset Management System </title>
    
</head>
<body>
    <form id="form1" runat="server">
    <dxrp:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" 
        HeaderText="Error During Authentication." Width="100%">
        <PanelCollection>
<dxp:PanelContent runat="server" CssClass="masterRoundpanel">
    <table class="table" style="width:100%;" >
        <tr>
            <td>
                This problem can be caused by a variety of issues, including: <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:BulletedList ID="BulletedList1" runat="server" Height="54px">
                    <asp:ListItem>You were not logged in.</asp:ListItem>
                    <asp:ListItem>You are not authenticated to view this page.</asp:ListItem>
                    <asp:ListItem>Your login session has expired.</asp:ListItem>
                </asp:BulletedList>
            </td>
        </tr>
        <tr>
            <td>
                Click
                <asp:HyperLink ID="login_button" runat="server" 
                    NavigateUrl="~/Login.aspx" EnableViewState="False">here</asp:HyperLink>
                 to login.</td>
        </tr>
    </table>
            </dxp:PanelContent>
</PanelCollection>
    </dxrp:ASPxRoundPanel>
    </form>
</body></html>

