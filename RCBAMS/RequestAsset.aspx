<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="RequestAsset.aspx.cs" Inherits="RequestAsset" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
      <h4><strong><span>Request Asset</span></strong></h4>
    <div class="">
        <div class="row">
        <div style="">
           <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red"  Font-Size="Large"></dx:ASPxLabel>
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
                <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Select Asset Class:" Font-Size="Medium" Width="300px"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
                        <dx:ASPxComboBox ID="cmb_AssetClass" runat="server" TextField="AssetClassName" ValueField="AssetClassName" ValueType="System.String" AutoPostBack="True" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                            Height="25px" CssPostfix="PlasticBlue" Width="300px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="AssetClassDS">                     
                      </dx:ASPxComboBox>
                                 <asp:SqlDataSource ID="AssetClassDS" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
                                     SelectCommand="SELECT [AssetClassName] FROM [AssetClassMaster] WHERE ([Status] = @Status)">
                                     <SelectParameters>
                                         <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                                     </SelectParameters>
                        </asp:SqlDataSource>
                                 </div>
            </div>
            </div>
                        <br/><br/>
            <div class="col-sm-10">
                 <div class="row form_div">
                <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="lbl_Asset" runat="server" Text="Select Asset" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                  <%--  <dx:ASPxComboBox ID="cmb_Assetname" runat="server" DataSourceID="SqlDataSource1" ValueField="AssetID" TextField="MainAssetNumber"></dx:ASPxComboBox>--%>
                      <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False" OnInit="gridlkup_Asset_Init"
                     DataSourceID="SqlDataSource1" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                     KeyFieldName="AssetTypeID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="300px">
        <GridViewProperties>

       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="25"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                       <%-- <dx:gridviewdatatextcolumn FieldName="AssetTypeCode"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="AssetTypeID" VisibleIndex="1" Visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetTypeName" VisibleIndex="2">
                        </dx:gridviewdatatextcolumn>--%>
                        <dx:GridViewDataTextColumn FieldName="AssetTypeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AssetTypeName" VisibleIndex="1" Width="100%">
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
                     </div>
            </div>
            <br/><br/>
                <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2">
                   <dx:ASPxLabel ID="lbl_tolocation" runat="server" Text="Select Wing" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
                        <dx:ASPxComboBox ID="txt_Locationid" runat="server" Width="100%" Height="25px" DataSourceID="location" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="Location" ValueField="Location" OnSelectedIndexChanged="txtLocationid_SelectedIndexChanged"
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
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [Location] FROM [LocationMaster]">
 </asp:SqlDataSource>
                       <%-- <dx:ASPxGridLookup ID="LocationGridLookup1" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="LocationSqlDataSource1" IncrementalFilteringMode="Contains" TextFormatString="{2}"
                     KeyFieldName="Location"   Height="25px"  AutoPostBack="true"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px" >
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="10"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="LocationID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="Location" VisibleIndex="1" >
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="2" Caption="LocationCode" Visible="false">
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
                </dx:ASPxGridLookup>--%>
                    </div>
            </div>
            </div>
                        <br/><br/>
                <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2"> 
                   <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Select Floor" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
                        <dx:ASPxComboBox ID="txtblock" runat="server" Width="100%" Height="25px" DataSourceID="Blockid" TextField="Block" AutoPostBack="true" ValueField="Block"
              OnSelectedIndexChanged="txtbolck_SelectedIndexChanged" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  PageSize="10"
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
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [BLOCK] FROM [LocationMaster]  where Location=@Location">
         <SelectParameters>             
             <asp:ControlParameter ControlID="txt_Locationid" Name="Location" />
         </SelectParameters>
        
 </asp:SqlDataSource>
                        <%--<dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server"  AutoGenerateColumns="False" OnInit="ASPxGridLookup1_Init"
                     DataSourceID="LocationblockSqlDataSource1" IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="LocationID" Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="10"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="LocationID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="BLOCK" VisibleIndex="1" >
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="2" Caption="LocationCode" Visible="false">
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
                                <asp:SqlDataSource ID="Blockid" runat="server" 
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [BLOCK] FROM [LocationMaster]  where Location=@Location">
         <SelectParameters>             
             <asp:ControlParameter ControlID="LocationGridLookup1" Name="Location" />
         </SelectParameters>
        
 </asp:SqlDataSource>--%>
                    </div>
            </div>
            </div>
                    <br/><br/>
