<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CalibrationColorCoding.aspx.cs" Inherits="CalibrationColorCoding" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <style>
	.dxgv {
		/*color:white !important;*/
	}
    .btns{
        margin:5px;
    }
	</style>
	    <br />
     <div class="container-fluid cnt_div">
<table class="nav-justified">
   
     <tr>
     <td colspan="8">
         <dx:aspxlabel ID="lbl_msg" runat="server" Text="" ForeColor="Red">
         </dx:aspxlabel>
     </td>
     <td>
         &nbsp;</td>
 </tr>
    <br />

	<tr>
		 <div class="col-sm-12">
     <div class="col-sm-10">
            <h4>View Equipment AMC/CMC </h4>
		    </div>
</div>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
    </table>
	     <br />
	<table>
   
    <tr>
        <td class="auto-style7"> <svg width="90" height="50">
        <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:Red;opacity:10.5" />
        </svg></td>
        <td class="auto-style10">
            <dx:ASPxLabel ID="lbl_occupancy" runat="server" Text="Overdue"></dx:ASPxLabel>
        </td>

        <td class="auto-style11"><svg width="90" height="50">
        <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:#4fe84f;opacity:10.5" />
        </svg></td>  
        <td colspan="2"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="No Due"></dx:ASPxLabel></td> 
         <td class="auto-style11"><svg width="90" height="50">
        <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:orange;opacity:10.5" />
        </svg></td>  
        <td colspan="2"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Falling this Month "></dx:ASPxLabel></td> 
    </tr>
    </table>
       
	
			<dx:ASPxGridView ID="grid_view" runat="server" AutoGenerateColumns="False"
                width="100%" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                DataSourceID="DS_Satis" KeyFieldName="euipmentid" OnHtmlRowPrepared="grid_view_HtmlRowPrepared"
                >
      
                     <TotalSummary>
          <dx:ASPxSummaryItem  SummaryType="Count" FieldName="equipmentname"/>
      </TotalSummary>
                <GroupSummary>
    <dx:ASPxSummaryItem  SummaryType="Count" FieldName="equipmentname"/>
</GroupSummary>
                   <Columns>

                                              <dx:GridViewDataCheckColumn Caption="CheckList"  >
<DataItemTemplate>
<dx:ASPxCheckBox ID="mailsent" runat="server"   OnCheckedChanged="mailsent_CheckedChanged" >
</dx:ASPxCheckBox>
</DataItemTemplate>
</dx:GridViewDataCheckColumn>
                       
       <dx:GridViewDataTextColumn FieldName="CalibrationID" VisibleIndex="1" Visible="false">
	  <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="assetid" VisibleIndex="8" Visible="false">
			 <Settings AutoFilterCondition="Contains" />
           </dx:GridViewDataTextColumn>

           <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1" Caption="Equipment Number">
			 <Settings AutoFilterCondition="Contains" />
           </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="MaintenanceContract" VisibleIndex="2" >
			 <Settings AutoFilterCondition="Contains" />
           </dx:GridViewDataTextColumn>
                       
          
           <dx:GridViewDataDateColumn FieldName="CalibrationOn" VisibleIndex="6" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy" Caption="Start Date">
			 <Settings AutoFilterCondition="Contains" />
           </dx:GridViewDataDateColumn>
           <dx:GridViewDataDateColumn FieldName="CalibrationDue" VisibleIndex="7" ReadOnly="True" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy" Caption="End Date">
			 <Settings AutoFilterCondition="Contains" />
           </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Span" VisibleIndex="8" Visible="false" >
	  <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                                             
                    
		
       </Columns>
                  
       			<SettingsBehavior AllowFocusedRow="True" />
       			<SettingsPager PageSize="20">
				</SettingsPager>
       <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
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
	<br />
	
<dx:ASPxButton ID="btn_save" ValidationGroup="btn" runat="server" Text="Send Email" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" OnClick="ASPxButton1_Click" Width="204px" ></dx:ASPxButton>

<asp:SqlDataSource ID="DS_Satis"
runat="server"
ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"

SelectCommand="
select
CalibrationID,
assetid,
MainAssetNumber,
MaintenanceContract,
DueUnit,
Span,
CalibrationOn,
CalibrationDue
from AssetCalibration">
</asp:SqlDataSource>
		
   </div>

       
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" Landscape="True" LeftMargin="0" MaxColumnWidth="150" RightMargin="0" BottomMargin="0">
</dx:ASPxGridViewExporter>
</asp:Content>
