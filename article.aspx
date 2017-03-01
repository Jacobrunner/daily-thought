<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="article.aspx.cs" Inherits="article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBcon %>" SelectCommand="SELECT Articles.*, categories.* FROM Articles INNER JOIN categories ON Articles.category = categories.catId"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetRouteUrl" TypeName="MasterPage">
        <SelectParameters>
            <asp:Parameter Name="routeParameters" Type="Object" />
        </SelectParameters>
</asp:ObjectDataSource>
    </br>
    
</asp:Content>

