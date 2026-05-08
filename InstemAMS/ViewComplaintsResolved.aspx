<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewComplaintsResolved.aspx.cs" Inherits="ViewComplaintsResolved" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
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
                   <dx:ASPxGridView ID="ASPxGridView1" runat="server" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData1" style="width:100%"
                       OnRowCommand="ASPxGridView1_RowCommand" KeyFieldName="ComplaintID"  ClientInstanceName="grid" AutoGenerateColumns="False" 
                       CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2">
                 <Columns>
                      <dx:GridViewDataTextColumn FieldName="AssetClassID" ReadOnly="True" VisibleIndex="0" Caption="Asset Class" Visible="false" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>                              
           <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1" Caption="Employee Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="2" Caption=" Complaint ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                              <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="2" Caption=" complaint Sequence" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="3" Caption="Complaint Type">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
                        <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Asset Number" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Description"  Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="4" Caption="Asset Class" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="11" Caption="Complaint Description" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="8" 
               Width="100px" caption="Complaint Date">
              
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                       <dx:GridViewDataTextColumn FieldName="ProgressDate" VisibleIndex="8" 
               Width="100px" caption="Solved Date">
               
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
          <dx:GridViewDataTextColumn FieldName="ApproverID" VisibleIndex="9" Caption="Approver ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="10" Caption="Approver Name" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
             <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="6" Caption="Engineer Remarks" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="FilePath" VisibleIndex="13" Caption="File Path" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="14" Caption="Complaint ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn  VisibleIndex="15">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="View" Font-Bold="true" ForeColor="Green" >Re_Open</asp:LinkButton>
                               
  </DataItemTemplate>
                    </dx:GridViewDataTextColumn>            
                      </Columns>
                       <SettingsPager PageSize="25" />
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
                        <SettingsPager PageSize="15"></SettingsPager>
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
                   
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand=" SELECT AssetClassID,InstemAMS..[ComplaintRegistration].ComplaintID,AssetMaster.AssetClass,ComplaintCode,FilePath,EmployeeID,MainAssetNumber,AssetDesc,EmployeeName,EmployeeDepartment,ComplaintTransaction.Status,Concat(ComplaintTransaction.USR_ID+'__','C0',ComplaintTransaction.Sequence) as complaintsequence,
                           ApproverID,ApproverName,InstemAMS..[ComplaintTransaction].Comments, InstemAMS..[ComplaintTransaction].ProgressDate,EmployeeDesignation,InstemAMS..[ServiceTypeMaster].ServiceTypeName,
                           ComplaintRegistration.CreatedDate,Complaint_Description FROM InstemAMS..[ComplaintRegistration]  
inner join InstemSAP..AssetMaster on InstemSAP..AssetMaster.AssetID=[ComplaintRegistration].AssetID
inner join InstemAMS..[ComplaintTransaction] on InstemAMS..[ComplaintTransaction].ComplaintID=InstemAMS..[ComplaintRegistration].ComplaintID
inner join InstemAMS..[ServiceTypeMaster] on InstemAMS..[ServiceTypeMaster].ServiceTypeID=ComplaintRegistration.ServiceTypeID  Where EmployeeID=@EmployeeID and  InstemAMS..[ComplaintRegistration].Status='Resolved'">
        <SelectParameters>
        <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
                       
                  </div>
             </div>
    <%--select distinct ComplaintRegistration.Status,tblUSER.USR_ID,ComplaintRegistration.CreatedDate,ComplaintCode,MobileNumber,OccupantDetails.Name,ServiceTypeName,ComplaintRegistration.ComplaintID
from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
inner join OccupantDetails on OccupantDetails.OccupantID=ComplaintRegistration.OccupantID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
inner join tblUSER on tblUSER.OccupantID=ComplaintRegistration.OccupantID
where ComplaintRegistration.Status='Resolved' and tblUSER.USR_ID=@UserID">--%>
</asp:Content>

