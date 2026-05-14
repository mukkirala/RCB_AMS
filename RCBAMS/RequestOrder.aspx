<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestOrder.aspx.cs" Inherits="RequestOrder" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dxlp" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 119px;
        }
        .auto-style12 {
            color: #FF0000;
        }       
        .style6
        {
            font-size: medium;
            color: #000000;
        }
        .style16
        {
            color: #000000;
        }
        .style18
        {
            width: 384px;
        }
        
        .style104
        {
            width: 121px;
        }
   
        .style107
        {
            width: 201px;
        }
        .style108
        {
            width: 403px;
        }
        .style109
        {
            width: 166px;
        }
        .auto-style13 {
            width: 288px;
        }
        .auto-style16 {
            width: 286px;
        }
     
  
        .auto-style22 {
            width: 180px;
            height: 22px;
        }
        .auto-style24 {
            width: 92px;
            height: 22px;
        }
        .auto-style25 {
            width: 165px;
            height: 22px;
        }
        .auto-style26 {
            height: 22px;
        }
        .auto-style27 {
            height: 22px;
            width: 54px;
        }
  
    .auto-style29 {
        width: 108px;
    }
    .req-table {
    margin-left: 55px;
    width: 1000px;
    border-collapse: separate;
    border-spacing: 0 12px;
}

.req-table td {
    padding-right: 25px;
    vertical-align: top;
}

.req-label {
    font-size: 15px;
    font-weight: 600;
    color: #000;
    padding-bottom: 6px;
}

.req-btn-cell {
    padding-top: 25px;
}
.auto-style18 {
    width: 220px;
    padding-bottom: 14px;
}

.auto-style20 {
    width: 260px;
    padding-left: 80px;
    padding-bottom: 14px;
}

.auto-style28 {
    width: 260px;
    padding-bottom: 14px;
}

