<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetManagemetHistory.aspx.cs" Inherits="AssetManagemetHistory" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width:100%;
            height: 23px;
           
            
        }
           .back-bg {
            margin: 20px 30px;
            border: 2px solid rgb(199, 212, 220);
            padding: 15px 0;
     }
        .auto-style6 {
            width: 30px;
        }
        .auto-style7 {
            width: 30px;
        }
        .auto-style8 {
            width: 78px;
        }
        .auto-style9 {
            font-size: small;
            font-weight: bold;
        }
          .form_div{
           margin-top:10px;
       }
           .style5
    {
            width: 120px;
            color: red;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br/>
    <h3><strong><span>Asset Management History</span></strong></h3>
 <br />
      <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
             <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Select Asset" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
           </div>
            <div class="col-sm-4">
             <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="170px" Height="25px"
                    KeyFieldName="AssetID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="AssetID"  VisibleIndex="0"  Caption="AssetID" Visible="true">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1"  Caption="Equipment Number">
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="1"  Caption="Asset Name" Visible="true">
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
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
        SelectCommand="SELECT Distinct [AssetID],[MainAssetNumber], [AssetDesc] FROM [AssetMaster] where Status !='InActive'">
         </asp:SqlDataSource>     
              </div>
        <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                      OnClick="btn_search_Click" Width="20px" Height="25px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton> 
     </div>
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
               <dx:ASPxLabel ID="Label1" runat="server" Text="Asset Number:" Font-Size="Large"></dx:ASPxLabel>
              
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
               <dx:ASPxLabel ID="Label2" runat="server" Text="Sub Asset Number:" Font-Size="Large"></dx:ASPxLabel>
               
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
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2">
                <dx:ASPxLabel ID="Label4" runat="server" Text="Asset Type:" Font-Size="Large"></dx:ASPxLabel>
             
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2">
           <dx:ASPxLabel ID="Label5" runat="server" Text="Asset Location:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
               <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Asset Block:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
                      <dx:ASPxLabel ID="lbl_Block" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
         </div>
         <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2">
              <dx:ASPxLabel ID="label6" runat="server" Text="Asset User:" Font-Size="Large"></dx:ASPxLabel>
               
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_User" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
        </div>
             </div>
     </div>
</div>
</div>
</div>
</div>






     <div class="col-sm-12"><br /><br /></div>
   <div class="col-sm-12">
                 <div class="row">
                     <div class="col-sm-4">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Search" OnClick="ASPxButton1_Click" Width="150px" CssPostfix="SoftOrange" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Visible="false"> 
                        </dx:ASPxButton><br />
                   </div>
                   </div>
                 </div>
     <h4><strong><span>Asset Location Change History</span></strong></h4>

  <div class="table-responsive" style="padding:10px" ></div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server"  style="width:100%" DataSourceID="SqlDataSource1" KeyFieldName="AssetID"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  CssPostfix="PlasticBlue" AutoGenerateColumns="false" >
        <Columns>
              <dx:GridViewDataTextColumn FieldName="CustodianChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="true">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetDesc"  ReadOnly="True" VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Employee ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RequestBy" VisibleIndex="4" Caption="Employee Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="6" Visible="true" Caption="Current Floor" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ToLocation" VisibleIndex="5" Caption=" Current Wing" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="FromLocation" VisibleIndex="9" Visible="true" Caption="Previous Wing" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FromBlock" VisibleIndex="8" Caption="Previous Floor" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="6" Caption="Transfered Date" Visible="true">
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
                <SettingsPager PageSize="25"></SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
                    
                    <SettingsDetail ShowDetailRow="false" />
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
                    <StylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    </dx:ASPxGridView>
    <br />
  <h4><strong><span>Asset Employee Change History</span></strong></h4>
    
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumnsASPxGridView1="False" OnCustomUnboundColumnData="ASPxGridView2_CustomUnboundColumnData" DataSourceID="SqlDataSource2" style="width:100%"  KeyFieldName="AssetID"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  CssPostfix="PlasticBlue" AutoGenerateColumns="True" >
        <Columns>
              <dx:GridViewDataTextColumn FieldName="CustodianChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="true">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetDesc"  ReadOnly="True" VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Previous Employee ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RequestBy" VisibleIndex="3" Caption="Previous Employee Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDepartmentCode" VisibleIndex="3" Caption="DepartmentCode" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="3" Caption="CustodianDepartment" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="3" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="4" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestedChangeCustodian" VisibleIndex="4" Caption="Current Employee ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="4" Caption="Current Employee Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="4" Caption="Transfered Date">
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
                <SettingsPager PageSize="25"></SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
                    
                    <SettingsDetail ShowDetailRow="false" />
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
                    <StylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    </dx:ASPxGridView>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand=" Select EmployeeLocationChange.AssetID, AssetMaster.AssetDesc,EmployeeLocationChange.[RequestBy],[EmployeeID],LocationMaster.[Block],EmployeeLocationChange.[ToLocation],EmployeeLocationChange.FromLocation,EmployeeLocationChange.FromBlock,EmployeeLocationChange.Date from [EmployeeLocationChange]
  inner join RCBSAP..AssetMaster on AssetMaster.AssetID= EmployeeLocationChange.AssetID
          inner join LocationMaster on LocationMaster.LocationID = EmployeeLocationChange.LocationID Where [EmployeeLocationChange].Status='Approved'and  AssetMaster.AssetID =@AssetID order by Date desc">
            <SelectParameters>
          <asp:ControlParameter  ControlID="Cust_gridlookup" Name="AssetID"/>
         </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand=" Select CustodianChangeRequest.AssetID, AssetMaster.AssetDesc, [EmployeeID],CustodianChangeRequest.RequestBy,[RequestedChangeCustodian],[CustodianMaster].[CustodianName],CustodianChangeRequest.Date from [CustodianChangeRequest]
        inner join RCBSAP..AssetMaster on AssetMaster.AssetID = CustodianChangeRequest.AssetID
          inner join CustodianMaster on CustodianMaster.[CustodianID] = CustodianChangeRequest.RequestedChangeCustodian Where [CustodianChangeRequest].Status='Approved'and CustodianChangeRequest.AssetID =@AssetID order by Date desc">
            <SelectParameters>
                <asp:ControlParameter  ControlID="Cust_gridlookup" Name="AssetID"/>
         </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

