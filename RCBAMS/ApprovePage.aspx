<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApprovePage.aspx.cs" Inherits="ApprovePage" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="container cnt_div">

      <div class="row">
          <asp:Label ID="lbl_msg" runat="server" Text="" style="color: #FF0000"></asp:Label>
          <h4><strong>Approve Requisitions</strong></h4>
      </div>

      <br />

          <div class="col-sm-12"> 
	<div class="col-sm-2">
		 <strong>Req ID: </strong>
	 <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Req ID:" Font-Bold="true"></dx:ASPxLabel>--%>
		</div>

	<div class="col-sm-3">
	 <dx:ASPxLabel ID="lbl_Req_ID" runat="server" Text=""></dx:ASPxLabel>
		</div>



	<div class="col-sm-2">
		 <strong>Requisition Date: </strong>
	 <%--<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Requisition Date:" Font-Bold="true"></dx:ASPxLabel>--%>
		</div>

	<div class="col-sm-3">
	 <dx:ASPxLabel ID="lbl_RequisitionDate" runat="server" Text=""></dx:ASPxLabel>
		</div>
</div>
		  <br />
		            <div class="col-sm-12"> 
	<div class="col-sm-2">
		 <strong>Requisition Send by: </strong>
	<%-- <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Requisition Send by:" Font-Bold="true"></dx:ASPxLabel>--%>
		</div>

	<div class="col-sm-3">
	 <dx:ASPxLabel ID="lbl_Req_Send_by" runat="server" Text=""></dx:ASPxLabel>
		</div>



	<div class="col-sm-2">
		 <strong>Warehouse: </strong>
	 <%--<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Warehouse :" Font-Bold="true"></dx:ASPxLabel>--%>
		</div>

	<div class="col-sm-3">
	 <dx:ASPxLabel ID="lbl_Warehouse" runat="server" Text=""></dx:ASPxLabel>
		</div>
</div>
		  <br />
		            <div class="col-sm-12"> 
	<div class="col-sm-2">
		 <strong>Description: </strong>
	 <%--<dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Requisition Description:" Font-Bold="true"></dx:ASPxLabel>--%>
		</div>

	<div class="col-sm-5">
	 <dx:ASPxLabel ID="lbl_Req_Desc" runat="server" Text=""></dx:ASPxLabel>
		</div>
						</div>


              <div class="clearfix"></div><br />
		  <div class="col-sm-12">
			   <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
     DataSourceID="SqlDS_ItemList" KeyFieldName="ReqDetailsID" 
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
     onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect" Width="100%">
     <Columns>
        <%-- <dx:GridViewCommandColumn VisibleIndex="0">
             <ClearFilterButton Visible="True">
             </ClearFilterButton>
         </dx:GridViewCommandColumn>--%>
         <dx:GridViewDataTextColumn FieldName="ReqDetailsID" ReadOnly="True" Visible="false"
             VisibleIndex="1">
             <EditFormSettings Visible="False" />
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="ReqID" VisibleIndex="2" >
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="ItemID" VisibleIndex="2">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="3">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="4">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="5" Visible="false">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="Colour" VisibleIndex="6"  Visible="false">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="7">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8"  Visible="false">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn Caption="Approver Quantity"  
                       VisibleIndex="7" >
<DataItemTemplate>
         <dx:ASPxSpinEdit ID="txt_Qty" runat="server" ClientInstanceName="txt_Qty"
             CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
             MaxValue="9999999999999999" Number="0" 
             SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" Height="22px">
         </dx:ASPxSpinEdit>
</DataItemTemplate>
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
     <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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
 <asp:SqlDataSource ID="SqlDS_ItemList" runat="server" 
     ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
     SelectCommand="SELECT 
    PRD.[ReqDetailsID],
    PRD.[ReqID],
    PRD.[ItemID],
    AM.AssetDesc AS ItemName,
    AM.AssetID AS ItemCode,
    AM.Make AS Brand,
    AM.Model AS Colour,
    PRD.[Quantity],
    PRD.[Status]
FROM [POSRequisitionDetails] PRD
INNER JOIN [RCBSAP].[dbo].[AssetMaster] AM
    ON PRD.ItemID = AM.SLNO
WHERE PRD.ReqID = @ReqID">
     <SelectParameters>
         <asp:ControlParameter ControlID="lbl_Req_ID" Name="ReqID" />
   <%--  <asp:SessionParameter Name="ReqID" SessionField="ReqID" />--%>
     </SelectParameters>
 </asp:SqlDataSource>
		  </div>

          <div class="clearfix"></div><br />
           <div class="col-sm-12">
     <div class="col-sm-2">
         <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Remarks" Font-Bold="true"></dx:ASPxLabel>
     </div>
     <div class="col-sm-3">
         <asp:TextBox ID="Memo_remarks" runat="server" TextMode="MultiLine" Rows="2" Columns="18">
             </asp:TextBox>
         </div>
               </div>

       <div class="clearfix"></div><br />
           <div class="col-sm-12">
    
    <div class="col-sm-2">
         <dx:ASPxButton ID="btn_save" runat="server" Text="Approve" Width="100px" Onclick="btn_save_Click"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"  >
    </dx:ASPxButton>
    
    </div>
	  <%--<div class="col-sm-2">
         <dx:ASPxButton ID="btn_reject" runat="server" Text="Reject" Width="100px" Onclick="btn_reject_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
    </dx:ASPxButton>
    
    </div>--%>
      <div class="col-sm-2">
         <dx:ASPxButton ID="btn_Reject" runat="server" Text="Reject" Width="100px"  OnClick="btn_Reject_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"  >
    </dx:ASPxButton>
    
    </div>
</div>


              </div>


</asp:Content>


