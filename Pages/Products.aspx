<%@ Page Title="All Products" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ECommerceApp.Pages.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12 my-4">
        <div class="row shadow p-2">
            <h3 class="text-center text-warning">All Products</h3>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-3">
                        <label>Category</label>
                    </div>
                    <div class="col-6">
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" CssClass="form-select" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">

                        </asp:DropDownList>
                    </div>
                    <div class="col"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-md-6">
                        <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search by Name"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-secondary" Text="Search" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>
            <br />

            <br />

            <asp:DataList runat="server" ID="dataList" RepeatColumns="4" RepeatDirection="Horizontal">

                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server" Width="150px" Height="100px" BorderWidth="1px" ImageUrl='<%# "~/Content/Images/" + Eval("ProductImage") %>' />
                    <br />
                    <b>Category: </b>
                    <asp:Label ID="lblCategory" runat="server" CssClass="fw-bolder text-danger" Text='<%# Eval("Category.Name") %>'></asp:Label>
                    <br />
                    <b>Name: </b>
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    <br />
                    <b>Price:</b>
                    <asp:Label Style="text-align: justify" ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label><br />
                    <b>Quantity: </b>
                    <asp:Label ID="lblQuantity" runat="server" Text=' <%# Eval("QuantityAvailable") %>'></asp:Label>
                    <br />
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/Pages/ProductDetails.aspx?Id=" + Eval("Id") %>' CssClass="btn btn-outline-info btn-sm my-1">
                        Details
                    </asp:HyperLink>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/Pages/AddToCart.aspx?Id=" + Eval("Id") %>' CssClass="btn btn-outline-success btn-sm my-1">
                        Add To Cart
                    </asp:HyperLink>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
