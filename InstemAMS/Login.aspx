<%@ Page  Language="C#" AutoEventWireup="true"  CodeFile="Login.aspx.cs" Inherits="Login"  %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
        <link rel="shortcut icon"  href="Images/Instem_logo.png" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Instem </title>
   <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />--%>


    
     <meta http-equiv="Page-Enter" content="blendTrans(Duration=0)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
     <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
   <link href="fonts/fontawesome-free-6.2.1-web/fontawesome-free-6.2.1-web/css/all.css" rel="stylesheet" />
        
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="<%# ResolveUrl("~/javascript/leesUtils.js") %>"></script>



    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.4.0.min.js"></script>--%>
  <%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!--//fonts-->
    <link href="https://fonts.googleapis.com/css?family=Exo+2" rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,700,900&display=swap" rel="stylesheet"/>--%>

  <%--  <link rel="icon" href="Images/BEL_Logo.png" type="image/x-icon"/>
    <title>Asset Management System</title>
     <meta http-equiv="Page-Enter" content="blendTrans(Duration=0)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Telex&display=swap" rel="stylesheet">
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
     <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script> --%>

     <script>
        if (window.dialogArguments) {
            alert("Your Session has been expired.\r\n\r\nPlease login again.");
            window.close();
        }

        if (window.opener) {
            window.location.href = "./SessionExpired.aspx";
        }
        
     </script>

    <style >
         body {
            /*font-family: 'Exo 2', sans-serif;*/
            /*font-family:"Work Sans", sans-serif;*/
            font-family: 'Telex', sans-serif;
            background-size: cover;
        }

        .bg-login {
            //background: url(Images/AirforceBackground.png) center no-repeat;
            background-size: cover;
        }
        
        /*body {
            //background: url(../Images/BEL_Background.png)  center no-repeat ;*/ /*img*/
            /*background-size: cover;
			font-family: 'Telex', sans-serif;
         
        }*/
              body {
            border: none;
            outline: none;
            background: no-repeat center center cover;
            /*background-image:url(../Images/hist.jpg);
            background-size: 100%;*/
        }
           .header{
              background:white;
              padding:5px;
              min-height:20px;
          }
        .header img{
            position:absolute;
        }
        #MyDiv {
            //position: fixed;
            margin:5% auto;
            width: 37em;
            padding:10px ;
            padding-bottom:20px;
            //height: 24em;
            background:#ffffffd1;
            //margin-top: -9em; /*set to a negative number 1/2 of your height*/
           // margin-left: -15em; /*set to a negative number 1/2 of your width*/
           // border: 2px groove rgba(46, 51, 56, 0.2);
        }

        .footer {
            //padding-top: 600px;
            color: black;
            padding-left: 30px;
        }
  
         

   .inp {
  position: relative;
  margin: auto;
  width: 100%;
  //max-width: 280px;
}
.inp .label {
  position: absolute;
  top: 16px;
  left: 0;
  font-size: 16px;
  color: #9098a9;
  font-weight: 500;
  transform-origin: 0 0;
  transition: all 0.2s ease;
}
.inp .border {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 2px;
  width: 100%;
  background: green;
  transform: scaleX(0);
  transform-origin: 0 0;
  transition: all 0.15s ease;
    border-bottom: 2px solid green;

}
.inp input {
  -webkit-appearance: none;
  width: 100%;
  border: 0;
  font-family: inherit;
  padding: 12px 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  border-bottom: 2px solid #ff6c00;
  background: none;
  border-radius: 0;
  color: #223254;
  transition: all 0.15s ease;
}

.inp input:hover {
 // background: rgba(34,50,84,0.03);
}
.inp input:not(:placeholder-shown) + span {
  color: #5a667f;
  transform: translateY(-26px) scale(0.75);
}
.inp input:focus {
  background: none;
  outline: none;
}
.inp input:focus + span {
  color: #ff6c00;
  transform: translateY(-26px) scale(0.75);
}
.inp input:focus + span + .border {
  transform: scaleX();
  //background:green;
  
  
}
.btn-suc{
    width:100%;
    border:2px solid #ff6c00;
    background:linear-gradient(#ff6c00,#da9311,#ff8124);
    color:white;
    padding:6px;
}
.btn-suc:hover{
        background:#ff6c00;

}
.main-title{
    color:#102594;
}
      
        .auto-style1 {
            height: 350px;
            padding: 15px;
        }
        .auto-style2 {
            height: 109px;
            width: 120px;
            left: 20px;
            top: 7px;
        }
        #logintype tr td{
            padding:5px;
        }
        .logindiv {
          /*  color: black;*/
            height:300px;
        }
        .login {
           /* background: #5f6969c9;*/
            background:#4c4b4b54;
            min-height: 300px;
             
          
        }
        .login-form {
            max-width: 400px;
             min-height:760px;
            margin: 0px auto;
            padding: 10px 20px; 
        }
        .input-group-addon, .input-group-btn {
            min-width: 50px;
            font-size: 21px;
            border: none;
            color: white;
            background: rgb(51, 95, 224);
            border-radius: 0px;
        }
       
         .btn-form {
            /*width: 100%;*/
            padding: 8px;
            color: white;
            background: rgb(51, 95, 224);
            border:none;
            transition: .3s ease-in;
            font-size: 18px;
        }
        .btn-form:hover {
             background: #ea091c;
        }
         .slide_div {
            background:linear-gradient(rgba(0,0,0,.2), rgba(0,0,0,.2)), url('Images/instem_gate.jpg');
            min-height: 860px;
           // min-height:832px;
            background-size: cover;

        }
         .form-control {
            background: #ffffff;
            border: none;
            height: 35px;
            border-radius: 0px;
        }
           .toggle-password{
            color: black;
            position: absolute;
            right: 15px;
            cursor: pointer;
            padding: 12px;
            z-index: 100;
        }
    </style>
   

      
