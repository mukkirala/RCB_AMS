<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PendingComplaints.aspx.cs" Inherits="PendingComplaints" %>
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
              <h4>  <strong>Complaints Work in Progress</strong></h4>
                   <div class="col-sm-12">
                   <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ComplaintID" Width="95%" OnRowCommand="ASPxGridView1_RowCommand" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1">
                <Columns>
                           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                                 <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="4">
                                 <Settings AutoFilterCondition="Contains"/>
                           </dx:GridViewDataDateColumn>
                                                   <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" width="80px" Caption="Asset Number">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2" width="80px" Caption="Asset Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Caption="Complaint ID" Visible="false">
                                 <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="5" Caption="Assignd Engineer Name">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn FieldName="AssignedTo" VisibleIndex="4" Caption="Assignd Engineer ID">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ProgressDate" VisibleIndex="6" Caption="Working in Progress">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="2" Visible="false">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="1" Caption="Complaint Type">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="0" Visible="true" Caption="Complaint ID">                   
                          </dx:GridViewDataTextColumn>
                           <%--<dx:GridViewDataTextColumn  VisibleIndex="10">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View">View </asp:LinkButton>
                               
                </DataItemTemplate>
                    </dx:GridViewDataTextColumn>--%>

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
                        <SettingsPager PageSize="25"></SettingsPager>
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
            
<%--              <div class="col-sm-12">
                       <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ComplaintID" OnRowCommand="ASPxGridView1_RowCommand" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1">
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
       
        <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
                      <Columns>
                           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="5">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="4">
                           </dx:GridViewDataDateColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintCode" VisibleIndex="0" Caption="Complaint Code">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="MobileNumber" VisibleIndex="2">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="3">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="5" Visible="false">
                          </dx:GridViewDataTextColumn>
                        <%--   <dx:GridViewDataTextColumn  VisibleIndex="10">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View">View </asp:LinkButton>
                               
                </DataItemTemplate>
                    </dx:GridViewDataTextColumn>--%>

                      <%--</Columns>
                 <SettingsPager ShowDefaultImages="False">
                     <AllButton Text="All">
                     </AllButton>
                     <NextPageButton Text="Next &gt;">
                     </NextPageButton>
                     <PrevPageButton Text="&lt; Prev">
                     </PrevPageButton>
                 </SettingsPager>
                      <Settings ShowFilterRow="True" />
                 <SettingsCustomizationWindow Enabled="True" Height="250px" 
            PopupHorizontalOffset="200" PopupVerticalOffset="100" Width="250px" 
            PopupVerticalAlign="TopSides" />
		  <SettingsLoadingPanel Mode="ShowOnStatusBar" />
       
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
                  </dx:ASPxGridView>--%>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="
select ComplaintRegistration.Status,ComplaintRegistration.CreatedDate,ComplaintCode,EmployeeName,[InstemSAP].[dbo].[AssetMaster].[AssetDesc],[InstemSAP].[dbo].[AssetMaster].[MainAssetNumber],ServiceTypeName,CustodianMaster.CustodianName,ComplaintTransaction.AssignedTo,ComplaintTransaction.ProgressDate,Concat(ComplaintTransaction.USR_ID+'__','C0',ComplaintTransaction.Sequence) as complaintsequence,ComplaintRegistration.ComplaintID
from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
                 inner join [InstemSAP].[dbo].[AssetMaster] on [InstemSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
                           inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintTransaction.AssignedTo

inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
                           where ComplaintRegistration.Status='Work In Progress' and ComplaintTransaction.Status='Work In Progress' and  ApproverID=@ApproverID

">
                             <SelectParameters>
                         <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
                     </SelectParameters>
                       </asp:SqlDataSource>
                  </div>
          </div>

 
</asp:Content>

