<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewDateWiseEmployeeRequest.aspx.cs" Inherits="ViewDateWiseEmployeeRequest" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
        .auto-style7 {
            color: Black;
            font-size: large;
            font-weight: 700;
        }
        .auto-style9 {
        margin-left: 13px;
        width:100%;
    }
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 190px;
        }
    .style8
    {
        width: 26px;
    }
    style10{
        width: 800px;
            font-size: medium;
            color: #000000;
    }
        .auto-style11 {
            width: 67px;
        }
        .auto-style12 {
            width: 91px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="Container">
        <span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
    
    <span class="auto-style7">View DateWise EmployeeRequest </span><span class="auto-style1"><br /></span>
    <br />


    <table class="style10">
        
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style12">
                From Date</td>

            <td>
                <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" Height="25px" 
                    DisplayFormatString ="dd-MM-yyyy" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="Select From Date" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
           
       
        &nbsp;
      
       
            <td class="auto-style11">
                To Date</td>
            <td>
                <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" Height="25px" 
                    DisplayFormatString ="dd-MM-yyyy" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="Select To Date" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
         
          
        </tr>
     <%--   <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style7">
                Visitor Type</td>
            <td>
                <dx:ASPxComboBox ID="cmbvisitortype" runat="server" Height="25px">
                </dx:ASPxComboBox>
            </td>
         
        </tr>--%>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
           
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="ASPxButton3" runat="server" onclick="ASPxButton3_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"  
                    Text="Search">
                </dx:ASPxButton>
   
 
            </td>
           
        </tr>
    </table>
   <br />
   <table align ="left">
        <tr>
            <td >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td>
    <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:200px"/>
               

            </td>
               </tr>
    </table>
    <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px"/>

<br />
<br />
<dx:ASPxGridView ID="ViewEmployeeRequest" runat="server" 
    AutoGenerateColumns="False" DataSourceID="LocationChange" Width="100%" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    CssClass="auto-style9" KeyFieldName="AssetRequestID" >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" 
                VisibleIndex="0" ShowInCustomizationForm="True" Width="25px"  Visible="False" >
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetTypeID" Caption="AssetType ID."
                VisibleIndex="0" ShowInCustomizationForm="True" Width="25px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="1" Caption="EmployeeID"
                ShowInCustomizationForm="True" Width="50px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="2" Caption="Quantity"
                ShowInCustomizationForm="True" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="3" 
                ShowInCustomizationForm="True"  Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Width="100px" Caption="RequstedDate" FieldName="Date" VisibleIndex="4" 
                ShowInCustomizationForm="True" >
             <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="5" Visible="false"
                ShowInCustomizationForm="True" Width="25px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="6" Width="50px" Visible="false"
                ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="AdminDate" VisibleIndex="7" Width="100px"
                ShowInCustomizationForm="True">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
         
           
            <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="8" Visible ="False" 
                ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestBy" Width="25px" Caption="Request By" 
                ShowInCustomizationForm="True" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestType" Width="25px" 
                ShowInCustomizationForm="True" VisibleIndex="10" Caption="Request Type">
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
        <Settings ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" 
            ShowFilterRow="True" />
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="AssetRequestID" SummaryType="Count" />
        </GroupSummary>
       <TotalSummary>
           <dx:ASPxSummaryItem FieldName="AssetRequestID" SummaryType="Count" Tag="No of Asset  Request Request"/>
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
        <asp:SqlDataSource ID="LocationChange" runat="server" 
    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
    SelectCommand="SELECT [AssetTypeID],[EmployeeID],[Quantity],[Status],[Date],[ApproverName],[ApproverComments],[AdminDate],[ApproverName],[RequestBy],[RequestType] FROM [EmployeeAssetRequest] WHERE (CAST([AdminDate] AS date) >= @fromdate) AND (CAST([AdminDate] AS date) <=@todate) ">
            <SelectParameters>
                 <asp:SessionParameter Name="fromdate" SessionField="fromdate"  />
                 <asp:SessionParameter Name="todate" SessionField="todate" />
            </SelectParameters>
            </asp:SqlDataSource>
    <br />
    <br />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" GridViewID="ViewEmployeeRequest" 
        runat="server" MaxColumnWidth="90">
    </dx:ASPxGridViewExporter>
    <br />
    </div>
</asp:Content>

