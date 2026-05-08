<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewOccupantComplaintStatus.aspx.cs" Inherits="ViewOccupantComplaintStatus" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
      <script type="text/javascript">
         function button1_Click(s, e) {
             if (grid.IsCustomizationWindowVisible())
                 grid.HideCustomizationWindow();
             else
                 grid.ShowCustomizationWindow();
             UpdateButtonText();
         }
         function grid_CustomizationWindowCloseUp(s, e) {
             UpdateButtonText();
         }
         function UpdateButtonText() {
             var text = grid.IsCustomizationWindowVisible() ? "Hide" : "Show";
             text += " Customization Window";
             button1.SetText(text);
         }
      </script>
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
 
    <div class="col-sm-10"></div>
         <div class="col-sm-1">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />
             </div>
            <div class="col-sm-1">
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
               </div>
           </div>
           
              <div class="col-sm-12">
		<div class="col-sm-3">
            <dx:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="button1" Text="Show Customization Window"
                UseSubmitBehavior="False" AutoPostBack="False" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                <ClientSideEvents  Click= "button1_Click"/>
            </dx:ASPxButton>
             <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
            </div>
            </div>
            <div class="col-sm-12">
                 <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" ForeColor="Red"></dx:ASPxLabel>
            </div>
              <div class="col-sm-12">
                       <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="ComplaintID" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData"  ClientInstanceName="grid"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared"  AutoGenerateColumns="False"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2">
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
       
        <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
                      <Columns>
                           <dx:GridViewDataTextColumn FieldName="AssetClassID" ReadOnly="True" VisibleIndex="0" Caption="Asset Class" Visible="false" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>                              
           <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1" Caption="User Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="2" Visible="false" >
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
              <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="7" Caption="Engineer Remarks">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="9" 
               Width="100px" caption="Complaint Date">
              
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="ProgressDate" VisibleIndex="10" 
               Width="100px" caption="Solved Date">
              
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
          <dx:GridViewDataTextColumn FieldName="ApproverID" VisibleIndex="9" Caption="Approver ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="10" Caption="Approver Name" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                          <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="6" Caption="Complaint Description" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="2" Caption="complaint Sequence" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
                  <%--         <dx:GridViewDataTextColumn  VisibleIndex="10" Visible="false">
                <DataItemTemplate>
                    <asp:LinkButton ID="Click" runat="server" CommandName="Escalate">Escalate</asp:LinkButton>
                               
                </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn  VisibleIndex="10">
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
                            <SettingsPager PageSize="15"></SettingsPager>
                           <SettingsPager PageSize="25" />
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
                       
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand=" SELECT AssetClassID,AssetMaster.AssetClass,ComplaintRegistration.ComplaintID,EmployeeID,MainAssetNumber,AssetDesc,EmployeeName,EmployeeDepartment, Complaint_Description,ApproverID,ApproverName,EmployeeDesignation,
InstemAMS..[ServiceTypeMaster].ServiceTypeName, ComplaintTransaction.CreatedDate,ComplaintTransaction.Status,ComplaintTransaction.ProgressDate,Concat(ComplaintTransaction.USR_ID+'__','C0',ComplaintTransaction.Sequence) as complaintsequence,ComplaintTransaction.Comments,Complaint_Description FROM InstemAMS..[ComplaintRegistration] 
inner join InstemAMS..[ComplaintTransaction] on InstemAMS..[ComplaintTransaction].ComplaintID=InstemAMS..[ComplaintRegistration].ComplaintID
inner join InstemSAP..AssetMaster on InstemSAP..AssetMaster.AssetID=[ComplaintRegistration].AssetID
inner join InstemAMS..[ServiceTypeMaster] on InstemAMS..[ServiceTypeMaster].ServiceTypeID=ComplaintRegistration.ServiceTypeID  Where EmployeeID=@EmployeeID">
                                   <SelectParameters>
        <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
                  </div>
             <div class="clearfix"></div><br />
              <asp:Panel ID="Panel1" runat="server" Visible="false">
                  <div class="col-sm-12"> 
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Description" Font-Bold="true"></dx:ASPxLabel>
					</div>
                <div class="col-sm-3">
                    <dx:ASPxMemo ID="escalateremarks" runat="server" Height="100px" Width="100px"> </dx:ASPxMemo>
                </div>
             
                </div>
            			 <div class="col-sm-12">
                
                <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_save" runat="server" Text="Submit" Width="100px" Onclick="btn_save_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>
            </div>
              </asp:Panel>
             </div>
         </div> 
    <%--select distinct ComplaintRegistration.Status,ComplaintRegistration.CreatedDate,ComplaintCode,MobileNumber,OccupantDetails.Name,ServiceTypeName,ComplaintRegistration.ComplaintID
from ComplaintRegistration
inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID
inner join OccupantDetails on OccupantDetails.OccupantID=ComplaintRegistration.OccupantID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
inner join tblUSER on tblUSER.OccupantID=ComplaintRegistration.OccupantID
where tblUSER.USR_ID=@UserID">--%>
</asp:Content>


