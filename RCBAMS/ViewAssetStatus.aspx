<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAssetStatus.aspx.cs" Inherits="ViewAssetStatus" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="col-sm-12">

         <strong><span>View Asset Requests Status</span></strong><br /><br />
          <table>
              <tr>
                  <td style="width:100px">
                       <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Select Request">
                       </dx:ASPxLabel>
                  </td>
                  <td>
                      <dx:ASPxComboBox ID="cmb_selectReqtype" IncrementalFilteringMode="Contains" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnSelectedIndexChanged="cmb_selectReqtype_SelectedIndexChanged" AutoPostBack="true" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
                  </td>
              </tr>
          </table>
         

    <br />

  <strong><span>Asset Details</span></strong>
 <div class="table-responsive" runat="server" id="AllRequests">
      <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="MainAssetNumber"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetID"  VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="2" Caption="AssetSubNumber">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="3"  Caption="AssetDesc">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetStatus" VisibleIndex="4" >
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="5" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestBy" VisibleIndex="6" Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustDepartmentCode" VisibleIndex="7" Caption="DepartmentCode">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="8" Caption="Department">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="9" Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
                     
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="11" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
           
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
<br />

  <div class="table-responsive" runat="server" visible="false" id="Assetrequests">
      <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
          style="width:100%"
        DataSourceID="SqlDataSource3" KeyFieldName="AssetRequestID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
               <dx:gridviewdatatextcolumn FieldName="Edit" VisibleIndex="0" Visible="false">
                 <DataItemTemplate>
                   <asp:LinkButton ID="btnlink" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton>
                 </DataItemTemplate>
               </dx:gridviewdatatextcolumn>
              <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
          
           <dx:GridViewDataTextColumn FieldName="AssetTypeName"  VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
        
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestBy" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustDepartmentCode" ReadOnly="True" VisibleIndex="5"  Caption="DepartmentCode" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="5"  Caption="Department" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="5"  Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestedQuantity"  VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="7" >
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>        
            
            <dx:GridViewDataTextColumn FieldName="RequestStatus" VisibleIndex="8" Caption="Status">
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
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
                     <TotalSummary >
                                <dx:ASPxSummaryItem FieldName="AssetTypeName"  SummaryType="Count"/>
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

       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT  AssetRequestID,AssetTypeName,EmployeeAssetRequest.MainAssetNumber,EmployeeID,RequestBy,CustodianDepartment,CustDepartmentCode,CustDesignation,Quantity as RequestedQuantity,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,ApprovedQuantity,ApproverComments,EmployeeAssetRequest.Status as RequestStatus,Date from RCBAMS..EmployeeAssetRequest inner join RCBSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID where [EmployeeAssetRequest].Status in('Request Sent To Admin','Rejected') order by AssetRequestID desc">
       
        </asp:SqlDataSource>
  
    
           </div>


</div>
</asp:Content>