<div class="col-sm-10">
<div class="row form_div">
<div class="col-sm-2"> 
   <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select LAB" Font-Size="Medium"></dx:ASPxLabel>
</div>
    <div class="col-sm-4">
        <dx:ASPxComboBox ID="txt_Lab" runat="server" Width="100%" Height="25px" DataSourceID="SqlDataSource4" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
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
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [LocationCode],[LocationID] FROM [LocationMaster] WHERE Location=@Location AND Block=@Block">
            <SelectParameters>                  
                <asp:ControlParameter ControlID="txt_Locationid" Name="Location"/>
                <asp:ControlParameter ControlID="txtblock" Name="Block"/>                
            </SelectParameters>
 </asp:SqlDataSource>
        </div>
    </div>
    </div>
            <br/><br/>
            <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Quantity" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                    <dx:ASPxTextBox ID="txt_quantity" runat="server" Width="300px" Height="25"></dx:ASPxTextBox><br />
                   <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Send Request" OnClick="ASPxButton1_Click"></dx:ASPxButton><br />--%>
                </div>
                     </div>
            </div>
            <br/>
         
            <br/>
             <div class="col-sm-10">
                 <div class="row">
                     <div class="col-sm-2">

                     </div>
                     <div class="col-sm-4">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Send Request" OnClick="ASPxButton1_Click"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"> 
                        <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}"></ClientSideEvents> 
                        </dx:ASPxButton><br />
                         
                 <dx:ASPxLoadingPanel runat="server" Modal="True" Text="Please wait" ClientInstanceName="lpanel" ID="ASPxLoadingPanel1">
                 </dx:ASPxLoadingPanel>
                   </div>
                   </div>
                 </div>
            <div class="clearfix"></div>
      <div class="table-responsive" style="padding:10px" >

     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource3" KeyFieldName="AssetTransferId" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="1" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <%--<dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="2">
                 <Settings AutoFilterCondition="Contains" />
                        <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>
            </dx:GridViewDataTextColumn> inner join InstemAMS..LocationMaster on LocationMaster.LocationCode=EmployeeAssetRequest.Location--%> 
                  
          
           <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="3" Caption="Requested Quantity">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="4" Caption="Wing">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="6" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="5" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
                   </dx:GridViewDataTextColumn>
                   <%--<dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="5" Caption="Wing">
   <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="RequestSequene" VisibleIndex="7" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RequestedBy" VisibleIndex="8" Caption="User Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="9" Caption=" Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="10" Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="11" 
               Width="100px" caption="Requested Date">
                 <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="12">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AssetClassName" VisibleIndex="2" Caption="Asset Class">
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
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
        
      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="select AssetTypeID,AssetTypeName,AssetTypeCode from AssetTypeMaster where AssetClassName=@AssetClassName ">
                  <SelectParameters>
        <asp:ControlParameter  ControlID="cmb_AssetClass" Name="AssetClassName" />
        </SelectParameters>
    </asp:SqlDataSource>

       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand=" SELECT  EmployeeAssetRequest.AssetTypeID,AssetTypeName,LocationMaster.Block,LocationMaster.Location,LocationMaster.LocationCode,RequestBy as RequestedBy,EmployeeAssetRequest.LocationID,
           EmployeeAssetRequest.CustodianDepartment,CustDesignation,Concat(EmployeeAssetRequest.EmployeeID+'__',EmployeeAssetRequest.RequestSequene) as RequestSequene,AssetTypeMaster.AssetClassName,
           EmployeeAssetRequest.Quantity,EmployeeAssetRequest.Status,Date,LocationMaster.LocationCode 
FROM InstemAMS..EmployeeAssetRequest 
inner join InstemAMS..LocationMaster on LocationMaster.LocationID=EmployeeAssetRequest.LocationID
inner join InstemSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID
where EmployeeID=@EmployeeID order by [AssetRequestID] desc">
        <SelectParameters>
        <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
 <%--<asp:SqlDataSource ID="LocationSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="select * from LocationMaster">

 </asp:SqlDataSource>
           <asp:SqlDataSource ID="LocationblockSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="select DISTINCT [BLOCK]
 from LocationMaster where Location=@Location">
                <SelectParameters>
        <asp:ControlParameter  ControlID="LocationGridLookup1" Name="Location" />
         <asp:ControlParameter  ControlID="ASPxGridLookup1" Name="Location" />          
        </SelectParameters>
        </asp:SqlDataSource>--%>
 
   </div>
      </div>
    </div> 
 </div>
      </div>
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

