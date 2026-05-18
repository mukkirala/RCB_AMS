<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminApproveAssetRequest.aspx.cs" Inherits="AdminApproveAssetRequest" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <style>
        
		input {
			color:#333 !important;
		}
		.dxgvControl_PlasticBlue a {
			color:#333 !important;
		}
        .auto-style53 {
            width: 116px;
        }
         .form_div{
           margin-top:10px;
       }
          .back-bg {
   
            margin: 10px 15px;
            border: 2px solid rgb(199, 212, 220);
            padding: 20px 0;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <%--<asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>--%>
 <div class="col-sm-12">
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
     <strong>Requester Details</strong>
         <dx:ASPxLabel ID="lbl_msg" ForeColor="Red" runat="server" Text="">
                </dx:ASPxLabel><hr />
         <div class="row form_div">
            <div class="col-sm-2" style="Font-Size:large">
                <label>Requestor ID:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqid" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>            
            </div>    
            <div class="col-sm-2" style="Font-Size:large">
                <label>Requestor Name:</label>
            </div>
            <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_empname" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>        
            </div>
        </div>
         <div class="row form_div">
              
            <div class="col-sm-2" style="Font-Size:large">
                <label>Department Name:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqdeptname" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
            <div class="col-sm-2" style="Font-Size:large">
                <label>Designation:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqdesig" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>
            
            </div> 
        </div>
       
     <div class="row form_div">
         <div class="col-sm-2" style="Font-Size:large">
            <label>Requested Asset:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_rqAsset" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx1:ASPxLabel>            
         </div>   
         <div class="col-sm-2" style="Font-Size:large">
           <label >Requested Quantity:</label>      
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_Quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
						 </dx1:ASPxLabel>            
         </div>
     </div>
     <div class="row form_div">
           <div class="col-sm-2" style="Font-Size:large">
                <label>Requested Location:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqlocation" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
           
            <div class="col-sm-2" style="Font-Size:large">
                <label>Requested  Block:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_block" runat="server"  Text="" ForeColor="Black" Font-Size="Medium"  Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
        </div>
          <div class="row form_div">       
            <div class="col-sm-2"  style="Font-Size:large">
                <label>Requested Date:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_date" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
        </div>

     <br />
   

      <div class="row form_div">
         <div class="col-sm-2" style="font-size:Medium">
         <label">Allocate Quantity:</label>
         </div>
         <div class="col-sm-4">
            <dx:ASPxTextBox ID="req_qnty" runat="server" Width="170px" Text="" ForeColor="Blue" ReadOnly="false" Height="25px"></dx:ASPxTextBox>            
         </div>
     
         <div class="col-sm-2" style="font-size:Medium">
          <span class="auto-style7" >Comments:</span>       
         </div>
         <div class="col-sm-4">
             <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" Rows="2" ForeColor="Blue" Columns="22"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_txt_cmt" runat="server" ControlToValidate="txt_cmt"
    InitialValue="" ErrorMessage="Please enter a comment." ForeColor="Red"></asp:RequiredFieldValidator>
         </div>
    </div>
   
     <div class="clearfix"></div>

      <div class="row">   <div class="col-sm-12"><strong>Asset Details</strong>
        <hr/>
        </div>
    </div>
     <div class="row form_div">
      <div class="col-sm-12">
             <dx:ASPxGridView ID="AssetTypesGridView"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="AssetID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="950px" DataSourceID="AssetTypesGridViewDS">
        <Columns>
             <dx:GridViewCommandColumn VisibleIndex="0" ShowSelectCheckbox="True">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2" Caption="Asset Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3" Caption="SerialNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Caption="AssetSubNumber">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5"  Caption="AssetClass">
                <Settings AutoFilterCondition="Contains" />
                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="AssetType">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7" Caption="Status">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="8" Caption="AssetTypeID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="7" Caption="CustodianID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
  </Columns> 
   <SettingsPager ShowDefaultImages="False" PageSize="5">
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
</div>


              </div>

     <div class="row form_div">
         <div class="col-sm-2">
             <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Add" Width="20" OnClick="AddAssets_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"  ></dx:ASPxButton><br />
         </div>
     </div>

         <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="MainAssetNumber"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="950px" OnRowCommand="ASPxGridView1_RowCommand">
        <Columns>
           
            <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2" Caption="Asset Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3" Caption="SerialNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Caption="AssetSubNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5"  Caption="AssetClass">
                <Settings AutoFilterCondition="Contains" />
                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetType" VisibleIndex="6" Caption="AssetType">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="7" Caption="AssetTypeID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="7" Caption="EmployeeID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="8">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server"  ForeColor="Red"  Font-Bold="true" >Delete</asp:LinkButton>
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
    <div class="clearfix"></div>
    <div class="row"> 
        <div class="col-sm-12">
        <hr/>
            </div>


    </div>
     
    <div class="clearfix"></div>
     
<div class="row form_div">

    <div class="col-sm-2">
        <dx:ASPxButton 
            ID="AddAssets" 
            runat="server" 
            Text="Approve"
            Width="120px"
            CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"
            CssPostfix="SoftOrange">
        </dx:ASPxButton>
    </div>

    <div class="col-sm-2">
        <dx:ASPxButton 
            ID="RejectAsset" 
            runat="server" 
            Text="Reject"
            Width="120px"
            CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"
            CssPostfix="SoftOrange">
        </dx:ASPxButton>
    </div>

</div>


<asp:SqlDataSource ID="AssetTypesGridViewDS" runat="server"  ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select * from AssetMaster
    inner join AssetTypeMaster on AssetTypeMaster.AssetTypeName=AssetMaster.AssetDesc where AssetMaster.AssetDesc=@AssetTypename
    and AssetMaster.Status in('AVAL','') and AssetMaster.CustodianID is NULL">
         <SelectParameters>
             <asp:SessionParameter Name="AssetTypename" SessionField="AssetTypename" />
         </SelectParameters>
     </asp:SqlDataSource>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="select AssetTypeID,AssetTypeName,AssetTypeCode from AssetTypeMaster">

    </asp:SqlDataSource>
 <asp:SqlDataSource ID="LocationSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select * from LocationMaster">

 </asp:SqlDataSource>
      <%--</ContentTemplate>
     </asp:UpdatePanel>--%>
</asp:Content>

