<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="WebApplication2.mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>لوحة تحكم مجلة الحرس الوطني</title>
    <link rel="stylesheet" type="text/css" href="style.css" media="screen"/>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
   
</head>
<body>
    <form id="form1" runat="server">
        
         <nav  id="navbar">
                        <ul>
                            <li><a href="mainpage.aspx">الرئيسية</a></li>
                            <li> <a href="IssuesPage.aspx">الأعداد</a></li>
                            <li><a href="sections.aspx">الأقسام</a></li>
                            <li><a href="Associations.aspx">ربط العدد بالأقسام</a></li>
                            <li> <a href="Pages.aspx">الصفحات</a></li>
                            <li><a href="LogOut.aspx" onclick="Logout_Click">خروج</a></li>
                             <h1> لوحة تحكم مجلة الحرس الوطني </h1>
                        </ul>
                    </nav>
                    
            <div id='login'>
                
                <p>
                  ! <asp:Label ID="NameWelcome" runat="server" Text="NameWelcome"></asp:Label> مرحبا بك 
                </p>

            </div>

    </form>
</body>
</html>





