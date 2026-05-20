<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PhysicalStockVerification.aspx.cs" Inherits="PhysicalStockVerification" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 130px;
        }
        .style3
        {
            width: 180px;
        }
        .style4
        {
            width: 54px;
        }
        .style5
       {
            width: 167px;
       }
  
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
           
            color: #000000;
        }
 </style>


    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="col-sm-12" runat="server">
<h4><strong>View Available and Missing Assets</strong>
    </h4><br /><br />        
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
 </asp:SqlDataSource>
                        </div>
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
SelectCommand="SELECT DISTINCT [Block] FROM [LocationMaster]  where Location=@Location">
         <SelectParameters>             
             <asp:ControlParameter ControlID="txt_Locationid" Name="Location" />
         </SelectParameters>
        
 </asp:SqlDataSource>
                        </div>
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
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="LocationCode" ValueField="LocationID" OnSelectedIndexChanged="txt_Lab_SelectedIndexChanged"
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String"  PageSize="10">                
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

                <div class="col-sm-10">
             <div class="row">
            <div class="col-sm-2 ">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Audit" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-4">
                  <dx:ASPxComboBox ID="gridlkup_Asset" runat="server"  AutoPostBack="true" AutoGenerateColumns="False"
                 DataSourceID="SqlDataSource2" IncrementalFilteringMode="Contains" TextFormatString="{1}" 
                 TextField="AuditName" ValueField="AuditID"  Height="25px" 
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px" OnSelectedIndexChanged="gridlkup_Asset_SelectedIndexChanged" >
    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
</LoadingPanelImage>
<ValidationSettings ErrorTextPosition="Bottom" >
    <RequiredField IsRequired="true" ErrorText=" Select Audit " />
    <ErrorFrameStyle ImageSpacing="4px">
        <ErrorTextPaddings PaddingLeft="4px" />
    </ErrorFrameStyle>
</ValidationSettings>
            </dx:ASPxComboBox>
                                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
SelectCommand="select * from AuditMaster where LocationID=@LocationID">
         <SelectParameters>             
             <asp:ControlParameter ControlID="txt_Lab" Name="LocationID" />
         </SelectParameters>
        
 </asp:SqlDataSource>
            </div>                                      
                 </div>
        </div>        
             <div class="col-sm-10">
         <div class="row form_div">
             <div class="col-sm-2">

             </div>
             <div class="col-sm-4">
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="View Audited Assets"  OnClick="ASPxButton1_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
            
            </dx:ASPxButton><br />        
           </div>
           </div>
         </div>
                <div class="col-sm-12">           
                 <div class="col-sm-10"></div>
<div class="col-sm-1">
  <asp:ImageButton ID="ImageButton1" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton1_Click"    />
   
    </div>
<div class="col-sm-1">
   <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton2_Click" Width="35px" />
    
</div>
  </div>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                   Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                   LeftMargin="0" RightMargin="0" TopMargin="0">
 </dx:ASPxGridViewExporter>
        <div class="col-sm-12">
            <div class="col-sm-4">
                              <h4> <span><strong>Available Assets</strong></span></h4>
                </div>
            </div>
         <div class="row" runat="server">
<dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDSGrid1" KeyFieldName="AssetID" Width="100%"                   
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" >
   <Columns>
        <dx:GridViewDataTextColumn FieldName="AuditDetailsID" Visible="false" ReadOnly="True" VisibleIndex="0">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        
        <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption=" Equipment Number">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="3" Caption="RFID Card Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Sub Number" Visible="false">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        
        <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Name" >
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
      <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="6">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
    <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="7" Caption="Wing">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
       <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="8" Caption="Floor">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
       <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="9" Caption="LAB">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
              
       <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="10">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
      <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="11">
          <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
      </dx:GridViewDataDateColumn> 
         <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="12">
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
                        <div class="col-sm-12">           
                 <div class="col-sm-10"></div>
<div class="col-sm-1">
  <asp:ImageButton ID="ImageButton3" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton3_Click"    />
   
    </div>
<div class="col-sm-1">
   <asp:ImageButton ID="ImageButton4"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton4_Click" Width="35px" />
    
</div>
  </div>
               <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
                  Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView2" 
                  LeftMargin="0" RightMargin="0" TopMargin="0">
</dx:ASPxGridViewExporter>
        <div class="col-sm-12">
    <div class="col-sm-4">
                      <h4> <span><strong>Missing Assets</strong></span></h4>
        </div>
    </div>
                 <div class="row" runat="server">
<dx:ASPxGridView ID="ASPxGridView2"  runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDSGrid2" KeyFieldName="AssetID"                   
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" >
   <Columns>
        <dx:GridViewDataTextColumn FieldName="AuditDetailsID" Visible="false" ReadOnly="True" VisibleIndex="0">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        
        <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption=" Equipment Number">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="3" Caption="RFID Card Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Sub Number" Visible="false">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        
        <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Name" >
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
      <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="6">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
    <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="7" Caption="Wing">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
       <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="8" Caption="Floor">
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>  
       <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="9" Caption="LAB">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
           
         <%--<dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="10">
            <Settings AutoFilterCondition="Contains" />
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

  <asp:SqlDataSource ID="SqlDSGrid1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
      SelectCommand="select distinct AuditDetails.AuditDetailsID, AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
AssetMaster.AssetDesc,AssetMaster.AssetClass,LocationMaster.Location,LocationMaster.LocationCode,LocationMaster.Block ,AuditDetails.Date as AuditDate, 
AuditDetails.AuditStatus,AuditDetails.RFIDCardNumber,
AuditDetails.AuditBy  from RCBAMS..AuditDetails 
inner join RCBAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
inner join RCBAMS..LocationMaster 
on CAST(LocationMaster.LocationID AS VARCHAR(50)) =
   CAST(AssetMaster.LocationID AS VARCHAR(50))
where RCBAMS..AuditDetails.AuditID=@AuditID  order by AuditDate desc">
      <SelectParameters>
          <asp:SessionParameter SessionField="AuditID" Type="String" Name="AuditID" />
      </SelectParameters>
  </asp:SqlDataSource> 
          <asp:SqlDataSource ID="SqlDSGrid2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
      SelectCommand="select distinct AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
AssetMaster.AssetDesc,AssetMaster.AssetClass,LocationMaster.Location,LocationMaster.LocationCode,LocationMaster.Block , 
AuditMaster.AuditStatus,AssetMaster.RFIDCardNumber,
AuditMaster.AuditBy
              from RCBSAP..AssetMaster 
inner join RCBAMS..LocationMaster 
on CAST(LocationMaster.LocationID AS VARCHAR(50)) =
   CAST(AssetMaster.LocationID AS VARCHAR(50))
inner join RCBAMS..AuditMaster on AuditMaster.LocationID=LocationMaster.LocationID
left join RCBAMS..AuditDetails ON AuditDetails.AssetID = AssetMaster.AssetID AND AuditDetails.AuditID = @AuditID
WHERE AuditMaster.AuditID=@AuditID AND AssetMaster.AssetID NOT IN (SELECT AssetID FROM RCBAMS..AuditDetails WHERE AuditID=@AuditID)">
      <SelectParameters>
          <asp:SessionParameter SessionField="AuditID" Type="String" Name="AuditID"  />
      </SelectParameters>
  </asp:SqlDataSource> 

          
        </div>
    </asp:Content>