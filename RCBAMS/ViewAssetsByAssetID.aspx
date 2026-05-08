<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAssetsByAssetID.aspx.cs" Inherits="ViewAssetsByAssetID" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 150px;
        }
        .style3
        {
            width: 220px;
        }
   
        .style6
        {
           font-size: medium;
         }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
 <strong><span class="style6"><span class="dxmLite_Glass">
    Print QRCode by MainAssetNumber <br />
</span></span></strong>
     <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
    <table>
        <tr>
            <td class="style2">
                Equipment Number  </td>
            <td class="style3">                
              <%--  <asp:TextBox ID="txt_mainassetnumber" runat="server"></asp:TextBox>--%>
                <dx:ASPxComboBox ID="txt_mainassetnumber" runat="server" DataSourceID="SqlDataSource1" ValueField="MainAssetNumber" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith"  
        CallbackPageSize="10" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" EnableIncrementalFiltering="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">  
        <Columns>  
            <dx:ListBoxColumn FieldName="MainAssetNumber" Caption="Equipment Number" />
        </Columns>  
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
    </dx:ASPxComboBox>  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="Select MainAssetNumber,AssetSubNumber from AssetMaster"></asp:SqlDataSource>

            </td>
           
            <td>
                SubNumber
            </td>
            <td>
               <%-- <asp:TextBox ID="txt_subnumber" runat="server"></asp:TextBox>--%>
               <dx:ASPxComboBox ID="txt_subnumber" runat="server" SelectedIndex="0" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">
                <Items>
                      <dx:ListEditItem Selected="True" Text="0" Value="0"></dx:ListEditItem>
                      <dx:ListEditItem Text="1" Value="1"></dx:ListEditItem>       
                </Items>
                   <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                   </LoadingPanelImage>
                   <ValidationSettings>
                       <ErrorFrameStyle ImageSpacing="4px">
                           <ErrorTextPaddings PaddingLeft="4px" />
                       </ErrorFrameStyle>
                   </ValidationSettings>
               </dx:ASPxComboBox>  
  
  
            </td>
             <td>
                 <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                    OnClick="btn_search_Click" Width="16px" Height="16px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
            </td>
         </tr>
    </table>
     <br />
     <div class=" style3">
                <dx:ASPxImage ID="ASPxImage1" runat="server" Visible="false">
                </dx:ASPxImage>
            </div>
    <div class=" table-responsive">
        <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSGrid"
                   KeyFieldName="AssetID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="850px" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">
       <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetID" Visible="true" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" Width="200px" Caption="Sub Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdditionalDesc" VisibleIndex="4" Caption="Additional Description" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="5" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="5" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="5" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="5" Caption="Floor">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="5" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="5" Caption="Serial Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Model">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="5" Caption="Make">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="5" Caption="PO Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="6" Caption="Quantity">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="6" Caption="Unit">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="AssetCapitalizationDate" VisibleIndex="6" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FirstAcquisitionDate" VisibleIndex="6" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>            
            <dx:GridViewDataTextColumn FieldName="Component" VisibleIndex="8">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="ComponentDesc" VisibleIndex="8">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataDateColumn FieldName="Deacdate" VisibleIndex="9" Caption="Deactivation Date" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Invdate" VisibleIndex="9" Caption="Inventory Date" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InventoryNote" VisibleIndex="9" Caption="Inventory Note">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="QRCode" VisibleIndex="10" Caption="QRCode">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="PrintStatus" VisibleIndex="10" Caption="PrintStatus" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>                        
            <dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="10">
                 <Settings AutoFilterCondition="Contains" />
                        <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="10" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="Select * from InstemSAP..AssetMaster left JOIN InstemAMS..QRCodeMaster ON AssetMaster.AssetID=QRCodeMaster.AssetID where AssetDesc=@AssetType">
         <SelectParameters>
          <asp:SessionParameter SessionField="AssetType" Name="AssetType" />
      </SelectParameters>
    </asp:SqlDataSource>                                     
    
      </div>
        <br/>
    
     <table class="style8"  style="width:460px">
        <tr>
            <td >
                <dx:ASPxButton ID="btn_printItems" runat="server" Text="Print PDf" 
                    onclick="btn_printItems_Click" Width="191px" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            
            </td>
          
            <td  style="margin-left:150px">
                <dx:ASPxButton ID="btn_Printbarcode" runat="server" Text="Generate QRCodes" 
                    onclick="btn_Printbarcode_Click" Width="191px" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>       
          
   
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
                </dx:ASPxGridViewExporter>
 </div>  

</asp:Content>


   