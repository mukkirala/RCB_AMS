<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewCurrentAudits.aspx.cs" Inherits="ViewCurrentAudits" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
 
  
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
 <div class="col-sm-12" runat="server">
      <table style="margin-right:15px">
        <tr>
            <td class="style10">
               <h4><span><strong>View Current Active Audits</strong></span></h4>
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
      <div class="table-responsive" runat="server">
    <dx:ASPxGridView ID="ASPxGridView2"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="AuditID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="98%">
       <Columns>
            <dx:GridViewDataTextColumn FieldName="AuditID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AuditName" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="AuditDescription" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="3" Caption="CreatedBy">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="4" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="4" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="4" Caption="LAB">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="5" 
               Width="100px" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>        
            
            <dx:GridViewDataTextColumn FieldName="UnitNo" VisibleIndex="6" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
       
            <dx:GridViewDataTextColumn FieldName="Status" Visible="false" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           
           
            <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="8">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TotalStock" VisibleIndex="9" Visible="false">
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
        <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AuditName" SummaryType="Count" />
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
    </div>
     
    <br />

 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView2" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
  </dx:ASPxGridViewExporter>
  <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
      SelectCommand="select * from RCBAMS..AuditMaster  left join 
RCBAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID 
where AuditStatus='Active' order by AuditBy desc">
     
  </asp:SqlDataSource>                                     
  
</div>
</asp:Content>

