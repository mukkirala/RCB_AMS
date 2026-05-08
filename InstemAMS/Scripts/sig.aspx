<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sig.aspx.cs" Inherits="Scripts_sig" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>jQuery UI Signature Basics</title>
<link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/south-street/jquery-ui.css" rel="stylesheet">

<link href="jquery.signature.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.kbw-signature { width: 400px; height: 200px; }
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
<!--[if IE]>
<script type="text/javascript" src="excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="jquery.signature.js"></script>
<script type="text/javascript">
    $(function () {
        $('#sig').signature();
        $('#clear').click(function () {
            $('#sig').signature('clear');
        });
        $('#Save').click(function () {
            json_input=$('#sig').signature('toJSON');
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<p>Default signature:</p>
<div id="sig"></div>
<p style="clear: both;"><button id="clear">Clear</button> <button id="json">To JSON</button></p>

<input type="hidden" name="json_input" id="json_input" />
    <dx:ASPxButton ID="Save" runat="server" Text="Save" onclick="Save_Click" >
    </dx:ASPxButton>

</asp:Content>

