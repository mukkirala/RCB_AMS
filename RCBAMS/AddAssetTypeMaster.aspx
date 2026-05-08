<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAssetTypeMaster.aspx.cs" Inherits="AddAssetTypeMaster" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
 <style type="text/css">
        .auto-style1 {
            width: 63%;
            height: 184px;
          
            margin-right: 0px;
        }
        .auto-style2 {
            width: 151px;
        }
        .auto-style3 {
          
        }
        .auto-style7 {
            color: #333300;
        }
       
        .auto-style8 {
           
            color: #000000;
        }
       
        .auto-style9 {
            color: #FF0000;
        }
        .auto-style10 {
            color: #000000;
            
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="col-sm-12">
 <table class="auto-style1">
    
        <tr>
            <td colspan="3" class="auto-style8">
                <strong>Select Asset Name  </strong></td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style3">
                <dx:ASPxLabel ID="lbl_dsplay" runat="server" ForeColor="red" visible="false">
                </dx:ASPxLabel>
             </td>
        </tr>
        <tr>
            <td class="auto-style2">Asset Name <span class="auto-style9"><strong>*</strong></span></td>
            <td>
                <dx:ASPxTextBox ID="txt_assetname" runat="server" Height="25px" Width="300px">
                </dx:ASPxTextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
              <td>
           <%-- <td class="auto-style2">Asset Description Code</td>--%>
             Asset Class:<span class="style10"color="red"><strong>*</strong></span>
              </td>
            <%--<td>
                <dx:ASPxTextBox ID="txt_assetcode" runat="server" Height="25px" Width="200px">
                </dx:ASPxTextBox>
            </td>--%>
             <td>
     <%--<dx:ASPxTextBox ID="txtassetclass" runat="server" Height="25PX" Width="170px"> </dx:ASPxTextBox>--%>
<%--     <dx:ASPxComboBox ID="cmb_AssetClass" runat="server"  Height="25px" Width="200px" ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">                     --%>
                <dx:ASPxComboBox ID="cmb_AssetClass" runat="server"  Height="25px" Width="300px"  DataSourceID="Classid" TextField="AssetClassName" ValueField="AssetClassName"  IncrementalFilteringMode="StartsWith" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">                      

                 </dx:ASPxComboBox>
                         <asp:SqlDataSource ID="Classid" runat="server" 
ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
SelectCommand="SELECT DISTINCT [AssetClassName] FROM [AssetClassMaster] ">
        <%-- <SelectParameters>
             <asp:ControlParameter ControlID="txtLocationid" Name="LocationCode" />
         </SelectParameters>
        --%>
 </asp:SqlDataSource>
 </td>
            <td>&nbsp;</td>
        </tr>
       
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_save" runat="server"  Text="Save"  
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" Width="100px" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" OnClick="btn_save_Click">
                </dx:ASPxButton>
    <span class="auto-style7">
                
                <dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" 
                     OnClick="btn_Update_Click" Visible="false">
                </dx:ASPxButton>
                
    </span>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
      
     <br />
   <strong><span class="style5"><span class="auto-style10">AssetType/Category Master Details</span> 
        
          
           </span></strong>
           <br />

           <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
               DataSourceID="SqlDataSource1" KeyFieldName="AssetTypeID" width="100%"  OnRowCommand="ASPxGridView1_RowCommand"
               CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" CssClass="auto-style10">
               <Columns>
             <%--   <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                    
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>     --%>  
                                                        <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" CellStyle-Font-Bold="true">
    <DataItemTemplate>
        <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green" width="50%"></asp:LinkButton>
        </DataItemTemplate>
    
</dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" CellStyle-Font-Bold="true">
    <DataItemTemplate>
        <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red" width="50%"></asp:LinkButton>
    </DataItemTemplate>
          </dx:GridViewDataTextColumn>     


                   <dx:GridViewDataTextColumn FieldName="AssetTypeID" ReadOnly="True" VisibleIndex="1" Caption="Asset Name ID">
                       <EditFormSettings Visible="False" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="AssetTypeName" VisibleIndex="2" Caption="Asset Name">
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="AssetTypeCode" VisibleIndex="3" Visible="false">
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
                SelectCommand="SELECT [AssetTypeID], [AssetTypeName], [AssetTypeCode], [CreatedDate], [Status] FROM [AssetTypeMaster] WHERE Status = 'Active' OR Status IS NULL; "
                UpdateCommand="UPDATE ManufacturerMaster SET ManufacturerName=@ManufacturerName,ManufacturerCode=@ManufacturerCode WHERE ManufacturerID=@ManufacturerID  "></asp:SqlDataSource>
           <br />
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</asp:Content>

