<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestCustodianChange.aspx.cs" Inherits="RequestCustodianChange" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style>
    .form_div{
           margin-top:10px;
           /*//margin-left:2px;*/
         }
       
         .back-bg {
            margin: 20px 30px;
            border: 2px solid rgb(199, 212, 220);
            padding: 15px 0;
     }
</style>
    <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" cssclass="container">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
    <div class="col-sm-12">
      <h4><strong><span>Request For Employee Change</span></strong></h4>
    <div class="">
        <div class="row">
        <div style="">
             <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel>
                 </div>
            </div>
            <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Staff Number:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="User Name:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                  <div class="row form_div">
                
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Department:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                 <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Designation:" Font-Size="Large"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                 <div class="row form_div">
                         
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Email:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="lblmail" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Reporting Authority:" Font-Size="Large" Visible="false"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_auth" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                <div class="row form_div">
               
                <div class="col-sm-2">
                     
                </div>
                <div class="col-sm-4">
                     
                </div>
                </div>
            </div>
            <br />
             <div class="clearfix"></div>
            <hr />
            <br />
            <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Asset" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                  <%--  <dx:ASPxComboBox ID="cmb_Assetname" runat="server" DataSourceID="SqlDataSource1" ValueField="AssetID" TextField="MainAssetNumber"></dx:ASPxComboBox>--%>
                      <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="SqlDataSource1" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                     KeyFieldName="AssetID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px" OnInit="gridlkup_Asset_Init">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="15"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                                              
                        <dx:gridviewdatatextcolumn FieldName="AssetID" VisibleIndex="1" visible="false">
                        </dx:gridviewdatatextcolumn>
						 <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                        </dx:gridviewdatatextcolumn>
						 <dx:gridviewdatatextcolumn FieldName="AssetSubNumber" VisibleIndex="3" Caption="SubNumber" Visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name">
                        </dx:gridviewdatatextcolumn>
                        
                    </Columns>
                     <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                         <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                         </LoadingPanelOnStatusBar>
                         <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                         </LoadingPanel>
                     </GridViewImages>
                     <GridViewImagesFilterControl>
                         <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                         </LoadingPanel>
                     </GridViewImagesFilterControl>
                     <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                         <Header ImageSpacing="10px" SortingImageSpacing="10px">
                         </Header>
                     </GridViewStyles>
                     <GridViewStylesEditors>
                         <CalendarHeader Spacing="11px">
                         </CalendarHeader>
                         <ProgressBar Height="25px">
                         </ProgressBar>
                     </GridViewStylesEditors>
                     <ValidationSettings>
                         <ErrorFrameStyle ImageSpacing="4px">
                             <ErrorTextPaddings PaddingLeft="4px" />
                         </ErrorFrameStyle>
                     </ValidationSettings>
                </dx:ASPxGridLookup>

                </div>
                 <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    
                    OnClick="btn_search_Click" Width="20px" Height="25px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
                     </div>
            </div>
            
             <div class="clearfix"></div>
            
             <div class="clearfix"></div>
                 
          <div id="AssetDetails"  runat="server" visible="false">
                 
                  <div class="row">  
                  <div class="col-sm-12"> 
                  <div class="col-sm-12">  
                <%--  <strong>  <label>Asset Details:</label> </strong>--%>
                 
               </div>      
             </div>       
        
   </div>
         <div class="row">  
          
               <div class="row back-bg">
             

         <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2">
               <dx:ASPxLabel ID="Label1" runat="server" Text="Equipment Number:" Font-Size="Large"></dx:ASPxLabel>
              
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" FForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
               <dx:ASPxLabel ID="Label2" runat="server" Text="Sub Number:" Font-Size="Large"></dx:ASPxLabel>
               
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_SubNumber" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2">
              <dx:ASPxLabel ID="Label3" runat="server" Text="Asset Class:" Font-Size="Large"></dx:ASPxLabel>
               
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" FForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2">
                <dx:ASPxLabel ID="Label4" runat="server" Text="Asset Name:" Font-Size="Large"></dx:ASPxLabel>
             
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2">
           <dx:ASPxLabel ID="Label5" runat="server" Text="Asset Wing:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
               <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Asset Floor:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
                      <dx:ASPxLabel ID="lbl_Block" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
         </div>
     </div>
