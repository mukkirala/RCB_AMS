<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ResolvedComplaints.aspx.cs" Inherits="ResolvedComplaints" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container">
         <div class="row cnt_div">
              <div class="col-sm-12">
                 <h4><strong>Resolved Complaints</strong></h4>
             </div>
             <div class="col-sm-12">
                   <dx:ASPxGridView ID="ASPxGridView1" runat="server" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData1" OnRowCommand="ASPxGridView1_RowCommand" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" KeyFieldName="ComplaintID"  ClientInstanceName="grid" AutoGenerateColumns="False" width="95%" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2">
                 <Columns>
                      <dx:GridViewDataTextColumn FieldName="Number" VisibleIndex="0" UnboundType="String" Caption="S.No" Visible="false">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="8" >
                               <Settings AutoFilterCondition="Contains"/>
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Caption="ComplaintID" Visible="false">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1" width="80px" Caption="Asset Number">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2" width="80px" Caption="Asset Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="0" Caption="Complaint ID">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="5" Caption="Assignd Engineer Name">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn FieldName="AssignedTo" VisibleIndex="4" Caption="Assignd Engineer ID">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ProgressDate" VisibleIndex="6" Caption="Rsolved Date" >
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="1" Caption="Complainyt Type">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="5" Visible="false">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn  VisibleIndex="10">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View" Visible="false">Open</asp:LinkButton>
                               
  </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                      </Columns>
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
                       <SettingsPager PageSize="25" />
                     <Settings ShowFilterRow="true" />
                     <SettingsPager ShowDefaultImages="False">
                         <AllButton Text="All">
                         </AllButton>
                         <NextPageButton Text="Next &gt;">
                         </NextPageButton>
                         <PrevPageButton Text="&lt; Prev">
                         </PrevPageButton>
                     </SettingsPager>
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
                   
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="
select ComplaintRegistration.Status,ComplaintRegistration.CreatedDate,ComplaintTransaction.AssignedTo,ComplaintCode,Concat(ComplaintTransaction.USR_ID+'_','C0',ComplaintTransaction.Sequence) as complaintsequence,CustodianMaster.CustodianName,[InstemSAP].[dbo].[AssetMaster].[AssetDesc],[InstemSAP].[dbo].[AssetMaster].[MainAssetNumber],ComplaintTransaction.ProgressDate,
  ServiceTypeName,ComplaintRegistration.ComplaintID
from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
                 inner join [InstemSAP].[dbo].[AssetMaster] on [InstemSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
                           inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintTransaction.AssignedTo
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID

 where ComplaintRegistration.Status='Resolved' and ComplaintTransaction.Status='Resolved' and  ApproverID=@ApproverID">
                            <SelectParameters>
                         <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
                     </SelectParameters>
                       </asp:SqlDataSource>
                  </div>
             </div>
         
</asp:Content>

