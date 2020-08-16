<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="WebApplication2.Pages" %>

<!DOCTYPE html>

<html lang="ar" dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>لوحة تحكم مجلة الحرس الوطني</title>
    <link rel="stylesheet" type="text/css" href="style.css" media="screen"/>
     <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <script src="_scripts/jquery-3.4.1.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="Scripts/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="Scripts/ckeditor/adapters/jquery.js"></script> 

<script type="text/javascript" lang="javascript">

    $(document).ready(function () {

        $('#PageContent').ckeditor();

    });



    function UpdateContent() {

        var ckeditorinstance = $('#PageContent').ckeditorGet();

        ckeditorinstance.updateElement();

    }
    

</script>
</head>
<body>
      <form id="form1" runat="server">
        
        <div id="navbar">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <ul>
                <li><a href="MainPage.aspx">الرئيسية</a></li>
                <li><a href="IssuesPage.aspx">الأعداد</a></li>
                <li><a href="Sections.aspx">الأقسام</a></li>
                <li><a href="Associations.aspx">ربط العدد بالأقسام</a></li>
                <li><a href="Pages.aspx">الصفحات</a></li>
                <li><a href="LogOut.aspx">خروج</a></li>

                <h1>لوحة تحكم مجلة الحرس الوطني </h1>
            </ul>
        </div>
          <section>
              <center> 
  
                <h3> عنوان الصفحة:</h3>
            <asp:TextBox ID="PageTitle" runat="server" CausesValidation="true" CssClass="box" > </asp:TextBox>
          <asp:RequiredFieldValidator  runat="server"   id="reqTitle" controltovalidate="PageTitle" errormessage="الرجاء تعبئة الحقل" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv" />
             
            <br />
             
                 <h3>محتوى الصفحة:</h3>
            <asp:TextBox ID="PageContent" CausesValidation="true" runat="server" TextMode="MultiLine"   > </asp:TextBox>
             <script type="text/javascript" lang="javascript">
                CKEDITOR.replace('<%=PageContent.ClientID %>', { htmlEncodeOutput: true, language: 'ar', contentsLangDirection: 'rtl' ,width: '50%'  });
            </script>
                <asp:RequiredFieldValidator runat="server"   id="reqContent" controltovalidate="PageContent" errormessage="الرجاء تعبئة الحقل" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv" />
              <br />
                   
               <h3>ترتيب الصفحة:</h3>
            <asp:TextBox ID="PageNo" runat="server" CausesValidation="true" CssClass="box"> </asp:TextBox  >
               <asp:RequiredFieldValidator runat="server"   id="reqNumber" controltovalidate="PageNo" errormessage="الرجاء تعبئة الحقل" ForeColor="red" Style="  left: 625px; position: absolute;  
            height: 22px; width: 128px" ValidationGroup="btnv" />
                   <br />
                  <br />
                  <asp:Button Class="btn" type="submit"  runat="server" OnClientClick="javascript:UpdateContent()"  Text="حفظ" OnClick="btn_Click" ValidationGroup="btnv" />
                   <br />
                  
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MagConPanDBConnectionString %>" DeleteCommand="DELETE FROM [Pages] WHERE [Page_ID] = @Page_ID" InsertCommand="INSERT INTO [Pages] ([PageTitle], [PageContent], [PageNo]) VALUES (@PageTitle, @PageContent, @PageNo)" SelectCommand="SELECT * FROM [Pages]" UpdateCommand="UPDATE [Pages] SET [PageTitle] = @PageTitle, [PageContent] = @PageContent, [PageNo] = @PageNo WHERE [Page_ID] = @Page_ID">
                  <DeleteParameters>
                      <asp:Parameter Name="Page_ID" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="PageTitle" Type="String" />
                      <asp:Parameter Name="PageContent" Type="String" />
                      <asp:Parameter Name="PageNo" Type="Int32" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="PageTitle" Type="String" />
                      <asp:Parameter Name="PageContent" Type="String" />
                      <asp:Parameter Name="PageNo" Type="Int32" />
                      <asp:Parameter Name="Page_ID" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
                  <asp:GridView ID="grdContent" runat="server" AllowPaging="True" AutoGenerateColumns="False" EnableViewState="False" DataKeyNames="Page_ID" DataSourceID="SqlDataSource1" Width="50%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnRowCommand="GridView1_RowCommand" >
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="GV" >
<ControlStyle CssClass="GV"></ControlStyle>
                          </asp:CommandField>
                          <asp:BoundField DataField="PageTitle" HeaderText="عنوان الصفحة" SortExpression="PageTitle" />
                          <asp:BoundField DataField="PageNo" HeaderText="رقم الصفحة" SortExpression="PageNo" />
                          <asp:BoundField DataField="PageContent" HeaderText="محتوى الصفحة" SortExpression="PageContent"  />
                      </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
                  </asp:GridView>
                  <br />
 
         
              </center>
              </section>

    </form>
     <footer>

            <hr>
            <small> وزارة الحرس الوطني - المملكة العربية السعودية &copy; 2019</small>
        </footer>
</body>
</html>
