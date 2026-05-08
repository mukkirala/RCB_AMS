<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignOutPage.aspx.cs" Inherits="SignOutPage" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0)"/>
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="icon" href="Images/BEL_Logo.png" type="image/x-icon"/>
    <title>Asset Management System</title>
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
        .style2
        {
            font-size: medium;
        }
    </style>
	<script type="text/javascript">
       history.pushState(null, null, document.URL);
       window.addEventListener('popstate', function () {
           history.pushState(null, null, document.URL);
       });
   </script>
</head>
<body>
    <form id="form1" runat="server">
        <dxrp:ASPxRoundPanel ID="signOutpanel" runat="server" Width="100%" 
            HeaderText="Signed Out">
            <PanelCollection>
<dx:PanelContent >
<table width="100%" style="height:500px; vertical-align:middle;" ><tr><td align="center">
<p>
<b><span class="style1">You have successfully signed out.</span></b>
</p>
    <p>
        <span class="style2">To login again</span> <asp:HyperLink ID="login" runat="server" 
            NavigateUrl="~/Login.aspx" >Click here</asp:HyperLink></p>
    </td></tr></table>
</dx:PanelContent>
</PanelCollection>
        </dxrp:ASPxRoundPanel>
    </form>
</body>
</html>
