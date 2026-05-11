<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddSupplier.aspx.cs" Inherits="VendorMaster" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 76%;
            margin-left: 58px;
        }
        .style2
        {
        }
        .style3
        {
            width: 165px;
        }
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
        width: 158px;
    }
        .style5
        {
            font-size: medium;
        }
        .auto-style7 {
            color: #333300;
        }
        
        .auto-style8 {
            color: #000000;
        }
        .auto-style9 {
            width: 10px;
        }
        .auto-style10 {
            font-size: small;
            color: #000000;
        }
        
        .auto-style11 {
        width: 161px;
    }
        
        .auto-style12 {
            width: 85%;
            margin-left: 58px;
            margin-right: 38px;
        }
        
        </style>
    <%--<script type="text/javascript">
        function validation(s, e) {
            var phoneno = /^\d{10}$/;
            var pincode = /^([1-9])([0-9]){5}$/;
            var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            var fax_numeric = /^[0-9]+$/;

            if (client_txt_cmpname.GetText() == "") {
                client_lblmsg.SetText('<%= Resources.Messages._30012%>');
                client_txt_cmpname.Focus();
                e.cancel();
                return false;
            }

            if (client_txt_mobile.GetText() != "") {
                if (!(client_txt_mobile.GetValue().match(phoneno))) {
                    //alert("contact calling");
                    client_lblmsg.SetText('<%= Resources.Messages._30003%>');
                    client_txt_mobile.Focus();
                    e.cancel();
                    return false;
                }
            } 
//            if (client_txtPinCode.GetText() != "") {
//                if (!(client_txtPinCode.GetValue().match(pincode))) {
//                    //alert("pincode calling");
//                    client_lblmsg.SetText('<%= Resources.Messages._30004%>');
//                    client_txtPinCode.Focus();
//                    e.cancel();
//                    return false;
//                }
//            }
            if (client_txtEmailId.GetText() != "") {
                if (!(client_txtEmailId.GetValue().match(filter))) {
                    //alert("email calling");
                    client_lblmsg.SetText('<%= Resources.Messages._30005%>');
                    client_txtEmailId.Focus();
                    e.cancel();
                    return false;
                }
            }
//            if (client_txtFaxNo.GetText() != "") {
//                if (!(client_txtFaxNo.GetValue().match(fax_numeric))) {
//                    //alert("fax calling");
//                    client_lblmsg.SetText('<%= Resources.Messages._30006%>');
//                    client_txtFaxNo.Focus();
//                    e.cancel();
//                    return false;
//                }
//            }
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
    <span class="style5">&nbsp;&nbsp; <span class="auto-style8">ADD SUPPLIER</span></span></strong><br />
    <table class="auto-style12">
               <tr>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
               <tr>
            <td class="auto-style11">
             Supplier Code :<span class="auto-style1"><strong>*</strong></span></td>
         <td class="style3">
             <dx:ASPxTextBox ID="txt_spcode" runat="server" Width="300px" Height="25px" ClientInstanceName="client_txt_spcode">
            <ValidationSettings SetFocusOnError="True">
            <RequiredField ErrorText="enter supplier code" IsRequired="True" />
            </ValidationSettings>
                 </dx:ASPxTextBox>
         </td>
           <td class="auto-style9">
                &nbsp;</td>
                <td class="auto-style2">
     Supplier Name :<span class="auto-style1"><strong>*</strong></span></td>
 <td class="style3">
     <dx:ASPxTextBox ID="txt_cmpname" runat="server" Width="300px" Height="25px" ClientInstanceName="client_txt_cmpname">
         <ValidationSettings SetFocusOnError="True">
<RequiredField ErrorText="enter supplier name" IsRequired="True" />
</ValidationSettings>
     </dx:ASPxTextBox>
 </td>

</tr>
                  <tr>
<td>
    &nbsp;</td></tr>
           <%-- <td class="auto-style11">
                Supplier Name :<span class="auto-style1"><strong>*</strong></span></td>
            <td class="style3">
                <dx:ASPxTextBox ID="txt_cmpname" runat="server" Width="170px" Height="25px" ClientInstanceName="client_txt_cmpname">
                </dx:ASPxTextBox>
            </td>--%>
        <tr>
      <%-- <td class="auto-style11">
            &nbsp;</td>--%>
        <td class="auto-style11">
            Contact person Name : <span class="auto-style1"><strong>*</strong></span></td>
        <td>
            <dx:ASPxTextBox ID="txt_cntprsname" runat="server" Width="300px" Height="25px">
                <ValidationSettings SetFocusOnError="True">
<RequiredField ErrorText="enter contact person name" IsRequired="True" />
</ValidationSettings>
            </dx:ASPxTextBox>
        </td>
                    <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                Contact Number : <span class="auto-style1"><strong>*</strong></span></td>
            <td>
                <dx:ASPxTextBox ID="txt_cntprsno" runat="server" Width="300px" Height="25px" ClientInstanceName="client_txt_mobile" MaxLength="10">
                <ValidationSettings SetFocusOnError="True">
<RequiredField ErrorText="enter contact number" IsRequired="True" />
</ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
                          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td class="auto-style11">
                Address :</td>
            <td class="style3">
                <dx:ASPxTextBox ID="txt_adress" runat="server" Width="300px" Height="25px">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                Area :</td>
            <td>
                <dx:ASPxTextBox ID="txt_area" runat="server" Width="300px" Height="25px">
                </dx:ASPxTextBox>
            </td>
        </tr>
                          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td class="auto-style11">
                State :<span class="auto-style1"><strong>*</strong></span></td>
            <td class="style3">
                <dx:ASPxComboBox ID="cmb_state" runat="server" DataSourceID="SqlDataSource1"  AutoPostBack="true" Width="300px" Height="25px"
                    onselectedindexchanged="cmb_state_SelectedIndexChanged"   TextField="State" IncrementalFilteringMode="StartsWith"
                    ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" >
                    <ValidationSettings SetFocusOnError="True">
                        <RequiredField ErrorText="Select State" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                City :<span class="auto-style1"><strong>*</strong></span></td>
            <td>
                <dx:ASPxComboBox ID="cmb_city" runat="server" DataSourceID="SqlDataSource2"  TextField="city_name" IncrementalFilteringMode="StartsWith"
                    ValueType="System.String" Width="300px" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" >
                    <ValidationSettings>
                        <RequiredField ErrorText="Select City" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
                          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td class="auto-style11">
                Pincode :</td>
            <td class="style3">
                <dx:ASPxTextBox ID="txt_pincode" runat="server" Width="300px" Height="25px" ClientInstanceName="client_txtPinCode">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                Phone No : <span class="auto-style1"><strong>*</strong></span></td>
            <td>
                <dx:ASPxTextBox ID="txt_mobile" runat="server" Width="300px"  Height="25px" ClientInstanceName="client_txt_mobile" MaxLength="10">
                <ValidationSettings SetFocusOnError="True">
<RequiredField ErrorText="enter phone no" IsRequired="True" />
</ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
                          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td class="auto-style11">
                Fax Number :</td>
            <td class="style3">
                <dx:ASPxTextBox ID="txt_faxno" runat="server" Width="300px" Height="25" ClientInstanceName="client_txtFaxNo">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                E Mail :</td>
            <td>
                <dx:ASPxTextBox ID="txt_mail" runat="server" Width="300px" Height="25" ClientInstanceName="client_txtEmailId">
                </dx:ASPxTextBox>
            </td>
        </tr>
                          <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
              <%--  <dx:ASPxGridView ID="gridviewMaterial" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource4" 
        KeyFieldName="MaterialId" CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" 
        CssPostfix="BlackGlass" style="margin-left: 55px">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="MaterialId" ReadOnly="True" VisibleIndex="1" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MaterialName" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MaterialCode" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ReceivedUnit" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ConsumptionUnit" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UnitRatio" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="UnitRatio" VisibleIndex="7" Caption="Min.OrderQty">
                           <DataItemTemplate>
                                <dx:ASPxSpinEdit ID="spineditMinQty" runat="server" Height="25px" Number="0" Width="75px"/>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                  
                    <SettingsPager PageSize="50">
                    </SettingsPager>
                  
                    <Images SpriteCssFilePath="~/App_Themes/BlackGlass/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/BlackGlass/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/BlackGlass/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/BlackGlass/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Styles CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                    </Styles>
                    <StylesEditors>
                        <CalendarHeader Spacing="1px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dx:ASPxGridView>--%>
            <br />
                <dx:ASPxButton ID="btn_save" runat="server" Text="Save" 
                    onclick="btn_save_Click" 
                    AutoPostBack="False" Width="100px" style="margin-left: 56px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                     
                </dx:ASPxButton>
    <span class="auto-style7"><dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" 
                    OnClick="btn_Update_Click" style="margin-left: 55px" >
                </dx:ASPxButton>
                
    </span>
    <div>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <span class="style5">&nbsp;</span><span class="auto-style10">VIEW SUPPLIER DETAILS </span></strong>
        <br />
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="ASPxGridView1_RowCommand"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
             DataSourceID="SqlDataSource3" 
            KeyFieldName="SupplierID" style="margin-left: 47px">
            <Columns>
                         <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" CellStyle-Font-Bold="true">
    <DataItemTemplate>
        <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green" width="50%"></asp:LinkButton>
        </DataItemTemplate>
    
</dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" CellStyle-Font-Bold="true">
    <DataItemTemplate>
        <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red" width="50%"></asp:LinkButton>
    </DataItemTemplate>
                




                <%--<dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                    
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </DataItemTemplate>--%>
                
            </dx:GridViewDataTextColumn> 
                <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="1" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VendorCode" VisibleIndex="2" Caption="Supplier Code">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="3" Caption="Supplier Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ContactPerson" VisibleIndex="4"  Caption="Contact Person">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="ContactNumber" VisibleIndex="5" Caption="Contact Number">               
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="6" Caption="Address">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="7" Caption="Area">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pincode" VisibleIndex="8" Caption="Pincode">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="PhoneNumber" VisibleIndex="9" Caption="PhoneNumber">
                 </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Fax" VisibleIndex="10" Caption="Fax">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="State" VisibleIndex="11" Caption="State">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="12" Caption="City">
                </dx:GridViewDataTextColumn>       
               
                <dx:GridViewDataTextColumn FieldName="EMail" VisibleIndex="13" Caption="Mail Id">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
          
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
            <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue">
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
            </Styles>
            <StylesEditors>
                <CalendarHeader Spacing="1px">
                </CalendarHeader>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
          
        </dx:ASPxGridView>
               <%-- <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                  SelectCommand="SELECT [MaterialId], [MaterialName], [MaterialCode], [ReceivedUnit], [ConsumptionUnit], [UnitRatio] FROM [MaterialMaster]">
                </asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
            SelectCommand="SELECT [SupplierID], [VendorCode], [CompanyName], [ContactPerson],[State], [City], [ContactNumber],[Address],[Area],[Pincode],[PhoneNumber],[Fax],[EMail] FROM [SupplierMaster] WHERE Status='Active'"
            UpdateCommand="UPDATE SupplierMaster SET [VendorCode]=@VendorCode, [CompanyName]=@CompanyName, [ContactPerson]=@ContactPerson, [City]=@City, [ContactNumber]=@ContactNumber,[Address]=@Address,Area=@Area,Pincode=@Pincode,[PhoneNumber]=@PhoneNumber,[Fax]=@Fax,State=@State,[EMail]=@EMail WHERE [SupplierID]=@SupplierID">
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                    SelectCommand="SELECT [city_name] FROM [tblcitylist] where state=@state ">
                    <SelectParameters>
                    <asp:SessionParameter  Name="state" SessionField="state"/>
                    </SelectParameters>
                    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                    SelectCommand="SELECT distinct [state] FROM [tblcitylist]"></asp:SqlDataSource>
    </div>


</asp:Content>

