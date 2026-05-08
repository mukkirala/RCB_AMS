<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestDetails.aspx.cs" Inherits="RequestDetails" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>


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
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
 <div class="col-sm-12">
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
     <div id="Requesterdetails" runat="server">
   <h4>  <strong>Requester Details</strong></h4>
              <dx:ASPxLabel ID="lbl_msg" ForeColor="Red" runat="server" Text="">
                </dx:ASPxLabel><hr />
             <div class="row form_div">
            <div class="col-sm-2" style="font-size:larger">
                <label>Requestor ID:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqid" runat="server" Font-Bold="true" ForeColor="Black" Text="" Font-Size="Medium">
						 </dx:ASPxLabel>            
            </div>    
            <div class="col-sm-2" style="font-size:larger">
                <label>Requestor Name:</label>
            </div>
            <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_empname" runat="server" Font-Bold="true" ForeColor="Black" Text="" Font-Size="Medium">
						 </dx:ASPxLabel>        
            </div>
        </div>
         <div class="row form_div">
              
            <div class="col-sm-2"  style="font-size:larger">
                <label>Department Name:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqdeptname" runat="server"  Text="" ForeColor="Black" Font-Bold="True" Font-Size="Medium">
						 </dx1:ASPxLabel>           
            </div>
             <div class="col-sm-2"  style="font-size:larger">
                <label>Designation:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqdesig" runat="server" Font-Bold="true" ForeColor="Black" Text="" Font-Size="Medium">
						 </dx:ASPxLabel>
            
            </div> 
        </div>
       
         <div class="row form_div" id="req" runat="server">
         <div class="col-sm-2"   style="font-size:larger">
            <label>Requested Asset:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_rqAsset" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx1:ASPxLabel>            
         </div>   
         <div class="col-sm-2"  style="font-size:larger">
           <label >Requested Quantity:</label>      
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_reqQuantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
						 </dx1:ASPxLabel>            
         </div>
     </div>
          <div class="row form_div">
               
            <div class="col-sm-2"  style="font-size:larger">
                <label>Requested Date:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_date" runat="server"  Text="" ForeColor="Black" Font-Bold="True" Font-Size="Medium">
						 </dx1:ASPxLabel>           
            </div>
        </div>

</div>
     <br />
    <div class="clearfix"></div>

    <div id="Assetdetails" runat="server">
    <div class="row">   <div class="col-sm-12">
        <h4><strong>Asset Details</strong></h4>
        <hr/>
        </div>
    </div>

    <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
            <label>Requested Asset:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_reqasset" runat="server" ForeColor="Black" Text="" Font-Bold="True" Font-Size="Medium">
		   </dx1:ASPxLabel>            
         </div>   
         <div class="col-sm-2"  style="font-size:larger">
           <label >Main Asset Number:</label>      
         </div>
          <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_mainassetnumber" runat="server" ForeColor="Black" Text="" Font-Bold="True" Font-Size="Medium">
	            </dx1:ASPxLabel>             
         </div>
    </div>
    <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
            <label>Asset Sub Number:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_subnumber" runat="server" ForeColor="Black" Text="" Font-Bold="True" Font-Size="Medium">
		   </dx1:ASPxLabel>           
         </div>     
         <div class="col-sm-2"  style="font-size:larger">
           <label >Asset Class:</label>        
         </div>
          <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_assetclass" runat="server" ForeColor="Black" Text="" Font-Bold="True" Font-Size="Medium">
	        </dx1:ASPxLabel>            
         </div>
     </div>
   

      <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
            <label >Asset Status:</label>  
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_assetstatus" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>     
         <div class="col-sm-2" style="font-size:larger"> 
             <label>Available Quantity:</label>  
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>          
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
            <label >Component:</label>    
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_component" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>              
         </div>     
         <div class="col-sm-2"  style="font-size:larger">
            <label>Capitalization Date:</label>  
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>         
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
             <label >First Acquisition Date:</label>  
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_acquisitiondate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2"  style="font-size:larger">
              <label>DeacDate:</label>  
         </div>
         <div class="col-sm-4">
              <dx1:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>           
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2"   style="font-size:larger">
           <label >Inventory Note:</label>     
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_inventorynote" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>     
         <div class="col-sm-2"  style="font-size:larger">
              <label>Inventory Date:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>               
         </div>
     </div>

         <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
            <label> Current Location:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_Currentlocation" runat="server" ForeColor="Black" Text="" Font-Bold="True" Font-Size="Medium">
		   </dx1:ASPxLabel>            
         </div> 
          <div id="reqloc" runat="server">
         <div class="col-sm-2"  style="font-size:larger">
           <label >Requested Location:</label>       
         </div>
          <div class="col-sm-4">
         <dx1:ASPxLabel ID="lbl_Requestedlocation" runat="server" ForeColor="Black" Text="" Font-Bold="True" Font-Size="Medium">
	     </dx1:ASPxLabel>           
         </div>
        </div>
     </div>
