<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SingleQRPrint.aspx.cs" Inherits="SingleQRPrint" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <%--<script type = "text/javascript">
    function GetCheckBoxValue(s, e) {
        var value = s.GetChecked();
        alert(value);
        var grid = document.getElementById("<%= ASPxGridView1.ClientID %>");
       
        alert(grid.rows.length);
        for (var i = 1; i < grid.rows.length; i++) {       
            var inputList = grid.rows[i].getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        row.style.backgroundColor = "aqua";
                        inputList[i].checked = true;
                    }
                }
            }
        }
       
    }
</script>--%>
    <script language="javascript" type="text/javascript">
        var _selectNumber = 0;
        var _all = false;
        var _handle = true;

        function OnAllCheckedChanged(s, e) {
            if (s.GetChecked())
                grid.SelectRows();
            else
                grid.UnselectRows();
        }

        function OnGridSelectionChanged(s, e) {
            cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);

            if (e.isChangedOnServer == false) {
                if (e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber = s.GetVisibleRowsOnPage();
                else if (e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber = 0;
                else if (!e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber++;
                else if (!e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber--;

                if (_handle) {
                    cbPage.SetChecked(_selectNumber == s.GetVisibleRowsOnPage());
                    _handle = false;
                }
                _handle = true;
            }
            else {
                cbPage.SetChecked(cbAll.GetChecked());
            }
        }

        function OnPageCheckedChanged(s, e) {
            _handle = false;
            if (s.GetChecked())
                grid.SelectAllRowsOnPage();
            else
                grid.UnselectAllRowsOnPage();
        }

        function OnGridEndCallback(s, e) {
            _selectNumber = s.cpSelectedRowsOnPage;
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="col-sm-12">
     <strong><span class="style6"><span class="dxmLite_Glass">
   Print Single Lable QRCode for Selected Assets <br />
</span></span></strong>
    <div class="">
           <dx:ASPxLabel ID="lbl_error" runat="server" 
        style="color: #FF0000; font-weight: 700">
    </dx:ASPxLabel>
       
        
         <div class=" style3">
                <dx:ASPxImage ID="ASPxImage1" runat="server" Visible="false">
                </dx:ASPxImage>
          </div>
          <div class=" table-responsive">
        <dx:ASPxGridView ID="grid"  runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" OnCustomJSProperties="grid_CustomJSProperties"
                    DataSourceID="SqlDSGrid" KeyFieldName="AssetID"  
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="950px" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">
        <Columns>
             <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                    <HeaderTemplate>
                        <dx:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                            BackColor="White" OnInit="cbAll_Init">
                            <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                        </dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="cbPage" runat="server" ClientInstanceName="cbPage" ToolTip="Select all rows within the page"
                            OnInit="cbPage_Init">
                            <ClientSideEvents CheckedChanged="OnPageCheckedChanged" />
                        </dx:ASPxCheckBox>
                    </HeaderTemplate>
                </dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" Visible="true" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" Width="200px" Caption="Sub Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Name" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="Code" VisibleIndex="5" Caption="Code" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="AdditionalDesc" VisibleIndex="6" Caption="Additional Description" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="8" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="9" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="10" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
           <%-- <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="11" Caption="Floor">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="12" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="13">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="14">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="15" Caption="Quantity">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="16" Caption="Unit">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="AssetCapitalizationDate" VisibleIndex="17" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FirstAcquisitionDate" VisibleIndex="18" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>            
            <dx:GridViewDataTextColumn FieldName="Component" VisibleIndex="19">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="ComponentDesc" VisibleIndex="20">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataDateColumn FieldName="Deacdate" VisibleIndex="21" Caption="Deactivation Date" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Invdate" VisibleIndex="22" Caption="Inventory Date" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InventoryNote" VisibleIndex="23" Caption="Inventory Note">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="QRCode" VisibleIndex="24" Caption="QRCode">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="PrintStatus" VisibleIndex="10" Caption="PrintStatus" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>                        
            <dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="25">
                 <Settings AutoFilterCondition="Contains" />
                        <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="26" Caption="Imported Date" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
        </Columns>
            <SettingsPager  ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
              <TotalSummary>
<dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
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
    


    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
        SelectCommand="Select * from RCBSAP..vAssetMaster
        ">
         <SelectParameters>
           <asp:SessionParameter Name="AdminID" SessionField="UserID" />
       </SelectParameters>
    </asp:SqlDataSource>                                     
    
      </div>
        <br/>
    
     <table class="style8" style="width:460px">
        <tr>
            <td class="style9">
                <dx:ASPxButton ID="btn_printItems" runat="server" Text="Print PDf" 
                    onclick="btn_printItems_Click" Width="191px" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            
            </td>
          
            <td>
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
    </div>

</asp:Content>

