<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="Default3" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
 <%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>


<%--<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken= " namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style12 {
        }
        .auto-style17 {
            width: 182px;
        }
        .auto-style18 {
            width: 102px;
        }
        .auto-style19 {
            width: 114px;
            height: 28px;
        }
        .auto-style20 {
            height: 28px;
            width: 182px;
        }
        .auto-style21 {
            height: 28px;
            width: 102px;
        }
        .auto-style22 {
            height: 28px;
        }
    .auto-style23 {
        }
        .auto-style24 {
            width: 107px;
        }
        .style1
        {
            color: #FF5050;
        }
        .style2
        {}
    </style>
    <script type="text/javascript">
        // <![CDATA[
        function ShowLoginWindow() {
            pcLogin.Show();
        }
        // ]]> 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td align="left" colspan="7" class="style2">Add Employee </td>
        </tr>
        <tr>
            <td align="left" colspan="7">
                         <strong designer:mapid="ef">
                         <dx:ASPxLabel ID="Lbl_Display" runat="server"  
                             Height="20px" Text="">
                         </dx:ASPxLabel>
                         </strong>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                         <strong style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                         <span class="style117" style="font-size: x-small;">Fields are Mandatory</span><span 
                             class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong><span 
                             style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">&nbsp;</span></td>
            <td rowspan="8">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Employee Photo" Height="141px" HorizontalAlign="center" 
                    Width="147px">

                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
 
    <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Height="135px" 
        Width="140px" ImageAlign="Middle">
    </dx:ASPxBinaryImage> 
   </dx:PanelContent>
</PanelCollection>
                             </dx:ASPxRoundPanel></td>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style12">Basic Details:</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">First Name<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong> :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtfirstname" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">Last Name<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong> :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtlastname" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">Father&#39;s Name :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtfathername" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">Date Of Birth :</td>
            <td colspan="4">
                <dx:ASPxDateEdit ID="dateofbirth" runat="server">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">Blood Group :</td>
            <td colspan="4">
                <dx:ASPxComboBox ID="cmbbloodgroup" runat="server">
                     <Items>
                        <dx:ListEditItem Text="A+" Value="A+" />
                        <dx:ListEditItem Text="A-" Value="A-" />
                        <dx:ListEditItem Text="B+" Value="B+" />
                        <dx:ListEditItem Text="B-" Value="B-" />
                        <dx:ListEditItem Text="O+" Value="O+" />
                        <dx:ListEditItem Text="O-" Value="O-" />
                        <dx:ListEditItem Text="AB+" Value="AB+" />
                        <dx:ListEditItem Text="AB-" Value="AB-" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">Date Of Joining<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong>&nbsp; :</td>
            <td colspan="4">
                <dx:ASPxDateEdit ID="dateofjoining" runat="server">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style19">Qualification<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong>&nbsp; :</td>
            <td class="auto-style20">
                <dx:ASPxComboBox ID="txtqualification" runat="server">
                 <Items>
                        <dx:ListEditItem Text="High School" Value="High School" />
                        <dx:ListEditItem Text="Intermediate" Value="Intermediate" />
                        <dx:ListEditItem Text="Graduation" Value="Graduation" />
                       <dx:ListEditItem Text="Post Graduation" Value="Post Graduation" />
                        <dx:ListEditItem Text="Others" Value="Others" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style21">
                </td>
            <td colspan="2" class="auto-style22">Browse Picture :</td>
            <td class="auto-style22">
               
                 <dx:ASPxUploadControl ID="Image1" runat="server" 
                           ClientInstanceName="uploader1" 
                           OnFileUploadComplete="ASPxUploadControl_FileUploadComplete" Size="35" 
                           Width="170px">
                           <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/jpg" 
                               MaxFileSize="4000000">
                           </ValidationSettings>
                           <ClientSideEvents FileInputCountChanged="loadFile" />
                       </dx:ASPxUploadControl>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style12">Gender<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong>&nbsp; :</td>
            <td class="auto-style17">
                <dx:ASPxRadioButtonList ID="Radiobtngender" runat="server" RepeatDirection="Horizontal" Width="15px" Border-BorderStyle="None" SelectedIndex="0">
                  
                    <Items>
                        <dx:ListEditItem Text="Male" Value="Male" Selected="true" />
                        <dx:ListEditItem Text="Female" Value="Female" />
                    </Items>

