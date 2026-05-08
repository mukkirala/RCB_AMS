<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ExportHistory.aspx.cs" Inherits="ExportHistory" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
     
     <style type="text/css">
        .auto-style1 {
            width: 96%;
        }
        .auto-style18 {
            font-size: medium;
        }
        .auto-style19 {
            font-size: medium;
            color: #000000;
        }
        .style3
        {
            width: 789px;
        }
        .style4
        {
            width: 188px;
        }
        .style5
        {
            width: 162px;
        }
        .style6
        {
            width: 52px;
        }
         .style9
        {
            width: 47px;
        }
        .style10
        {
            width: 988px;
           
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="col-sm-12">
        <table style="margin-right:20px">
        <tr>
            <td class="style10">
            <span><strong>View Asset Export History</strong></span>
            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />

            </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td class="style9">
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="45px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
              
            </td>       
        </tr>
        <tr></tr>
      </table>
         <br />
         <div class="table-responsive">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="SAPUpdateID" DataSourceID="SqlDataSource2" Theme="BlackGlass" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
        <Columns>
            <dx:GridViewDataColumn Caption="#" VisibleIndex="0">
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="SAPUpdateID" VisibleIndex="0"  Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Log_Message" VisibleIndex="1" Caption="Update Status">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="2" Caption="EmployeeID" Visible="false">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataDateColumn FieldName="PerformedDate" VisibleIndex="2" Caption="Updated Date">
                 <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="MainAssetNumber">
            </dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" Caption="AssetSubNumber">
            </dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="3" Caption="Location">
            </dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="3" Caption="CustodianID">
            </dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="3" Caption="Status" Visible="false">
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="3" Caption="Status">
            </dx:GridViewDataTextColumn> 
        </Columns>
        <SettingsPager PageSize="25" ShowDefaultImages="False">
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
               
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
                </dx:ASPxGridViewExporter>
         </div>
      </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT * FROM [SAPUpdateLogInfo] where Log_Message!='No changes made'">
         </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>



