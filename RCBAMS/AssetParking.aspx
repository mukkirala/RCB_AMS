<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetParking.aspx.cs" Inherits="AssetParking" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <style>
        
		input {
			color:#333 !important;
		}
		.dxgvControl_PlasticBlue a {
			color:#333 !important;
		}
        .auto-style53 {
            width: 116px;
        }
         .form_div{
           margin-top:10px;
       }
          .back-bg {
   
            margin: 10px 15px;
            border: 2px solid rgb(199, 212, 220);
            padding: 20px 0;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
 <div class="col-sm-12">
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
    <h4><strong><span>Asset Parking</span></strong></h4>
 
      <div class="row form_div">
         <div class="col-sm-2 " style="font-size:large">
             
          <label>Select Employee</label>
           </div>
            <div class="col-sm-2">
             <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="300px" Height="25px"
                    KeyFieldName="CustodianID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0"  Caption="EmployeeID">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1"  Caption="EmployeeName">
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
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [CustodianID], [CustodianName] FROM [vEmpDtlsAssetApp]">
         </asp:SqlDataSource>

                
             </div>
           
         <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                     Width="16px" Height="16px" OnClick="btn_search_Click">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
        
     </div>
        <div id="RequestorDetails"  runat="server" visible="false">
                 
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
           <div class="col-sm-2" style="font-size:large">
               <%--<dx:ASPxLabel ID="Label1" runat="server" Text="Main Asset Number:"></dx:ASPxLabel>--%>
               <label>Employee ID:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_ReqID" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2" style="font-size:large">
              <%-- <dx:ASPxLabel ID="Label2" runat="server" Text="Serial Number:"></dx:ASPxLabel>--%>
                <label>Custodian Name:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_ReqName" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
             </div> 
              </div>
           </div>
          <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2" style="font-size:large">
               <%--<dx:ASPxLabel ID="Label1" runat="server" Text="Main Asset Number:"></dx:ASPxLabel>--%>
               <label>Designation:</label>
               </div>
           <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_Desig" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                  
            </div>
            <div class="col-sm-2" style="font-size:large" >
              <%-- <dx:ASPxLabel ID="Label2" runat="server" Text="Serial Number:"></dx:ASPxLabel>--%>
                <label>Department:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_ReqDept" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium" ></dx:ASPxLabel>
             </div> 
              </div>
           </div>
           <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2">
             <label></label>
               </div>
           <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_ReqDeptcode" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
            
                <label></label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
             </div> 
              </div>
           </div>
     </div>
</div>
</div>
               <div class="row form_div">
   <div class="col-sm-2" style="font-size:large">
   <label">Select Wing: </label>
   </div>
                    <div class="col-sm-2">
                        <dx:ASPxComboBox ID="txt_Locationid" runat="server" Width="300px" Height="25px" DataSourceID="location" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="Location" ValueField="Location" OnSelectedIndexChanged="txt_Locationid_SelectedIndexChanged"
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String"  PageSize="10"
            >                
            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanelImage>
            <ValidationSettings ErrorTextPosition="Bottom" >
                <RequiredField IsRequired="true" ErrorText=" Select Wing " />
                <ErrorFrameStyle ImageSpacing="4px">
                    <ErrorTextPaddings PaddingLeft="4px" />
                </ErrorFrameStyle>
            </ValidationSettings>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="location" runat="server" 
ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [Location] FROM [LocationMaster]">
 </asp:SqlDataSource>
                        </div>
                    </div>
     <div class="row form_div">
<div class="col-sm-2" style="font-size:large">
<label">Select Floor: </label>
</div>
                         <div class="col-sm-2">
                        <dx:ASPxComboBox ID="txtblock" runat="server" Width="300px" Height="25px" DataSourceID="Blockid" TextField="Block" AutoPostBack="true" ValueField="Block"
              OnSelectedIndexChanged="txtblock_SelectedIndexChanged" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  PageSize="10"
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">
            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanelImage>
           <ValidationSettings ErrorTextPosition="Bottom" >
                <RequiredField IsRequired="true" ErrorText="Floor Is Required" />
                <ErrorFrameStyle ImageSpacing="4px">
                    <ErrorTextPaddings PaddingLeft="4px" />
                </ErrorFrameStyle>
            </ValidationSettings>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="Blockid" runat="server" 
ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [BLOCK] FROM [LocationMaster]  where Location=@Location">
         <SelectParameters>             
             <asp:ControlParameter ControlID="txt_Locationid" Name="Location" />
         </SelectParameters>        
 </asp:SqlDataSource>
                             </div>
         </div>
          <div class="row form_div">
<div class="col-sm-2" style="font-size:large">
<label">Select LAB: </label>
</div>
                  <div class="col-sm-2">
        <dx:ASPxComboBox ID="txt_Lab" runat="server" Width="300px" Height="25px" DataSourceID="SqlDataSource4" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="LocationCode" ValueField="LocationID" 
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String"  PageSize="10"
            >                
            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanelImage>
            <ValidationSettings ErrorTextPosition="Bottom" >
                <RequiredField IsRequired="true" ErrorText=" Select LAB " />
                <ErrorFrameStyle ImageSpacing="4px">
                    <ErrorTextPaddings PaddingLeft="4px" />
                </ErrorFrameStyle>
            </ValidationSettings>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [LocationCode],[LocationID] FROM [LocationMaster] WHERE Location=@Location AND Block=@Block">
            <SelectParameters>                  
                <asp:ControlParameter ControlID="txt_Locationid" Name="Location"/>
                <asp:ControlParameter ControlID="txtblock" Name="Block"/>                
            </SelectParameters>
 </asp:SqlDataSource>
        </div>
    </div>
        <div class="row form_div">
                <div class="col-sm-2 "  style="font-size:large">
                   
                    <label>Select Asset Name</label>
                </div>
                <div class="col-sm-2">
                  <%--  <dx:ASPxComboBox ID="cmb_Assetname" runat="server" DataSourceID="SqlDataSource1" ValueField="AssetID" TextField="MainAssetNumber"></dx:ASPxComboBox>--%>
                      <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False" OnInit="gridlkup_Asset_Init"
                     DataSourceID="SqlDataSource1" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                     KeyFieldName="AssetTypeID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="300px">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="10"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                      
                        <dx:GridViewDataTextColumn FieldName="AssetTypeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AssetTypeName" VisibleIndex="1" Width="100%" Caption="Asset Name">
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

                  
                </div>

                 <dx:ASPxButton ID="btn_gridlkup_Asset" runat="server" BackColor="White" 
                    
                    Width="20px" Height="25px" OnClick="gridlkup_Asset_Click">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
             </div>

      <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
         <label">Allocate Quantity:</label>
         </div>
         <div class="col-sm-4">
            <dx:ASPxTextBox ID="req_qnty" runat="server" Width="300px" Text="" ForeColor="Blue" ReadOnly="false" Height="25px"></dx:ASPxTextBox>            
         </div>
     
         <div class="col-sm-2" style="font-size:large">
          <span class="auto-style7">Remarks:</span>       
         </div>
         <div class="col-sm-4">
             <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" Rows="2" ForeColor="Blue" Columns="32"></asp:TextBox>                     
         </div>
    </div>
   
     <div class="clearfix"></div>

      <div class="row">   <div class="col-sm-12"><strong>Asset Details</strong>
        <hr/>
        </div>
    </div>
     <div class="row form_div">
      <div class="col-sm-12">
             <dx:ASPxGridView ID="AssetTypesGridView"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="AssetID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="1100px" DataSourceID="AssetTypesGridViewDS">
        <Columns>
             <dx:GridViewCommandColumn VisibleIndex="0" ShowSelectCheckbox="True">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3" Caption="SerialNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Caption="AssetSubNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5"  Caption="AssetClass">
                <Settings AutoFilterCondition="Contains" />
                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7" Caption="Status">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="8" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                 
  </Columns> 
   <SettingsPager ShowDefaultImages="False" PageSize="5">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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


              </div>

     <div class="row form_div">
         <div class="col-sm-2">
             <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Add" Width="20" OnClick="AddAssets_Click"   CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"  CssPostfix="SoftOrange"  SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton><br />
         </div>
     </div>

         <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="MainAssetNumber"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="1100px" OnRowCommand="ASPxGridView1_RowCommand" >
        <Columns>
           
            <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3" Caption="SerialNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Caption="AssetSubNumber" visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5"  Caption="AssetClass">
                <Settings AutoFilterCondition="Contains" />
                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetType" VisibleIndex="6" Caption="AssetType">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="7" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="8">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server" ForeColor="Red"  Font-Bold="true" >Delete</asp:LinkButton>
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
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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
    <div class="clearfix"></div>
    <div class="row"> 
        <div class="col-sm-12">
        <hr/>
            </div>


    </div>
     
    <div class="clearfix"></div>
     
     <div class="row form_div">
         <div class="col-sm-1">
             <dx:ASPxButton ID="AddAssets" runat="server" Text="Park" Width="20" OnClick="Assets_Click"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"     CssPostfix="SoftOrange"   SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sp"></dx:ASPxButton>
              
         </div>
         <div class="col-sm-4">
         
         </div>
     </div>


<asp:SqlDataSource ID="AssetTypesGridViewDS" runat="server"  ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="
 select AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
 AssetMaster.SerialNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.Status,AssetTypeMaster.AssetTypeID,AssetMaster.Deacdate
  from AssetMaster inner join AssetTypeMaster on AssetTypeMaster.AssetTypeName=AssetMaster.AssetDesc
 where AssetMaster.AssetDesc=@AssetTypename and AssetMaster.Status in('AVAL','') and AssetMaster.CustodianID is null ">
         <SelectParameters>
             <asp:SessionParameter Name="AssetTypename" SessionField="AssetType" />
         </SelectParameters>
     </asp:SqlDataSource>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="select AssetTypeID,AssetTypeName,AssetTypeCode from AssetTypeMaster">

    </asp:SqlDataSource>
 <asp:SqlDataSource ID="LocationSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select * from LocationMaster">

 </asp:SqlDataSource>
    </div> 
 </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

