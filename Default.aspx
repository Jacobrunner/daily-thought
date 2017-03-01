<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 95px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <h1>Choose your power sigil Combination</h1>
        
       <table>
           <tr>
               <td>
<h3>Justice</h3>
               </td>
               
           
           <td>
 <asp:CheckBox ID="CheckBox1" runat="server" />
           </td>
               <td class="auto-style1">
                     <asp:TextBox ID="Justice" runat="server" Text="0" Visible="false" style="margin-left: 0px"  />
               </td>
            
               <td><asp:Label ID="JusticeS" runat="server" Text=""></asp:Label></td>
               <td><asp:Label ID="errorj" runat="server" Text=""></asp:Label></td>
           </tr>
        <tr>
            <td>
 <h3>Fire</h3> 
            </td>
           <td>
<asp:CheckBox ID="CheckBox2" runat="server" />
            <td class="auto-style1"><asp:TextBox ID="fire" runat="server" Text="0" Visible="false" /></td>
            <td><asp:Label ID="FireS" runat="server" Text=""></asp:Label></td>
            <td><asp:Label ID="errorf" runat="server" Text=""></asp:Label></td>
        </tr>
           <tr>
               <td>
                   <h3>Primal</h3>
               </td>
              <td>
<asp:CheckBox ID="CheckBox3" runat="server" />
               <td class="auto-style1"><asp:TextBox ID="Primal" runat="server" Text="0" Visible="false" /></td>
               <td><asp:Label ID="PrimalS" runat="server" Text=""></asp:Label></td>
               <td><asp:Label ID="errorp" runat="server" Text=""></asp:Label></td>
           </tr>
         <tr>
             <td>
                <h3> Time</h3>
             </td>
             <td><asp:CheckBox ID="CheckBox5" runat="server" />
                 
             <td class="auto-style1"><asp:TextBox ID="time" runat="server" Text="0" Visible="false" /></td>
             <td><asp:Label ID="TimeS" runat="server" Text=""></asp:Label></td>
             <td><asp:Label ID="errort" runat="server" Text=""></asp:Label> </td>
         </tr>
           <tr>
               <td>
                   <h3>Shadow</h3>
               </td>
               <td>
                   <asp:CheckBox ID="CheckBox4" runat="server" />

               <td class="auto-style1"><asp:TextBox ID="shadow" runat="server" Text="0" Visible="false" /></td>
               <td><asp:Label ID="ShadowS" runat="server" Text=""></asp:Label></td>
               <td><asp:Label ID="errors" runat="server" Text=""></asp:Label></td>
           </tr>
           <tr>
               <td><h3>Sigil Slots available</h3></td>
               <td><asp:TextBox ID="NumSS" runat="server" Text="0" Visible="false" Width="55px" >0</asp:TextBox>
               </td>
               <td class="auto-style1"><asp:Label ID="errorsigil" runat="server" Text=""></asp:Label></td>
               
           </tr>
           <tr>
               <td><asp:Button ID="Calc" runat="server" Text="Calculate" Visible="false" OnClick="Calc_Click" /></td>
           </tr>
         
         <asp:Button ID="Selection" runat="server" Text="confirm selections" OnClick="Button1_Click" />
         
        
       </table>
        
      
        
        
        
       
        
        
      
        
        
        
        

        
        
        
        
        
        

    </div>
    </form>
</body>
</html>
