<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AuditDetails.aspx.cs" Inherits="AuditDetails" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx2" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
 <style type="text/css">

        
        .style6
        {
            width: 70%;
        }
        .style7
        {
            width: 136px;
        }
        .style9
        {
            font-size: medium;
            color: #000000;
        }
        .style10
        {
            color: #FF0000;
        }
        </style>
 <style type="text/css">
        
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 136px;
        }
        .style9
        {
            font-size: medium;
            color: #000000;
        }
        .style10
        {
            color: #FF0000;
        }
         .form_div{
           margin-top:10px;
       }
         .back-bg {
   
            margin: 10px 2px;
            border: 2px solid rgb(199, 212, 220);
            padding: 20px 0;
        }
        </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div class="col-sm-12">
 <div class="">
   
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
  <ContentTemplate>--%>
   <h4> <strong><span class="style9">Perform Asset Audit</span></strong></h4>
       <dx2:ASPxLabel ID="lbl_msg" runat="server" Text="" 
                    style="color: red; font-weight: 700; margin-left:40px;" >
                </dx2:ASPxLabel>
    
          <div class="row form_div">
          
           <div class="col-sm-2" style="font-size:large">
               <%-- <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Select Location">
                </dx:ASPxLabel>--%>
               <label>Select Wing</label>
               <span class="style10"><strong>*</strong></span>
               </div>
           <div class="col-sm-4">
                      <dx:ASPxComboBox ID="cmb_location" runat="server" AutoPostBack="true" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                          SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.Int32" DataSourceID="LocationDS" Width="300px"
                    ValueField="LocationID" TextField="LocationCode" DropDownStyle="DropDown" IncrementalFilteringMode="Contains" Height="25px" TextFormatString="{2}">

                           <Columns>
                               <dx:ListBoxColumn FieldName="Location" Width="170px" Caption="Wing" />
                               <dx:ListBoxColumn FieldName="Block" Width="170px" Caption="Floor"/>
					<dx:ListBoxColumn FieldName="LocationCode" Width="170px" Caption="LAB" />
                        
                       <%-- <dx:ListBoxColumn FieldName="SerialNumber" Width="170px" />
                       --%>
                    </Columns>

                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </div>
           
              </div>
             
    <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
               <%--<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Select Audit">
                </dx:ASPxLabel>--%>
             <label>Select Audit</label>
&nbsp;<span class="style10"><strong>*</strong></span>
           </div>
            <div class="col-sm-4">
                  <dx:ASPxGridLookup ID="gd_Audit" runat="server"  AutoGenerateColumns="False"
                      IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="AuditID"   Height="25px" Width="300px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="AuditDS">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AuditID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="AuditName" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AuditBy" Visible="false" VisibleIndex="2">
                        </dx:gridviewdatatextcolumn>
                       <%-- <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="3" Caption="Location">
                        </dx:gridviewdatatextcolumn>
                         <dx:gridviewdatatextcolumn FieldName="Block" VisibleIndex="3" Caption="Block">
                        </dx:gridviewdatatextcolumn>--%>
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
                 <asp:SqlDataSource ID="AuditDS" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                     SelectCommand="SELECT [AuditID], [AuditName], [AuditBy], AuditMaster.[LocationID],LocationCode,Block FROM [AuditMaster] 
                     inner join LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID 
                     WHERE (AuditMaster.[LocationID] = @LocationID) and (AuditMaster.AuditStatus='Active') ">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="cmb_location" Name="LocationID" PropertyName="Value" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </div> 

    </div>
<%--</ContentTemplate>
 </asp:UpdatePanel>--%>
     <div class="row form_div">
      <div class="col-sm-2">

      </div>
        <div class="col-sm-4">
            <dx:ASPxButton ID="StartAuditButton" runat="server" Text="Start Audit" 
                    Height="25px" Width="110px" 
                      CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"   CssPostfix="SoftOrange"   SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
             OnClick="StartAuditButton_Click"> 
                   
     </dx:ASPxButton>
        </div>
     </div>

   <br />
