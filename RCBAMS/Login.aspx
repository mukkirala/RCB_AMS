<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

  <%@ Register
    Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

    <%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
      Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>


      <!DOCTYPE html>

      <html xmlns="http://www.w3.org/1999/xhtml">

      <head runat="server">

        <link rel="shortcut icon" href="Images/logoRCB.png" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>RCB-AssetManagement System </title>

        <meta http-equiv="Page-Enter" content="blendTrans(Duration=0)" />
        <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <link href="fonts/fontawesome-free-6.2.1-web/fontawesome-free-6.2.1-web/css/all.css" rel="stylesheet" />

        <link href="Content/bootstrap.min.css" rel="stylesheet" />
        <script type="text/javascript" src="<%# ResolveUrl(" ~/javascript/leesUtils.js") %>"></script>

        <script>
          if (window.dialogArguments) {
            alert("Your Session has been expired.\r\n\r\nPlease login again.");
            window.close();
          }

          if (window.opener) {
            window.location.href = "./SessionExpired.aspx";
          }

        </script>

        <style>
          body {
            font-family: 'Telex', sans-serif;
            background-size: cover;
            margin: 0;
            padding: 0;
            height: 100vh;
            overflow: hidden;
          }

          .bg-login {
            background: #cbd2d6;
            min-height: 100vh;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding-top: 5%;
          }

          body {
            border: none;
            outline: none;
            background: no-repeat center center cover;
          }

          .container-fluid {
            height: 100vh;
            display: flex;
            flex-direction: column;
            padding: 0;
          }

          /* Top header bar - styled to match provided design */
          .header {
            background: linear-gradient(90deg, #0b4f7a 0%, #1786c1 100%);
            padding: 0;
            height: 80px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
            position: relative;
            z-index: 100;
            width: 100%;
          }

          .header .container {
            max-width: 100%;
            width: 100%;
            padding: 0 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 100%;
          }

          .header-logo {
            height: 60px;
            width: 60px;
            background: #fff;
            padding: 4px;
            border-radius: 50%;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            object-fit: contain;
          }

          .footer {
            display: none;
          }

          .inp {
            position: relative;
            margin: auto;
            width: 100%;
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

          .inp input:hover {}

          .inp input:not(:placeholder-shown)+span {
            color: #5a667f;
            transform: translateY(-26px) scale(0.75);
          }

          .inp input:focus {
            background: none;
            outline: none;
          }

          .inp input:focus+span {
            color: #ff6c00;
            transform: translateY(-26px) scale(0.75);
          }

          .inp input:focus+span+.border {
            transform: scaleX();
          }

          .btn-suc {
            width: 100%;
            border: none;
            background: linear-gradient(90deg, #0b4f7a 0%, #1786c1 100%);
            color: white;
            padding: 12px 20px;
            font-weight: 500;
            font-size: 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
          }

          .btn-suc:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(11, 79, 122, 0.3);
            background: linear-gradient(90deg, #094063 0%, #136a99 100%);
          }

          .main-title {
            color: #fff;
            font-weight: 700;
            margin: 0;
            font-size: 16px;
          }

          .header h3 {
            margin: 3px 0 0 0;
            font-size: 13px;
            color: rgba(255, 255, 255, 0.9);
            font-weight: 400;
          }

          .header-center-title {
            color: #fff;
            font-weight: 700;
            font-size: 18px;
            margin: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
          }

          .auto-style1 {
            height: 350px;
            padding: 15px;
          }

          #logintype tr td {
            padding: 5px;
          }

          .logindiv {
            flex: 1;
            margin: 0;
            width: 100%;
          }

          /* frosted glass login panel */
          .login {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.4);
            padding: 30px;
            width: 100%;
            max-width: 420px;
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(8px) saturate(120%);
            -webkit-backdrop-filter: blur(8px) saturate(120%);
          }

          .login-form {
            margin: 0px auto;
            padding: 0px;
          }

          .login-form h3 {
            font-weight: 600;
            font-size: 24px;
            margin-bottom: 30px;
            color: #fff;
            text-align: center;
          }

          .input-group-addon,
          .input-group-btn {
            min-width: 50px;
            font-size: 18px;
            border: 1px solid rgba(11, 79, 122, 0.2);
            border-right: none;
            color: white;
            background: linear-gradient(90deg, #0b4f7a 0%, #1786c1 100%);
            border-radius: 8px 0 0 8px;
          }

          .btn-form {
            padding: 8px;
            color: white;
            background: rgb(51, 95, 224);
            border: none;
            transition: .3s ease-in;
            font-size: 18px;
          }

          .btn-form:hover {
            background: #ea091c;
          }

          /* slideshow and overlay adjustments - make images full width and place login panel on top */
          .slide_div {
            position: relative;
            height: 100%;
            display: block;
            padding: 0 !important;
            margin: 0 !important;
            overflow: hidden;
            background: linear-gradient(135deg, #193546 0%, #065B98 30%, #1B7FDC 65%, #0DB8D3 100%),
              linear-gradient(60deg, rgba(13, 184, 211, 0.12), rgba(27, 127, 220, 0.06)),
              linear-gradient(240deg, rgba(0, 0, 0, 0.06), transparent 40%);
          }

          /* slideshow elements */
          .slideshow-container {
            position: absolute;
            inset: 0;
          }

          .slideshow-container .slide {
            position: absolute;
            inset: 0;
            background-size: cover;
            background-position: center center;
            opacity: 0;
            transform: scale(1.02);
            transition: opacity 1s ease, transform 1s ease;
            animation: slidefade 12s infinite;
          }

          .slideshow-container .slide:nth-child(1) {
            animation-delay: 0s;
          }

          .slideshow-container .slide:nth-child(2) {
            animation-delay: 4s;
          }

          .slideshow-container .slide:nth-child(3) {
            animation-delay: 8s;
          }

          @keyframes slidefade {
            0% {
              opacity: 0;
              transform: scale(1.03);
            }

            8% {
              opacity: 1;
              transform: scale(1);
            }

            33% {
              opacity: 1;
              transform: scale(1);
            }

            41% {
              opacity: 0;
              transform: scale(1.02);
            }

            100% {
              opacity: 0;
            }
          }

          .slideshow-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(0, 0, 0, 0.12) 0%, rgba(0, 0, 0, 0.22) 100%);
            pointer-events: none;
          }

          /* overlay wrapper for login panel */
          .login-overlay {
            position: absolute;
            top: 50%;
            right: 6%;
            transform: translateY(-50%);
            z-index: 50;
            width: 420px;
            max-width: calc(100% - 40px);
            padding: 10px;
          }

          @media (max-width: 991px) {
            .login-overlay {
              position: absolute;
              left: 50%;
              right: auto;
              transform: translate(-50%, -50%);
              top: 50%;
              width: 90%;
            }

            .header {
              height: auto;
              padding: 15px 0;
            }
            .header .container {
              flex-direction: column;
              text-align: center;
              justify-content: center;
            }
            .header .container > div {
              justify-content: center;
            }
            .header-center-text {
              position: relative !important;
              left: auto !important;
              transform: none !important;
              margin-top: 10px;
              width: 100% !important;
            }
            .header-center-title {
              text-align: center;
              font-size: 14px;
            }
          }

          .form-control {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            height: 45px;
            border-radius: 8px;
            font-size: 14px;
            padding: 0 15px;
            transition: all 0.3s ease;
          }

          .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            outline: none;
          }

          .toggle-password {
            color: black;
            position: absolute;
            right: 15px;
            cursor: pointer;
            padding: 12px;
            z-index: 100;
          }
                  @font-face {
    font-family: 'Conthrax';
    src: url('Conthrax-SemiBold.otf') format('opentype'),
         url('fonts/Conthrax-SemiBold.otf') format('opentype');
    font-weight: 600;
    font-style: normal;
    font-display: swap;
}

