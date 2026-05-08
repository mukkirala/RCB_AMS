<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EngineerResolvedComplaints.aspx.cs" Inherits="EngineerResolvedComplaints" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" cssclass="container">
         <div class="row cnt_div">
              <div class="col-sm-12">
                 <h4><strong>Resolved Complaints</strong></h4>
             </div>
             <div class="col-sm-12">
                   <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData1" OnRowCommand="ASPxGridView1_RowCommand" KeyFieldName="ComplaintID" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared"  ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2">
                 <Columns>
                      <dx:GridViewDataTextColumn FieldName="Number" VisibleIndex="0" UnboundType="String" Caption="S.No" Visible="false">
                          </dx:GridViewDataTextColumn>
                      <dx:GridViewDataColumn FieldName="complaintsequence" VisibleIndex="0" Caption="Complaint ID" width="80px">
                           </dx:GridViewDataColumn>
                           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ProgressDate" VisibleIndex="5"   Caption="Solved Date">
                               <Settings AutoFilterCondition="Contains"/>
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintCode" VisibleIndex="0" Caption="Complaint Code" Visible="false">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                       <%--   <dx:GridViewDataTextColumn FieldName="MobileNumber" VisibleIndex="2">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>--%>
                          <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="3">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="4" Caption="Complaint Type">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Visible="false">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="ComplaintType" VisibleIndex="8" Caption=" Type of Complaint" width="70px">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1" Caption="Asset Number" >
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2" Caption="Asset Name" >
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
                     <Settings ShowFilterRow="true" />
                     <SettingsPager ShowDefaultImages="False">
                         <AllButton Text="All">
                         </AllButton>
                         <NextPageButton Text="Next &gt;">
                         </NextPageButton>
                         <PrevPageButton Text="&lt; Prev">
                         </PrevPageButton>
                     </SettingsPager>
                       <SettingsPager PageSize="25" />
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
                   
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="
 select ComplaintTransaction.Status,ComplaintTransaction.ProgressDate,[RCBSAP].[dbo].[AssetMaster].[AssetDesc],[RCBSAP].[dbo].[AssetMaster].[MainAssetNumber],Concat(ComplaintTransaction.USR_ID+'_','C0',ComplaintTransaction.Sequence) as complaintsequence,
 ComplaintCode,EmployeeName,ComplaintTransaction.AssignedTo,ComplaintTransaction.ComplaintType,
  ServiceTypeName,ComplaintRegistration.ComplaintID
from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
inner join [RCBSAP].[dbo].[AssetMaster] on [RCBSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
 where ComplaintTransaction.Status='Resolved'  and   RCBAMS..ComplaintTransaction.AssignedTo=@AssignedTo  order by ComplaintTransaction.ProgressDate Desc ">
                            <SelectParameters>
                         <asp:SessionParameter Name="AssignedTo" SessionField="UserID" />
                     </SelectParameters>
                       </asp:SqlDataSource>
                  </div>
             </div>
         
</asp:Content>

