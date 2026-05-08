<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewRegisteredCom.aspx.cs" Inherits="AdminViewRegisteredCom" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container">
         <div class="row cnt_div">
               <h4>  <strong>View Complaint Registration Details</strong></h4>
             <div class="col-sm-12">
                 <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ComplaintID" Width="95%" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" ClientInstanceName="grid" AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1">
                <Columns>
                           <dx:GridViewDataTextColumn FieldName="Number" VisibleIndex="0" Caption="S.No." UnboundType="String" Visible="false">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="2">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="2">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                         
                          <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="11">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="4" Caption="Type of Service">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="5"  Visible="false">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ApproverID" VisibleIndex="6"  Visible="true" >
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="7"  Visible="true" Caption="Approver Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="9"  Visible="true" Caption="Assigned Engineer Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="8"  Visible="true" Caption="Assigned Engineer ID">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="0"  Visible="true" Caption="Complaint ID">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="1"  Visible="true" Caption="Asset Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="0"  Visible="true" Caption="Asset Number">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FilePath" VisibleIndex="10"  Visible="false">
                                 <Settings AutoFilterCondition="Contains"/>
                                 <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View">View </asp:LinkButton>
                               
                </DataItemTemplate>
                          </dx:GridViewDataTextColumn>
                          <%-- <dx:GridViewDataTextColumn  VisibleIndex="10">
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
                       <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="select Name as occpantname,MobileNumber,[ComplaintRegistration].Status,ServiceTypeName,[ComplaintRegistration].ComplaintID,FilePath from [dbo].[ComplaintRegistration] inner join OccupantDetails on OccupantDetails.OccupantID=ComplaintRegistration.OccupantID inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID inner join LocationMaster on LocationMaster.LocationID=OccupantDetails.LocationID where ComplaintRegistration.Status!='' and LocationMaster.LocationID=@LocationID">
                           <SelectParameters>
                         <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                     </SelectParameters>
                       </asp:SqlDataSource>--%>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
                 
                 
       SelectCommand="
  select Distinct  EmployeeName,EmployeeID,[ComplaintTransaction].Status,ServiceTypeName,[ComplaintRegistration].ComplaintID,[ComplaintRegistration].ApproverID,[ComplaintRegistration].ApproverName,CustodianMaster.CustodianName,CustodianMaster.CustodianID,Concat(ComplaintTransaction.USR_ID+'__','C0',ComplaintTransaction.Sequence) as complaintsequence,[InstemSAP].[dbo].[AssetMaster].[AssetDesc],[InstemSAP].[dbo].[AssetMaster].[MainAssetNumber],FilePath from [dbo].[ComplaintRegistration]
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
left join CustodianMaster on CustodianMaster.CustodianID=ComplaintTransaction.AssignedTo
 inner join [InstemSAP].[dbo].[AssetMaster] on [InstemSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID where ComplaintTransaction.ComplaintType is NULL">
          <%--       select  EmployeeName,EmployeeID,[ComplaintRegistration].Status,ServiceTypeName,
[ComplaintRegistration].ComplaintID,FilePath from [dbo].[ComplaintRegistration]

inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID 
where ComplaintRegistration.Status!=''--%>
                           <%--<SelectParameters>
                         <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                     </SelectParameters>--%>
                       </asp:SqlDataSource>
                 
             </div>
         </div>

</asp:Content>