</head>
<body  runat="server">
     <div class="container-fluid">
        <div class="header" >
    
                <div class="container">
                 <img src="../Images/Instem_logo.png" class="auto-style2">
             <br />
     
                    <div class="text-center">
                     <h2 class="main-title" >Institute for Stem Cell Science and Regenerative Medicine</h2>
                      <h3 >Asset Management System</h3>
                 <%--       <h6 >Madras Atomic Power Station, Kalpakkam</h6>--%>
                        </div>
                        </div>
          </div>
                  
        <div class="row logindiv">
           
            <div class="col-sm-8 slide_div">
                
            </div>
               
            <div class="col-sm-4 bg-login ">
              
                <div class="row login">
                     <br />
                          <br />
                          <br />
                          <br />
                          <br />
                          
                      <div class="login-form" style="padding-left:50px;">
                         
                         
                        <h3>LOGIN</h3>
                          


                    <div>

                        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" Modal="true" ClientInstanceName="lpanel" runat="server"></dx:ASPxLoadingPanel>
                        <%--<dx:ASPxLoadingPanel runat="server" Modal="True" ClientInstanceName="lpanel" ID="ASPxLoadingPanel1"></dx:ASPxLoadingPanel>--%>
                        
                    </div>
              <form id="loginform" class="form-horizontal" runat="server">
                  
                      <div style="margin-bottom:25px" class="input-group">
                   
                         <span class="input-group-addon"><i class="fas fa-user-circle"></i></span>
                      
                        <input type="text" id="txtUserID" runat="server"  placeholder="UserName" autocomplete="off" class="form-control" />
                    
                       </div>
                 
                         
                        <%--<dx:ASPxTextBox ID="txtUserID" runat="server" Width="170px" CssClass="email"></dx:ASPxTextBox>--%>
                 
                  
                 <div style="margin-bottom: 25px" class="input-group">
                  
                     <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" id="txtPassword" runat="server" placeholder="Password" title="Password" class=" form-control" />
                     
                      <%--  <span toggle="#password-field" class="fa fa-fw fa-eye-slash field_icon toggle-password"></span>--%>
                     
                  
                       </div>
                <div style="margin-left:2px">
                 <div class="form-group">
                   <label>Select Login Type</label>
                        <asp:RadioButtonList id="logintype" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Selected="True" Value="0" Text="Requestor">Requestor</asp:ListItem>
                        <asp:ListItem Value="1" Text="Auditor">Auditor</asp:ListItem>
                        <asp:ListItem Value="2" Text="Admin">Admin</asp:ListItem>
                        <%--<asp:ListItem Value="3" Text="Approver">Approver</asp:ListItem> --%>
                       <%-- <asp:ListItem Value="4" Text="Engineer">Engineer</asp:ListItem> --%>
                    <%--    <asp:ListItem Value="4" Text="IT-Admin">IT-Admin</asp:ListItem> --%>     
                      <%--  <asp:ListItem Value="5" Text="NONIT-Admin">NONIT-Admin</asp:ListItem>     --%>
                        </asp:RadioButtonList>
                                        
                </div>
                        
                        <%--<dx:ASPxTextBox ID="txtPassword" runat="server" Width="170px"  CssClass="email"></dx:ASPxTextBox>--%>
                   
                            
                    
                  
                   <%-- <div class="checkbox-inline text-center">
                        <input type="checkbox" class="checkbox checkbox-inline active" value="Remember Me" /><span>Remember Me</span>
                    </div>--%>
                    
                        <dx:ASPxLabel runat="server" ID="lblNotification" CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" ForeColor="Red"></dx:ASPxLabel>
                    
                    <div class="center-block text-center">
                        <%--    <input type="Button" class="btn btn-success" title="Log In" value="Log in" /> 
                        --%>       <%--<dx:ASPxButton ID="save" runat="server" Text="Login" OnClick="save_Click" CssClass="btn btn-success"></dx:ASPxButton>--%>
                         <div class="form-group">
                        <asp:Button ID="save" runat="server" class="btn-suc"  Text="Login" OnClick="save_Click" />
                         </div>
                    </div>
                    <div>
                         <%-- <a href=" ForgotPassword.aspx"  id="a2" runat="server" style="color:black">Forgot Password</a>--%>
                        </div>
<%--                        <a href="ChangePassword.aspx" visible="false" id="a1" runat="server" style="font-weight:bolder;color:black">Forgot Password</a>--%>
                        </div>
                    <div>
                         <div class="" style="padding: 15px;">
                     <%--   <asp:Button ID="btn_MobileApp" runat="server" class="btn-form" Text="Download App" OnClick="btn_MobileApp_Click" />--%>
                         </div>
                        <asp:HiddenField ID="HdnStartTime" runat="server" />
                    </div>
                   <%-- <div >
                        <%--<asp:ScriptManager   runat="server" ID="ScriptManager1"></asp:ScriptManager>
                    </div>--%>
                     
                </div>
                    </form>
            </div>
                </div>
            </div>
                  
     
        
         <footer class="footer">
        </footer>

  </div>

</body>
</html>
