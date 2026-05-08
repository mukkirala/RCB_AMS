<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustodianDashboard.aspx.cs" Inherits="CustodianDashboard" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <script type="text/javascript">
        function ShowLoginWindow1() {
         
            pcLogin.Show();
 return false;
            }
            </script>
    <style>
    .auto-style35 {
          box-shadow: 0 0 14px -10px;
          margin-bottom: 15px;
          padding:15px;
        }
    .style19
        {
            width: 268px
        }
    .panel-pink {
  
     border-color:rgb(241, 79, 124) !important;
        border-bottom: 3px solid rgb(241, 79, 124) !important;
}
    .panel-blue {
    border-color: rgb(3, 169, 244) !important;
      border-bottom: 3px solid rgb(3, 169, 244) !important;

}
     .panel-green {
    border-color: rgb(0, 128, 0) !important;
      border-bottom: 3px solid rgb(0, 128, 0) !important;

}
      .panel-orange {
    border-color: orange !important;
      border-bottom: 3px solid orange !important;

}
      .pink-bg{
     background:rgb(241, 79, 124) !important;

      }
       .blue-bg{
     background:rgb(3, 169, 244) !important;

      }
        .green-bg{
     background:rgb(0, 128, 0) !important;

      }
         .orange-bg{
     background:orange !important;

      }
    .panel {
        width: 250px;
        height: 130px;
        color: white;
        margin:0px auto;
   
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
    .view{
        padding: 6px;
        font-size: 16px;
        text-align:center;
    }
         .style20
        {
           
            height: 22px;
            width: 199px;
            text-align: center;
            height: 70px;
            color: #ffffff;
   
        }
         .auto-style6{
             font-size:25px;
         }
        </style>
      <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container cnt_div" cssclass="container">
        <h3 class="text-center"><strong>Dashboard</strong></h3>

         <!------------------------------------->

        <div id="wrapper" class="auto-style35">
            <!-- Navigation -->


            <!-- Page Heading -->
        
            <div class="row sui-editor-iframe">
                <div class="col-sm-3">
                 
                        <div class="panel panel-pink" style="">
                            <div class="panel-heading pink-bg" style="background-color:rgb(241, 79, 124)">
                                <div class="style20" style="">
                                 
                                    <span style="">Pending Requests For Asset</span><br/>
                                    <asp:Label runat="server" ID="lbl_assetrequests" CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                             <a href="RequestAsset.aspx"><div class="view" style="color:rgb(241, 79, 124)">View</div></a>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="panel panel-blue">
                             <div class="panel-heading blue-bg" style="background-color:rgb(3, 169, 244)">
                                <div class="style20" style="">
                                
                                    <%-- <img src="Images/Group.jpg" class="auto-style32" />--%>
                                 
                                    <span>Pending Requests For Location Transfer</span><br />
                                    <asp:Label runat="server" ID="lbl_locationtransfer"  CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                           <a href="RequestLocationChange.aspx"> <div class="view" style="color:rgb(3, 169, 244)">View</div></a>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="panel panel-green" style="">
                            <div class="panel-heading green-bg" style="background-color:rgb(0, 128, 0)">
                                <div class="style20" style="">
                                   
                                    <%-- <img src="Images/Group.jpg" class="auto-style32" />--%>
                                  
                                    <span>Pending Requests For Employee Tranfer</span><br />
                                    <asp:Label runat="server" ID="lbl_custodiantransfer"  CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                           <a href="RequestCustodianChange.aspx"> <div class="view" style="color:rgb(0, 128, 0)">View</div></a>
                        </div>
                    </div>
                       <div class="col-sm-3">
                        <div class="panel panel-orange" style="">
                            <div class="panel-heading orange-bg" style="background-color:orange">
                                <div class="style20" style="">
                                   
                                    <%-- <img src="Images/Group.jpg" class="auto-style32" />--%>
                                  
                                    <span>Pending Requests For Asset Return</span><br />
                                    <asp:Label runat="server" ID="lbl_assetreturn" CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                            <a href="AssetReturnRequest.aspx"><div class="view" style="color:orange">View</div></a>
                        </div>
                    </div>


                </div>

          
        </div>

    <div class="">
            <div class=" col-sm-3 auto-style35">
                <h5>Updates</h5>
                <div class=" table-responsive">
                    <table class="table table-dark">
                      <thead>
 
                      </thead>
                      <tbody>
            
                           
                        <tr>
    
                          <td>
                              <%--<asp:LinkButton runat="server" OnClick="lbtn_buybackreq_Click" ID="lbtn_buybackreq" Text="Request For Buyback" ForeColor="Black"/> <span class="badge blue-bg"><asp:LinkButton runat="server" ID="lbl_cntBuybackreq" ForeColor="White"/></span> <asp:ImageButton ID="req1" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>--%>
     
                        </tr>
                       
                         <tr>
     
                          <td> <asp:LinkButton runat="server" OnClick="lbtn_allocatedassets_Click" ID="lbtn_allocatedassets" Text="Allocated Assets" ForeColor="Black"/> <span class="badge pink-bg"><asp:LinkButton runat="server" ID="lbl_cntallocatedassets"    ForeColor="White"/></span> <asp:ImageButton ID="reqicon" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
     
                        </tr>
                      </tbody>
                    </table>
                    </div>
            </div>


    <div class="col-sm-9 ">
                <div class=" ">
                    <div class="auto-style35">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_AllocatedAssets" KeyFieldName="AllocationID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="100%">
            <Columns>
                
              <dx:GridViewCommandColumn VisibleIndex="0">
				  <ClearFilterButton Visible="True">
				  </ClearFilterButton>
			  </dx:GridViewCommandColumn>
                 
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="2"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber"  ReadOnly="True" VisibleIndex="3" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" Caption="SubNumber"  ReadOnly="True" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="AssetDesc"  ReadOnly="True" VisibleIndex="5" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetClass" Caption="Asset Class"  ReadOnly="True" VisibleIndex="6">
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
            
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
           
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="ds_AllocatedAssets" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="Select * from vAssetMaster
where vAssetMaster.Status !='NVAL' and vAssetMaster.CustodianID=@CustodianID">
   <SelectParameters>
       <asp:SessionParameter SessionField="UserID" Name="CustodianID" />
   </SelectParameters>
           
        </asp:SqlDataSource>
       
            </div>
                <div>
                    </div>

        </div>

</div>
</div>
</div>

</asp:Content>

