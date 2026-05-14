<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestLocationChange.aspx.cs" Inherits="RequestLocationChange" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


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
      <h4><strong><span>Request For Location Change</span></strong></h4>
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
                     DataSourceID="SqlDataSource1" IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="AssetID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px" OnInit="gLookup_Init">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="15"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                                              
                        <dx:gridviewdatatextcolumn FieldName="AssetID" VisibleIndex="0" visible="false">
                        </dx:gridviewdatatextcolumn>
						 <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="1" Caption="Equipment Number">
                        </dx:gridviewdatatextcolumn>
						 <dx:gridviewdatatextcolumn FieldName="AssetSubNumber" VisibleIndex="2" Caption="SubNumber" Visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="3" Caption="Asset Name">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="Location" VisibleIndex="4" Caption="Wing" Visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationDesc" VisibleIndex="5" Caption="LAB" Visible="false">
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
                <div class="row form_div">
                                    <div class="col-sm-2">
                   <dx:ASPxLabel ID="lbl_tolocation" runat="server" Text="Select Wing" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
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
            <%--<SelectParameters>             
    <asp:ControlParameter ControlID="txt_Locationid" Name="Location" />
</SelectParameters>--%>
 </asp:SqlDataSource>
                        </div>
                <%--<div class="col-sm-2">
                   <dx:ASPxLabel ID="lbl_tolocation" runat="server" Text="Select To Wing" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
                        <dx:ASPxGridLookup ID="LocationGridLookup1" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="LocationSqlDataSource1" IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="LocationCode"   Height="25px" AutoPostBack="true"
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
                        <dx:gridviewdatatextcolumn FieldName="Location" VisibleIndex="1" caption="Wing" Visible="True">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="2" Caption="LAB">
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
                    </div>--%>
            </div>
            </div>
             <br/><br/>
                <div class="col-sm-10">
                <div class="row">
                                    <div class="col-sm-2"> 
                   <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Select Floor" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
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
                <%--<div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Select To Floor" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                    <div class="col-sm-4">
                        <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server"  AutoGenerateColumns="False" OnInit="ASPxGridLookup1_Init"
                     DataSourceID="LocationblockSqlDataSource1" IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="LocationID" Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="15"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="LocationID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="Block" VisibleIndex="1" Caption="Floor" >
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="2" Caption="LAB" Visible="false">
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
                    </div>--%>
            </div>
            </div>
            <br/><br/>
            <div class="col-sm-10">
     <div class="row form_div">
         <div class="col-sm-2"> 
   <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Select LAB" Font-Size="Medium"></dx:ASPxLabel>
</div>
    <div class="col-sm-4">
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
                </div>
            <br/><br/>
            <div class="col-sm-10">
                 <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Comments" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="txt_comments" runat="server"  TextMode="Multiline" rows="3" columns="38"></asp:TextBox><br />
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

</div>

 <div class="clearfix"></div>
      <div class="table-responsive" style="padding:10px" >

     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
         
        DataSourceID="AssetListSqlDataSource3" KeyFieldName="LocationChangeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="LocationChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
			 <dx:GridViewDataTextColumn FieldName="MainAssetNumber"  ReadOnly="True" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
			 <dx:GridViewDataTextColumn FieldName="AssetSubNumber" Caption="SubNumber" ReadOnly="True" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="4" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="LocationSequence" VisibleIndex="5" Caption="Staff Number" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Requestedby" VisibleIndex="6" Caption="User Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="7" Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="8" Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CLocation" VisibleIndex="7" Caption="Current Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CBlock" VisibleIndex="8" Caption="Current Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CLocationDesc" VisibleIndex="8" Caption="Current LAB">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="9" Caption="Requested Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="10" Caption="Requested Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
<%--            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="9" Caption="Requested Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="10" Caption="Requested LAB" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="11" Caption="Comments">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="12" Caption="Requested Date">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="13">
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
</div>
</div>
</ContentTemplate>
</asp:UpdatePanel>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="Select * From RCBSAP..vAssetMaster where CustodianID=@EmployeeID and vAssetMaster.Status !='NVAL'">
    <SelectParameters>
        <asp:SessionParameter name="EmployeeID" SessionField="UserID"/>
    </SelectParameters>
    </asp:SqlDataSource>
 <%--<asp:SqlDataSource ID="LocationSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select * from LocationMaster">

 </asp:SqlDataSource>--%>
         <%--<asp:SqlDataSource ID="LocationblockSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select DISTINCT LocationID, Location, LocationCode, Status, Block from LocationMaster where LocationCode=@LocationCode">
                <SelectParameters>
        <asp:ControlParameter  ControlID="LocationGridLookup1" Name="LocationCode" />
        </SelectParameters>
        </asp:SqlDataSource>--%>
    
      <asp:SqlDataSource ID="AssetListSqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand=" SELECT LocationChangeID,EmployeeLocationChange.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,LocationMaster.LocationCode,LocationMaster.Block,AssetMaster.Location as CLocation,AssetMaster.Block as CBlock,AssetMaster.LocationDesc as CLocationDesc,
AssetDesc as AssetTypeName,LocationMaster.Location,RequestBy as Requestedby,Concat(EmployeeLocationChange.EmployeeID+'__',EmployeeLocationChange.LocationSequence) as LocationSequence,EmployeeLocationChange.CustodianDepartment,CustDesignation,
EmployeeLocationChange.Status,EmployeeLocationChange.Date,CustodianComments 
FROM EmployeeLocationChange 
inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeLocationChange.AssetID 
inner join RCBAMS..LocationMaster on LocationMaster.LocationID=EmployeeLocationChange.LocationID          
 where EmployeeLocationChange.EmployeeID=@EmployeeID order by LocationChangeID desc">
         <SelectParameters>
        <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>


