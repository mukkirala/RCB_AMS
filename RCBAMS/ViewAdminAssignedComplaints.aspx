<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAdminAssignedComplaints.aspx.cs" Inherits="ViewAdminAssignedComplaints" %>

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
          <div class="row cnt_div">
               <h4>  <strong>View  Admin Assigned Complaints</strong></h4>
              <div class="col-sm-12">
                       <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ComplaintID" OnRowCommand="ASPxGridView1_RowCommand" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1">
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
             
       
        <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
                      <Columns>
                           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6" visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="1" visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2" Caption="Asset Name" >
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="7" visible="false">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataDateColumn FieldName="AssignedDate" VisibleIndex="5">
                           </dx:GridViewDataDateColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Caption="Complaint ID">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" visible="false">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="4">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="8" Visible="false">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="3" Caption="Complaint Description">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn  VisibleIndex="10">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View">View </asp:LinkButton>
                               
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
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select ComplaintTransaction.Status,AssetMaster.AssetDesc,ComplaintRegistration.AssetID,
                           ComplaintRegistration.EmployeeID,CustodianMaster.email,ComplaintTransaction.ComplaintID,ComplaintTransaction.AssignedDate,
                           ComplaintRegistration.ComplaintCode,ServiceTypeName,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,ComplaintRegistration.EmployeeName,
                           ComplaintTransaction.Remarks from ComplaintTransaction 
                           inner join ComplaintRegistration on ComplaintRegistration.ComplaintID=ComplaintTransaction.ComplaintID 
                           inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
                           inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintRegistration.EmployeeID 
                           inner join RCBSAP..AssetMaster on AssetMaster.AssetID=ComplaintRegistration.AssetID where ComplaintTransaction.Status='Assign'">
   <%--                       <SelectParameters>
        <asp:SessionParameter Name="ComplaintID" SessionField="ComplaintID" />
        </SelectParameters>
                                <SelectParameters>
                         <asp:SessionParameter Name="AssignedTo" SessionField="UserID" />
                     </SelectParameters>--%>
                       </asp:SqlDataSource>
                  </div>
          </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

