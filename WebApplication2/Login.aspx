<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ar" dir="rtl">
<head runat="server">
      <title>لوحة تحكم مجلة الحرس الوطني</title>
     <link rel="stylesheet" type="text/css" href="style.css" media="screen"/>
            <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
</head>
<body>
<form id="form1" runat="server">
        
            <div id='login' runat="server" >
                     
                            <asp:TextBox id="txtusername" runat="server" placeholder="اسم المستخدم" CssClass="loginTextbox"  ></asp:TextBox>
                            <asp:TextBox TextMode="Password" id="txtPw" runat="server" placeholder="كلمة المرور" CssClass="loginTextbox" ></asp:TextBox>
                           
                            <asp:button cssclass="btn"  id="Loginbtn" onclick="Loginbtn_Click" runat="server" Text="تسجيل الدخول"></asp:button>
                         
                </div>
 </form>
</body>
</html>
