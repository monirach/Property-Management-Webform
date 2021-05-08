<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add-tenant.aspx.cs" Inherits="DataCommunicationsSP21Final.add_tenant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <h2>Input Tenant Information</h2>

    <asp:Label ID ="lblName" runat="server" Text="Household Last Name:" AssociatedControlID="txtName"></asp:Label>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID ="lblPhone" runat="server" Text="Phone Number:" AssociatedControlID="txtPhone"></asp:Label>
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID ="lblLease" runat="server" Text="Lease Term Months:" AssociatedControlID="txtLease"></asp:Label>
    <asp:TextBox ID="txtLease" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="lblProperty" runat="server" Text="What Property Does the Tenant Occupy?" AssociatedControlID="ddlProperty"></asp:Label>
    <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>" 
        SelectCommand="SELECT [Address] FROM [Property]"></asp:SqlDataSource>
    
    <asp:DropDownList ID="ddlProperty" runat="server" 
        DataSourceID="SqlDataSource1"  
        DataValueField="PropertyId" AppendDataBoundItems="True" DataTextField="Address">
   <asp:ListItem text="Select One" Value="" />
</asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>" 
        SelectCommand="SELECT [PropertyId], [Address] FROM [Property]"></asp:SqlDataSource>

    <br />

   
    
    <asp:Literal ID="lblOut" runat="server"></asp:Literal>
    
   

    <br />
    <asp:Button ID="btnGo" runat="server" Text="Submit" OnClick="btnGo_Click" />


     <br />
    <asp:SqlDataSource runat="server" id="sdsTenant" 
        ConnectionString="<%$ ConnectionStrings:ConDBStr %>"
        SelectCommand="SELECT * FROM [Tenant]"></asp:SqlDataSource>
    <asp:GridView runat="server" id="gvTenant" AutoGenerateColumns="True" DataSourceID="sdsTenant">
      </asp:GridView>
     
    </asp:Content>
