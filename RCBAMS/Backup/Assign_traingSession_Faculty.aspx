<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Assign_traingSession_Faculty.aspx.cs" Inherits="Assign_traingSession_Faculty" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<script runat="server">
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="container">
    <table class="nav-justified">
        <tr>
            <td colspan="2" style="font-size: large">
                <dx:ASPxLabel ID="lbl_Msg" runat="server" Text="" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: large; height: 11px;"></td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: large"><strong>Assign Training Session To Faculty</strong></td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: large">&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 32px; width: 153px">
                <dx:ASPxLabel ID="lbl_Traingname" runat="server" Text="Name Of the Training:" Width="159px">
                </dx:ASPxLabel>
                    </td>
            <td style="height: 32px">
                <dx:ASPxTextBox ID="txt_Traingname"   runat="server" style="margin-left: 0px" Height="25px" Width="200px">
                </dx:ASPxTextBox>
                        
                    </td>
        </tr>
        <tr>
            <td style="height: 32px; width: 153px">
                        <dx:ASPxLabel ID="lbl_fac" runat="server" Text="Select Faculty:">
                        </dx:ASPxLabel>
                    </td>
            <td style="height: 32px">
                        <dx:ASPxComboBox ID="cmb_Fac" Width="200px" Height="25px" runat="server" TextField="FacultyName" ValueField="FacultyID" DataSourceID="DSS_Faculty" ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                                <RequiredField ErrorText="Select Faculty" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        
                    </td>
        </tr>
        <tr>
            <td style="height: 37px; width: 153px">
                        <dx:ASPxLabel ID="lbl_class" runat="server" Text="Select Class:">
                        </dx:ASPxLabel>
                    </td>
            <td style="height: 37px">
                        <dx:ASPxComboBox ID="cmb_Class" Width="200px" Height="25px" runat="server" TextField="ClassName" ValueField="ClassID" DataSourceID="DSS_Class" ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                                <RequiredField ErrorText="Select Class" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        
                    </td>
        </tr>
        <tr>
            <td style="height: 37px; width: 153px">
                        <dx:ASPxLabel ID="lbl_duraion" runat="server" Text="Duration of Training:">
                        </dx:ASPxLabel>
                    </td>
            <td style="height: 37px">
                <dx:ASPxTextBox ID="txt_duraion"  runat="server" style="margin-left: 0px" Height="25px" Width="200px">
                </dx:ASPxTextBox>
                        
                    </td>
        </tr>
        <tr>
            <td style="height: 29px; width: 153px">
                <dx:ASPxLabel ID="lbl_from" runat="server" Text="Training Date From:">
                </dx:ASPxLabel>
                    </td>
            <td style="height: 29px">
                <dx:ASPxDateEdit ID="from_Date"  AutoPostBack="true" runat="server" Height="25px" Width="200px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                     <ValidationSettings ValidationGroup="btn">
                        <RequiredField ErrorText="Select From Date" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
                    </td>
        </tr>
        <tr>
            <td style="height: 37px; width: 153px">
                <dx:ASPxLabel ID="lbl_To" runat="server" Text="Training Date To:">
                </dx:ASPxLabel>
                    </td>
            <td style="height: 37px">
                <dx:ASPxDateEdit ID="To_Date"  AutoPostBack="true" runat="server" Height="25px" Width="200px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <ValidationSettings ValidationGroup="btn"  >
                      <%--  <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>--%>
                        <RequiredField ErrorText="Select To Date" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
                        
                    </td>
        </tr>
        <tr>
            <td style="height: 46px; width: 153px"></td>
            <td style="height: 46px">
              <%--  <dx:ASPxButton ID="btn_Assign" runat="server" Width="100px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="Assign" OnClick="btn_Assign_Click">
                </dx:ASPxButton>--%>
                <dx:ASPxButton ID="btn_Assign" OnClick="btn_Assign_Click" Width="100px"  ValidationGroup="btn" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="Assign">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="width: 153px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <dx:ASPxGridView ID="ASPxGridView1"  runat="server" OnRowCommand="ASPxGridView1_RowCommand"  AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2" KeyFieldName="Fac_ClassMappingID" Width="576px">
        <Columns>
             <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="Fac_ClassMappingID" ReadOnly="True">
                 <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TrainingName" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FacultyID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="FacultyName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ClassID" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ClassName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FromDate" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Duration" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ToDate" VisibleIndex="6">
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
        <Settings ShowFilterRow="True" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceManagementConnectionString %>" SelectCommand="SELECT [Fac_ClassMappingID], [TrainingName], [FacultyID], [ClassID],ClassName,FacultyName,
            [FromDate], [Duration], [ToDate] FROM [Fac_ClassMapping]
            inner join [dbo].[FacultyMaster] on [dbo].[FacultyMaster].FacultyID=[Fac_ClassMapping].FacultyID
inner join [dbo].[ClassMaster] on [dbo].[ClassMaster].[ClassID]=[Fac_ClassMapping].[ClassID]"></asp:SqlDataSource>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceManagementConnectionString %>" SelectCommand="
SELECT [Fac_ClassMappingID],[FacultyMaster].[FacultyID],FacultyName, [dbo].[ClassMaster].[ClassID],ClassName, [FromDate], [ToDate] FROM [Fac_ClassMapping]
inner join [dbo].[FacultyMaster] on [dbo].[FacultyMaster].FacultyID=[Fac_ClassMapping].FacultyID
inner join [dbo].[ClassMaster] on [dbo].[ClassMaster].[ClassID]=[Fac_ClassMapping].[ClassID]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DSS_Class" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceManagementConnectionString %>" SelectCommand="SELECT [ClassID], [ClassName] FROM [ClassMaster]"></asp:SqlDataSource>
<asp:SqlDataSource ID="DSS_Faculty" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceManagementConnectionString %>" SelectCommand="SELECT [FacultyID], [FacultyName] FROM [FacultyMaster]"></asp:SqlDataSource>
</asp:Content>

