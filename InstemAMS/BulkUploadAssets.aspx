<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BulkUploadAssets.aspx.cs" Inherits="BulkUploadAssets" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxLabel ID="label" runat="server" Text="" ForeColor="Red" Font-Size="Medium" Font-Bold="true" ></dx:ASPxLabel>
    <br />
    <h4><strong>BULK UPLOAD ASSETS</strong></h4>
    <br />
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Download Format"  Font-Bold="true"  Font-Size="Medium" Width="204px"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxButton ID="download" runat="server" OnClick="download_Click" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                    <Image Url="Images/Download.jpeg" Width="40px" Height="40px"></Image>
                </dx:ASPxButton>
                <br />
            </td>
            <td class="auto-style2"></td>

        </tr>
        &nbsp;&nbsp;
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Upload Assets"  Font-Size="Medium" Font-Bold="true" ></dx:ASPxLabel>
            </td>
              <td>
                <%--<dx:ASPxUploadControl ID="upload_excel" runat="server" Width="185px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"></dx:ASPxUploadControl>--%>
                <dx:ASPxUploadControl ID="upload_excel" runat="server" 
                                    CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" Width="287px" >
                </dx:ASPxUploadControl>
                <br />
                </td>
            <td class="auto-style2">&nbsp;</td>

        </tr>
        &nbsp;&nbsp;
        <tr>
            <td></td>
            <td>
                <dx:ASPxButton ID="save" runat="server" Text="Save" Width="116px" OnClick="save_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
                <br />
            </td>
            <td class="auto-style2"></td>

        </tr>
        &nbsp;&nbsp;
    </table>
    <br />
    
    
    <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="SLNO"    MaxColumnWidth="100"   width="100%"        
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="SLNO"  ReadOnly="True" Width="35" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="1" Caption="Company">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="2" Caption="Plant">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="3" Caption="Supplier Name">
   </dx:GridViewDataTextColumn>--%>
 <%--<dx:GridViewDataTextColumn FieldName="InstituteName" VisibleIndex="3">
   </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Equipment Number" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="5" Caption="Sub AssetNumber " Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="7" Caption="Asset Owner" Width="180" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="8"  Caption="Asset User" Width="180">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="9" Width="140"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="10" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="11" Caption="Serial Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="MACID" VisibleIndex="12" Width="150" Caption="MAC ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="15" Width="180" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="14" Width="140" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="16" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="17" Caption="Model" Width="140">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="16" Caption="Make">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Cost" VisibleIndex="17" Caption="Cost">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GRNumber" VisibleIndex="18" Width="80px" Caption="GR Number">
               <%-- <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="YearofPurchase" VisibleIndex="19" Width="80px" Caption="Year of Purchase">
              <%--  <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn FieldName="CapitalizationDate" VisibleIndex="20" Caption="Capitalization Date" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="21" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="CostCenter" VisibleIndex="22" Caption="Cost Center" Width="80px">
               <%-- <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaterialNumber" VisibleIndex="23" Caption="Material Number" Width="80px" Visible="false">
            <%--    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AcceptDatebyUser" VisibleIndex="24" Caption="Accept Date by User">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="25" Caption="PO No for Reference">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="WBSNumberforReference" VisibleIndex="26" Caption="WBS Number for Reference" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="InstallationDateforReference" VisibleIndex="27" Caption="Installation Date for Reference">
                 <Settings AutoFilterCondition="Contains" />
                       <%-- <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' 
                                Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>--%>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Code" VisibleIndex="28" Caption="Code">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn> 
            <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="29" Caption="Creation Date" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="30" Caption="Remark">
                <Settings AutoFilterCondition="Contains" />
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
        <SettingsPager PageSize="20" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowHorizontalScrollBar="true" ShowFooter="true"/>
          <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
        </TotalSummary>
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="Select * from  AssetMaster 
        "></asp:SqlDataSource>                                     
    
</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style2 {
            width: 758px;
        }
    </style>
</asp:Content>