<Border BorderStyle="None"></Border>
                </dx:ASPxRadioButtonList>
            </td>
            <td class="auto-style18">
                &nbsp;</td>
            <td colspan="2">Take Picture :</td>
            <td>
                <dx:ASPxButton ID="ASPxButton1" runat="server" BackColor="White" Height="16px" Width="16px" HorizontalAlign="Center" AutoPostBack="false" OnClick="ASPxButton1_Click">
                    <Image Url="Images/camera_icon32.png"></Image>
                    <Border BorderStyle="None"/>
                    <ClientSideEvents Click="function(s, e) { ShowLoginWindow(); }" />
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="7">

                
                <dx:ASPxPopupControl ID="pcLogin" runat="server" CloseAction="CloseButton" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcLogin"
        HeaderText="Capture Image" AllowDragging="True" PopupAnimationType="None" EnableViewState="False">
                    <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); tbLogin.Focus(); }" />
<ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup(&#39;entryGroup&#39;); tbLogin.Focus(); }"></ClientSideEvents>
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <table class="auto-style1">
                                <tr>
                                    <td colspan="2">
                                        <param name="movie" value="WebcamResources/save_picture.swf">
		                               <embed src="WebcamResources/save_picture.swf" width="405" height="190">

		                               </embed>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <dx:ASPxButton ID="btsave" runat="server" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" Height="25px" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Accept" Width="100px" OnClick="btsave_Click1">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btCancel" runat="server" AutoPostBack="False" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" Height="25px" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cancel" Width="100px">
                                            <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
<ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }"></ClientSideEvents>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                </td>
        </tr>
        <tr>
            <td>Address Details:</td>
            <td colspan="4">&nbsp;</td>
            <td colspan="2" rowspan="8"> <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" HeaderText="Address Proof" Height="175px" HorizontalAlign="Center" 
                    Width="380px">

                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttribute="True">
 
    <dx:ASPxBinaryImage ID="ASPxBinaryImage4" runat="server" Height="170px" 
        Width="375px" ImageAlign="Middle">
    </dx:ASPxBinaryImage> 
   </dx:PanelContent>
