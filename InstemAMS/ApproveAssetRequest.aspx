<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproveAssetRequest.aspx.cs" Inherits="ApproveAssetRequest" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
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
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel><br />
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
                 <dx:ASPxLabel ID="lbl_empname" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium"  Text="">
						 </dx:ASPxLabel>        
            </div>
        </div>
         <div class="row form_div">
               
             <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Department Name:" Font-Size="Large"></dx:ASPxLabel>            
                </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqdeptname" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
             <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Designation:" Font-Size="Large"></dx:ASPxLabel>            
                </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqdesig" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium" Text="">
			   </dx:ASPxLabel>
            
            </div>  
        </div>
        
     <div class="row form_div">
         <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Requested Asset:" Font-Size="Large"></dx:ASPxLabel>            
                </div>
         <div class="col-sm-4">
             <dx1:ASPxLabel ID="lbl_rqAsset" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True"></dx1:ASPxLabel>            
         </div>   
         <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Requested Quantity:" Font-Size="Large"></dx:ASPxLabel>            
                </div>
         <div class="col-sm-4">
            <dx1:ASPxLabel ID="lbl_Quantity" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>            
         </div>
     </div>
     <div class="row form_div">
         <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Requested Location:" Font-Size="Large"></dx:ASPxLabel>            
                </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_custlocation" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
         <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Requested Date:" Font-Size="Large"></dx:ASPxLabel>            
                </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="lbl_date" runat="server"  Text="" ForeColor="Black" Font-Size="Medium" Font-Bold="True">
						 </dx1:ASPxLabel>           
            </div>
        </div>
 
    <%--<div class="row form_div">
         <div class="col-sm-2">
           <label>Requested Status:</label>
         </div>
         <div class="col-sm-4">
            
             <dx1:ASPxLabel ID="lbl_req" runat="server"  Text="" Font-Bold="True">
                         </dx1:ASPxLabel>
         </div>
     
         <div class="col-sm-2">
          
        
         </div>
          <div class="col-sm-4">
       
             
         </div>
              </div>--%>
     
     <div class="row form_div">
         
     
         <div class="col-sm-2">
          
             <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Remarks:" Font-Size="Large"></dx:ASPxLabel> 
         </div>
         <div class="col-sm-4">
             <asp:TextBox ID="text_cmt" runat="server" TextMode="MultiLine" Rows="2" ForeColor="Blue" Columns="22"></asp:TextBox>   
                       <%--<asp:RequiredFieldValidator ID="rfv_txt_cmt" runat="server" ControlToValidate="text_cmt"
    InitialValue="" ErrorMessage="Please enter a comment." ForeColor="Red"></asp:RequiredFieldValidator>--%>
         </div>
    </div>
    <div class="clearfix"></div>
   
            
    <div class="row form_div">
         <div class="col-sm-1">
            <dx:ASPxButton ID="Approve" runat="server" Text="Approve" OnClick="Approve_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
         </div>
         <div class="col-sm-4">
            <dx:ASPxButton ID="Reject" runat="server" Text="Reject" OnClick="Reject_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
         </div>
    </div>
                
           
</div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>



