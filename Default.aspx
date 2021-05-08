<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DataCommunicationsSP21Final.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Home</h1>

    


    <h2>How Many Properties Are There in Total?</h2>
    <asp:SqlDataSource ID="sdsTotal" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>" 
        SelectCommand="SELECT COUNT (*) AS Total FROM [Property]"></asp:SqlDataSource>
    <asp:GridView ID="gvTotal" runat="server" DataSourceID="sdsTotal"></asp:GridView>

    <h2>What Are the Top 5 Most Expensive Properties?</h2>
    <asp:SqlDataSource ID="sdsExpensive" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>"
        SelectCommand="SELECT TOP (5) Address, Rent FROM Property ORDER BY Rent DESC"></asp:SqlDataSource>
    <asp:GridView ID="gvExpensive" runat="server" DataSourceID="sdsExpensive"></asp:GridView>
   
    <h2>How Many Tenants Have Paid Rent This Month?</h2>
    <asp:SqlDataSource ID="sdsPaid" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>" 
        SelectCommand="SELECT Tenant.Name, Payment.PayMade, Payment.PayId FROM Payment CROSS JOIN Tenant ORDER BY Tenant.Name DESC"></asp:SqlDataSource>
    <asp:GridView ID="gvPaid" runat="server" DataSourceID="sdsPaid"></asp:GridView>

</asp:Content>
