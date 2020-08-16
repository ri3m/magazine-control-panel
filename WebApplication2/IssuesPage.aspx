<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuesPage.aspx.cs" Inherits="WebApplication2.IssuesPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html lang="ar" dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
            <title>لوحة تحكم مجلة الحرس الوطني</title>
            <link rel="stylesheet" type="text/css" href="style.css" media="screen">
            <meta http-equiv="content-type" content="text/html;charset=UTF-8">

</head>
 <body>
   <form id="form2" runat="server">  
            
            <div id="navbar">
                <ul>
                    <li><a href="MainPage.aspx">الرئيسية</a></li>
                    <li> <a href="IssuesPage.aspx">الأعداد</a></li>
                    <li><a href="sections.aspx">الأقسام</a></li>
                    <li><a href="Associations.aspx">ربط العدد بالأقسام</a></li>
                    <li> <a href="Pages.aspx">الصفحات</a></li>
                    <li><a href="logout.aspx">خروج</a></li>
                   
                    <h1> لوحة تحكم مجلة الحرس الوطني </h1>
                </ul>
            </div>


<section>
    
    <center>
            
        <h3>  العدد :</h3>
 <asp:TextBox ID="TextBox1" runat="server" CssClass ="box"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="الرجاء تعبئة الحقل"  ControlToValidate="TextBox1" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
        <h3>رقم العدد :</h3>
 <asp:TextBox ID="TextBox2" runat="server" CssClass ="box"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="الرجاء تعبئة الحقل"  ControlToValidate="TextBox2" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
        <h3>تاريخ العدد :</h3>
 <asp:ScriptManager runat="server"/>
 <asp:TextBox ID="TextBox3" runat="server" CssClass="box" />
<cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox3"
    Format="dd/MM/yyyy">
</cc1:CalendarExtender>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="الرجاء تعبئة الحقل"  ControlToValidate="TextBox3" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>
        <h3>الحالة :</h3>
          <asp:DropDownList ID="DropDownList1" runat="server" CssClass ="box">
             <asp:ListItem Value="-1" Text="اختر الحالة ..."></asp:ListItem>
            <asp:ListItem  >معلق</asp:ListItem>
            <asp:ListItem  >منشور</asp:ListItem>
        </asp:DropDownList>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="الرجاء اختيار الحالة"  ControlToValidate="DropDownList1" InitialValue="-1" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv"></asp:RequiredFieldValidator>

        <br/>
        
        <asp:Button cssclass="btn" ID="Button1" runat="server" Text="حفظ" OnClick="Button1_Click1" ValidationGroup="btnv"></asp:Button>
        <br/>
          <br/>
          <br/>
<asp:GridView ID="grdContent" runat="server" EnableViewState="False" AutoGenerateColumns="False" DataKeyNames="Issue_ID" DataSourceID="SqlDataSource1" Width="50%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="GV">
<ControlStyle CssClass="GV"></ControlStyle>
        </asp:CommandField>
        <asp:BoundField DataField="Issue" HeaderText="العدد" SortExpression="Issue" />
        <asp:BoundField DataField="IssueNo" HeaderText="رقم العدد" SortExpression="IssueNo" />
        <asp:TemplateField HeaderText="تاريخ العدد" SortExpression="IssueDate">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IssueDate") %>'></asp:TextBox>
                <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("IssueDate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="الحالة" SortExpression="Status">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Status") %>'>
                    <asp:ListItem>معلق</asp:ListItem>
                    <asp:ListItem>منشور</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
          </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" DeleteCommand="DELETE FROM [Issues] WHERE [Issue_ID] = @Issue_ID" InsertCommand="INSERT INTO [Issues] ([Issue], [IssueNo], [IssueDate], [Status]) VALUES (@Issue, @IssueNo, @IssueDate, @Status)" SelectCommand="SELECT * FROM [Issues]" UpdateCommand="UPDATE [Issues] SET [Issue] = @Issue, [IssueNo] = @IssueNo, [IssueDate] = @IssueDate, [Status] = @Status WHERE [Issue_ID] = @Issue_ID">
    <%--</InsertParameters>--%>
    <DeleteParameters>
        <asp:Parameter Name="Issue_ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Issue" Type="String" />
        <asp:Parameter Name="IssueNo" Type="Int32" />
        <asp:Parameter Name="IssueDate" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Issue" Type="String" />
        <asp:Parameter Name="IssueNo" Type="Int32" />
        <asp:Parameter Name="IssueDate" Type="String" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="Issue_ID" Type="Int32" />
    </UpdateParameters>
          </asp:SqlDataSource>
     
        
             
    </center>
 </section>


    <footer>

            <hr>
            <small> وزارة الحرس الوطني - المملكة العربية السعودية &copy; 2019</small>
        </footer>
 </form>
</body>
        </html>
