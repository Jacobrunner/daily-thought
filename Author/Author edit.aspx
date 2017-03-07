<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Author edit.aspx.cs" Inherits="Author_Category_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:sqldatasource ID="SqlDatasourceA" runat="server" ConnectionString="<%$ ConnectionStrings:myDBcon %>" SelectCommand="SELECT * FROM [Author]" DeleteCommand="DELETE FROM [Author] WHERE [authID] = @authID" InsertCommand="INSERT INTO [Author] ([authFName], [authLName], [authPerm], [authTag], [authUser], [authPass]) VALUES (@authFName, @authLName, @authPerm, @authTag, @authUser, @authPass)" UpdateCommand="UPDATE [Author] SET [authFName] = @authFName, [authLName] = @authLName, [authPerm] = @authPerm, [authTag] = @authTag, [authUser] = @authUser, [authPass] = @authPass WHERE [authID] = @authID">
        <DeleteParameters>
            <asp:Parameter Name="authID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="authFName" Type="String" />
            <asp:Parameter Name="authLName" Type="String" />
            <asp:Parameter Name="authPerm" Type="Int32" />
            <asp:Parameter Name="authTag" Type="String" />
            <asp:Parameter Name="authUser" Type="String" />
            <asp:Parameter Name="authPass" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="authFName" Type="String" />
            <asp:Parameter Name="authLName" Type="String" />
            <asp:Parameter Name="authPerm" Type="Int32" />
            <asp:Parameter Name="authTag" Type="String" />
            <asp:Parameter Name="authUser" Type="String" />
            <asp:Parameter Name="authPass" Type="String" />
            <asp:Parameter Name="authID" Type="Int32" />
        </UpdateParameters>
    </asp:sqldatasource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBcon %>" SelectCommand="SELECT * FROM [Author]">
    </asp:SqlDataSource>

    <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="authID">
        <Columns>
          
            <asp:CommandField ShowSelectButton="True" />
          
            <asp:BoundField DataField="authFName" HeaderText="Author" SortExpression="authID" />
        
           
        </Columns>
    </asp:GridView>

   <div class="static" >
       <asp:formview runat="server" DataKeyNames="authID" DataSourceID="SqlDatasourceA">
           <EditItemTemplate>
               authID:
               <asp:Label ID="authIDLabel1" runat="server" Text='<%# Eval("authID") %>' />
               <br />
               authFName:
               <asp:TextBox ID="authFNameTextBox" runat="server" Text='<%# Bind("authFName") %>' />
               <br />
               authLName:
               <asp:TextBox ID="authLNameTextBox" runat="server" Text='<%# Bind("authLName") %>' />
               <br />
               authPerm:
               <asp:TextBox ID="authPermTextBox" runat="server" Text='<%# Bind("authPerm") %>' />
               <br />
               authTag:
               <asp:TextBox ID="authTagTextBox" runat="server" Text='<%# Bind("authTag") %>' />
               <br />
               authUser:
               <asp:TextBox ID="authUserTextBox" runat="server" Text='<%# Bind("authUser") %>' />
               <br />
               authPass:
               <asp:TextBox ID="authPassTextBox" runat="server" Text='<%# Bind("authPass") %>' />
               <br />
               <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
               &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           </EditItemTemplate>
           <InsertItemTemplate>
               authFName:
               <asp:TextBox ID="authFNameTextBox" runat="server" Text='<%# Bind("authFName") %>' />
               <br />
               authLName:
               <asp:TextBox ID="authLNameTextBox" runat="server" Text='<%# Bind("authLName") %>' />
               <br />
               authPerm:
               <asp:TextBox ID="authPermTextBox" runat="server" Text='<%# Bind("authPerm") %>' />
               <br />
               authTag:
               <asp:TextBox ID="authTagTextBox" runat="server" Text='<%# Bind("authTag") %>' />
               <br />
               authUser:
               <asp:TextBox ID="authUserTextBox" runat="server" Text='<%# Bind("authUser") %>' />
               <br />
               authPass:
               <asp:TextBox ID="authPassTextBox" runat="server" Text='<%# Bind("authPass") %>' />
               <br />
               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
               &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           </InsertItemTemplate>
           <ItemTemplate>
               authID:
               <asp:Label ID="authIDLabel" runat="server" Text='<%# Eval("authID") %>' />
               <br />
               authFName:
               <asp:Label ID="authFNameLabel" runat="server" Text='<%# Bind("authFName") %>' />
               <br />
               authLName:
               <asp:Label ID="authLNameLabel" runat="server" Text='<%# Bind("authLName") %>' />
               <br />
               authPerm:
               <asp:Label ID="authPermLabel" runat="server" Text='<%# Bind("authPerm") %>' />
               <br />
               authTag:
               <asp:Label ID="authTagLabel" runat="server" Text='<%# Bind("authTag") %>' />
               <br />
               authUser:
               <asp:Label ID="authUserLabel" runat="server" Text='<%# Bind("authUser") %>' />
               <br />
               authPass:
               <asp:Label ID="authPassLabel" runat="server" Text='<%# Bind("authPass") %>' />
               <br />
               <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
               &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
               &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
           </ItemTemplate>
       </asp:formview>




       </div>


    <div class="clear"></div>
</asp:Content>

