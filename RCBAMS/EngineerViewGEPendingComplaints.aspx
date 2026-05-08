<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EngineerViewGEPendingComplaints.aspx.cs" Inherits="EngineerViewGEPendingComplaints" %>

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
               <h4>  <strong>View Complaint Registration Details</strong></h4>
              <h5>  <strong>Pending Complaints</strong></h5>
            
              <div class="col-sm-12">
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
                           <dx:GridViewDataTextColumn FieldName="ComplaintCode" VisibleIndex="0" Caption="Complaint ID">
                          </dx:GridViewDataTextColumn>
                      <%--    <dx:GridViewDataTextColumn FieldName="MobileNumber" VisibleIndex="2">
                          </dx:GridViewDataTextColumn>--%>
                          <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="3">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="5" Visible="false">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="7" Caption="Complaint Description">
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
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString=
                           "<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="
select ComplaintRegistration.Status,ComplaintRegistration.CreatedDate,ComplaintCode,EmployeeName,ComplaintTransaction.AssignedTo,
 Complaint_Description,
ServiceTypeName,ComplaintRegistration.ComplaintID from ComplaintRegistration 
                           inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
 inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
where ComplaintRegistration.Status='Pending' and ComplaintTransaction.Status='Pending' and AssignedTo=@AssignedTo">
                           
                             <SelectParameters>
                         <asp:SessionParameter Name="AssignedTo" SessionField="UserID" />
                     </SelectParameters>
                          <%-- <SelectParameters>
                         <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                     </SelectParameters>--%>
                       </asp:SqlDataSource>
                  </div>

       <%--  <div class="col-sm-12"><br/></div> 
                <h5>  <strong>Work In Progress</strong></h5>--%>
          <%--   <div class="col-sm-12">
                       <dx:ASPxGridView ID="ASPxGridView2" runat="server" KeyFieldName="ComplaintID" OnRowCommand="ASPxGridView2_RowCommand" OnCustomUnboundColumnData="ASPxGridView2_CustomUnboundColumnData" ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2">
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
                          </dx:GridViewDataTextColumn>--%>
                        <%--  <dx:GridViewDataTextColumn FieldName="MobileNumber" VisibleIndex="2">
                          </dx:GridViewDataTextColumn>--%>
                        <%--   <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="3">
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="5" Visible="false">
                          </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="7" Caption="Complaint Description">
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
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="
select ComplaintRegistration.Status,ComplaintRegistration.CreatedDate,ComplaintCode,EmployeeName,ServiceTypeName,ComplaintRegistration.Complaint_Description,ComplaintTransaction.AssignedTo,
                           ComplaintRegistration.ComplaintID
from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
 where ComplaintRegistration.Status='Work In Progress' and ComplaintTransaction.Status='Work In Progress' and AssignedTo=@AssignedTo">
                           
                             <SelectParameters>
                         <asp:SessionParameter Name="AssignedTo" SessionField="UserID" />
                     </SelectParameters>
                           <%--<SelectParameters>
                               <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                  </div>--%>

            
             </div>
         </div>
</asp:Content>

