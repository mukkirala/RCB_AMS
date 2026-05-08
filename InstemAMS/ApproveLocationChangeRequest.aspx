<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproveLocationChangeRequest.aspx.cs" Inherits="ApproveLocationChangeRequest" %>

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
     <h4><strong>Requester Details</strong></h4>
              <dx:ASPxLabel ID="lbl_msg" ForeColor="Red" runat="server" Text="">
                </dx:ASPxLabel><hr />
            <div class="row form_div">
            <div class="col-sm-2">

                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Requestor ID:" Font-Size="Large"></dx:ASPxLabel>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqid" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>            
            </div>    
            <div class="col-sm-2">

                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Requestor Name:" Font-Size="Large"></dx:ASPxLabel>
            </div>
            <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_empname" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>        
            </div>
        </div>
         <div class="row form_div">
              
            <div class="col-sm-2">

                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Department Name:" Font-Size="Large"></dx:ASPxLabel>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqdeptname" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
						 </dx1:ASPxLabel>           
            </div>
        <div class="col-sm-2">

            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Designation:" Font-Size="Large"></dx:ASPxLabel>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqdesig" runat="server" Font-Bold="true"  Text="" ForeColor="Black" Font-Size="Medium">
						 </dx:ASPxLabel>
            
            </div> 
        </div>
        <div class="row form_div">
               
            <div class="col-sm-2">

                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Requested Date:" Font-Size="Large"></dx:ASPxLabel>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_date" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
						 </dx1:ASPxLabel>           
            </div>
        </div>
   <br />
    <div class="clearfix"></div>
    <div class="row">   <div class="col-sm-12">
         <h4><strong>Asset Details</strong> </h4>
        <hr/>
        </div>
    </div>

      <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Requested Asset:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_reqasset" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>            
         </div>   
         <div class="col-sm-2">
    
             <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Asset Number:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_mainassetnumber" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>
     </div>
     <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Asset Sub Number:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_subnumber" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div>     
         <div class="col-sm-2">
  
             <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Asset Class:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_assetclass" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>            
         </div>
      </div>
       <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Current Location:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_Currentlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div>   
         <div class="col-sm-2">
    
             <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Current Block:" Font-Size="Large"></dx:ASPxLabel>
         </div>
          <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_CBlock" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	      </dx1:ASPxLabel>             
         </div>
       </div>
         <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Requested Location:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_Requestedlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div>   
         <div class="col-sm-2">
    
             <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Requested Block:" Font-Size="Large"></dx:ASPxLabel>
         </div>
          <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_RequestedBlock" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	      </dx1:ASPxLabel>             
         </div>
       </div>

       <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Asset Status:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_assetstatus" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>     
         <div class="col-sm-2">
  
             <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Available Quantity:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>          
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Component:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_component" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>              
         </div>     
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Capitalization Date:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>         
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2">
 
             <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="First Acquisition Date:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_acquisitiondate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="DeacDate:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
              <dx1:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>           
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2">
     
             <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Inventory Note:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_inventorynote" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>     
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Inventory Date:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx1:ASPxLabel>               
         </div>
     </div>

    
     <br />
   <div class="clearfix"></div>
     <div class="row">   <div class="col-sm-12"><strong></strong>
        <hr/>
        </div>
     </div>        
     
     <div class="row form_div">
         <div class="col-sm-2">

             <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Remarks:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
            <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" ForeColor="Blue" Rows="2" Columns="18"></asp:TextBox>  
             <asp:RequiredFieldValidator ID="rfv_txt_cmt" runat="server" ControlToValidate="txt_cmt"
    InitialValue="" ErrorMessage="Please enter a comment." ForeColor="Red"></asp:RequiredFieldValidator>
         </div>
     
         <div class="col-sm-2">
             
         </div>
          <div class="col-sm-4">
              
         </div>
    </div>
     <div class="clearfix"></div>
     

     <div class="row form_div">
         <div class="col-sm-1">
             <dx:ASPxButton ID="AddAssets" runat="server" Text="Approve" Width="20" OnClick="AddAssets_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
              
         </div>
         <div class="col-sm-4">
          <dx:ASPxButton ID="RejectAsset" runat="server" Text="Reject" Width="20" OnClick="RejectAsset_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton><br /><br />
         </div>
     </div>

   
    <div class="clearfix"></div>
    <div class="row"> 
        <div class="col-sm-12">
        <hr/>
            </div>
     </div>
    </div>

 <asp:SqlDataSource ID="AssetTypesGridViewDS" runat="server"  ConnectionString="<%$ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="select * from AssetMaster inner join AssetTypeMaster on AssetTypeMaster.AssetTypeName=AssetMaster.AssetDesc where AssetTypeMaster.AssetTypeID=@AssetTypeID">
         <SelectParameters>
             <asp:SessionParameter Name="AssetTypeID" SessionField="AssetTypeID" />
         </SelectParameters>
     </asp:SqlDataSource>
  </ContentTemplate>
</asp:UpdatePanel>

</asp:Content>
