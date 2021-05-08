<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add-property.aspx.cs" Inherits="DataCommunicationsSP21Final.add_property" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <h2>Input Property Information</h2>

    <asp:Label ID="lblAddress" runat="server" Text="Property Address:" AssociatedControlID="txtAddress"></asp:Label>
    <asp:TextBox ID ="txtAddress" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblRent" runat="server" Text="What is the Monthly Rent?" AssociatedControlID="txtRent"></asp:Label>
      <asp:TextBox ID="txtRent" runat="server"></asp:TextBox>

    <br />

    <asp:Button ID="BtnGo" runat="server" Text="Submit" OnClick="BtnGo_Click" />

    <br />

    <asp:SqlDataSource ID="sdsCombo" runat="server" ConnectionString="<%$ ConnectionStrings:ConDBStr %>"
        SelectCommand="SELECT * FROM [Property]"></asp:SqlDataSource>
    <asp:GridView ID="gvCombo" runat="server" AutoGenerateColumns="False" DataKeyNames="PropertyId" DataSourceID="sdsCombo">
        <Columns>
            <asp:BoundField DataField="PropertyId" HeaderText="PropertyId" InsertVisible="False" ReadOnly="True" SortExpression="PropertyId" />
            <asp:BoundField DataField="Rent" HeaderText="Rent" SortExpression="Rent" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        </Columns>
     </asp:GridView>

       <br />
    

    <asp:Literal ID="lblOut" runat="server"></asp:Literal>

    <br />



</asp:Content>
