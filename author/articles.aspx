<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="articles.aspx.cs" Inherits="Author_articles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Choose an article</h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBcon %>" SelectCommand="SELECT Articles.*, categories.* FROM Articles INNER JOIN categories ON Articles.category = categories.catId"></asp:SqlDataSource>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <h3><a href="edit-articles.aspx?id=<%#Eval("artid")%>"><%# Eval("headline") %></a></h3>
            <h5> <%# Eval("postdate") %></h5>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
        </SeparatorTemplate>

    </asp:Repeater>
</asp:Content>