</PanelCollection>
                             </dx:ASPxRoundPanel></td>
        </tr>
        <tr>
            <td>Address 1 :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtaddress" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Address 2 :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtaddress2" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Area :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtarea" runat="server" Width="170px">
                </dx:ASPxTextBox>
                
            </td>
        </tr>
        <tr>
            <td>State<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong> :</td>
            <td colspan="4">
                 <dx:ASPxComboBox ID="cmb_state" runat="server" DataSourceID="stateDS" 
                        ValueType="System.String" TextField="state" 
                        onselectedindexchanged="cmb_state_SelectedIndexChanged" 
                        AutoPostBack="true" Height="25px" Width="170px" 
                        IncrementalFilteringMode="StartsWith" ForeColor="Black">
                    </dx:ASPxComboBox>
                
            </td>
        </tr>
        <tr>
            <td>City<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong>&nbsp; :</td>
            <td colspan="4">
                    <dx:ASPxComboBox ID="cmb_city" runat="server" DataSourceID="CityDS" 
                        ValueType="System.String" TextField="city_name" Height="25px" 
                        Width="170px" IncrementalFilteringMode="StartsWith" ForeColor="Black">
                       
                    </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Pin Code :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtpincode" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Country<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong> :</td>
            <td colspan="4">
                <dx:ASPxComboBox ID="txtnationality" runat="server">
                    <Items>
                        <dx:ListEditItem Text="Indian" Value="Indian" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Address Proof Type :</td>
            <td colspan="4">
                <dx:ASPxComboBox ID="cmbaddressproof" runat="server">
                     <Items>
                        <dx:ListEditItem Text="Driver License" Value="Driver License" />
                        <dx:ListEditItem Text="Electricity Bill" Value="Electricity Bill" />
                        <dx:ListEditItem Text="Votter Card" Value="Votter Card" />
                         <dx:ListEditItem Text="Rashan Card" Value="Rashan Card" />
                         <dx:ListEditItem Text="Bank Statement" Value="Bank Statement" />
                         <dx:ListEditItem Text="Mobile Bill" Value="Mobile Bill" />
                     
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td>Browse Address Proof :</td>
            <td>
               
                 <dx:ASPxUploadControl ID="Image4" runat="server" 
                           ClientInstanceName="uploader4" 
                           OnFileUploadComplete="ASPxUploadControl4_FileUploadComplete" Size="35" 
                           Width="170px">
                           <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/jpg" 
                               MaxFileSize="4000000">
                           </ValidationSettings>
                           <ClientSideEvents FileInputCountChanged="loadFile" />
                       </dx:ASPxUploadControl>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="4">
                    &nbsp;</td>
            <td>&nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>Contact Details:</td>
            <td colspan="4">
                    &nbsp;</td>
            <td>&nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>Phone Number :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtphonenumber" runat="server" Width="170px" style="margin-left: 0px">
                </dx:ASPxTextBox>
            </td>
            <td>Mobile Number<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong> :</td>
            <td>
                <dx:ASPxTextBox ID="txtmobilenumber" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Alternate Mobile number :</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtalternatemobile" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>E-Mail Address :</td>
            <td>
                <dx:ASPxTextBox ID="txtemailaddress" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="4">
                    &nbsp;</td>
            <td>&nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td colspan="7">Organisational Details :</td>
        </tr>
        <tr>
            <td>Designation<strong 
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span 
                    class="style43" style="color: rgb(255, 0, 0); font-size: large;">*</span></strong> :</td>
            <td colspan="4">
                <dx:ASPxComboBox ID="txtdesignation" runat="server" OnSelectedIndexChanged="txtdesignation_SelectedIndexChanged" AutoPostBack="true">
                     <Items>
                        <dx:ListEditItem Text="Manager" Value="Manager" />
                        <dx:ListEditItem Text="operator" Value="operator" />
                        <dx:ListEditItem Text="CourierBoys" Value="CourierBoys" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td>Posting Location : </td>
            <td>
                <dx:ASPxComboBox ID="txtpostinglocation" runat="server">
                     <Items>
                        <dx:ListEditItem Text="Location A" Value="Location A" />
                        <dx:ListEditItem Text="Location B" Value="Location B" />
                        <dx:ListEditItem Text="Location C " Value="Location C" />
                        <dx:ListEditItem Text="Location D" Value="Location D" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Employee Verification :</td>
            <td colspan="4">
                <dx:ASPxRadioButtonList ID="radiobtnempverification" runat="server" RepeatDirection="Horizontal" Border-BorderStyle="None">
                    <Items>
                        <dx:ListEditItem Text="Yes" Value="Yes" Selected="true" />
                        <dx:ListEditItem Text="No" Value="No" />
                    </Items>
                </dx:ASPxRadioButtonList>
            </td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="7"><dx:ASPxLabel ID="lblinfo" runat="server" Text="The following information is mandatory for Courier Boy :" Visible="false">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblregistrationcard" runat="server" Text="Registration Card :" Visible="false">
                </dx:ASPxLabel>
            </td>
            <td colspan="4">
               
                 <dx:ASPxUploadControl ID="Image2" runat="server" 
                           ClientInstanceName="uploader2" 
                           OnFileUploadComplete="ASPxUploadControl2_FileUploadComplete" Size="35" 
                           Width="170px" Visible="false">
                           <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/jpg" 
                               MaxFileSize="4000000">
                           </ValidationSettings>
                           <ClientSideEvents FileInputCountChanged="loadFile" />
                       </dx:ASPxUploadControl>
                </td>
            <td>
                <dx:ASPxLabel ID="lbldriverlicense" runat="server" Text="Driver Licence :" Visible="false">
                </dx:ASPxLabel>
            </td>
            <td>
               
                 <dx:ASPxUploadControl ID="Image3" runat="server" 
                           ClientInstanceName="uploader3" 
                           OnFileUploadComplete="ASPxUploadControl3_FileUploadComplete" Size="35" 
                           Width="170px" Visible="false">
                           <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/jpg" 
                               MaxFileSize="4000000">
                           </ValidationSettings>
                           <ClientSideEvents FileInputCountChanged="loadFile" />
                       </dx:ASPxUploadControl>
                </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="4">
               
                 &nbsp;</td>
            <td>&nbsp;</td>
            <td>
               
                 &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5"> <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Registration Card" Height="250px" HorizontalAlign="Center" 
                    Width="350px" Visible="false">

                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
 
    <dx:ASPxBinaryImage ID="ASPxBinaryImage2" runat="server" Height="245px" 
        Width="345px" ImageAlign="Middle">
    </dx:ASPxBinaryImage> 
   </dx:PanelContent>
