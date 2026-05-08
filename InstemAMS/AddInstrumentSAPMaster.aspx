<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddInstrumentSAPMaster.aspx.cs" Inherits="AddInstrumentSAPMaster" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            width: 109px;
        }
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            font-size: medium;
            color: #000000;
        }
        .style5
        {
            width: 195px;
        }
        .style6
        {
            width: 49px;
        }
        .style7
        {
            width: 47px;
        }
        .auto-style1 {
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <strong style="margin-left:55px"><span class="style4">
    Add Instrument SAP Code <br />
    </span></strong>

<br />

    <table style="margin-left:55px" class="style1">
        <tr>
            <td colspan="5">
                <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" ForeColor="Red"></dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                Instrument Sap Code<span class="style3"><strong>*</strong></span></td>
            <td class="style5">
                <dx:ASPxTextBox ID="txt_sapcode" runat="server" Width="170px" Height="25px"
                    MaxLength="7">
                </dx:ASPxTextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                Date</td>
            <td>
                <dx:ASPxLabel ID="lbl_date" runat="server" style="color: #0000FF" >
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <dx:ASPxButton ID="btnsave" runat="server" Width="120px" Height="25px"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Save" 
                    onclick="btnsave_Click">
                </dx:ASPxButton>
                <dx:ASPxButton ID="btnupdate" runat="server" Text="Update" Visible="False" 
                    Width="120px" Height="25px"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    onclick="btnupdate_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <strong style="margin-left:55px; color: #000000; font-size: medium;">Edit/Delete Instrument SAP Code
    </strong>
    
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" style="margin-left:55px"
    AutoGenerateColumns="False"  KeyFieldName="AssetSapID"
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
        DataSourceID="SqlDSAssetSap" onrowcommand="ASPxGridView1_RowCommand">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                            <DataItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text="Edit">Edit</asp:LinkButton>
                            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Delete">Delete</asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSapID" VisibleIndex="1" Caption="Instrument SAP ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSapCode" VisibleIndex="2" Caption="Instrument SAPCode">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
            CssPostfix="Glass">
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="1px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDSAssetSap" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
        SelectCommand="SELECT [AssetSapID], [AssetSapCode] FROM [AssetSapMaster]">
    </asp:SqlDataSource>
    <br />
    <br />


</asp:Content>

