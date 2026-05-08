<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BulkUploadEmployee.aspx.cs" Inherits="BulkUploadEmployee" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxLabel ID="label" runat="server" Text="" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel>
    <br />
    <h4><strong>Bulk Upload Employee</strong></h4>
    <br />
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Download Format" Font-Size="Large" Width="204px"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxButton ID="download" runat="server" OnClick="download_Click" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                    <Image Url="Images/Download.jpeg" Width="40px" Height="40px"></Image>
                </dx:ASPxButton>
                <br />
            </td>
            <td class="auto-style2"></td>

        </tr>
        &nbsp;&nbsp;
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Upload Assets" Font-Size="Large"></dx:ASPxLabel>
            </td>
              <td>
                <%--<dx:ASPxUploadControl ID="upload_excel" runat="server" Width="185px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"></dx:ASPxUploadControl>--%>
                <dx:ASPxUploadControl ID="upload_excel" runat="server" 
                                    CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" Width="287px" >
                </dx:ASPxUploadControl>
                <br />
                </td>
            <td class="auto-style2">&nbsp;</td>

        </tr>
        &nbsp;&nbsp;
        <tr>
            <td></td>
            <td>
                <dx:ASPxButton ID="save" runat="server" Text="Save" Width="116px" OnClick="save_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
                <br />
            </td>
            <td class="auto-style2"></td>

        </tr>
        &nbsp;&nbsp;
    </table>
    <br />
     <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="CustodianID" width="100%"        
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"> 
                     
        <Columns>
            <dx:GridViewDataTextColumn FieldName="CustodianID"  ReadOnly="True" VisibleIndex="0" Width="30%" Caption="EmployeeID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1" Caption="Employee Name" Width="40%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="2"  Caption="Designation" Width="40%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="3" Caption="Department Name" Width="50%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="reporting_staff_no" VisibleIndex="4" Width="50%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> --%>
                
            <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="5" Caption="Email" Width="100%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LDAP_USERID" VisibleIndex="6" Caption="LDAP-USERNAME" Width="80%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <%-- <dx:GridViewDataTextColumn FieldName="InternalNumber" VisibleIndex="7" Caption="Internal Number" Width="70%" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="CustodianStatus" VisibleIndex="8" Caption="Staus " Width="50%">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="9" Caption="Creation Date" Width="50%">
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
         <SettingsPager PageSize="25"></SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowHorizontalScrollBar="true" ShowFooter="true"/>
          <TotalSummary>
        <dx:ASPxSummaryItem FieldName="CustodianID" SummaryType="Count" />
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="Select *,DepartmentMaster.DepartmentName from  CustodianMaster
        inner join DepartmentMaster on DepartmentMaster.DepartmentCode=CustodianMaster.CustodianDepartmentCode">
        </asp:SqlDataSource>                                     
    
</asp:Content>
