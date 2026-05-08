<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddmanualAssetMaster.aspx.cs" Inherits="AddmanualAssetMaster" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%--<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>--%>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
        .auto-style2 {
            width: 108px;
        }
        .style10
        {
            color: #FF0000;
        }
    </style>
    <script>
        function onlyNumb(event, maxLength) {
            var charCode = (event.which) ? event.which : event.keyCode;
            var inputValue = event.target.value;

            if (charCode < 48 || charCode > 57 || inputValue.length >= maxLength) {
                event.preventDefault();
            }
        }
        function onlyNumbers(event, maxLength) {
            var charCode = (event.which) ? event.which : event.keyCode;
            var inputValue = event.target.value;

            if (charCode < 48 || charCode > 57 || inputValue.length >= maxLength) {
                event.preventDefault();
            }
        }
        function onlyNum(event, maxLength) {
            var charCode = (event.which) ? event.which : event.keyCode;
            var inputValue = event.target.value;

            if (charCode < 48 || charCode > 57 || inputValue.length >= maxLength) {
                event.preventDefault();
            }
        }
        function validateAlphabetsAndLength(event, currentValue, maxLength) {
            var charCode = (event.which) ? event.which : event.keyCode;

            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
                var newValue = currentValue + String.fromCharCode(charCode);
                if (newValue.length <= maxLength) {
                    return true;
                }
            }

            return false;
        }
        function onlyNu(event, maxLength) {
            var charCode = (event.which) ? event.which : event.keyCode;
            var inputValue = event.target.value;

            if (charCode < 48 || charCode > 57 || inputValue.length >= maxLength) {
                event.preventDefault();
            }
        }
        function onlyNuss(event, maxLength) {
            var charCode = (event.which) ? event.which : event.keyCode;
            var inputValue = event.target.value;

            if (charCode < 48 || charCode > 57 || inputValue.length >= maxLength) {
                event.preventDefault();
            }
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" cssclass="container">
    <table>
        <tr>
            <td>
                <h4><strong>Add Asset Manually</strong></h4>
            </td>
             </tr>
        <tr>
            <td>
          <dx:ASPxLabel ID="lbl_msg" runat="server" style="font-weight: 700; color: RED" ClientInstanceName="client_lblmsg" Font-Size="Large" Text="" Visible="false">
              </dx:ASPxLabel>
              
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td>
              Company: <span class="style10"color="red"><strong></strong></span>  
            </td>
            
            <td>
              <dx:ASPxTextBox ID="txtCompany" runat="server" Height="25PX" Width="170px"  onkeypress="onlyNumb(event,6);"> </dx:ASPxTextBox>
    <ValidationSettings ValidationGroup="btn" ErrorTextPosition="Bottom">
        <RequiredField IsRequired="true" ErrorText="Company Is Required" />
        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                     </ValidationSettings>
                  
            </td>
            <td></td>
            <td class="auto-style2">&nbsp;</td>
            <td>
                Plant: <span class="style10"color="red"><strong></strong></span>  
            </td>
           
            <td>
                <dx:ASPxTextBox ID="txtplant" runat="server" Height="25PX" Width="170px"    onkeypress="onlyNumb(event,6);"> </dx:ASPxTextBox>
                <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                        <RequiredField IsRequired="true" ErrorText="Enter Plant" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
            </td>
        </tr>
          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
                <td>
          Select Supplier: <span class="style10" color="red"><strong>*</strong></span>  
        </td>
                      
            <td>
                <dx:aspxcombobox ID="cmb_supplier" runat="server" DataSourceID="SupplierDS" 
                    ValueType="System.Int32" TextFormatString="{2}"  IncrementalFilteringMode="Contains"
                 TextField="SupplierName"    ValueField="SupplierID"  Width="170px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    
                     <Columns>
                     <dx:listboxcolumn FieldName="SupplierID" />
                         <dx:listboxcolumn FieldName="VendorCode" Caption="Supplier Code" />
                    <dx:listboxcolumn FieldName="CompanyName" Caption="Supplier Name" />
                    </Columns>
                    <ValidationSettings ErrorTextPosition="Bottom" >
    <RequiredField IsRequired="true" ErrorText=" Select Supplier " />
    <ErrorFrameStyle ImageSpacing="4px">
        <ErrorTextPaddings PaddingLeft="4px" />
    </ErrorFrameStyle>
</ValidationSettings>
</dx:aspxcombobox>
                        <asp:SqlDataSource ID="SupplierDS" runat="server" 
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [SupplierID],VendorCode,[CompanyName] FROM [SupplierMaster] ">
 </asp:SqlDataSource>
  </td>      
       <%-- <td>
          <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Height="25PX" Width="170px"> </dx:ASPxTextBox>
<ValidationSettings ValidationGroup="btn" ErrorTextPosition="Bottom">
    <RequiredField IsRequired="true" ErrorText="Supplier Code Is Required" />
    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                 </ValidationSettings>
              
        </td>--%>
        <td></td>
        <td class="auto-style2">&nbsp;</td>
        <td>
            Select Institute: <span class="style10"color="red"><strong>*</strong></span>  
        </td>
       
        <td>
            <%--<dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Height="25PX" Width="170px"    onkeypress="onlyNumb(event,6);"> </dx:ASPxTextBox>
            <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                    <RequiredField IsRequired="true" ErrorText="Enter Supplier Name" />
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>--%>
                            <dx:aspxcombobox ID="cmb_institute" runat="server" DataSourceID="InstituteDS" 
                    ValueType="System.Int32" TextFormatString="{1}"  IncrementalFilteringMode="Contains"
                 TextField="InstituteName"    ValueField="InstitutePKID"  Width="170px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    
 <Columns>
      <dx:listboxcolumn FieldName="InstitutePKID" />
 <dx:listboxcolumn FieldName="InstituteID" />
<dx:listboxcolumn FieldName="InstituteName" />
</Columns>
                                <ValidationSettings ErrorTextPosition="Bottom" >
    <RequiredField IsRequired="true" ErrorText=" Select Institute " />
    <ErrorFrameStyle ImageSpacing="4px">
        <ErrorTextPaddings PaddingLeft="4px" />
    </ErrorFrameStyle>
</ValidationSettings>
</dx:aspxcombobox>
                        <asp:SqlDataSource ID="InstituteDS" runat="server" 
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [InstitutePKID], [InstituteID],[InstituteName] FROM [InstituteMaster] ">
 </asp:SqlDataSource>



        </td>

        </tr>



          <tr>
        <td>
            &nbsp;</td></tr>
         <tr>
            <td>
                AssetID: <span class="style10"color="red"><strong>*</strong></span>  
            </td>
           
            <td>
                <dx:ASPxTextBox ID="txtAssetID" runat="server" Height="25PX" Width="170px"  onkeypress="onlyNumbers(event, 15);" >  </dx:ASPxTextBox>
                <ValidationSettings ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText="Enter Asset ID" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
            </td>
            <td></td>
              <td class="auto-style2"></td>
            <td>
                Equipment Number: <span class="style10"color="red"><strong>*</strong></span>  
            </td>
            
            <td>
                <dx:ASPxTextBox ID="txtMainAssetID" runat="server" Height="25PX" Width="170px" onkeypress="onlyNum(event, 15);"> </dx:ASPxTextBox>
                <ValidationSettings ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText="Enter Equipment No" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
            </td>
        </tr>
        <tr>
        <td>
            &nbsp;</td></tr>
        <tr>
                       <td>
    Asset Class:<span class="style10"color="red"><strong>*</strong></span>
     <%--<dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Asset Class:"></dx:ASPxLabel>--%>
</td>
<td>
    <%--<dx:ASPxTextBox ID="txtassetclass" runat="server" Height="25PX" Width="170px"> </dx:ASPxTextBox>--%>
    <dx:ASPxComboBox ID="cmb_AssetClass" runat="server" ValueType="System.String" ValueField="AssetClassName" OnSelectedIndexChanged="cmb_AssetClass_SelectedIndexChanged" 
        TextField="AssetClassName" DataSourceID="AssetClassDS"  IncrementalFilteringMode="StartsWith" AutoPostBack="true"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Height="25px" CssPostfix="PlasticBlue" 
        SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">                     
          </dx:ASPxComboBox>
    <asp:SqlDataSource ID="AssetClassDS" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
                         SelectCommand="SELECT [AssetClassName] FROM [AssetClassMaster] WHERE ([Status] = @Status)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                         </SelectParameters>
            </asp:SqlDataSource>
</td>
                        <td></td>
<td class="auto-style2"></td>
                <td>
       Asset Name: <span class="style10"color="red"><strong>*</strong></span>
    </td>
     <td> <dx:ASPxComboBox ID="txtAssetDesc" runat="server" Width="100%" Height="25px" DataSourceID="SqlDataSource2" AutoPostBack="true"
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="AssetTypeName" ValueField="AssetTypeName" IncrementalFilteringMode="StartsWith"
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String"  PageSize="10"
            >
            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanelImage>
            <ValidationSettings ErrorTextPosition="Bottom" >
                <RequiredField IsRequired="true" ErrorText=" Select Asset Name " />
                <ErrorFrameStyle ImageSpacing="4px">
                    <ErrorTextPaddings PaddingLeft="4px" />
                </ErrorFrameStyle>
            </ValidationSettings>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
SelectCommand="SELECT DISTINCT [AssetTypeName] FROM [AssetTypeMaster] WHERE [AssetClassName]=@AssetClassName">
    <SelectParameters>
        <asp:ControlParameter ControlID="cmb_AssetClass" Name="AssetClassName" PropertyName="Value" Type="String" />
    </SelectParameters>
 </asp:SqlDataSource>
    </td>
                    </tr>
          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td>
                 Sub AssetNumber: <span class="style10"color="red"><strong></strong></span>
            </td>
            
            <td>
                <dx:ASPxTextBox ID="txtsubassetno" runat="server" Height="25PX" Width="170px"   onkeypress="onlyNumbers(event, 15);"> </dx:ASPxTextBox>
                <ValidationSettings ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText="Enter Sub Asset No" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
            </td>        
                                        <td></td>
<td class="auto-style2"></td>         
            <td>
                 Asset Owner: <span class="style10"color="red"><strong>*</strong></span>
            </td>
            
            <td>
                <dx:ASPxTextBox ID="txtAssetOwner" runat="server" Height="25PX" Width="170px"  > </dx:ASPxTextBox>
                <ValidationSettings ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText="Enter Owner" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
            </td>
            </tr>
                  <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td>
               Asset User: <%--<span class="style10"color="red"><strong>*</strong></span>--%>
            </td>
            <td>
                <dx:ASPxGridLookup ID="custodianlookup" runat="server" AutoGenerateColumns="False" DataSourceID="custodiands" KeyFieldName="CustodianID"
                    IncrementalFilteringMode="Contains" TextFormatString="{1}" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      

</GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1">
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
                <asp:SqlDataSource ID="custodiands" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>"
                    SelectCommand="SELECT [CustodianID], [CustodianName] FROM [CustodianMaster] WHERE ([CustodianStatus] = @CustodianStatus)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Active" Name="CustodianStatus" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <%--<dx:ASPxTextBox ID="txtAssetUser" runat="server" Height="25PX" Width="170px"  onkeypress="return validateAlphabetsAndLength(event, this.value, 32);" > </dx:ASPxTextBox>--%>
            </td>
                                                <td></td>
<td class="auto-style2"></td>                       
              <td>
    Serial Number: <span class="style10"color="red"><strong></strong></span>
 </td>
 <td>
     <dx:ASPxTextBox ID="txttxtSerial" runat="server" Height="25PX" Width="170px"      > </dx:ASPxTextBox>
      <%-- <ValidationSettings ErrorTextPosition="Bottom" >
             <RequiredField IsRequired="true" ErrorText="Enter Serial No" />
             <ErrorFrameStyle ImageSpacing="4px">
                 <ErrorTextPaddings PaddingLeft="4px" />
             </ErrorFrameStyle>
         </ValidationSettings>--%>
 </td>
                     </tr>
                  <tr>
<td>
    &nbsp;</td></tr>
        <tr>  
           <td>
     Macid:<span class="style10"color="red"><strong></strong></span>
</td>

<td> 
    <dx:ASPxTextBox ID="txtMAcid" runat="server" Height="25PX" Width="170px"   onkeypress="onlyNuss(event, 25);" > 

    </dx:ASPxTextBox>
</td>
                                                        <td></td>
<td class="auto-style2"></td>                   
                             <%--<td>
       LocationID: <span class="style10"color="red"><strong>*</strong></span>
    </td>
    <td> <dx:ASPxComboBox ID="txt_locationid" runat="server" Width="100%" Height="25px" DataSourceID="locationid" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="LocationID" ValueField="LocationID" OnSelectedIndexChanged="txtLocationid_SelectedIndexChanged"
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String"  PageSize="10"
            >                
            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanelImage>
            <ValidationSettings ErrorTextPosition="Bottom" >
                <RequiredField IsRequired="true" ErrorText=" Select LocationID " />
                <ErrorFrameStyle ImageSpacing="4px">
                    <ErrorTextPaddings PaddingLeft="4px" />
                </ErrorFrameStyle>
            </ValidationSettings>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="locationid" runat="server" 
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [LocationID] FROM [LocationMaster] ">
 </asp:SqlDataSource>
    </td>   --%>
             <%--<td>
    Locationid: <span class="style10" color="red"><strong>*</strong></span>
</td>
<td>
    <dx:ASPxComboBox ID="txtLocationid" runat="server" Width="100%" Height="25px" DataSourceID="locationid" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
          CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="LocationCode" ValueField="LocationCode" OnSelectedIndexChanged="txtLocationid_SelectedIndexChanged"
        CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String" PageSize="10">
        <Columns>
            <dx:ListBoxColumn FieldName="Location" Caption="Wing" />
            <dx:ListBoxColumn FieldName="Block" Caption="Floor" />
            <dx:ListBoxColumn FieldName="LocationCode" Caption="Lab" />
        </Columns>
        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
        </LoadingPanelImage>
        <ValidationSettings ErrorTextPosition="Bottom">
            <RequiredField IsRequired="true" ErrorText=" Select Location " />
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>
    </dx:ASPxComboBox>
    <asp:SqlDataSource ID="locationid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT DISTINCT Location, Block, LocationCode FROM LocationMaster">
    </asp:SqlDataSource>
</td>--%>                                
            <td>
       Wing: <span class="style10"color="red"><strong>*</strong></span>
    </td>
    <td> <dx:ASPxComboBox ID="txtLocationid" runat="server" Width="100%" Height="25px" DataSourceID="location" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
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
    </td>   
     </tr>
     <tr>
<td>
    &nbsp;</td></tr>
        <tr>                 
                <td>
         Floor: <span class="style10"color="red"><strong></strong>*</span>
    </td>
    
    <td><dx:ASPxComboBox ID="txtbolck" runat="server" Width="100%" Height="25px" DataSourceID="Blockid" TextField="Block" AutoPostBack="true" ValueField="Block"
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
             <asp:ControlParameter ControlID="txtLocationid" Name="Location" />
         </SelectParameters>
        
 </asp:SqlDataSource>
       
    </td>
              <td></td>
<td class="auto-style2"></td>    
                            <td>
       LAB: <span class="style10"color="red"><strong>*</strong></span>
    </td>
    <td> <dx:ASPxComboBox ID="txt_lab" runat="server" Width="100%" Height="25px" DataSourceID="SqlDataSource4" AutoPostBack="true" IncrementalFilteringMode="StartsWith"
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="LocationCode" ValueField="LocationID" 
            CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String"  PageSize="10"
            >                
            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanelImage>
           <%-- <ValidationSettings ErrorTextPosition="Bottom" >
                <RequiredField IsRequired="true" ErrorText=" Select LAB " />
                <ErrorFrameStyle ImageSpacing="4px">
                    <ErrorTextPaddings PaddingLeft="4px" />
                </ErrorFrameStyle>
            </ValidationSettings>--%>
        </dx:ASPxComboBox>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
SelectCommand="SELECT DISTINCT [LocationCode],[LocationID] FROM [LocationMaster] WHERE Location=@Location AND Block=@Block">
            <SelectParameters>                  
                <asp:ControlParameter ControlID="txtLocationid" Name="Location"/>
                <asp:ControlParameter ControlID="txtbolck" Name="Block"/>                
            </SelectParameters>
 </asp:SqlDataSource>
    </td>
     </tr>
     <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td>
    Model: <span class="style10"color="red"><strong></strong></span>
</td>
<td>
    <dx:ASPxTextBox ID="txtmodel" runat="server" Height="25PX" Width="170px"   > </dx:ASPxTextBox>
    <%--<ValidationSettings ErrorTextPosition="Bottom" >
            <RequiredField IsRequired="true" ErrorText="Enter Model" />
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>--%>
</td>
                 <td></td>
<td class="auto-style2"></td>                                        
            <td>
     GR Number: <span class="style10"color="red"><strong></strong></span>
</td>

<td>
    <dx:ASPxTextBox ID="txtgrnumber" runat="server" Height="25PX" Width="170px"   > </dx:ASPxTextBox>
</td>
      </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr>
            <td>
   Year of Purchase: <span class="style10"color="red"><strong></strong></span>
</td>
<td>
    <dx:ASPxTextBox ID="cmb_yearofpurchase" runat="server" Height="25PX" Width="170px"> </dx:ASPxTextBox>
      <%--<ValidationSettings ErrorTextPosition="Bottom" >
            <RequiredField IsRequired="true" ErrorText="Enter Year Of Purchase" />
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>--%>   
</td>
                  <td></td>
<td class="auto-style2"></td>  
             <td>
       Capitalization Date: <span class="style10"color="red"><strong></strong></span>
 </td>
 
 <td>
     <dx:ASPxDateEdit ID="cmb_Capitalizationdate" runat="server" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DisplayFormatString="dd-MM-yyyy" >
        <%-- <ValidationSettings>
             <ErrorFrameStyle ImageSpacing="4px">
                 <ErrorTextPaddings PaddingLeft="4px" />
             </ErrorFrameStyle>
         </ValidationSettings>--%>
     </dx:ASPxDateEdit>
 </td>
                         </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr>                     
             <td>
     Cost Center:<span class="style10"color="red"><strong></strong></span>
 </td>
 
 <td>
     <dx:ASPxTextBox ID="txtcostno" runat="server" Height="25PX" Width="170px"   onkeypress="onlyNumbers(event, 15);" > </dx:ASPxTextBox>
 </td>
        
             <%-- <tr>
        <td>
            &nbsp;</td></tr>
          <tr>
           
            <td></td>
            <td class="auto-style2"></td>--%>
            <%--<td>
               Equipment / Material No:  <span class="style10"color="red"><strong>*</strong></span>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtmaterialno" runat="server" Height="25PX" Width="170px"   onkeypress="onlyNumbers(event, 15);"> </dx:ASPxTextBox>
                <ValidationSettings ErrorTextPosition="Bottom" >
        <RequiredField IsRequired="true" ErrorText="Enter Equipment / Material No" />
        <ErrorFrameStyle ImageSpacing="4px">
            <ErrorTextPaddings PaddingLeft="4px" />
        </ErrorFrameStyle>
    </ValidationSettings>
            </td>--%>
              
                  <%--</tr>--%>
   <td></td>
<td class="auto-style2"></td>  
                      <td>
     Indentor: <span class="style10"color="red"><strong></strong></span>
</td>

<td>
    <dx:ASPxTextBox ID="txt_indentor" runat="server" Height="25PX" Width="170px"  onkeypress="return validateAlphabetsAndLength(event, this.value, 32);" > </dx:ASPxTextBox>
    <%--<ValidationSettings ErrorTextPosition="Bottom" >
            <RequiredField IsRequired="true" ErrorText="Enter Indentor" />
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>--%>
</td>
              </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr>                    
                                            <td>
     Indent No: <span class="style10"color="red"><strong>*</strong></span>
</td>

<td>
    <dx:ASPxTextBox ID="txt_indentno" runat="server" Height="25PX" Width="170px"  onkeypress="return validateAlphabetsNumbersAndLength(event, this.value, 32);" > </dx:ASPxTextBox>
    <ValidationSettings ErrorTextPosition="Bottom" >
            <RequiredField IsRequired="true" ErrorText="Enter Indent Number" />
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>
</td>
  <td></td>
<td class="auto-style2"></td>
                    <td>
          Cost: <span class="style10"color="red"><strong>*</strong></span>  
        </td>
        
        <td>
          <dx:ASPxTextBox ID="txt_cost" runat="server" Height="25PX" Width="170px"  onkeypress="onlyNumb(event,15);"> </dx:ASPxTextBox>
<%--<ValidationSettings ValidationGroup="btn" ErrorTextPosition="Bottom">
    <RequiredField IsRequired="true" ErrorText="Enter the Cost" />
    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                 </ValidationSettings>--%>
              
        </td>
  </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr>                
            <td>
  Warranty Date: <span class="style10"color="red"><strong></strong></span>
</td>
<td>
    <dx:ASPxDateEdit ID="cmb_warrantydate" runat="server" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DisplayFormatString="dd-MM-yyyy" >
     <%--   <ValidationSettings>
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>--%>
    </dx:ASPxDateEdit>
</td>
       <td></td>
<td class="auto-style2"></td>                  
            <td>
                Accept Date by User: <span class="style10"color="red"><strong></strong></span>
            </td>
            
            <td>
                 <dx:ASPxDateEdit ID="cmb_Acceptdatebyuser" runat="server" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DisplayFormatString="dd-MM-yyyy" >
                   <%-- <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>--%>
                </dx:ASPxDateEdit>
            </td>
          </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr> 
            <td>
                PO No for Reference: <%--<span class="style10"color="red"><strong>*</strong></span>--%>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtpono" runat="server" Height="25PX" Width="170px"   onkeypress="onlyNuss(event, 25);"> </dx:ASPxTextBox>
            </td>
        <td></td>
<td class="auto-style2"></td>
      <td>
           Make: <%--<span class="style10"color="red"><strong>*</strong></span>--%>
      </td>
      
      <td>
          <dx:ASPxTextBox ID="txt_make" runat="server" Height="25PX" Width="170px"> </dx:ASPxTextBox>
      </td>
         </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr>
      <td>
        P.O Date: <span class="style10"color="red"><strong></strong></span>
      </td>
      <td>
          <dx:ASPxDateEdit ID="cmb_podate" runat="server" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DisplayFormatString="dd-MM-yyyy" >
           <%--   <ValidationSettings>
                  <ErrorFrameStyle ImageSpacing="4px">
                      <ErrorTextPaddings PaddingLeft="4px" />
                  </ErrorFrameStyle>
              </ValidationSettings>--%>
          </dx:ASPxDateEdit>
      </td>
 <td></td>
<td class="auto-style2"></td>       
            <td>
                 WBS Number for Reference: <%--<span class="style10"color="red"><strong>*</strong></span>--%>
            </td>
            
            <td>
                <dx:ASPxTextBox ID="txtwnfr" runat="server" Height="25PX" Width="170px"   onkeypress="onlyNuss(event, 25);"> </dx:ASPxTextBox>
            </td>
                         </tr>
   <tr>
      <td>
&nbsp;</td></tr>
    <tr>   
            <td>
              Installation Date for Reference: <span class="style10"color="red"><strong></strong></span>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cmb_IDFR" runat="server" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DisplayFormatString="dd-MM-yyyy" >
                 <%--   <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>--%>
                </dx:ASPxDateEdit>
            </td>
    <td></td>
<td class="auto-style2"></td>
            <td>
                 Remarks: <%--<span class="style10"color="red"><strong>*</strong></span>--%>
            </td>
            
            <td>
                <dx:ASPxTextBox ID="txtremark" runat="server" Height="25PX" Width="170px" > </dx:ASPxTextBox>
            </td>
                                          </tr>
   <tr>
      <td>
&nbsp;</td></tr>   
        <tr>
            <td>
              Department: <span class="style10"color="red"><strong>*</strong></span>
            </td>
          
          <%--  <td>
                   <dx:ASPxComboBox ID="Dep_ID" runat="server" ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Height="25px" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">                     
                      </dx:ASPxComboBox>
                <ValidationSettings ErrorTextPosition="Bottom"   >
                        <RequiredField IsRequired="true" ErrorText="Enter Department"  />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </td>--%>
                    <td> <dx:ASPxComboBox ID="Dep_ComboBox1" runat="server" Width="100%" Height="25px" DataSourceID="SqlDataSource3" AutoPostBack="true"
                      CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" TextField="DepartmentName" ValueField="DepartmentCode" IncrementalFilteringMode="StartsWith"  CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText=" Select DepartmentName " />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT DISTINCT [DepartmentCode],[DepartmentName] FROM [DepartmentMaster] ">
         </asp:SqlDataSource>
            </td>
               <td></td>
<td class="auto-style2"></td>
            <td>
     Code: <span class="style10"color="red"><strong>*</strong></span>
</td>

<td>
    <dx:ASPxTextBox ID="txtxcode" runat="server" Height="25PX" Width="170px" > </dx:ASPxTextBox>
</td>
       </tr>

        <tr>
        <td>
            &nbsp;</td></tr>
         
        </table>
       <table>
        
        <tr>
            <td></td>
            <td>
                <dx:ASPxButton ID="btn_save" runat="server"  Text="Save"  Height="25PX" ValidationGroup="btn" Width="50PX"
                   onclick="btn_save_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
        </tr>
        
        <tr>
            <td></td>
            <td>
                 <dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
                  OnClick="btn_Update_Click" Visible="false">
                </dx:ASPxButton>
            </td>
        </tr>
         <tr>
        <td>
            &nbsp;</td></tr>
           </table>
    <table>
        <tr>
            <td>
               <div style="overflow-x:scroll;width:1500px">

               
                 <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" KeyFieldName="SLNO"  MaxColumnWidth="150" OnRowCommand="ASPxGridView1_RowCommand">
                     <Columns>
                          <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" CellStyle-Font-Bold="true">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green"></asp:LinkButton>
                    </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>  
                          <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" CellStyle-Font-Bold="true">
                <DataItemTemplate>
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>  

                         <dx:GridViewDataTextColumn FieldName="SLNO" VisibleIndex="1" ReadOnly="True" Visible="false">
                             <editformsettings visible="False" />
                           
                 </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="2">
                 </dx:GridViewDataTextColumn>
                         
                         <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="3">

                         </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="4" Caption="Supplier Name">
                              </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="InstituteName" VisibleIndex="5">
                              </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="4" Visible="false">
                        </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="InstitutePKID" VisibleIndex="5" Visible="false">
                            </dx:GridViewDataTextColumn>
                          
                         <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="6">
                           <CellStyle HorizontalAlign="Left" />
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="7" Caption="Equipment  Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="8" Caption="Asset sub Number" Visible="false">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="9" Caption="Asset Name">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="10" Width="150" Caption="Asset Owner">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="11" Width="150" Visible="true" Caption="Asset User">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="12" Caption="Staff Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="13" Caption="Serial Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="MACID" VisibleIndex="14" Width="150" Caption="MAC ID">
                         </dx:GridViewDataTextColumn>
                         <%--<dx:GridViewDataTextColumn FieldName="LocationID" VisibleIndex="15">
                         </dx:GridViewDataTextColumn>--%>
                         <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="15" Caption="Wing">
                         </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="16">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="17" Caption="Floor">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="18" Caption="LAB">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="19" Width="150">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="GRNumber" VisibleIndex="20" Caption="GR Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="YearofPurchase" VisibleIndex="21" Caption="Year of Purchase">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="CapitalizationDate" VisibleIndex="22">
                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="23">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="CostCenter" VisibleIndex="24" Caption="Cost Center">
                         </dx:GridViewDataTextColumn>
                         <%--<dx:GridViewDataTextColumn FieldName="MaterialNumber" VisibleIndex="24">
                         </dx:GridViewDataTextColumn>--%>
                         <dx:GridViewDataTextColumn FieldName="Indentor" VisibleIndex="25">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="IndentNumber" VisibleIndex="26">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Cost" VisibleIndex="27">
                         </dx:GridViewDataTextColumn>
                          <dx:GridViewDataDateColumn FieldName="WarrantyDate" VisibleIndex="28">
                              <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                          </dx:GridViewDataDateColumn>
                         <dx:GridViewDataDateColumn FieldName="AcceptDatebyUser" VisibleIndex="29">
                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="30">
                         </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="31">
                        </dx:GridViewDataTextColumn>
                          <dx:GridViewDataDateColumn FieldName="PODate" VisibleIndex="32">
                              <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="WBSNumberforReference" VisibleIndex="33">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="InstallationDateforReference" VisibleIndex="34">
                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="Code" VisibleIndex="35">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="36">
                         </dx:GridViewDataTextColumn>
                          <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="37">
                              <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
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
                     <SettingsPager PageSize="15"></SettingsPager>
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
                       <%--  <dx:GridViewDataTextColumn FieldName="ComponentDesc" VisibleIndex="27" Visible="false">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Deacdate" VisibleIndex="28">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Invdate" VisibleIndex="29">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="InventoryNote" VisibleIndex="30">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="31">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="CostCtr" VisibleIndex="32">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="InitiatedBy" VisibleIndex="33">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="34">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="VerifDate" VisibleIndex="35">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="FiscalYear" VisibleIndex="36">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="CustVeriBy" VisibleIndex="37">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="CustodianVerificationDate" VisibleIndex="38">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataDateColumn FieldName="CustodianVerificationTime" VisibleIndex="39">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="FinanceVeriBy" VisibleIndex="40">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="FInVerifDt" VisibleIndex="41">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataDateColumn FieldName="FinanceVerificationTime" VisibleIndex="42">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="CompanyCode" VisibleIndex="43">
                         </dx:GridViewDataTextColumn>
                          
                         <dx:GridViewDataTextColumn FieldName="Client" VisibleIndex="44">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="TechnicalAssetNumber" VisibleIndex="45">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetType" VisibleIndex="46">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="AssetCreatedDate" VisibleIndex="47">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetCreatedBy" VisibleIndex="48">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetCatagory" VisibleIndex="49">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetOrigin" VisibleIndex="50">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetSupplier" VisibleIndex="51">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetManufacturer" VisibleIndex="52">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="53">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Latitude" VisibleIndex="54">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Longitude" VisibleIndex="55">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="56">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="57">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="58">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetDescription" VisibleIndex="59">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="60">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="61">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="StaffNumber" VisibleIndex="62">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="LocationID" VisibleIndex="63">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="YearofPurchase" VisibleIndex="64">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataDateColumn FieldName="CapitalizationDate" VisibleIndex="65">
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="CostCenter" VisibleIndex="66">
                         </dx:GridViewDataTextColumn>--%>
<%--                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="SELECT * FROM [AssetMaster] where Status !='InActive' ORDER BY SLNO Desc"></asp:SqlDataSource>--%>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
                     SelectCommand="SELECT 
                                AssetMaster.*, 
                               InstemAMS..SupplierMaster.CompanyName,
                              InstemAMS..InstituteMaster.InstituteName
                            FROM 
                              InstemSAP..[AssetMaster]
                            INNER JOIN 
                              InstemAMS..[SupplierMaster] ON AssetMaster.SupplierID = [SupplierMaster].SupplierID
                            INNER JOIN 
                                InstemAMS..[InstituteMaster] ON AssetMaster.InstitutePKID = InstituteMaster.InstitutePKID
                            WHERE 
                                AssetMaster.Status != 'InActive'
                            ORDER BY 
                                AssetMaster.SLNO DESC
                            "></asp:SqlDataSource>

</div>
                </td>    
        </tr>
    </table>
    </div>
</asp:Content>


