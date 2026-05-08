<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewRegisteredCom.aspx.cs" Inherits="ViewRegisteredCom" %>

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
               <h4>  <strong>View Complaint Registration Details</strong></h4>
             <div class="col-sm-12">
                 <dx:ASPxGridView ID="ASPxGridView1" runat="server"  KeyFieldName="ComplaintID" Width="95%" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" ClientInstanceName="grid" AutoGenerateColumns="False"   OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1">
                <Columns>
                           <dx:GridViewDataTextColumn FieldName="Number" VisibleIndex="0" Caption="S.No." UnboundType="String" Visible="false">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="1" width="50px" Visible="false">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="2" width="80px" Caption="Asset ID" Visible="false">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" width="80px" Caption="Asset Number">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2" width="80px" Caption="Asset Name">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="2" width="80px">
                                <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataColumn FieldName="complaintsequence" VisibleIndex="0" Caption="Complaint ID" width="80px">
                           </dx:GridViewDataColumn>
                          <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="2" width="60px">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="3" width="60px">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="3" width="60px">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AssignedDate" VisibleIndex="3" width="60px" >
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProgressDate" VisibleIndex="3" width="60px" Caption="Resolved or Workin Progess Date">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="4" Caption="Complaint Type" width="70px">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ComplaintType" VisibleIndex="4" Caption="Type Complaint" width="70px">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
                          
                            <dx:GridViewDataTextColumn FieldName="FilePath" VisibleIndex="2"  Visible="false" width="80px">
                                 <Settings AutoFilterCondition="Contains"/>
                                 <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View" ForeColor="Green" Font-Bold="true" >View </asp:LinkButton>
                               
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
                       <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select Name as occpantname,MobileNumber,[ComplaintRegistration].Status,ServiceTypeName,[ComplaintRegistration].ComplaintID,FilePath from [dbo].[ComplaintRegistration] inner join OccupantDetails on OccupantDetails.OccupantID=ComplaintRegistration.OccupantID inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID inner join LocationMaster on LocationMaster.LocationID=OccupantDetails.LocationID where ComplaintRegistration.Status!='' and LocationMaster.LocationID=@LocationID">
                           <SelectParameters>
                         <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                     </SelectParameters>
                       </asp:SqlDataSource>--%>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                 
                 
       SelectCommand="select  EmployeeName,EmployeeID,ComplaintRegistration.AssetID,[RCBSAP].[dbo].[AssetMaster].[AssetDesc],[RCBSAP].[dbo].[AssetMaster].[MainAssetNumber],[ComplaintRegistration].Status,ComplaintTransaction.CreatedDate,ServiceTypeName,Concat(ComplaintTransaction.USR_ID+'_','C0',ComplaintTransaction.Sequence) as complaintsequence,ComplaintTransaction.ComplaintType,ComplaintTransaction.AssignedDate ,ComplaintTransaction.ProgressDate,
[ComplaintRegistration].ComplaintID,FilePath from [dbo].[ComplaintRegistration]
                 inner join [RCBSAP].[dbo].[AssetMaster] on [RCBSAP].[dbo].[AssetMaster].AssetID = ComplaintRegistration.AssetID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID 
                inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
where ComplaintRegistration.Status!='' AND ApproverID=@ApproverID  order by ComplaintTransaction.CreatedDate Desc ">
                 <SelectParameters>
                 <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
       </SelectParameters>
                           <%--<SelectParameters>
                         <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                     </SelectParameters>--%>
                       </asp:SqlDataSource>
                 
             </div>
         </div>
</asp:Content>