</div>
    
     <br />
    <div id="Approverdetails" runat="server">
     <h4><strong>Approver Details:</strong></h4>
         <hr />            
     <div class="row form_div">
         <div class="col-sm-2"  style="font-size:larger">
               <label> Approver ID:</label>
         </div>
          <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprID" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>
         </div>
         <div class="col-sm-2"  style="font-size:larger">
            <label> Approver Name:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprName" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div>      
    </div>
     <div class="row form_div">
         
         <div class="col-sm-2"  style="font-size:larger">
            <label> Department Name:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprDept" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div> 
         <div class="col-sm-2"  style="font-size:larger">
             <label>Designation:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprdesign" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>  
         </div>
    </div>
     <div class="row form_div">
         
     
         <div class="col-sm-2"  style="font-size:larger">
             <label>Remarks:</label>  
         </div>
          <div class="col-sm-4">
            <dx1:ASPxLabel ID="apprcmts" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>  
         </div>
    </div>
</div>
     <br />
<div id="allocatedassets"  runat="server" visible="false">
    <label><h4><strong>Allocated Assets</strong></h4></label>
     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource1" KeyFieldName="AllocationID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AllocationID" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber"  ReadOnly="True" VisibleIndex="2" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetClass"  ReadOnly="True" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="AssetDesc"  ReadOnly="True" VisibleIndex="4" Caption="Asset">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetRequestID"  ReadOnly="True" VisibleIndex="5"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
             </dx:GridViewDataTextColumn>
          
           <dx:GridViewDataTextColumn FieldName="RequestedBy" VisibleIndex="6" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="7" visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

             
            <dx:GridViewDataDateColumn FieldName="RequestedDate" VisibleIndex="8" 
               Width="100px" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>  
              <dx:GridViewDataDateColumn FieldName="AllocatedDate" VisibleIndex="9" 
               Width="100px" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>    
              <dx:GridViewDataTextColumn FieldName="AssetStatus" VisibleIndex="10">
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
        <Settings  ShowFooter="true" />
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AllocationID" SummaryType="Count" />
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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="select AllocationID,AssetAllocation.AssetID,AssetAllocation.MainAssetNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc, AssetAllocation.AssetRequestID,AssetAllocation.Date as AllocatedDate,AssetAllocation.Status,AssetMaster.StatusDesc as AssetStatus, 
  Requestby as RequestedBy,concat(EmployeeAssetRequest.EmployeeID+'__'EmployeeAssetRequest.RequestSequene) as EmployeeID ,EmployeeAssetRequest.Date as RequestedDate
  from RCBAMS..AssetAllocation 
  inner join RCBAMS..EmployeeAssetRequest on EmployeeAssetRequest.AssetRequestID=AssetAllocation.AssetRequestID
  inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AssetAllocation.AssetID
   where   AssetAllocation.AssetRequestID=@RequestID">
  <SelectParameters>
      <asp:SessionParameter Name="RequestID" SessionField="RequestID" />
  </SelectParameters>
  </asp:SqlDataSource> 
</div>

     <br />
     <div class="clearfix"></div>
     <div class="row">   
          <div class="col-sm-12"><strong></strong>

        <hr/>
               <dx:ASPxButton ID="btn_back" runat="server" Text="Back" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    onclick="btn_back_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="137px">
                </dx:ASPxButton>
        </div>
    </div>

     </div>
  </ContentTemplate>
     </asp:UpdatePanel>
    
</asp:Content>
