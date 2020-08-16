<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Associations.aspx.cs" Inherits="WebApplication2.AssociationsPage" %>

<!DOCTYPE html>

   

<html lang="ar" dir="rtl" xmlns="http://www.w3.org/1999/xhtml">

       

<head>

           

<title>لوحة تحكم مجلة الحرس الوطني</title>

   

<link rel="stylesheet" type="text/css" href="Style.css" media="screen">        

<meta http-equiv="content-type" content="text/html;charset=UTF-8">
</head>
<body>          

<div id="navbar">

               

<ul>
<li><a href="MainPage.aspx">الرئيسية</a></li>
<li> <a href="IssuesPage.aspx">الأعداد</a></li>
<li><a href="sections.aspx">الأقسام</a></li>
<li><a href="Associations.aspx">ربط العدد بالأقسام</a></li>
<li> <a href="Pages.aspx">الصفحات</a></li>                  
<li><a href="LogOut.aspx">خروج</a></li>
<h1> لوحة تحكم مجلة الحرس الوطني </h1>
</ul>

</div>

<section>

    <center>

        <form id="form1" runat="server">

        <h3>العدد:</h3>

        &nbsp;

                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Issue" DataValueField="Issue" AppendDataBoundItems="True" CssClass="box">

                    <asp:ListItem Text="اختر العدد..." Value=""/>
                </asp:DropDownList>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="الرجاء تعبئة الحقل" ControlToValidate="DropDownList1" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" SelectCommand="SELECT [Issue] FROM [Issues]">
            </asp:SqlDataSource>

           <h3><p>القسم:</p></h3>

            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="SectionName" DataValueField="SectionName" AppendDataBoundItems="True" CssClass="box">

             <asp:ListItem Text=" اختر القسم..." Value=""/>

            </asp:DropDownList>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="الرجاء تعبئة الحقل" ControlToValidate="DropDownList2" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" SelectCommand="SELECT [SectionName] FROM [Sections]"></asp:SqlDataSource>

           

        &nbsp;<h3><p>ترتيب القسم في العدد:</p></h3>

         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="الرجاء تعبئة الحقل" ControlToValidate="TextBox1" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="box"></asp:TextBox>

&nbsp;<h3><p>صفحة بدء القسم:</p></h3>

         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="الرجاء تعبئة الحقل" ControlToValidate="TextBox2" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="box"></asp:TextBox>

        <br/>

            <asp:Button cssclass="btn" ID="Button1" runat="server" Text="حفظ" OnClick="Button1_Click"  ValidationGroup="btnv" />

            <br />

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" DeleteCommand="DELETE FROM [Association] WHERE [Association_ID] = @Association_ID" InsertCommand="INSERT INTO [Association] ([Issue], [SectionName], [FPageNumNSec], [SectionNo]) VALUES (@Issue, @SectionName, @FPageNumNSec, @SectionNo)" SelectCommand="SELECT * FROM [Association]" UpdateCommand="UPDATE [Association] SET [Issue] = @Issue, [SectionName] = @SectionName, [FPageNumNSec] = @FPageNumNSec, [SectionNo] = @SectionNo WHERE [Association_ID] = @Association_ID">

                <DeleteParameters>

                    <asp:Parameter Name="Association_ID" Type="Int32" />

                </DeleteParameters>

                <InsertParameters>

                    <asp:Parameter Name="Issue" Type="String" />

                    <asp:Parameter Name="SectionName" Type="String" />

                    <asp:Parameter Name="FPageNumNSec" Type="Int32" />

                    <asp:Parameter Name="SectionNo" Type="Int32" />

                </InsertParameters>

                <UpdateParameters>

                    <asp:Parameter Name="Issue" Type="String" />

                    <asp:Parameter Name="SectionName" Type="String" />

                    <asp:Parameter Name="FPageNumNSec" Type="Int32" />

                    <asp:Parameter Name="SectionNo" Type="Int32" />

                    <asp:Parameter Name="Association_ID" Type="Int32" />

                </UpdateParameters>

            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server"  EnableViewState="False" AutoGenerateColumns="False" DataKeyNames="Association_ID" DataSourceID="SqlDataSource5" Width="50%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"

            AllowPaging="True" OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="GV" >

<ControlStyle CssClass="GV"></ControlStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="العدد" SortExpression="Issue">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource6" DataTextField="Issue" DataValueField="Issue" SelectedValue='<%# Bind("Issue") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" SelectCommand="SELECT [Issue] FROM [Issues]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Issue") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="القسم" SortExpression="SectionName">
                        <EditItemTemplate>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" SelectCommand="SELECT [SectionName] FROM [Sections]"></asp:SqlDataSource>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource7" DataTextField="SectionName" DataValueField="SectionName" SelectedValue='<%# Bind("SectionName") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SectionName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="FPageNumNSec" HeaderText="ترتيب القسم " SortExpression="FPageNumNSec" />

                    <asp:BoundField DataField="SectionNo" HeaderText="صفحة بداية القسم" SortExpression="SectionNo" />

                </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>

            </asp:GridView>

        </form>

    </center>

</section>
  

<footer>

 <hr>

<small> وزارة الحرس الوطني - المملكة العربية السعودية &copy; 2019</small>

       
</footer>
    
</body>

       

</html>
