<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewPendingComplaints.aspx.cs" Inherits="AdminViewPendingComplaints" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
         <div class="row cnt_div">
               <h4>  <strong>View Complaint Registration Details</strong></h4>
              <h5>  <strong>Pending Complaints</strong></h5>
            
              <div class="col-sm-12">
                       <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ComplaintTransactionID" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnRowCommand="ASPxGridView1_RowCommand"  ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1"   Width="95%">
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
       
        <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
                      <Columns>
                           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="5">
                           </dx:GridViewDataTextColumn>
                          <dx:GridViewDataColumn FieldName="complaintsequence" VisibleIndex="0" Caption="Complaint ID">
                           </dx:GridViewDataColumn>
                            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2"  Visible="true" Caption="Asset Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1"  Visible="true" Caption="Asset Number">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="7" Caption="Remarks">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintType" VisibleIndex="7" Caption="Type of Complaint">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="1" Visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="3">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="2" Caption="Complaint Type">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Visible="false">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="4" Caption="Complaint Description">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn  VisibleIndex="10">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View" ForeColor="Green" Font-Bold="true" Width="70px" >View </asp:LinkButton>
                               
                </DataItemTemplate>
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
                            <SettingsPager PageSize="25"></SettingsPager>
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
                  </dx:ASPxGridView>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString=
                           "<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="
select ComplaintTransaction.Status,ComplaintTransaction.CreatedDate,ComplaintTransaction.ComplaintTransactionID,ComplaintRegistration.EmployeeName,ComplaintTransaction.Remarks,Concat(ComplaintTransaction.USR_ID+'__','C0',ComplaintTransaction.Sequence) as complaintsequence,[InstemSAP].[dbo].[AssetMaster].[AssetDesc],[InstemSAP].[dbo].[AssetMaster].[MainAssetNumber],ComplaintTransaction.ComplaintType,
 ComplaintRegistration.Complaint_Description,ServiceTypeName,ComplaintRegistration.ComplaintID from ComplaintRegistration 
 inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
 inner join [InstemSAP].[dbo].[AssetMaster] on [InstemSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
 inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
where (ComplaintTransaction.Status='Pending'or ComplaintTransaction.Status='Re_open') order by ComplaintTransaction.CreatedDate Desc ">
                           
                           <%--  <SelectParameters>
                         <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
                     </SelectParameters>--%>
                       <%--    <SelectParameters>
                         <asp:SessionParameter Name="ComplaintTransactionID" SessionField="ComplaintTransactionID" />
                     </SelectParameters>--%>
                       </asp:SqlDataSource>
                  </div>

         <div class="col-sm-12"><br/></div> 
                <h5>  <strong> Assiged Complaints</strong></h5>
              <div class="col-sm-12">
                       <dx:ASPxGridView ID="ASPxGridView2" runat="server" Width="95%"   KeyFieldName="ComplaintID" OnRowCommand="ASPxGridView2_RowCommand"  ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2">
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
       
        <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
                      <Columns>
                           <dx:GridViewDataTextColumn FieldName="AsnStatus" VisibleIndex="5" Visible="false">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="8" Visible="false">
                           </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="AssignedDate" VisibleIndex="5">
                           </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2"  Visible="true" Caption="Asset Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1"  Visible="true" Caption="Asset Number">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintCode" VisibleIndex="0" Caption="Complaint Code" Visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="7" Visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="7" Visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="2">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="1" Caption="Complaint Type">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="AssignedTo" VisibleIndex="4">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Visible="false">
                          </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="0" Visible="true" Caption="Complaint ID">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="6" Visible="true">
                          </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ComplaintType" VisibleIndex="6" Visible="true" Caption="Type of Complaint ">
                          </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="3" Caption="Complaint Description" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                         <%--   <dx:GridViewDataTextColumn  VisibleIndex="10">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View">View </asp:LinkButton>
                               
                </DataItemTemplate>
                    </dx:GridViewDataTextColumn>--%>

                      </Columns>
                 <SettingsPager ShowDefaultImages="False">
                     <AllButton Text="All">
                     </AllButton>
                     <NextPageButton Text="Next &gt;">
                     </NextPageButton>
                     <PrevPageButton Text="&lt; Prev">
                     </PrevPageButton>
                 </SettingsPager>
                            <SettingsPager PageSize="25"></SettingsPager>
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
                  </dx:ASPxGridView>
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="
select ComplaintTransaction.AsnStatus,ComplaintTransaction.Remarks,ComplaintTransaction.AssignedDate,ComplaintRegistration.CreatedDate,
ComplaintCode,EmployeeName,ServiceTypeName,ComplaintTransaction.ApproverComments,ComplaintRegistration.Complaint_Description,ComplaintTransaction.AssignedTo,Concat(ComplaintTransaction.USR_ID+'__',ComplaintTransaction.Sequence) as complaintsequence,[InstemSAP].[dbo].[AssetMaster].[AssetDesc],[InstemSAP].[dbo].[AssetMaster].[MainAssetNumber],ComplaintRegistration.ComplaintID,ComplaintTransaction.ComplaintType from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
                           inner join [InstemSAP].[dbo].[AssetMaster] on [InstemSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
 where  ComplaintTransaction.AsnStatus='Assign' ">
                           
                            <%-- <SelectParameters>
                         <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
                     </SelectParameters>--%>
                           <%--<SelectParameters>
                               <asp:SessionParameter Name="ComplaintTransactionID" SessionField="ComplaintTransactionID"/>
                           </SelectParameters>--%>
                       </asp:SqlDataSource>
                  </div>

            
             </div>
         </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

