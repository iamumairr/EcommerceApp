<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ECommerceApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-12 shadow p-2">
            <h3 class="text-warning text-center">
                Welcome to our online store
            </h3>
            <hr />
            <p>
                We provide quality and affordable products with complete easness. Want to check out our products, please visit:
            </p>
            <a runat="server" class="btn btn-outline-primary" href="~/Pages/Products.aspx">All Products</a>
        </div>
    </div>

</asp:Content>
