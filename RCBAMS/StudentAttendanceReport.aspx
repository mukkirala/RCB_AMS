<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentAttendanceReport.aspx.cs" Inherits="StudentAttendanceReport" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>


<%@ Register assembly="DevExpress.XtraReports.v11.1.Web, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
.dxeBase
{
    font-family: Tahoma;
    font-size: 9pt;
}
        .auto-style2 {
            width: 139px;
        }

 
        .auto-style3 {
            width: 181px;
        }
        .auto-style4 {
            width: 83px;
        }
        .auto-style5 {
            width: 210px;
        }
        .auto-style6 {
            width: 102px;
        }
        .auto-style12 {
            height: 117px;
        }
        .auto-style13 {
            width: 139px;
            height: 34px;
        }
        .auto-style14 {
            width: 181px;
            height: 34px;
        }
        .auto-style15 {
            width: 83px;
            height: 34px;
        }
        .auto-style16 {
            width: 210px;
            height: 34px;
        }
        .auto-style17 {
            width: 102px;
            height: 34px;
        }
        .auto-style18 {
            height: 34px;
        }
    </style>
</head>
<body>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <dx:ASPxLabel ID="lbl_Fac" runat="server" Text="Seect Faculty:">
                        </dx:ASPxLabel>
                                            </td>
                    <td class="auto-style3">
                        <dx:ASPxGridLookup ID="ASPxGridLookup1"  OnTextChanged="ASPxGridLookup1_TextChanged" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSS_fac" KeyFieldName="RFIDCardNumber" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <GridViewProperties><SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior></GridViewProperties>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="AttendanceID" ReadOnly="True" VisibleIndex="0">
                                    <editformsettings visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <gridviewimages spritecssfilepath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                                <loadingpanelonstatusbar url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                                </loadingpanelonstatusbar>
                                <loadingpanel url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                                </loadingpanel>
                            </gridviewimages>
                            <gridviewimagesfiltercontrol>
                                <loadingpanel url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                </loadingpanel>
                            </gridviewimagesfiltercontrol>
                            <gridviewstyles cssfilepath="~/App_Themes/PlasticBlue/{0}/styles.css" csspostfix="PlasticBlue">
                                <header imagespacing="10px" sortingimagespacing="10px">
                                </header>
                            </gridviewstyles>
                            <gridviewstyleseditors>
                                <calendarheader spacing="11px">
                                </calendarheader>
                                <progressbar height="25px">
                                </progressbar>
                            </gridviewstyleseditors>
                            <validationsettings>
                                <errorframestyle imagespacing="4px">
                                    <errortextpaddings paddingleft="4px" />
                                </errorframestyle>
                            </validationsettings>
                        </dx:ASPxGridLookup>
                    </td>
                    <td class="auto-style4">
                        <dx:ASPxLabel ID="lbl_class" runat="server" Text="Select Class:">
                        </dx:ASPxLabel>
                                            </td>
                    <td class="auto-style5">
                        <dx:ASPxComboBox ID="cmb_class" runat="server" AutoPostBack="true" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" TextField="ClassName" ValueField="ClassID" DataSourceID="DSS_Class" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">
                            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                                            </td>
                    <td class="auto-style6">
                        <dx:ASPxLabel ID="lbl_Date" runat="server" Text="Select Date:">
                        </dx:ASPxLabel>
                                            </td>
                    <td>
                        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxDateEdit>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13">
                                            </td>
                    <td class="auto-style14">
                    </td>
                    <td class="auto-style15">
                                            </td>
                    <td class="auto-style16">
                        <dx:ASPxButton ID="btn_report" runat="server" Text="Report" OnClick="btn_report_Click">
                        </dx:ASPxButton>
                                            </td>
                    <td class="auto-style17">
                                            </td>
                    <td class="auto-style18">
                    </td>
                    <td class="auto-style18"></td>
                    <td class="auto-style18"></td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="8">
                    <dx1:ReportToolbar ID="ReportToolbar1" runat="server" 
                        ReportViewerID="ReportViewer1" ShowDefaultButtons="False" Visible="false" Height="44px" Width="540px">
                        <Items>
                            <dx1:reporttoolbarbutton ItemKind="Search" />
                            <dx1:reporttoolbarseparator />
                            <dx1:reporttoolbarbutton ItemKind="PrintReport" />
                            <dx1:reporttoolbarbutton ItemKind="PrintPage" />
                            <dx1:reporttoolbarseparator />
                            <dx1:reporttoolbarbutton Enabled="False" ItemKind="FirstPage" />
                            <dx1:reporttoolbarbutton Enabled="False" ItemKind="PreviousPage" />
                            <dx1:reporttoolbarlabel ItemKind="PageLabel" />
                            <dx1:reporttoolbarcombobox ItemKind="PageNumber" Width="65px">
                            </dx1:reporttoolbarcombobox>
                            <dx1:reporttoolbarlabel ItemKind="OfLabel" />
                            <dx1:reporttoolbartextbox IsReadOnly="True" ItemKind="PageCount" />
                            <dx1:reporttoolbarbutton ItemKind="NextPage" />
                            <dx1:reporttoolbarbutton ItemKind="LastPage" />
                            <dx1:reporttoolbarseparator />
                            <dx1:reporttoolbarbutton ItemKind="SaveToDisk" />
                            <dx1:reporttoolbarbutton ItemKind="SaveToWindow" />
                            <dx1:reporttoolbarcombobox ItemKind="SaveFormat" Width="70px">
                                <Elements>
                                    <dx1:listelement Value="pdf" />
                                    <dx1:listelement Value="xls" />
                                    <dx1:listelement Value="xlsx" />
                                    <dx1:listelement Value="rtf" />
                                    <dx1:listelement Value="mht" />
                                    <dx1:listelement Value="html" />
                                    <dx1:listelement Value="txt" />
                                    <dx1:listelement Value="csv" />
                                    <dx1:listelement Value="png" />
                                </Elements>
                            </dx1:reporttoolbarcombobox>
                        </Items>
                        <Styles>
                            <LabelStyle>
                            <Margins MarginLeft="3px" MarginRight="3px" />
                            </LabelStyle>
                        </Styles>
                    </dx1:ReportToolbar>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="DSS_Class" runat="server"  ConnectionString="<%$ ConnectionStrings:AttendanceManagementConnectionString %>" SelectCommand="Select ClassMaster.ClassID,ClassName From ClassMaster
inner join [Fac_ClassMapping] on ClassMaster.[ClassID]=[Fac_ClassMapping].ClassID
inner join [FacultyMaster] on [dbo].[FacultyMaster].[FacultyID]=[Fac_ClassMapping].[FacultyID] 
where [RFIDCardNumber]=@RFIDCardNumber" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxGridLookup1" Name="RFIDCardNumber" />
            </SelectParameters>
        </asp:SqlDataSource>
                    
          <asp:SqlDataSource ID="DSS_Fac" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceManagementConnectionString %>" SelectCommand="SELECT  [EmployeeID],AttendanceID, [FacultyName],[FacultyMaster].RFIDCardNumber FROM [dbo].[Employee_AttendanceMaster]
inner join [FacultyMaster] on [Employee_AttendanceMaster].RFIDCardNumber=[FacultyMaster].RFIDCardNumber"></asp:SqlDataSource>    </form>
</body>
</html>
