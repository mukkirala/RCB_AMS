<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AssetRetirement.aspx.cs" Inherits="AssetRetirement" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx2" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style type="text/css">
        .style1
        {
            /*width: 82%;*/
           
            border-collapse: separate;
            border-spacing: 0 1em;
        }
        .style2
        {
            color: #000000;
            /*font-size: medium;*/
        }
        .style3
        {
            width: 180px;
        }
        .style4
        {
            width: 100px;
        }
        .style5
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
  <div class="container">
    
      <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
    <span class="style2"><strong>Asset Retirement</strong></span>
       <div class="col-sm-12">
    
     </div>
    <table class="style1">
        <tr>
            <td class="style3">
                Select Asset Class <span class="style5"><strong>*</strong></span></td>
            <td>
                   <dx:ASPxGridLookup ID="gd_Assetclass" runat="server"  AutoGenerateColumns="False"
                      IncrementalFilteringMode="Contains" TextFormatString="{2}"
                     KeyFieldName="AssetClassCode"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="AssetclassDS" AutoPostBack="true" OnTextChanged="gd_Assetclass_TextChanged">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AssetClassID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="AssetClassName" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetClassCode"  VisibleIndex="2">
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

            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
       
      <tr>
            <td class="style3">
                Select Asset</td>
             <td>
                 <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="AssetDS" IncrementalFilteringMode="Contains" TextFormatString="{1}"
                     KeyFieldName="MainAssetNumber"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" AutoPostBack="true"
                      OnTextChanged="gridlkup_Asset_TextChanged">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AssetID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="TechnicalAssetNumber" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetClassName" VisibleIndex="1">
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
             </td>
            <td>
                 &nbsp;</td>
     
          
        </tr>
     
    </table>
       
          <div class="clearfix"></div>
    
        
          <div id="AssetDetails"  runat="server">
               <div class="row">  
                  <div class="col-sm-12">  
                   
            <strong>  <label>Asset Details:</label> </strong>
                  </div>
              </div>
              <div class="row back-bg">
             

         <div class="">
           <div class="col-sm-2">
                 <label>Main Asset Number:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="true"  Text="">
			        </dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
                <label>Serial Number:</label>
           </div> 
            <div class="col-sm-4"> 
                    <dx:ASPxLabel ID="lbl_SerialNumber" runat="server"  Text="" Font-Bold="True">
			        </dx:ASPxLabel>
            </div> 
               
        </div>
        <div class="clearfix"></div>
      <div class="">
           <div class="col-sm-2">
                 <span>Asset Class:</span>
           </div>
            <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="true"  Text="">
			    </dx:ASPxLabel>
             </div> 
            <div class="col-sm-2">
                <span>Asset Type:</span>
            </div>
            <div class="col-sm-4"> 
                 <dx:ASPxLabel ID="lbl_AssetType" runat="server"  Text="" Font-Bold="True">
			     </dx:ASPxLabel>
            </div>
      </div>
      </div>
 
  </div>
      <table class="style1">
          <tr>
          <td class="style3">Select Retirement Date</td>
          <td>
              <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                  <ValidationSettings>
                      <ErrorFrameStyle ImageSpacing="4px">
                          <ErrorTextPaddings PaddingLeft="4px" />
                      </ErrorFrameStyle>
                  </ValidationSettings>
              </dx:ASPxDateEdit>
          </td>
        </tr>
        <tr>
            <td class="style3">Reason For Retirement</td>
            <td>
               <asp:TextBox ID="txt_Cmts" runat="server" TextMode="MultiLine" Rows="3" Columns="18"></asp:TextBox>
            </td>
        </tr>
      </table>
      <table style="margin-left:3px">
            <tr>
                 <td class="style3"></td>
                <td>
                <dx:ASPxButton ID="btn_Save" runat="server" Text="Retire" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    onclick="btn_Save_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="137px">
                </dx:ASPxButton>
            </td>
           
        </tr>
  </table>                                            
      <br />
    <strong ><span class="style2">Retired Asset List</span></strong><br />
   <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDS_RetiredAssetList" KeyFieldName="AssetRetirementID" 
        Width="731px">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AssetRetirementID" ReadOnly="True" 
                VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
          
            <dx:GridViewDataDateColumn FieldName="LastRetirementDate" VisibleIndex="5" Caption="Date" Visible="false">
           </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="PlannedRetirementDate" VisibleIndex="5" Caption="RetirementDate">

            </dx:GridViewDataDateColumn>
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
      
       <asp:SqlDataSource ID="AssetclassDS" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="SELECT [AssetClassID],[AssetClassName],[AssetClassCode] FROM [AssetClassMaster] WHERE Status='Active'">
                    
       </asp:SqlDataSource>
     <asp:SqlDataSource ID="AssetDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="select AssetID,MainAssetNumber,TechnicalAssetNumber,AssetClassName from AssetMaster inner join AssetClassMaster on AssetClassMaster.AssetClassCode = AssetMaster.AssetClass where AssetClassCode=@AssetClassCode and AssetMaster.Status='AVAL'">
      <SelectParameters>
          <asp:SessionParameter Name="AssetClassCode" SessionField="AssetClassCode"/>
      </SelectParameters>
     </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDS_RetiredAssetList" runat="server"  ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>"
       SelectCommand="SELECT [AssetRetirementID],[MainAssetNumber],[AssetClass],[Status],[PlannedRetirementDate],[LastRetirementDate],[DeActivationDate],[PurchaseOrderDate] FROM [AssetRetirement] where [Status]='Retired' order by AssetRetirementID desc" >

    </asp:SqlDataSource>
      </div>
 </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

