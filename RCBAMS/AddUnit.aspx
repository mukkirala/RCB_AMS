<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddUnit.aspx.cs" Inherits="AddUnit" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 80%;
        }
        .auto-style2 {
            width: 121px;
        }
        .auto-style3 {
            width: 87px;
        }
        .auto-style4 {
            width: 290px;
        }
        .auto-style5 {
            font-size: large;
            color: #003300;
        }
        .auto-style6 {
            width: 46px;
        }
        .auto-style7 {
            width: 121px;
            height: 40px;
        }
        .auto-style8 {
            width: 290px;
            height: 40px;
        }
        .auto-style9 {
    }
        .auto-style10 {
            width: 87px;
            height: 40px;
        }
        .auto-style11 {
            width: 46px;
            height: 40px;
        }
        .auto-style12 {
            width: 121px;
            height: 17px;
        }
        .auto-style13 {
            width: 290px;
            height: 17px;
        }
        .auto-style14 {
            height: 17px;
        }
        .auto-style15 {
            width: 87px;
            height: 17px;
        }
        .auto-style16 {
            width: 46px;
            height: 17px;
        }
        .style1
        {
            width: 206px;
        }
        .style4
        {
            width: 100px;
        }
        .style6
    {
        color: #FF3300;
    }
        .style7
    {
        font-size: medium;
        color: #000000;
    }
        .style8
        {
            width: 71px;
        }
        .style9
        {
            height: 21px;
        }
        .style10
        {
            width: 46px;
            height: 21px;
        }
        </style>
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <strong><span class="style7">
Unit Master</span></strong><table style="margin-left:55px" width="800px">
        <tr>
            <td class="style4">&nbsp;</td>
            <td class="style1">
    <strong><span class="auto-style5">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
        runat="server" style="font-size: small;"
                    ErrorMessage="Please Enter only digits" 
    ControlToValidate="txt_Unitcode" ForeColor="red" 
    ValidationExpression="^[0-9\d]*$" ></asp:RegularExpressionValidator>
    </span></strong></td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">Date</td>
            <td>
                <dx:ASPxLabel ID="lbl_date" runat="server" style="color: #0000FF" >
                </dx:ASPxLabel>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">Unit Code<span class="style6"><strong>*</strong></span></td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_Unitcode" runat="server" Width="170px"  
                    MaxLength="2">
                </dx:ASPxTextBox>
            </td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">Unit Name<span class="style6"><strong>*</strong></span></td>
            <td>
                <dx:ASPxTextBox ID="txt_Unitname" runat="server" Width="170px" >
                </dx:ASPxTextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="style9" >ContactNo</td>
            <td class="style9" >
                <dx:ASPxTextBox ID="txt_contactno" runat="server" Width="170px" >
                </dx:ASPxTextBox>
            </td>
            <td class="style9" ></td>
            <td class="style9" >EmailId</td>
            <td class="style9">
                

                <dx:ASPxTextBox ID="txt_emailid" runat="server" Width="170px" >
                </dx:ASPxTextBox>
                

            </td>
            <td class="style9"></td>
            <td class="style9"></td>
            <td class="style10"></td>
        </tr>
        <tr>
            <td class="style4">Fax No</td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_Faxno" runat="server" Width="170px" >
                </dx:ASPxTextBox>
            </td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">Unit Address</td>
            <td class="auto-style9" rowspan="2">
                

                <dx:ASPxMemo ID="txt_address" runat="server" Height="40px" Width="170px">
                </dx:ASPxMemo>
                

            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">Contact Person</td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_contactperson" runat="server" Width="170px" >
                </dx:ASPxTextBox>
            </td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">&nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <dx:ASPxButton ID="btn_save" runat="server" Text="Save" 
                    OnClick="btn_save_Click"  Width="120px" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">                   
                </dx:ASPxButton> 
                <dx:ASPxButton ID="btn_update" runat="server" Text="Update"  Width="120px"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Visible="False"
                    onclick="btn_update_Click">
                </dx:ASPxButton>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">&nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style8">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        </table>
        <br />
        <span class="style7">
        <strong style="margin-left:55px">Edit/Delete 
    </strong>
        </span>
       
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="800px" style="margin-left:55px"
        AutoGenerateColumns="False" 
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
        DataSourceID="SqlDSUnitMaster" KeyFieldName="UnitNo" 
        onrowcommand="ASPxGridView1_RowCommand">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                            <DataItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text="Edit">Edit</asp:LinkButton>
                            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Delete">Delete</asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitNo" ReadOnly="True" VisibleIndex="1" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitCode" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitName" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitAddress" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ContactNo" VisibleIndex="5">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FaxNo" VisibleIndex="6">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="7">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ContactPerson" VisibleIndex="8">
                    <Settings AutoFilterCondition="Contains" />
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
            <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
                CssPostfix="Glass">
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
            </Styles>
            <StylesEditors>
                <CalendarHeader Spacing="1px">
                </CalendarHeader>
                <ProgressBar Height="25px" >
                </ProgressBar>
            </StylesEditors>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDSUnitMaster" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [UnitNo],[UnitCode],[UnitName],[UnitAddress],[ContactNo],[FaxNo],[Email],[ContactPerson] FROM [dbo].[UnitMaster]
"></asp:SqlDataSource>
        <br />

</asp:Content>

