﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="edit-article.aspx.cs" Inherits="Author_add_article" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        tinymce.init({
            selector: '.full',
            height: 300,
            menubar: false,
            plugins: [
              'advlist autolink lists link image charmap print preview anchor',
              'searchreplace visualblocks code fullscreen',
              'insertdatetime media table contextmenu paste code'
            ],
            toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            content_css: '//www.tinymce.com/css/codepen.min.css'
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2> Edit an Article </h2>
    <asp:HiddenField ID="TXTID" runat="server" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="765px" />


    <br />
     <asp:Panel ID="pnlForm" runat="server">
       <div class="tab">
           <div class="tabCell">
               <asp:Label ID="lblHeadline" runat="server" AssociatedControlID="txtHeadline">Headline:</asp:Label>
               
                </div>
           <div class="tabCell">
               <asp:TextBox ID="txtHeadline" runat="server" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Headline needed" ControlToValidate="txtHeadline"  />
               <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtHeadline" ErrorMessage="Headline over character limit" OnServerValidate="CustomValidator2_ServerValidate"/>
               
           </div>
             <div class="tabCell">
               <asp:Label ID="lblDate" runat="server" AssociatedControlID="txtDate">Date:</asp:Label>
           </div>
           <div class="tabCell">
               <asp:TextBox ID="txtDate" runat="server" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date needed" ControlToValidate="txtDate"  />
  
           </div>
             <div class="tabCell">
               <asp:Label ID="lblAuth" runat="server" AssociatedControlID="authdrop">Author</asp:Label>
           </div>
        

           <div class="tabCell">
               <asp:SqlDataSource ID="SqlAuth" runat="server"
                   ConnectionString="<%$ ConnectionStrings:myDBcon %>"
                   SelectCommand="SELECT [authID],[authFName] + ' ' + [authLName] AS authName FROM [Author]">
               </asp:SqlDataSource> 
           <asp:DropDownList runat="server" ID="authdrop" DataSourceID="SqlAuth" DataTextField="authName" DataValueField="authID" AppendDataBoundItems="true">
               <asp:ListItem value="" Text="Select" />
               
              
           </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Author needed" ControlToValidate="authdrop" />
           </div>

             <div class="tabCell">
               <asp:Label ID="lblDrop" runat="server" AssociatedControlID="ddldrop">category</asp:Label>
           </div>
           <div class="tabCell">

               <asp:SqlDataSource ID="SqlCat" runat="server"
                    ConnectionString="<%$ ConnectionStrings:myDBcon %>" 
                   SelectCommand="SELECT * FROM [categories] ORDER BY [catOrder]">
                   </asp:SqlDataSource>
               <asp:DropDownList ID="ddldrop" runat="server" DataSourceID="sqlCat" DataTextField="catName"  DataValueField="catid" AppendDataBoundItems="true">
                   <asp:ListItem Value="" Text="Select" />
                   </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category needed" ControlToValidate="ddldrop" />
           </div>
           

           <div class="tab">
               <div class="tabCell">
               <asp:Label ID="lblimg" runat="server" Text="imagePath" AssociatedControlID="ImgP"></asp:Label>
           </div>
           <div class="tabCell">
               <asp:FileUpload ID="ImgP" runat="server" />  
           </div>

           </div>
           <div class="tabCell">
               <asp:Label ID="lblalt" runat="server" Text="ImageAlt" AssociatedControlID="txtImgA"></asp:Label>
           </div>
           <div class="tabCell">
               <asp:TextBox ID="txtimgA" runat="server" />
           </div>
             <div class="tabCell">
               <asp:Label ID="lblSummary" runat="server" AssociatedControlID="txtSum">Summary</asp:Label>
           </div>
           <div class="tabCell">
               <asp:TextBox ID="txtSum" runat="server" TextMode="MultiLine" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Summary needed" ControlToValidate="txtSum"  />
               
               <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtsum" runat="server" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator1_ServerValidate"/>
           </div>
             <div class="tabCell">
               <asp:Label ID="lblFulltxt" runat="server" AssociatedControlID="txtFull">FullText</asp:Label>
           </div>
           <div class="tabCell">
               <asp:TextBox ID="txtFull" runat="server" TextMode="MultiLine" CssClass="full" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Fulltext needed" ControlToValidate="txtFull"  />
           </div>
           
               <asp:button ID="btnsub" runat="server" Text="post Article" OnClick="btnsub_Click" />
           </div>
       
       


    </asp:Panel>
    <asp:Panel ID="pnlThanks" runat="server" Visible="false">
 <asp:Literal ID="lblout" runat="server"></asp:Literal>
        
    </asp:Panel>
</asp:Content>

