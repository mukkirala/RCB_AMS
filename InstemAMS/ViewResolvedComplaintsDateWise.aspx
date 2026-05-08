<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewResolvedComplaintsDateWise.aspx.cs" Inherits="ViewResolvedComplaintsDateWise" %>
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
     <div class="container" style="margin-top:10px">
 
    <span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
    
    <span class="auto-style7">View DateWise Resolved Complaints </span><span class="auto-style1"><br /></span>
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
    <dx:ASPxGridView ID="ViewResolvedComplaint" runat="server" OnHtmlDataCellPrepared="ViewResolvedComplaint_HtmlDataCellPrepared"
    AutoGenerateColumns="False" DataSourceID="ComplaintResolved" Width="95%" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    CssClass="auto-style9" KeyFieldName="ComplaintTransactionID" >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ComplaintTransactionID" ReadOnly="True" 
                VisibleIndex="0" ShowInCustomizationForm="True" Width="25px"  Visible="False" >
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ComplaintID" Caption="Complaint ID"
                VisibleIndex="0" ShowInCustomizationForm="True" Width="125px" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8" 
                ShowInCustomizationForm="True"  Width="125px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="USR_ID" VisibleIndex="2" Caption="EmployeeID"
                ShowInCustomizationForm="True"  Width="125px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1">
                              <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Asset Number"
                ShowInCustomizationForm="True"  Width="125px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="2"  Caption="Asset Name"
                ShowInCustomizationForm="True"  Width="125px">
            </dx:GridViewDataTextColumn>

              <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="4" Caption="Type of Service">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
            
              <dx:GridViewDataTextColumn FieldName="ComplaintType" VisibleIndex="4" Caption="Type of Complaint">
                               <Settings AutoFilterCondition="Contains"/>
                          </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="3" 
                ShowInCustomizationForm="True" Width="125px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Width="125px" Caption="Created Date" FieldName="CreatedDate" VisibleIndex="4" 
                ShowInCustomizationForm="True" >

            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Width="125px" Caption="Resolved Date" FieldName="ProgressDate" VisibleIndex="4" 
                ShowInCustomizationForm="True" >
             
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="5" Width="125px" 
                ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssignedTo" VisibleIndex="6" Visible ="true" 
                ShowInCustomizationForm="True" Width="125px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="0" Visible ="true" Caption="Complaint ID" 
                ShowInCustomizationForm="True" Width="125px">
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
            <dx:ASPxSummaryItem FieldName="ComplaintID" SummaryType="Count" />
        </GroupSummary>
       <TotalSummary>
           <dx:ASPxSummaryItem FieldName="ComplaintID" SummaryType="Count" Tag="No of complaint resolved"/>
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
    <asp:SqlDataSource ID="ComplaintResolved" runat="server" 
    ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
    SelectCommand="SELECT distinct [ComplaintTransaction]. [ComplaintID],[USR_ID],ComplaintRegistration.EmployeeName,ComplaintTransaction.[Remarks],[ComplaintTransaction].[Comments],ProgressDate,AssetMaster.AssetDesc,AssetMaster.MainAssetNumber,Concat(ComplaintTransaction.USR_ID+'__','C0',ComplaintTransaction.Sequence) as complaintsequence, ComplaintTransaction.Status,ServiceTypeMaster.ServiceTypeName,ComplaintTransaction.CreatedDate,ComplaintRegistration.ComplaintType,[AssignedTo] FROM [ComplaintTransaction] inner join ComplaintRegistration on ComplaintRegistration.ComplaintID=ComplaintTransaction.ComplaintID inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=[ComplaintRegistration].ServiceTypeID inner join  InstemSAP..AssetMaster on InstemSAP..AssetMaster.AssetID=InstemAMS..ComplaintRegistration.AssetID  WHERE (CAST([ProgressDate] AS date) >= @fromdate) AND (CAST([ProgressDate] AS date) <=@todate)  ">

                                     
    <SelectParameters>
       <%-- <asp:SessionParameter Name="LocationChangeID" SessionField="LocationChangeID" />--%>
    <asp:SessionParameter Name="fromdate" SessionField="fromdate"  />
    <asp:SessionParameter Name="todate" SessionField="todate" />
   <%-- <asp:SessionParameter Name="VisitorType" SessionField="VisitorType" />--%>
    </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    

    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" GridViewID="ViewResolvedComplaint" 
        runat="server" MaxColumnWidth="90">
    </dx:ASPxGridViewExporter>
    <br />
          </div>

</asp:Content>

