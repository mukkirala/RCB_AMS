<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AssetAllocation.aspx.cs" Inherits="AssetAllocation" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h4><strong><span style="margin-left:230px">Asset Allocation</span></strong></h4>
    <div class="container">
        <div class="row" style="margin-top:20px">
            <div class="col-sm-8">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Asset"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                    <dx:ASPxComboBox ID="cmb_Assetname" runat="server" DataSourceID="SqlDataSource1" ValueField="AssetID" TextField="AssetName"></dx:ASPxComboBox>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:ASSETManagementConnectionString %>" SelectCommand="select AssetID,AssetName from AssetMaster">

    </asp:SqlDataSource>
</asp:Content>

