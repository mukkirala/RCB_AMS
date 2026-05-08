<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAssetGroup.aspx.cs" Inherits="AddAssetGroup" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            font-size: medium;
            color: #000000;
        }
        .style3
        {
            width: 115px;
        }
        .style4
        {
            width: 209px;
        }
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
<strong style="margin-left:55px"><span class="style2"> Asset Group Master
    <br />
    </span></strong><br />

    <table style="margin-left:55px" class="style1">
        <tr>
            <td class="style3">
                Date</td>
            <td class="style4">
                <dx:ASPxLabel ID="lbl_date" runat="server" style="color: #0000FF">
                </dx:ASPxLabel>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Asset Group Code<span class="style5"><strong>*</strong></span></td>
            <td class="style4">
                <dx:ASPxTextBox ID="txt_assgrpcode" runat="server" Width="170px" 
                    MaxLength="2">
                </dx:ASPxTextBox>
            </td>
            <td class="style6">
                Asset Group Description<span class="style5"><strong>*</strong></span></td>
            <td>
                <dx:ASPxTextBox ID="txt_assgrpdes" runat="server" Width="170px" >
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
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
            <td class="style4">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <strong style="margin-left:55px; color: #000000; font-size: medium;">Edit/Delete Asset Group
    </strong>
   
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" style="margin-left:55px" Width="500px"
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
        DataSourceID="SqlDSAssetGroup" KeyFieldName="AssetGroupID" 
    onrowcommand="ASPxGridView1_RowCommand">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                            <DataItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text="Edit">Edit</asp:LinkButton>
                            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Delete">Delete</asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetGroupID" ReadOnly="True"  Visible="false"
                VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetGroupCode" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetGroupDescription" VisibleIndex="3">
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

    <asp:SqlDataSource ID="SqlDSAssetGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [AssetGroupID], [AssetGroupCode], [AssetGroupDescription] FROM [AssetGroupMaster]">
    </asp:SqlDataSource>

</asp:Content>

