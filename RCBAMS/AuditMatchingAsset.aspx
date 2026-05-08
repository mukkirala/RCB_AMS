<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AuditMatchingAsset.aspx.cs" Inherits="AuditMatchingAsset" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 97px;
        }
        .auto-style4 {
            width: 97px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 209px;
        }
        .auto-style7 {
            height: 23px;
            width: 209px;
        }
        .auto-style8 {
            width: 106px;
        }
        .auto-style9 {
            height: 23px;
            width: 106px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container">
 <table class="auto-style1">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="4">
                <legend><strong>Audit Assets By Location :</strong></legend>
            </td>
        </tr>
       <tr>
            <td class="auto-style3">
                <asp:Label ID="lbl_Location" runat="server" Text="Select Location :"></asp:Label>
            </td>
            <td class="auto-style6">
                <dx:ASPxComboBox ID="cmb_location" AutoPostBack="True" TextField="Location" ValueField="LocationID" runat="server" Width="170px" Height="25px" DataSourceID="SqlDataSource1" ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style8">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Audit :">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cmb_AuditID" runat="server" Height="25px" Width="170px" TextField="AuditName" ValueField="AuditID" AutoPostBack="True" DataSourceID="AuditdetailsDS" ValueType="System.String" OnSelectedIndexChanged="cmb_AuditID_SelectedIndexChanged" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="AuditdetailsDS" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT  AuditMaster.AuditID, AuditMaster.AuditName,LocationMaster.LocationID FROM AuditMaster INNER JOIN LocationMaster ON AuditMaster.LocationID = LocationMaster.LocationID where AuditMaster.LocationID=@LocationID" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb_location"  Name="LocationID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style7"></td>
            <td class="auto-style9"></td>
            <td class="auto-style5"></td>
        </tr>
     </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [LocationID],[Location] FROM  [RCBAMS]..[LocationMaster]">

    </asp:SqlDataSource>

     
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
        <Columns>           
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="QRCode" VisibleIndex="2">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>      
            <dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
                        <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4">
                 <Settings AutoFilterCondition="Contains" />                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="5">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="6">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="7">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditDate" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
          </div>
</asp:Content>

