<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAllocatedAssets.aspx.cs" Inherits="ViewAllocatedAssets" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container cnt_div" cssclass="container">
    <div class="col-sm-12">
      	<h4><strong><span> Allocated Asset Details</span></strong></h4> 
    <div class="">
        <div class="row">
             <div style="">
           <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red"></dx:ASPxLabel>
                 </div>
            </div>
            <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="large"  Text="Staff Number:"></dx:ASPxLabel>         
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" ForeColor="Black"  Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server"  Font-Size="large"  Text="User Name:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>

                 <div class="row form_div">
               
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Size="large"   Text="Department:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                 <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="large"  Text="Designation:"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                 <div class="row form_div">
                         
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="large" Text="Email:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="lblmail" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="large"   Text="Reporting Authority:" Visible="false"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_auth" runat="server" Text="" ForeColor="Black"  Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                <div class="row form_div">
               
                <div class="col-sm-2">
                     
                </div>
                <div class="col-sm-4">
                     
                </div>
                </div>
            </div>
            <br />
             <div class="clearfix"></div>
            <hr />
            <br />
   <div class="table-responsive" style="padding:10px" >
     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource1" KeyFieldName="CustodianID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewCommandColumn VisibleIndex="0">
				  <ClearFilterButton Visible="True">
				  </ClearFilterButton>
			  </dx:GridViewCommandColumn>
              
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber"  ReadOnly="True" VisibleIndex="3" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" Caption="SubNumber"  ReadOnly="True" VisibleIndex="4" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="AssetDesc"  ReadOnly="True" VisibleIndex="5" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetClass" Caption="Asset Class"  ReadOnly="True" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
             </dx:GridViewDataTextColumn>        
            <dx:GridViewDataTextColumn FieldName="LocationDesc" Caption="LAB"  ReadOnly="True" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" Caption="Wing"  ReadOnly="True" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
             </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="8" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" Caption="Serial Number"  ReadOnly="True" VisibleIndex="9">
    <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" Caption="Model"  ReadOnly="True" VisibleIndex="9">
    <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Make" Caption="Make"  ReadOnly="True" VisibleIndex="9">
    <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PONoforReference" Caption="PO Number"  ReadOnly="True" VisibleIndex="9">
    <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="10" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="11" Caption="User Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="12" Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
            <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="11"  Visible="false">
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
        <Settings  ShowFooter="true" ShowFilterRow="True" ShowGroupPanel="True" />
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetDesc" SummaryType="Count" />
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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="Select * From AssetMaster where CustodianID=@CustodianID and AssetMaster.Status !='NVAL'">
   <SelectParameters>
       <asp:ControlParameter ControlID="reqid" Name="CustodianID" />
   </SelectParameters>
    </asp:SqlDataSource>

 </div>
      </div>
    </div> 
 </div>
        </div>
</asp:Content>


