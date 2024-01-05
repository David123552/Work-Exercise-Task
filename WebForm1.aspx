<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MyWebApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:TextBox ID="postcodebox" runat="server"></asp:TextBox>
<asp:Button ID="postcodebutton" runat="server" onclick="postcodebutton_Click" Text="Submit"></asp:Button>
<asp:DropDownList ID="ddlOptions" runat="server"></asp:DropDownList>
<asp:Button ID="filltextboxes" runat="server" OnClick="filltextbutton_Click" Text="Find"></asp:button>
<asp:TextBox ID="AddressBoxTest" runat="server"></asp:TextBox>
<asp:TextBox ID="IDTextBox" runat="server"></asp:TextBox>
</asp:Content>
