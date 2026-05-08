<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminApprovalCustodianChangeRequests.aspx.cs" Inherits="AdminApprovalCustodianChangeRequests" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

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
<div class="col-sm-12">
    
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
   <h4> <strong>Requester Details</strong></h4>
              <dx:ASPxLabel ID="lbl_msg" ForeColor="Red" runat="server" Text="">
                </dx:ASPxLabel><hr />
        <div class="row form_div">
            <div class="col-sm-2" style="font-size:larger">
                <label>Requestor ID:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqid" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>
            
            </div>    
            <div class="col-sm-2" style="font-size:larger">
                <label>Requestor Name:</label>
            </div>
            <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_empname" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
						 </dx:ASPxLabel>           
            </div>
        </div>
        <div class="row form_div">
                
            <div class="col-sm-2"  style="font-size:larger">
                <label>Department Name:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqdeptname" runat="server"  Text="" ForeColor="Black"  Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
            <div class="col-sm-2" style="font-size:larger">
                <label>Designation:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqdesig" runat="server" Font-Bold="true"  ForeColor="Black"  Font-Size="Medium" Text="">
						 </dx:ASPxLabel>
            
            </div>    
        </div>
        <div class="row form_div">
            
            <div class="col-sm-2" style="font-size:larger">
                <label>Requested Date:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_date" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
						 </dx1:ASPxLabel>           
            </div>
             <div class="col-sm-2"  style="font-size:larger">
                <label>Transfer To Employee:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_trans" runat="server"  Text="" ForeColor="Black"  Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
        </div>
    <br />
    <div class="clearfix"></div>
    <div class="row">   <div class="col-sm-12"> <h4><strong>Asset Details</strong></h4>
        <hr/>
        </div>
    </div>

      <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>Requested Asset:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_reqasset" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel>
            
         </div>
     
         <div class="col-sm-2" style="font-size:larger">
           <label >Asset Number:</label>
        
         </div>
          <div class="col-sm-4">
        <dx1:ASPxLabel ID="lbl_mainassetnumber" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
	  </dx1:ASPxLabel>
             
         </div>
  </div>
 <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>Asset Sub Number:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_subnumber" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel>
            
         </div>
     
         <div class="col-sm-2" style="font-size:larger">
           <label >Asset Class:</label>
        
         </div>
          <div class="col-sm-4">
        <dx1:ASPxLabel ID="lbl_assetclass" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
	  </dx1:ASPxLabel>
             
         </div>
  </div>

<div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>Current Location:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_assetlocation" runat="server"  Text=""  Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		     </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:larger">
           <label >Asset Status:</label>       
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_assetstatus" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>Available Quantity:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		     </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:larger">
           <label >Component:</label>       
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_component" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>Capitalization Date:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		     </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2"  style="font-size:larger">
           <label >First Acquisition Date:</label>       
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_acquisitiondate" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
            <label>DeacDate:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		     </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:larger">
           <label >Inventory Note:</label>       
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_inventorynote" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
	        </dx1:ASPxLabel>           
         </div>
     </div>

     <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger" >
            <label>Inventory Date:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
		     </dx1:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label ></label>       
         </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="ASPxLabel10" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx1:ASPxLabel>           
         </div>
     </div>
       <br />
      <%--<h4> <strong>Approver Details:</strong></h4>
         <hr />       
      
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
               <label> Approver ID:</label>
         </div>
          <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprID" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel>
         </div>
         <div class="col-sm-2" style="font-size:larger">
            <label> Approver Name:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprName" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div>      
    </div>
     <div class="row form_div">
         
         <div class="col-sm-2"  style="font-size:larger">
            <label> Department Name:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprDept" runat="server"  Text="" Font-Bold="True"  ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel>          
         </div>  
        <div class="col-sm-2"  style="font-size:larger">
             <label> Designation:</label>
         </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="apprdesign" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel>  
         </div>
    </div>
    <div class="row form_div">
         
     
         <div class="col-sm-2" style="font-size:larger">
           <span class="auto-style7">Remarks:</span>        
         </div>
          <div class="col-sm-4">
            <dx1:ASPxLabel ID="apprcmts" runat="server"  Text="" Font-Bold="True" ForeColor="Black"  Font-Size="Medium">
		   </dx1:ASPxLabel> 
         </div>
    </div>--%>
   <div class="clearfix"></div>
    <div class="row">   <div class="col-sm-12"><strong></strong>
        <hr/>
        </div>
    </div>
    
    <div class="row form_div">
         <div class="col-sm-2">
          <span class="auto-style7">Remarks:</span>   
         </div>
         <div class="col-sm-4">
           <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" Rows="2" ForeColor="Blue" Columns="22"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv_txt_cmt" runat="server" ControlToValidate="txt_cmt"
    InitialValue="" ErrorMessage="Please enter a comment." ForeColor="Red"></asp:RequiredFieldValidator>
         </div>
     
         <div class="col-sm-2">
                 
         </div>
          <div class="col-sm-4">
                         
         </div>
    </div>
     <div class="row form_div">
         <div class="col-sm-1">
             <dx:ASPxButton ID="AddAssets" runat="server" Text="Approve" Width="20" OnClick="AddAssets_Click"   CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"  CssPostfix="SoftOrange" ></dx:ASPxButton>
              
         </div>
         <div class="col-sm-4">
          <dx:ASPxButton ID="RejectAsset" runat="server" Text="Reject" Width="20" OnClick="RejectAsset_Click"    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"   CssPostfix="SoftOrange" ></dx:ASPxButton><br /><br />
         </div>
     </div>
</div>
</asp:Content>