.style105 {
    width: 180px;
    padding-left: 90px;
    padding-bottom: 14px;
}
    </style>
    <script type="text/javascript">

        //Process changed fuc.......................................................................................
        function ProcessValueChanged(key, Quantity) {


            var newkey = key.toString();
            if (!hiddenField.Contains(newkey)) {
                hiddenField.Add(newkey, newkey + ";" + Quantity);
            }

            else {
                hiddenField.Set(newkey, newkey + ";" + Quantity);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


     <asp:Label ID="ASPxLabel2" runat="server" Text="" style="color: #FF0000"></asp:Label>
  
   
<br />
    <strong style="margin-left:55px"><span class="style6">Requisition To 
    Warehouse<br />
    </span></strong>
    <br />
    <table style="margin-left:55px; width: 901px;">
        <tr>
            <td class="auto-style22">Requisition Date </td>
            <td class="auto-style27">
                <dx:ASPxLabel ID="lbldate" runat="server" 
                    style="color: #0000CC">
            </dx:ASPxLabel>
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style25"></td>
            <td class="auto-style29"></td>
            <td class="auto-style26"></td>
        </tr>
      <tr>
    <td class="auto-style18">
        Staff Number:
    </td>
    <td class="auto-style28">
        <dx:ASPxLabel ID="reqid" runat="server"
            style="font-weight:700; color:#000000; font-size:medium;">
        </dx:ASPxLabel>
    </td>

    <td class="style105">
        User Name:
    </td>

    <td class="auto-style20">
        <dx:ASPxLabel ID="lbl_requestername" runat="server"
            style="font-weight:700; color:#000000; font-size:medium;">
        </dx:ASPxLabel>
    </td>
</tr>

<tr>
    <td class="auto-style18">
        Department:
    </td>

    <td class="auto-style28">
        <dx:ASPxLabel ID="reqdept" runat="server"
            style="font-weight:700; color:#000000; font-size:medium;">
        </dx:ASPxLabel>
    </td>

    <td class="style105">
        Designation:
    </td>

    <td class="auto-style20">
        <dx:ASPxLabel ID="reqdesign" runat="server"
            style="font-weight:700; color:#000000; font-size:medium;">
        </dx:ASPxLabel>
    </td>
</tr>

<tr>
    <td class="auto-style18">
        Email:
    </td>

    <td class="auto-style28">
        <dx:ASPxLabel ID="lblmail" runat="server"
            style="font-weight:700; color:#000000; font-size:medium;">
        </dx:ASPxLabel>
    </td>
</tr>
        <tr>
           <%-- <td class="auto-style18">Warehouse<span class="auto-style12"><strong> *</strong></span></td>
            <td class="auto-style28">
                <dx:ASPxGridLookup ID="ASPxGridLookup3" runat="server" Width="200px" height="25px"
                    AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" DataSourceID="SqlDSGodown" KeyFieldName="GodownId" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    IncrementalFilteringMode="Contains">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="GodownId" ReadOnly="True" 
                            VisibleIndex="0">
                            <Settings AutoFilterCondition="Contains" />
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GodownName" VisibleIndex="1">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ContactPerson" Visible="false" VisibleIndex="2">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ContactNo" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="4" Visible="false">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="EmailId" VisibleIndex="5" Visible="false">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="DivisionName" Caption="Catergory" VisibleIndex="6" Visible="true">
                         <Settings AutoFilterCondition="Contains" />
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
                    <GridViewProperties>
        <SettingsPager PageSize="5" />
    </GridViewProperties>
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
                        <RequiredField ErrorText="Warehouse Required" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxGridLookup>
            </td>--%>
            
        </tr>
      <%--  <tr>
            <td class="style109">Cc</td>
            <td class="style108">
                <dx:ASPxTextBox ID="txt_Cc" runat="server" Width="400px">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style109">Bcc</td>
            <td class="style108">
                <dx:ASPxTextBox ID="txt_Bcc" runat="server" Width="400px">
                    <ValidationSettings>
                        <RequiredField ErrorText="" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            
        </tr>--%>
        <tr>
            <td class="auto-style18"><br /></td>
        </tr>
        <tr>
            <td class="auto-style18">Requisition Description <span class="auto-style12"><strong>*</strong></span></td>
            <td class="auto-style28" rowspan="2">
                <asp:TextBox  ID="ASPxMemo2" Width="200px" runat="server" TextMode="MultiLine" Rows="2" Columns="18"> 
                    
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
        </tr>       
        <%--<tr>
            <td class="style109">&nbsp;Email Subject </td>
            <td class="style108">
                <dx:ASPxTextBox ID="txtsubject" runat="server"  Width="400px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style109">Email Description </td>
            <td class="style108">
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="150px" Width="400px" 
                    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxMemo>
            </td>
        </tr>--%>
        </table>
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <dx:ASPxLabel ID="lbl_error" runat="server" 
                style="color: #FF3300; font-weight: 700;">
            </dx:ASPxLabel>
        <br />
           <strong style="margin-left:55px">
    <span class="style6">Select Items</span>
</strong>

<table border="0"
    style="margin-left:55px; width:1100px; border-collapse:separate; border-spacing:0 12px;">

    <tr>

        <!-- Asset Class -->
        <td style="width:280px; padding-right:30px;">

            <div style="font-weight:600; margin-bottom:6px;">
                Asset Class
            </div>

            <dx:ASPxComboBox ID="cmb_AssetClass"
                runat="server"
                TextField="AssetClassName"
                ValueField="AssetClassName"
                ValueType="System.String"
                AutoPostBack="True"
                Width="320px"
                Height="28px"
                DataSourceID="AssetClassDS"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                CssPostfix="PlasticBlue"
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">

            </dx:ASPxComboBox>

        </td>

        <!-- Asset -->
        <td style="width:360px; padding-right:30px;">

            <div style="font-weight:600; margin-bottom:6px;">
                Asset Name
            </div>

            <dx:ASPxGridLookup ID="ASPxGridLookup1"
                runat="server"
                ClientInstanceName="ASPxGridLookup1"
                AutoGenerateColumns="False"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                CssPostfix="PlasticBlue"
                DataSourceID="SqlDataSource1"
                IncrementalFilteringMode="Contains"
                KeyFieldName="AssetTypeID"
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
                Width="320px">

                <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True"
                        AllowSelectSingleRowOnly="True" />
                    <SettingsPager PageSize="5"></SettingsPager>
                    <Settings ShowFilterRow="True"
                        ShowStatusBar="Visible" />
                </GridViewProperties>

                <Columns>

                    <dx:GridViewDataTextColumn
                        FieldName="AssetTypeID"
                        Visible="false"
                        VisibleIndex="0">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn
                        FieldName="AssetTypeName"
                        Caption="Asset Name"
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>

                </Columns>

            </dx:ASPxGridLookup>

        </td>

        <!-- Qty -->
        <td style="width:180px; padding-right:30px;">

            <div style="font-weight:600; margin-bottom:6px;">
                Required Qty
            </div>

            <dx:ASPxSpinEdit ID="txt_Qty"
                runat="server"
                ClientInstanceName="txt_Qty"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                CssPostfix="PlasticBlue"
                MaxValue="9999999999999999"
                Number="0"
                Width="140px"
                Height="28px"
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            </dx:ASPxSpinEdit>

        </td>

        <!-- Button -->
        <td style="padding-top:28px;">

            <dx:ASPxButton ID="lbl_add"
                runat="server"
                onclick="lbl_add_Click"
                Text="ADD"
                Width="100px"
                Height="38px"
                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"
                CssPostfix="SoftOrange"
                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
            </dx:ASPxButton>

        </td>

    </tr>

</table>
            <br />
            <strong style="margin-left:55px"><span class="style6">Items List</span></strong><dx:ASPxGridView 
                ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="ItemID" onrowcommand="ASPxGridView1_RowCommand" 
                Style="margin-left:55px" Width="1000px">
                <ClientSideEvents CallbackError="function(s, e) {alert('Session expired!'); location.href='Login.aspx';}" />
                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="RequiredQuantity" SummaryType="Sum" />
                    <dx:ASPxSummaryItem FieldName="ItemCode" SummaryType="Count" />
                </TotalSummary>
                <Columns>

    <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0">
        <DataItemTemplate>
            <asp:LinkButton ID="btn_Delete"
                runat="server"
                CommandName="Delete">
                Delete
            </asp:LinkButton>
        </DataItemTemplate>
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="AssetID"
        Visible="false"
        VisibleIndex="1">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="MainAssetNumber"
        Caption="Asset Number"
        VisibleIndex="2">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="AssetSubNumber"
        Caption="Sub Number"
        VisibleIndex="3">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="AssetDesc"
        Caption="Asset Description"
        VisibleIndex="4">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="SerialNumber"
        Caption="Serial Number"
        VisibleIndex="5">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="Location"
        VisibleIndex="6">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="Department"
        VisibleIndex="7">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn FieldName="RequiredQuantity"
        Caption="Quantity"
        VisibleIndex="8">
    </dx:GridViewDataTextColumn>

</Columns>
                <SettingsPager PageSize="1000" showdefaultimages="False">
                    <allbutton text="All">
                    </allbutton>
                    <nextpagebutton text="Next &gt;">
                    </nextpagebutton>
                    <prevpagebutton text="&lt; Prev">
                    </prevpagebutton>
                </SettingsPager>
                <Settings ShowFilterRow="True" ShowFooter="True" />
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
                    <progressbar height="25px">
                    </progressbar>
                </StylesEditors>
            </dx:ASPxGridView>
   <%-- <strong style="margin-left:55px"><span class="style6">Supplier List</span></strong><br />
    <dx:ASPxGridView ID="ASPxGridView2" Style="margin-left:55px" runat="server" Width="800px" 
        AutoGenerateColumns="False" 
        KeyFieldName="SupplierVendorID" CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
        CssPostfix="Glass">
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="SupplierVendorID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SupplierVendorName" VisibleIndex="2" Caption="Supplier">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactPerson" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PhoneNumber" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EMailID" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowGroupPanel="True" ShowFilterRow="True" />
        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="1px">
            </CalendarHeader>
        </StylesEditors>
    </dx:ASPxGridView>--%>
    
        </ContentTemplate>
    </asp:UpdatePanel>
   <br />
     <dx:ASPxButton ID="btnsendmail" runat="server" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"
         style="margin-left: 40px; margin-top: 0px" 
         CssPostfix="SoftOrange" OnClick="btnsendmail_Click" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Send Request" Width="118px">
  
</dx:ASPxButton>
   <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lpanel" Modal="True" >
                        </dxlp:ASPxLoadingPanel>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server"
    ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"

    SelectCommand="
    SELECT 
        AssetID,
        MainAssetNumber,
        AssetSubNumber,
        AssetDesc,
        SerialNumber,
        Location,
        Department,
        Status
    FROM AssetMaster
    WHERE Status!='InActive'
    ORDER BY MainAssetNumber">
</asp:SqlDataSource>


    <asp:SqlDataSource ID="AssetClassDS" runat="server"
    ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
    SelectCommand="
    SELECT AssetClassName
    FROM AssetClassMaster
    WHERE Status='Active'">
</asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>"
    SelectCommand="
    select AssetTypeID,
           AssetTypeName,
           AssetTypeCode
    from AssetTypeMaster
    where AssetClassName=@AssetClassName">

    <SelectParameters>

        <asp:ControlParameter
            ControlID="cmb_AssetClass"
            Name="AssetClassName"
            PropertyName="Value" />

    </SelectParameters>

</asp:SqlDataSource>
        
               <%-- <asp:SqlDataSource ID="SqlDSGodown" runat="server" 
    ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" 
    SelectCommand="SELECT GodownMaster.GodownId, [GodownName], [ContactPerson], [ContactNo],EmailId,
Address,DivisionMaster.DivisionID as DIVID,DivisionName FROM [GodownMaster] 
inner join DivisionMaster on DivisionMaster.DivisionID=GodownMaster.DivisionID

Where  GodownMaster.DivisionId=@Division
And GodownStatus='Active'">            
    <SelectParameters>
        <asp:SessionParameter Name="Godown" SessionField="GodownName" Type="String" />
        <asp:SessionParameter Name="Division" SessionField="DivisionId"  Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>--%>
  
</asp:Content>