.labmate-brand {
    font-family: 'Conthrax', sans-serif !important;
    font-weight: 600 !important;
    letter-spacing: 1px !important;
}

        </style>



      </head>

      <body runat="server">
        <div class="container-fluid">
          <div class="header">
            <div class="container" style="position: relative;">
              <!-- Left Side -->
              <div style="display: flex; align-items: center; flex-wrap: wrap; z-index: 2; flex: 1;">
                <img src="Images/rcblg.png" class="header-logo" alt="RCB Logo" />
                <div style="margin-left: 15px; text-align: left;">
                 <%-- <h2 class="main-title">Regional Centre for Biotechnology Faridabad</h2>
                  <h3>An Institution of National Importance, Govt of India</h3>--%>
                </div>
              </div>

              <!-- Centered Title -->
              <div class="header-center-text" style="position: absolute; left: 50%; transform: translateX(-50%); text-align: center; z-index: 1; width: max-content;">
               <span  style="font-family: 'Conthrax', 'Orbitron', sans-serif; font-size: 20px; color: #ffffff; font-weight: 700; ">Regional Centre for Biotechnology Faridabad</span><br />
                    <small style="color: #ffffff;">Material Management  and Inventory Control</small>
                
              </div>

            </div>
          </div>

          <div class="row logindiv">

            <!-- Make slideshow full width and place login form as overlay on top -->
            <div class="col-sm-12 slide_div">
              <div class="slideshow-container">
                <div class="slide" style="background-image: url('Images/img1.png')"></div>
                <div class="slide" style="background-image: url('Images/img2.png')"></div>
                <div class="slide" style="background-image: url('Images/img5.png')"></div>
                <div class="slideshow-overlay"></div>
              </div>

              <!-- login overlay placed on top of slideshow -->
              <div class="login-overlay">
                <div class="login">
                  <div class="login-form">
                    <h3>LOGIN</h3>

                    <div>
                      <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" Modal="true" ClientInstanceName="lpanel"
                        runat="server"></dx:ASPxLoadingPanel>
                    </div>

                    <form id="loginform" class="form-horizontal" runat="server">

                      <div style="margin-bottom:25px" class="input-group">
                        <span class="input-group-addon"><i class="fas fa-user-circle"></i></span>
                        <input type="text" id="txtUserID" runat="server" placeholder="UserName" autocomplete="off"
                          class="form-control" />
                      </div>

                      <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" id="txtPassword" runat="server" placeholder="Password" title="Password"
                          class=" form-control" />
                      </div>

                      <div style="margin-left:2px">
                        <div class="form-group">
                          <label style="color:rgba(255,255,255,0.85)">Select Login Type</label>
                          <asp:RadioButtonList id="logintype" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="0" Text="Requestor">Requestor</asp:ListItem>
                            <asp:ListItem Value="1" Text="Auditor">Auditor</asp:ListItem>
                            <asp:ListItem Value="2" Text="Admin">Admin</asp:ListItem>
                          </asp:RadioButtonList>
                        </div>

                        <dx:ASPxLabel runat="server" ID="lblNotification"
                          CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" ForeColor="Red">
                        </dx:ASPxLabel>

                        <div class="center-block text-center">
                          <div class="form-group">
                            <asp:Button ID="save" runat="server" class="btn-suc" Text="Login" OnClick="save_Click" />
                          </div>
                        </div>

                        <asp:HiddenField ID="HdnStartTime" runat="server" />

                      </div>

                    </form>

                  </div>
                </div>
              </div>

            </div>

          </div>

          <footer class="footer">
          </footer>

        </div>

      </body>

      </html>