<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewCustodianByDepartment.aspx.cs" Inherits="ViewCustodianByDepartment" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 140px;
        }
        .style3
        {
            width: 200px;
        }
        .style4
        {
            width: 54px;
        }
    .style5
    {
            width: 167px;
        }
    .auto-style8
    {}
    .style6
    {
        font-size: medium;
    }
            .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
           
            color: #000000;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
 <h3><strong><span>
     Employee Wise List<br /></span></strong></h3>
     <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
    <table>
        <tr>
           <%-- <td class="style2">
                Select Department </td>
            <td class="style3">                
                <dx:ASPxGridLookup ID="ASPxComboBox1" runat="server"
                    AutoGenerateColumns="False" DataSourceID="DeptSqlDataSource" TextFormatString="{1}" Width="170px" Height="25px"
                    KeyFieldName="DepartmentCode" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                   <%--   <Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="DepartmentCode"  VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="1" >
                        </dx:GridViewDataTextColumn>
                                           
                    </Columns>--%>
                   <%-- <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </GridViewImages>
                    <GridViewImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanel>
                    </GridViewImagesFilterControl>--%>
                   <%-- <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
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
                    </ValidationSettings>--%>
          <%--      </dx:ASPxGridLookup>
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
      
        </table>--%>
      <table style="margin-right:20px">
        <tr>
            <td class="style10">
            
            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />

            </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
               
            </td>
            <td>

            </td>
        </tr>
    </table>
 
    <asp:SqlDataSource ID="DeptSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [DepartmentCode], [DepartmentName] FROM [vDepartmentAssetApp]">
    </asp:SqlDataSource>
   

   
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDSCustodianDetails" Width="95%">
       
        <Columns>
        
            <dx:GridViewDataTextColumn FieldName="CustodianID" ReadOnly="True" VisibleIndex="1" Caption="EmployeeID">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>           
            <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="2" Caption="EmployeeName">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianDepartmentCode" Visible="false" VisibleIndex="3" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="4" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
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
        <SettingsPager PageSize="25"></SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="True" />
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
         <TotalSummary >
           <dx:ASPxSummaryItem FieldName="CustodianID"  SummaryType="Count"/>
          </TotalSummary>
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
    <asp:SqlDataSource ID="SqlDSCustodianDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="select *,DepartmentMaster.DepartmentName from CustodianMaster
        left join DepartmentMaster on DepartmentMaster.DepartmentCode = CustodianMaster.CustodianDepartmentCode ">
  <SelectParameters>
 <%-- <asp:SessionParameter Name="DepartmentCode" SessionField="DepartmentCode" />--%>
     <%-- <asp:ControlParameter Name="DepartmentCode" ControlID="ASPxComboBox1" />--%>
  </SelectParameters>
    </asp:SqlDataSource>
  
   
         <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
                </dx:ASPxGridViewExporter>
   
</div>
</asp:Content>

