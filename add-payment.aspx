<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add-payment.aspx.cs" Inherits="DataCommunicationsSP21Final.add_payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />


    <h2>Input Pay Information</h2> 
        
     <asp:Label ID="lblPay" runat="server" Text="Did The Tenant Pay Rent This Month:"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlTenant" runat="server" DataSourceID="sdsTenant" DataTextField="Name" 
        DataValueField="FK_PropertyId">
<asp:ListItem text="Select One" Value="" />
    </asp:DropDownList>
    <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>"
        SelectCommand="SELECT [FK_PropertyId], [Name] FROM [Tenant]"></asp:SqlDataSource>
   
    
    <br /><br />
        <asp:DropDownList ID="ddlPay" runat="server">
        <asp:ListItem Text="Select One-" Value="" />
        <asp:ListItem Text="Yes" Value="Yes" />
        <asp:ListItem Text="No" Value="No" />
    </asp:DropDownList>
   <br />
   
   <br />
    <asp:Literal ID="lblOut" runat="server"></asp:Literal>
    <asp:Button ID="BtnGo" runat="server" Text="Submit" OnClick="BtnGo_Click" />
    
    <br />
    <asp:SqlDataSource ID="sdsPay" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConDBStr %>" 
        SelectCommand="SELECT Payment.PayId, Payment.PayMade, Tenant.Name, Payment.FK_PropertyId FROM Payment INNER JOIN Property ON Payment.FK_PropertyId = Property.PropertyId INNER JOIN Tenant ON Property.PropertyId = Tenant.FK_PropertyId"></asp:SqlDataSource>
    <asp:GridView ID="gvPay" runat="server" DataSourceID="sdsPay" AutoGenerateColumns="False" DataKeyNames="PayId">
    </asp:GridView>
</asp:Content>
