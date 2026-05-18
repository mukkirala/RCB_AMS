<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproverAuthorizationRequisition.aspx.cs" Inherits="ApproverAuthorizationRequisition" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register TagPrefix="dxlp" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style1
    {
        font-size: medium;
        color: #000000;
    }
    .style2
    {
        width: 114px;
    }
    .style3
    {
        width: 159px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
            <br />
        <h3><strong style="margin-left:75px"><span class="style1">Authorizing Requisitions</span></strong></h3><br />

    
        <span class="style1"><strong  style="margin-left:75px" > Pending Requisitions List</strong></span><br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" KeyFieldName="ReqID" 
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
            Width="100%" onrowcommand="ASPxGridView1_RowCommand">
            <Columns>
              <%--  <dx:GridViewCommandColumn VisibleIndex="0">
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>
                </dx:GridViewCommandColumn>--%>
                <dx:GridViewDataTextColumn FieldName="ReqID" ReadOnly="True" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="2" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
               <%-- <dx:GridViewDataTextColumn FieldName="sendby" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="5" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <%--<dx:GridViewDataTextColumn FieldName="GodownName" VisibleIndex="6">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="ContactPerson" Visible="false" VisibleIndex="7">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
               <%-- <dx:GridViewDataTextColumn FieldName="ContactNo" VisibleIndex="8">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="9" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Approve" VisibleIndex="10" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                <DataItemTemplate>
                <asp:LinkButton ID="btn_approve" runat="server" CommandName="Approve" >Approve</asp:LinkButton>
                </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Reject" VisibleIndex="11" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                 <DataItemTemplate>
                <asp:LinkButton ID="btn_rej" runat="server" CommandName="Reject" > Reject</asp:LinkButton>
                </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn Caption="View" VisibleIndex="11">
      <Settings AutoFilterCondition="Contains" />
   <DataItemTemplate>
  <asp:LinkButton ID="btn_view" runat="server" CommandName="View" > View</asp:LinkButton>
  </DataItemTemplate>
  </dx:GridViewDataTextColumn>
            </Columns>
            <settingspager showdefaultimages="False">
                <allbutton text="All">
                </allbutton>
                <nextpagebutton text="Next &gt;">
                </nextpagebutton>
                <prevpagebutton text="&lt; Prev">
                </prevpagebutton>
            </settingspager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsDetail ShowDetailRow="false" />
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
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDS_ItemList" KeyFieldName="ReqDetailsID"  
                        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" Width="100%"
                        onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect">
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                                <ClearFilterButton Visible="True">
                                </ClearFilterButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ReqDetailsID" ReadOnly="True" Visible="false"
                                VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ReqID" Width="200px" VisibleIndex="2" >
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemID" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Colour" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                        <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                            </LoadingPanelOnStatusBar>
                            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                            </LoadingPanel>
                        </Images>
                        <ImagesFilterControl>
                            <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                            </LoadingPanel>
                        </ImagesFilterControl>
                        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                        </Styles>
                        <StylesEditors>
                            <CalendarHeader Spacing="1px">
                            </CalendarHeader>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dx:ASPxGridView>
                   <asp:SqlDataSource ID="SqlDS_ItemList"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"

    SelectCommand="
    SELECT
        ReqDetailsID,
        ReqID,
        ItemID,
        Quantity,
        Status
    FROM POSRequisitionDetails
    WHERE ReqID=@ReqID">

    <SelectParameters>
        <asp:SessionParameter
            Name="ReqID"
            SessionField="ReqID" />
    </SelectParameters>

</asp:SqlDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"

    SelectCommand="
    SELECT
        ReqID,
        Date,
        Description,
       
        Status,
        ReqSendBy,
        Location
    FROM POSRequisitionParent
    WHERE Status='Requisition Sent to POInc'
    ORDER BY Date DESC">
</asp:SqlDataSource>
   <br />
    <span class="style1"><strong  style="margin-left:75px" >Requisitions List</strong></span>
    <br />
    <br />
          <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" 
          DataSourceID="SqlDataSource3" KeyFieldName="ReqID" 
          CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
          Width="100%" onrowcommand="ASPxGridView1_RowCommand">
         <Columns>

    <dx:GridViewDataTextColumn
        FieldName="ReqID"
        Caption="Req ID"
        VisibleIndex="1">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataDateColumn
        FieldName="Date"
        VisibleIndex="2">
    </dx:GridViewDataDateColumn>

    <dx:GridViewDataTextColumn
        FieldName="Description"
        VisibleIndex="3">
    </dx:GridViewDataTextColumn>

    <%--<dx:GridViewDataTextColumn
        FieldName="sendby"
        Caption="Send By"
        VisibleIndex="4">
    </dx:GridViewDataTextColumn>--%>

    <dx:GridViewDataTextColumn
        FieldName="ReqSendBy"
        Caption="Requested By"
        VisibleIndex="5">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn
        FieldName="Status"
        VisibleIndex="6">
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn
        Caption="Approve"
        VisibleIndex="7" Visible="false">

        <DataItemTemplate>
            <asp:LinkButton
                ID="btn_approve"
                runat="server"
                CommandName="Approve" Visible="false">
                Approve
            </asp:LinkButton>
        </DataItemTemplate>

    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn
        Caption="Reject"
        VisibleIndex="8" Visible="false">

        <DataItemTemplate>
            <asp:LinkButton
                ID="btn_reject"
                runat="server"
                CommandName="Reject" Visible="false">
                Reject
            </asp:LinkButton>
        </DataItemTemplate>

    </dx:GridViewDataTextColumn>

    <dx:GridViewDataTextColumn
        Caption="View"
        VisibleIndex="9" Visible="false">

        <DataItemTemplate>
            <asp:LinkButton
                ID="btn_view"
                runat="server"
                CommandName="View" Visible="false">
                View
            </asp:LinkButton>
        </DataItemTemplate>

    </dx:GridViewDataTextColumn>

</Columns>
          <settingspager showdefaultimages="False">
              <allbutton text="All">
              </allbutton>
              <nextpagebutton text="Next &gt;">
              </nextpagebutton>
              <prevpagebutton text="&lt; Prev">
              </prevpagebutton>
          </settingspager>
          <Settings ShowFilterRow="True" ShowGroupPanel="True" />
          <SettingsDetail ShowDetailRow="false" />
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
     <asp:SqlDataSource ID="SqlDataSource3"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"

    SelectCommand="
   SELECT
    POSRequisitionParent. ReqID,
     Date,
     Description,
  
     POSRequisitionDetails.Status,
     ReqSendBy,
     Location
 FROM POSRequisitionParent
 inner join POSRequisitionDetails on POSRequisitionDetails.ReqID = POSRequisitionParent.ReqID
 WHERE POSRequisitionDetails.Status != 'Requisition Sent to POInc'
 ORDER BY Date DESC">
</asp:SqlDataSource>


   <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lpanel" Modal="True" >
                        </dxlp:ASPxLoadingPanel>
   
        <br />
        <br />
</asp:Content>