</PanelCollection>
                             </dx:ASPxRoundPanel></td>
            </td>
            <td colspan="2"> <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" HeaderText="Driver License" Height="250px" HorizontalAlign="Center" 
                    Width="380px" Visible="false">

                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                    <PanelCollection>
<dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
 
    <dx:ASPxBinaryImage ID="ASPxBinaryImage3" runat="server" Height="245px" 
        Width="375px" ImageAlign="Middle">
    </dx:ASPxBinaryImage> 
   </dx:PanelContent>
</PanelCollection>
                             </dx:ASPxRoundPanel></td>
            </td>
        </tr>
        </table>
<table class="auto-style1">
    <tr>
        <td class="auto-style24">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style24">
                <dx:ASPxButton ID="btnsave" runat="server" Text="Save" Width="80px" OnClick="btnsave_Click">
                </dx:ASPxButton>
            </td>
        <td>
                <dx:ASPxButton ID="btnsave0" runat="server" Text="Clear" Width="80px" OnClick="btnsave0_Click">
                </dx:ASPxButton>
            </td>
    </tr>
    <tr>
        <td class="auto-style23" colspan="2">
                &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style23" colspan="2">
                <dx:ASPxHyperLink ID="hypempdetails" runat="server" Text="View Employee Details" />
            </td>
    </tr>
    </table>
    <p>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DataSourceID="SqlDataSource1" KeyFieldName="EmployeeID">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="1" Visible="false">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Gender" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DateOfJoining" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Qualification" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MobileNumber" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="State" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nationality" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PostingLocation" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Gender], [DateOfJoining], [Qualification], [MobileNumber], [City], [State], [Nationality], [Designation], [PostingLocation] FROM [EmployeeMaster]"></asp:SqlDataSource>
    </p>
    <table class="auto-style1">
    <tr>
        <td class="auto-style23">
                &nbsp;</td>
    </tr>
</table>
<table class="auto-style1">
        <tr>
            <td>
                    <asp:SqlDataSource ID="stateDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" 
                        SelectCommand="SELECT distinct [state] FROM [tblcitylist] order by state"></asp:SqlDataSource>
                </td>
            <td>
                    <asp:SqlDataSource ID="CityDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" 
                        SelectCommand="SELECT * FROM [tblcitylist] where state=@state">
                        <SelectParameters>
                        <asp:SessionParameter SessionField="state" Name="state" />
                        </SelectParameters>
                        
                        </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
</asp:Content>

