<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sections.aspx.cs" Inherits="WebApplication2.Sections" %>

<!DOCTYPE html>
   
 <html lang="ar" dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
        <head runat="server">
            <title>لوحة تحكم مجلة الحرس الوطني</title>
            <link rel="stylesheet" type="text/css" href="style.css" media="screen"/>
            <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
        </head>
        <body>

               
            <div id="navbar">
                <ul>
                    <li><a href="mainpage.aspx">الرئيسية</a></li>
                    <li> <a href="IssuesPage.aspx">الأعداد</a></li>
                    <li><a href="sections.aspx">الأقسام</a></li>
                    <li><a href="Associations.aspx">ربط العدد بالأقسام</a></li>
                    <li> <a href="Pages.aspx">الصفحات</a></li>
                    <li><a href="logout.aspx">خروج</a></li>  
                    <h1> لوحة تحكم مجلة الحرس الوطني </h1>
               </ul>

            </div>

<section>
<!-- start here -->

<form id="form1" runat="server">
    <center> 
<h3>القسم:</h3>
    
    &nbsp;<asp:TextBox ID="TextBox1" runat="server" CssClass="box" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="الرجاء تعبئة الحقل" forecolor="red" ControlToValidate ="TextBox1" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
    &nbsp;
    <br />
    <br />
&nbsp;<br />

<asp:Button cssclass="btn" ID="Button1" runat="server" Text="حفظ" OnClick="Button1_Click" ValidationGroup="btnv" />
    <br />
 <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" DeleteCommand="DELETE FROM [Sections] WHERE [Section_ID] = @Section_ID" InsertCommand="INSERT INTO [Sections] ([SectionName]) VALUES (@SectionName)" SelectCommand="SELECT * FROM [Sections]" UpdateCommand="UPDATE [Sections] SET [SectionName] = @SectionName WHERE [Section_ID] = @Section_ID">
        <DeleteParameters>
            <asp:Parameter Name="Section_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SectionName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SectionName" Type="String" />
            <asp:Parameter Name="Section_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
&nbsp;
        <asp:GridView ID="grdContent" runat="server" AutoGenerateColumns="False" EnableViewState="False" DataKeyNames="Section_ID" DataSourceID="SqlDataSource1" Width="50%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"  OnRowCommand="GridView1_RowCommand"
>
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="GV"/>
                <asp:BoundField DataField="SectionName" HeaderText="القسم" SortExpression="SectionName" />
            </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
        </center>
        </form>
</section>
            <footer>
            <hr>
            <small> وزارة الحرس الوطني - المملكة العربية السعودية &copy; 2019</small>
        </footer>
</body>
     </html>
