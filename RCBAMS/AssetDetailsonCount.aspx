<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetDetailsonCount.aspx.cs" Inherits="AssetDetailsonCount" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
         .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
         <div class="row cnt_div">
               <h4>  <strong> Asset Details</strong></h4>

         <table style="margin-right:15px">
        <tr>
            <td class="style10">
            
            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />
                     </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
                  <td>

            </td>
        </tr>
    </table>
             <div class="col-sm-12">
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
                 <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="AssetID" Width="97%"    ClientInstanceName="grid" AutoGenerateColumns="False"   CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1">
              <Columns>
            <%--<dx:GridViewDataTextColumn FieldName="SLNO"  ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
            
            <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="1" Caption="Company" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="2"  Caption="Plant" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Left" />
            </dx:GridViewDataTextColumn>        
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Asset Number"  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="5" Caption="Sub AssetNumber " Visible="false" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetName" VisibleIndex="6" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="7" Width="140" Caption="Asset Owner" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="8"  Width="140" Caption="Asset User">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
            
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="12" Width="140" Caption="Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="13" Width="140" Caption="Location" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           

           <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="14" Caption="Block">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           <%--  <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="15" Width="140" Caption="Model" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="GRNumber" VisibleIndex="16" Width="80px" Caption="GR Number" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="YearofPurchase" VisibleIndex="17" Width="80px" Caption="Year of Purchase" >
              
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>            
             
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="19" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> --%>
             
           
            
            
             </Columns>
      
                      <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="false" 
            ShowHeaderFilterButton="True" />
                  <Settings ShowFilterRow="true" />
                     <Settings ShowFilterRow="true" />
                     <SettingsPager ShowDefaultImages="False">
                         <AllButton Text="All">
                         </AllButton>
                         <NextPageButton Text="Next &gt;">
                         </NextPageButton>
                         <PrevPageButton Text="&lt; Prev">
                         </PrevPageButton>
                     </SettingsPager>
                     <SettingsPager PageSize="25"></SettingsPager>
                      <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
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

             </div>
                       <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select Name as occpantname,MobileNumber,[ComplaintRegistration].Status,ServiceTypeName,[ComplaintRegistration].ComplaintID,FilePath from [dbo].[ComplaintRegistration] inner join OccupantDetails on OccupantDetails.OccupantID=ComplaintRegistration.OccupantID inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID inner join LocationMaster on LocationMaster.LocationID=OccupantDetails.LocationID where ComplaintRegistration.Status!='' and LocationMaster.LocationID=@LocationID">
                           <SelectParameters>
                         <asp:SessionParameter Name="LocationID" SessionField="LocationID" />
                     </SelectParameters>
                       </asp:SqlDataSource>--%>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="  Select AssetDesc as AssetName,AssetID,MainAssetNumber,AssetSubNumber,AssetDesc,AssetOwner,AssetUser,Location,LocationDesc,BLOCK from AssetMaster
               Where   Status !='InActive' and  AssetDesc=@AssetName">
                           <SelectParameters>
                         <asp:SessionParameter Name="AssetName" SessionField="AssetName" />
                     </SelectParameters>
                       </asp:SqlDataSource>
                 
             </div>
         </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

