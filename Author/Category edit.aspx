<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category edit.aspx.cs" Inherits="Author_Category_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBcon %>" DeleteCommand="DELETE FROM [categories] WHERE [catId] = @catId" InsertCommand="INSERT INTO [categories] ([catName], [catQuery], [catOrder]) VALUES (@catName, @catQuery, @catOrder)" SelectCommand="SELECT * FROM [categories] WHERE ([catId] = @catId)" UpdateCommand="UPDATE [categories] SET [catName] = @catName, [catQuery] = @catQuery, [catOrder] = @catOrder WHERE [catId] = @catId">
        <DeleteParameters>
            <asp:Parameter Name="catId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="catName" Type="String" />
            <asp:Parameter Name="catQuery" Type="String" />
            <asp:Parameter Name="catOrder" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GV" Name="catId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="catName" Type="String" />
            <asp:Parameter Name="catQuery" Type="String" />
            <asp:Parameter Name="catOrder" Type="Int32" />
            <asp:Parameter Name="catId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBcon %>" SelectCommand="SELECT * FROM [categories]">
    </asp:SqlDataSource>

    <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="catId">
        <Columns>
          
            <asp:CommandField ShowSelectButton="True" />
          
            <asp:BoundField DataField="catName" HeaderText="Category" SortExpression="catName" />
        
           
        </Columns>
    </asp:GridView>

   <div class="static" >
       <asp:FormView ID="FormView1" runat="server" DataKeyNames="catId" DataSourceID="SqlDataSource1" OnItemUpdated="FormView1_ItemUpdated" OnItemCreated="FormView1_ItemCreated" OnItemDeleted="FormView1_ItemDeleted" >
           <EditItemTemplate>
               catId:
               <asp:Label ID="catIdLabel1" runat="server" Text='<%# Eval("catId") %>'></asp:Label>
               <br />
               catName:
               <asp:TextBox ID="catNameTextBox" runat="server" Text='<%# Bind("catName") %>'></asp:TextBox>
               <br />
               catQuery:
               <asp:TextBox ID="catQueryTextBox" runat="server" Text='<%# Bind("catQuery") %>'></asp:TextBox>
               <br />
               catOrder:
               <asp:TextBox ID="catOrderTextBox" runat="server" Text='<%# Bind("catOrder") %>'></asp:TextBox>
               <br />
               <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
           </EditItemTemplate>
           <InsertItemTemplate>
               catName:
               <asp:TextBox ID="catNameTextBox" runat="server" Text='<%# Bind("catName") %>'></asp:TextBox>
               <br />
               catQuery:
               <asp:TextBox ID="catQueryTextBox" runat="server" Text='<%# Bind("catQuery") %>'></asp:TextBox>
               <br />
               catOrder:
               <asp:TextBox ID="catOrderTextBox" runat="server" Text='<%# Bind("catOrder") %>'></asp:TextBox>
               <br />
               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
           </InsertItemTemplate>
           <ItemTemplate>
               catId:
               <asp:Label ID="catIdLabel" runat="server" Text='<%# Eval("catId") %>'></asp:Label>
               <br />
               catName:
               <asp:Label ID="catNameLabel" runat="server" Text='<%# Bind("catName") %>'></asp:Label>
               <br />
               catQuery:
               <asp:Label ID="catQueryLabel" runat="server" Text='<%# Bind("catQuery") %>'></asp:Label>
               <br />
               catOrder:
               <asp:Label ID="catOrderLabel" runat="server" Text='<%# Bind("catOrder") %>'></asp:Label>
               <br />
               <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
               &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
           </ItemTemplate>
       </asp:FormView>
      

       </div>


    <div class="clear"></div>
</asp:Content>