<div id="Panel2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
          <div class="row form_div">
           <div class="col-sm-2" style="font-size:large">
              <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Asset">
                </dx:ASPxLabel>--%>
               <label>Select Asset</label>
&nbsp;<span class="style10"><strong>*</strong></span>
               </div>
           <div class="col-sm-2">
                     <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="AssetDS" IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="AssetID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
    <SettingsPager PageSize="6"></SettingsPager>
</GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AssetID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="1" Caption="Equipment Number">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="2" Caption="Asset Name">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetClass" VisibleIndex="3">
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
              <div class="col-sm-2">
                   <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                    OnClick="btn_search_Click" Width="16px" Height="16px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
              </div>
           <%-- <div class="col-sm-2">
              <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Asset Status">
                </dx:ASPxLabel>
           </div>
            <div class="col-sm-4">
                 <dx:ASPxComboBox ID="cmb_status" runat="server" AutoPostBack="true" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Height="25px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String" DataSourceID="StatusDS"
                    ValueField="StatusCode" TextField="StatusName">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
             </div> --%>
              </div>
             
            <div class="clearfix"></div>
    
        
          <div id="AssetDetails"  runat="server">
               <div class="row">  
                  <div class="col-sm-12" style="font-size:large">  
                      
            <strong>  <label>Asset Details:</label> </strong>
                 
                      </div>
                    
              </div>
             
              <div class="row back-bg">
             

         <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2" style="font-size:large">
               <%--<dx:ASPxLabel ID="Label1" runat="server" Text="Main Asset Number:"></dx:ASPxLabel>--%>
               <label>Main Asset Number:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2" style="font-size:large">
              <%-- <dx:ASPxLabel ID="Label2" runat="server" Text="Serial Number:"></dx:ASPxLabel>--%>
                <label>Asset SubNumber:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_SubNumber" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2" style="font-size:large">
              <%--<dx:ASPxLabel ID="Label3" runat="server" Text="Asset Class Name:"></dx:ASPxLabel>--%>
                <label>Asset Class Name:</label>
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2" style="font-size:large">
                <%--<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Asset Type:"></dx:ASPxLabel>--%>
               <label>Asset Type:</label>
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2"  style="font-size:large">
            <label>Current Location:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:large">
           <label >Asset Status:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_assetstatus" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
 <div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>Available Quantity:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:large">
           <label >Component:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_component" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
 </div>
 <div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2"  style="font-size:large">
            <label>Capitalization Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2"  style="font-size:large">
           <label >First Acquisition Date:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_acquisitiondate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
            <label>DeacDate:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2"  style="font-size:large">
           <label >Inventory Note:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_inventorynote" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2"  style="font-size:large">
            <label>Inventory Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label ></label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="ASPxLabel10" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
     </div> 
   </div>       

        <div class="row form_div">
      <div class="col-sm-2"  style="font-size:large">
             
          <label>Asset Wing</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxComboBox ID="cmb_assetlocation" runat="server" AutoPostBack="true" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.Int32" DataSourceID="LocationDS"
                    ValueField="LocationID" TextField="LocationCode" DropDownStyle="DropDown" IncrementalFilteringMode="Contains" Height="25px">
                           <Columns>
           <dx:ListBoxColumn FieldName="Location" Width="170px" Caption="Wing" />
           <dx:ListBoxColumn FieldName="Block" Width="170px" Caption="Floor"/>
<dx:ListBoxColumn FieldName="LocationCode" Width="170px" Caption="LAB" />
    
   <%-- <dx:ListBoxColumn FieldName="SerialNumber" Width="170px" />
   --%>
