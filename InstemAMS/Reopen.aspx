<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Reopen.aspx.cs" Inherits="Reopen" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" cssclass="container">
    <ContentTemplate> 
        <div class="col-sm-12">
      <h4><strong><span>Re-Open Complaint</span></strong></h4>
    <div class="">
        <div class="row">
        <div style="">
           <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red"  Font-Size="Large"></dx:ASPxLabel>
                 </div>
            </div>
			            <div class="clearfix"></div><br />

			  <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server"  Font-Size="large" Text="CustodianID:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" Font-Size="Medium" ForeColor="black"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Size="large" Text="CustodianName:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                </div>
                  <div class="row form_div">
              
                
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Size="large" Text="Department:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Font-Size="large" Text="Designation:"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                </div>
                 <div class="row form_div">
                         
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Font-Size="large" Text="Email:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="lblmail" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Font-Size="large" Text="Reporting Authority:"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_auth" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                </div>
            </div>
            <div class="col-sm-12"><br /></div>
     <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2">
                 <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Status"  Font-Size="Large" Font-Bold="true"></dx:ASPxLabel><span style="color:red">*</span>
                    </div>
                <div class="col-sm-4">
					 <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String" Height ="25px" Width="300px"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">               
                      </dx:ASPxComboBox>
			</div>
			</div>
         </div>
           
<div class="col-sm-12"><br /></div>
               <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2">
                     <dx:ASPxLabel ID="ASPxLabel7" runat="server"  Font-Size="Large" Text="Comments" Font-Bold="true"></dx:ASPxLabel><span style="color:red">*</span>
                 </div>
                 <div class="col-sm-4">
                     <dx:ASPxMemo ID="Memo_remarks" runat="server" Height="50px" Width="300px">
                       </dx:ASPxMemo>
                 </div>
             </div>
                    </div>
            			
 <div class="clearfix"></div><br />

			 <div class="col-sm-12">
                
                <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_save" runat="server" Text="Save" Width="100px" Onclick="btn_save_Click1" ValidationGroup="btn"   CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" >
                </dx:ASPxButton>
                
                </div>
				  
                  <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_back" runat="server" Text="Go Back" Width="100px"  OnClick="btn_back_Click1" ValidationGroup="btn"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>
            </div>

			</div>
		  </div>
            </div>
        </ContentTemplate>
         </div>
</asp:Content>