</div>
</div>
</div>
</div> 
            
             <div class="col-sm-10">
              <div class="row">
                <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Select Employee" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">             
                         <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="300px" Height="25px"
                    KeyFieldName="CustodianID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                        <SettingsPager PageSize="15"></SettingsPager>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0" >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1" >
                        </dx:GridViewDataTextColumn>
                                           
                    </Columns>
                    <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </GridViewImages>
                   
                    <GridViewImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanel>
                    </GridViewImagesFilterControl>
                    <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                        </Header>
                    </GridViewStyles>
                    <GridViewStylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </GridViewStylesEditors>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxGridLookup>
                 
                 <asp:SqlDataSource ID="CustSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [CustodianID], [CustodianName] FROM [CustodianMaster]">
         </asp:SqlDataSource>

                </div>
                
              </div>
            </div>
            
            <div class="col-sm-10">
                 <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Comments" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txt_comments" runat="server"  TextMode="Multiline" rows="3" columns="35"></asp:TextBox><br />
                   <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Send Request" OnClick="ASPxButton1_Click"></dx:ASPxButton><br />--%>
                </div>
                     </div>
            </div>
            
             <div class="col-sm-10">
                 <div class="row form_div">
                     <div class="col-sm-2">

                     </div>
                     <div class="col-sm-4">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Send Request" OnClick="ASPxButton1_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}"></ClientSideEvents> 
                        </dx:ASPxButton><br />
                  
                 <dx:ASPxLoadingPanel runat="server" Modal="True" Text="Please wait" ClientInstanceName="lpanel" ID="ASPxLoadingPanel1">
                 </dx:ASPxLoadingPanel>
                   </div>
                   </div>
                 </div>

</div>

 <div class="clearfix"></div>
      <div class="table-responsive" style="padding:10px" >

     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource3" KeyFieldName="CustodianChangeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="CustodianChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>		  
			 <dx:GridViewDataTextColumn FieldName="MainAssetNumber"  ReadOnly="True" VisibleIndex="1" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
			 <dx:GridViewDataTextColumn FieldName="AssetSubNumber" Caption=" Asset SubNumber" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="CustodianSequence" VisibleIndex="3" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Requestedby" VisibleIndex="3" Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="3" Caption="Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="3" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="4" Caption="Requester Comments">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RequestedChangeCustodian" VisibleIndex="4" Caption="Transfer To Employee ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="TransferTo" VisibleIndex="4" Caption="Transfer To Employee Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="5" 
               Width="100px" >
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
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
        <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetTypeName" SummaryType="Count" />
        </TotalSummary>
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
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
            <SettingsPager PageSize="25"></SettingsPager>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
  </ContentTemplate>
</asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ConnectionStrings:ASSETManagementConnectionString%>" SelectCommand="select CustodianID,CustodianName from vEmpDtlsAssetApp">

    </asp:SqlDataSource>
   <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="Select AssetAllocation.AssetID,AssetAllocation.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetDesc,AssetMaster.Location,AssetMaster.LocationDesc
From RCBAMS..AssetAllocation
inner join RCBAMS..EmployeeAssetRequest on EmployeeAssetRequest.AssetRequestID=AssetAllocation.AssetRequestID
inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AssetAllocation.AssetID
where AssetAllocation.Status='Approved' and EmployeeAssetRequest.EmployeeID=@EmployeeID order by AssetAllocation.Date desc">
    <SelectParameters>
        <asp:SessionParameter name="EmployeeID" SessionField="UserID"/>
    </SelectParameters>
    </asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="Select * From RCBSAP..vAssetMaster where CustodianID=@EmployeeID and vAssetMaster.Status !='NVAL'">
    <SelectParameters>
        <asp:SessionParameter name="EmployeeID" SessionField="UserID"/>
    </SelectParameters>
    </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT CustodianChangeID,CustodianChangeRequest.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
AssetDesc as AssetTypeName,Concat(CustodianChangeRequest.EmployeeID+'__',CustodianChangeRequest.CustodianSequence) as CustodianSequence,RequestBy as Requestedby,CustodianChangeRequest.CustodianDepartment,CustDesignation,RequestedChangeCustodian,CustodianMaster.CustodianName as TransferTo,
CustodianChangeRequest.Status,Date,CustodianComments FROM CustodianChangeRequest 
inner join RCBSAP..AssetMaster on AssetMaster.AssetID=CustodianChangeRequest.AssetID
inner join RCBAMS..CustodianMaster on  CustodianMaster.CustodianID=CustodianChangeRequest.RequestedChangeCustodian
where CustodianChangeRequest.EmployeeID=@EmployeeID order by CustodianChangeID desc">
        <SelectParameters>
        <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
          </div>
</asp:Content>