</Columns>
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
             </div>
         </div>
      <div class="row form_div">
      <div class="col-sm-2"  style="font-size:large">
             
          <label>Select Custodian</label>
           </div>
            <div class="col-sm-4">
             <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="170px" Height="25px"
                    KeyFieldName="CustodianID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0" >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1" Caption="Employee Name" >
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
     <div class="row form_div">
      <div class="col-sm-2">
               <%--<dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Asset Status">
                </dx:ASPxLabel>--%>
          <label>Asset Status</label>
           </div>
            <div class="col-sm-4">
                 <dx:ASPxComboBox ID="cmb_status" runat="server"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Height="25px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String" DataSourceID="StatusDS"
                    ValueField="StatusCode" TextField="StatusName" DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
             </div>
         </div>
          <div class="row form_div">
           <div class="col-sm-2">
               <%--<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Comments">
                </dx:ASPxLabel>--%>
               <label>Comments</label>
               </div>
           <div class="col-sm-4">
                <asp:TextBox ID="txt_Cmts" runat="server" TextMode="MultiLine" Rows="3" Columns="18"></asp:TextBox>
                 
            </div>
            <div class="col-sm-2">
             <%--  <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Technical Asset Number:-"></dx:ASPxLabel>--%>
           </div>
            <div class="col-sm-4">
              <%--  <dx:ASPxLabel ID="ASPxLabel10" runat="server"></dx:ASPxLabel>--%>
             </div> 
              </div>
             
    
            <div class="col-sm-2">
         
           </div>
            <div class="col-sm-4">
             
             </div> 
 </ContentTemplate>
    </asp:UpdatePanel>
      
         <div class="row form_div">
            <div class="col-sm-2">
            
            </div>
            <div class="col-sm-4"> 
              <dx:ASPxButton ID="btn_saveDocument" runat="server" Text="Add" OnClick="btn_saveDocument_Click"
                    Height="25px" Width="110px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" > 
                   
                </dx:ASPxButton>
            </div>         
           </div>
   
     <br/>
     <div class="table-responsive">
     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
         style="width:100%"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="500px" KeyFieldName="SRNO" OnRowCommand="ASPxGridView1_RowCommand">
        <Columns>
         <dx:GridViewDataTextColumn FieldName="SRNO" VisibleIndex="0" ReadOnly="True">
             <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="1" >
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1" Caption="Equipment Number">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditID" VisibleIndex="2" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="4" Caption="Wing">
            </dx:GridViewDataTextColumn>
 <%--            <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="4" Caption="Floor">
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="4" Caption="LAB">
</dx:GridViewDataTextColumn>--%>
          <%--  <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="5" Caption="Location" Visible="false">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="5" Visible="false">
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="8">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server" ForeColor="Red" Font-Bold="true">Delete</asp:LinkButton>
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
         <dx:ASPxButton ID="txtSubmit" runat="server" Text="Submit Audit" 
                    Height="25px" Width="110px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
        onclick="txtSubmit_Click"> 
                   
     </dx:ASPxButton>
     <br/>
  </div>
  </div>  
</div>
</div>
        
    <asp:SqlDataSource ID="AssetDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="select AssetID,MainAssetNumber,AssetSubNumber,AssetDesc,AssetClass,SerialNumber from AssetMaster">
    </asp:SqlDataSource>
   
     <asp:SqlDataSource ID="LocationDS" runat="server"  ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [LocationID],[Location],[LocationCode],Block FROM [RCBAMS]..[LocationMaster]">
     </asp:SqlDataSource>

      <asp:SqlDataSource ID="StatusDS" runat="server"  ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [StatusCode],[StatusName] FROM [RCBAMS]..[StatusMaster]">
     </asp:SqlDataSource>
       
  
   
      <asp:SqlDataSource ID="SqlDS_AuditedAssetList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT AuditDetailsID,AssetID,AuditStatus,Comments,AuditID,Date FROM [AuditDetails] Order by AuditDetailsID Desc">
      
    </asp:SqlDataSource>
</asp:Content>


