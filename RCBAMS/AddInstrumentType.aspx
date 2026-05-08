<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="AddInstrumentType.aspx.cs" Inherits="AddInstrumentType" %>

<%--<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>--%>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx1" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  

    <style type="text/css">
        .style1
        {
            width: 800px;
        }
        .style2
        {
            font-size: medium;
            color: #000000;
        }
        .style3
        {
            width: 115px;
        }
        .style4
        {
            width: 209px;
        }
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            width: 153px;
        }
        .auto-style7 {
			width: 214px;
			left: 0px;
			top: 2px;
		}
        .style1{
               box-shadow:-4px 6px 23px -5px rgba(0,0,0,0.2);
               width:900px;
               height:260px;
        }
      
    	.auto-style8 {
			width: 151px;
		}
      
    	.auto-style9 {
			width: 214px;
		}
		.auto-style10 {
			width: 209px;
			height: 45px;
		}
		.auto-style11 {
			width: 214px;
			left: 0px;
			top: 2px;
			height: 45px;
		}
		.auto-style13 {
			height: 45px;
		}
      
    	.auto-style15 {
			width: 246px;
			height: 45px;
		}
		.auto-style16 {
			width: 246px;
		}
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <strong style="margin-left:55px"><span class="style2">Add Instrument Type 
    <br />
    </span></strong><br />

<fieldset class="style1">
   
    <table style="margin-left:55px">
        <tr>
            <td colspan="8">
                <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                Date</td>
            <td class="auto-style7">
                <dx:ASPxLabel ID="lbl_date" runat="server" style="color: #0000FF">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style16">
                &nbsp;</td>
            <td class="auto-style8" rowspan="3">
                
				<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Height="104px" Width="129px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" GroupBoxCaptionOffsetY="-18px" HeaderText="Image" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <ContentPaddings PaddingBottom="8px" />
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <asp:Image ID="AspxImage2"  runat="server" Height="100px" Width="130px"/>
                                    <%--<dx:ASPxImage ID="AspxImage2" runat="server" Height="106px" Width="147px">
                                    </dx:ASPxImage>--%>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">
                Instrument Type Name<span class="style5"><strong>*</strong></span></td>
            <td class="auto-style11">
                <dx:ASPxTextBox ID="txt_typename" runat="server" Width="170px" Height="25px" >
					<ValidationSettings ErrorTextPosition="Bottom">
						<RequiredField ErrorText="Please Enter the Instrument Type Name" IsRequired="true" />
					</ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style15">
                </td>
            <td class="auto-style8">
                 
			</td>
            <td class="auto-style13">
                </td>
        </tr>
        <tr>
            <td class="style4">
          Description</td>
            <td class="auto-style7">
                <dx:ASPxMemo ID="memo_desc" runat="server" Height="25px" Width="100%"></dx:ASPxMemo>
            </td>
            <td class="auto-style16">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
		<tr>
			<td class="style4">&nbsp;</td>
			<td class="auto-style9"></td>
			<td class="auto-style16">Image Of the Instrument Typet Type</td>
			<td>
				   <asp:FileUpload ID="Upload_image" runat="server" class="btn btn-primary rounded-btn mr-0 mr-md-3 mb-3 mb-md-0" Font-Size="12px" onchange="this.form.submit()" ToolTip="Browse Photo" ViewStateMode="Enabled" Width="199px" />
			</td>
			<td></td>
		</tr>
		<%--<tr>
			<td class="style4">&nbsp;</td>
			<td class="auto-style9">
				   &nbsp;</td>
			<td class="auto-style16"></td>
			<td></td>
			<td></td>

		</tr>
		<tr>
			<td class="style4"></td>
			<td class="auto-style9"></td>
			<td class="auto-style16">&nbsp;</td>
			<td class="auto-style8">
				   &nbsp;</td>
			<td></td>
		</tr>
		<tr>
			<td class="style4"></td>
			<td class="auto-style9"></td>
			<td class="auto-style16"></td>
			<td class="auto-style8"></td>
			<td></td>
		</tr>--%>
		<%--<tr>
			<td class="style4"></td>
			<td class="auto-style9"></td>
			<td></td>
			<td class="auto-style8"></td>
			<td></td>
		</tr>--%>
        <tr>
            <td class="style4">
                <dx:ASPxButton ID="btnsave" runat="server" Width="120px" Height="25px" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Save" 
                    onclick="btnsave_Click">
                </dx:ASPxButton>
                <dx:ASPxButton ID="btnupdate" runat="server" Text="Update" Visible="False" 
                    Width="120px" Height="25px"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    onclick="btnupdate_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style16">
                &nbsp;</td>
            <td class="auto-style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </fieldset>
    <br />
    <strong style="margin-left:55px; color: #000000; font-size: medium;">Edit/Delete Instrument Type
    </strong>
   <br />
    
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" style="margin-left:55px" Width="500px"
        CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
        DataSourceID="SqlDSAssetGroup" KeyFieldName="InstrumentTypeID" 
    onrowcommand="ASPxGridView1_RowCommand">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="" VisibleIndex="0">
                            <DataItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text="Edit">Edit</asp:LinkButton>
                             </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="" VisibleIndex="0">
                            <DataItemTemplate>
                         <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Delete" >Delete</asp:LinkButton>
                            </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentTypeID" ReadOnly="True"  Visible="false" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentTypeName" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="InstrumentTypeImage" VisibleIndex="16" >
                         <Settings AutoFilterCondition="Contains" />
                 <DataItemTemplate>
                            <dx:ASPxImage ID="img1" runat="server" ImageUrl='<%#Eval("InstrumentTypeImage") %>' Height="80px" Width="140px"></dx:ASPxImage>
                        </DataItemTemplate>

                    </dx:GridViewDataTextColumn>

             <dx:GridViewDataTextColumn FieldName="InstrumentTypeBase64Image" VisibleIndex="4" Visible="false">
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
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDSAssetGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
        SelectCommand="SELECT [InstrumentTypeID], [InstrumentTypeName], [Description],InstrumentTypeImage,InstrumentTypeBase64Image FROM [InstrumentTypeMaster] where Status='Active'">
    </asp:SqlDataSource>

</asp:Content>

