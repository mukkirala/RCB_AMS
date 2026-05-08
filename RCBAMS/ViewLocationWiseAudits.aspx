<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewLocationWiseAudits.aspx.cs" Inherits="ViewLocationWiseAudits" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 120px;
        }
        
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
            font-size: medium;
            color: #000000;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
<h4> <strong><span>
    Audit Details As Per Location<br /></span></strong></h4>
     <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
    <table>
        <tr>
            <td class="style2" style="font-size:medium">
                Select Location </td>
            <td class="style3">                
               <dx:ASPxGridLookup ID="ASPxComboBox1" runat="server"
                    AutoGenerateColumns="False" DataSourceID="LocationSqlDataSource" TextFormatString="{2}" Width="170px" Height="25px"
                    KeyFieldName="LocationID" IncrementalFilteringMode="Contains"   CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                      <%--  <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                    <Settings></Settings>
                    </GridViewProperties>
                
                    <Columns>
                         <dx:GridViewDataTextColumn FieldName="LocationID"  VisibleIndex="0" visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LocationCode"  VisibleIndex="3"  Caption="LAB">
                            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="2" Caption="Floor" >
                        </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="1" Caption="Wing" >
                     </dx:GridViewDataTextColumn>
                    </Columns>
                    <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </GridViewImages>
                    <GridViewImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanel>
                    </GridViewImagesFilterControl>
                    <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                        </Header>
                    </GridViewStyles>
                    <GridViewStylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </GridViewStylesEditors>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxGridLookup>
            </td>
       
            <td>
                 <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                    OnClick="btn_search_Click" Width="16px" Height="16px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
            </td>
        </tr>
      
        </table>
     
 
    <table style="margin-right:15px">
        <tr>
            <td class="style10">
            
            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />

            </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
               
            </td>
            <td>

            </td>
        </tr>
    </table>
  <div class="table-responsive" runat="server">
    <dx:ASPxGridView ID="ASPxGridView2"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="AssetID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" >
       <Columns>
            <dx:GridViewDataTextColumn FieldName="AuditDetailsID" Visible="false" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID"   VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3"  Caption="Sub Number" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
           <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="6" Caption="Wing">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>  
           <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="6" Caption="Floor">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="6" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="7" Caption="EmployeeID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
        <%--<dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="8" Caption="AuditLocation">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
              <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
           <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
          <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="11">
              <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
          </dx:GridViewDataDateColumn> 
             <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="12">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="13">
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
        <Settings  ShowFooter="true" ShowFilterRow="true"/>
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
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
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
     
    <br />

 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView2" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
  </dx:ASPxGridViewExporter>
  <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>"
      SelectCommand="select AuditDetails.AuditDetailsID, AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
AssetMaster.AssetDesc,AssetMaster.AssetClass,LocationMaster.Location ,AuditMaster.AuditDate, AuditDetails.AuditStatus,
AuditDetails.AuditBy,AuditMaster.AuditName,AssetMaster.CustodianID,AssetMaster.BLOCK,AssetMaster.LocationDesc,AuditDetails.Status  from InstemAMS..AuditDetails 
inner join InstemAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
inner join InstemSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
inner join InstemAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID where AuditMaster.LocationID=@LocationID">
   <SelectParameters>
       <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
   </SelectParameters>  
  </asp:SqlDataSource>                                     
  
    <asp:SqlDataSource ID="LocationSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT [LocationID], [LocationCode],[Location],Block FROM [LocationMaster]">
    </asp:SqlDataSource>
</div>
</asp:Content>


