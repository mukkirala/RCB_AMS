<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="InstituteMaster.aspx.cs" Inherits="InstituteMaster" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style1
    {
        width:100%;
        height: 23px;
       
        
    }
    .auto-style6 {
        width: 30px;
    }
    .auto-style7 {
        width: 30px;
    }
    .auto-style8 {
        width: 78px;
    }
    .auto-style9 {
        font-size: small;
        font-weight: bold;
    }
      .form_div{
       margin-top:10px;
   }
       .style5
{
        width: 120px;
        color: red;
}
        .textarea {
           /* CssFilePath :"~/App_Themes/Glass/{0}/styles.css";
                CssPostfix:"Glass"; 
                SpriteCssFilePath:"~/App_Themes/Glass/{0}/sprite.css";*/
           color:glass lightblue;
        }

    </style>
    <head>
    <link rel="stylesheet" type="text/css" href="~/App_Themes/Glass/{0}/styles.css" />
</head>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <ContentTemplate>
     <h3><strong><span>Add Institute</span></strong></h3>
       <div style="">
          <div class="col-sm-12">
          <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel>
                </div>
           </div>
           <hr />
           <br /><br />
           <div class="col-sm-12">
                <div class="row form_div">
                       <div class="col-sm-2 ">
       <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="InstituteID" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
   </div>
                <div class="col-sm-4">
         <dx:ASPxTextBox ID="InstID" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>                
</div>
                       <div class="col-sm-2 ">
                   <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Institute Name" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
               </div>
                            <div class="col-sm-4">
                     <dx:ASPxTextBox ID="InstName" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                   <ValidationSettings>
                       <ErrorFrameStyle ImageSpacing="4px">
                           <ErrorTextPaddings PaddingLeft="4px" />
                       </ErrorFrameStyle>
                   </ValidationSettings>
               </dx:ASPxTextBox>
              
            </div>
               
         </div>
           </div>
     
          <div class="col-sm-12">
       <div class="row form_div">
   <%--  <div class="col-sm-2">
         <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Address" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
     </div>
                    <div class="col-sm-4">
<asp:TextBox ID="Adress" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="2" Columns="40"></asp:TextBox>      
     <ValidationSettings>
     <ErrorFrameStyle ImageSpacing="4px">
         <ErrorTextPaddings PaddingLeft="4px" />
     </ErrorFrameStyle>
 </ValidationSettings>
                       
       </div>--%>
              <div class="col-sm-2 ">
       <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Email-ID" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
   </div>
                <div class="col-sm-4">
         <dx:ASPxTextBox ID="EmailID" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>                
</div>
                <div class="col-sm-2">
         <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Phone No" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
     </div>
                    <div class="col-sm-4">
         <dx:ASPxTextBox ID="PhnNo" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ClientInstanceName="client_txt_mobile" MaxLength="10">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>                
</div>
</div>
</div>
            <div class="col-sm-12">
<div class="row form_div">
         <div class="col-sm-2">
         <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Address" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
     </div>
                    <div class="col-sm-4">
<asp:TextBox ID="Adress" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="2" Columns="40" ></asp:TextBox>      

     <ValidationSettings>
     <ErrorFrameStyle ImageSpacing="4px">
         <ErrorTextPaddings PaddingLeft="4px" />
     </ErrorFrameStyle>
 </ValidationSettings>
 </div>                                   
</div>
</div>
           <br /><br />
  <div class="col-sm-12"><br /><br /></div>
  
 <div class="col-sm-12">
     <div class="row">
         <div class="col-sm-4">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" OnClick="ASPxButton1_Click" Width="150px" CssPostfix="SoftOrange" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"> 
            </dx:ASPxButton><br />
       </div>
       </div>
     </div>
            <div class="col-sm-12">
           <div class="row">
               <div class="col-sm-2">
<dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
              Height="25px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
  SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
            OnClick="btn_Update_Click" Visible="false">
          </dx:ASPxButton>
                   </div>
                <div class="col-sm-2">
<dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancel" Width="100px" 
              Height="25px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
  SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
            OnClick="btn_Cancel_Click" Visible="false">
          </dx:ASPxButton>
                   </div>
             </div>
           </div>
                <div class="clearfix"></div>

 <div class="table-responsive" style="padding:10px" ></div>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" OnRowCommand="ASPxGridView1_RowCommand"
     style="width:100%" 
   DataSourceID="SqlDataSource3" KeyFieldName="InstituteID" 
   CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
   CssPostfix="PlasticBlue" AutoGenerateColumns="False">
    <Columns>
          <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" Width="5%" >
           <DataItemTemplate>
               <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green"></asp:LinkButton>
               </DataItemTemplate>
           
       </dx:GridViewDataTextColumn>  
                     <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" Width="5%">
           <DataItemTemplate>
               <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
           </DataItemTemplate>
           
       </dx:GridViewDataTextColumn>  
         <dx:GridViewDataTextColumn FieldName="InstitutePKID" ReadOnly="True" VisibleIndex="0" Caption="Institute PKID" Visible="false" >
     <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
       
       <dx:GridViewDataTextColumn FieldName="InstituteID" ReadOnly="True" VisibleIndex="1" Caption="Institute ID" >
           <Settings AutoFilterCondition="Contains" />
       </dx:GridViewDataTextColumn>
       
       <dx:GridViewDataTextColumn FieldName="InstituteName"  VisibleIndex="2" Caption=" Institute">
           <Settings AutoFilterCondition="Contains" />
       </dx:GridViewDataTextColumn>
             
       <dx:GridViewDataTextColumn FieldName="EmailID" VisibleIndex="3" Caption="EmailID" >
           <Settings AutoFilterCondition="Contains" />
       </dx:GridViewDataTextColumn>
       <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="4" Caption="Address" >
           <Settings AutoFilterCondition="Contains" />
       </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="PhoneNo" VisibleIndex="5" Caption="PhoneNo" >
     <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6" Caption="Status" >
     <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
  <dx:GridViewDataTextColumn FieldName="CreateDate" VisibleIndex="7" Caption="Created Date" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
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
 <Settings  ShowFooter="true" ShowFilterRow="true"/>
    <TotalSummary>
    <dx:ASPxSummaryItem FieldName="InstituteID" SummaryType="Count" />
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

      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT * from InstituteMaster  Where Status='Active' ">

           </asp:SqlDataSource>















   </ContentTemplate>







</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>--%>

