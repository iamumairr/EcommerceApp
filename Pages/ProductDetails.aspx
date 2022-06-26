<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ECommerceApp.Pages.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row d-flex align-items-center justify-content-center">
        <div class="col-md-6 shadow p-2">
        <h3 class="text-warning text-center">Product Details</h3>
            <hr />
            .<table class="table table-bordered table-hover table-striped">
                <tr>
                    <th>Name</th>
                    <td>
                        <asp:Label runat="server" ID="txtName"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <th>Category</th>
                    <td>
                        <asp:Label runat="server" ID="txtCategory"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Price</th>
                    <td>
                        <asp:Label runat="server" ID="txtPrice"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Quantity</th>
                    <td>
                        <asp:Label runat="server" ID="txtQuantity"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>
                        <asp:Label runat="server" ID="txtDescription"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Image</th>
                    <td>
                        <asp:Literal runat="server" ID="literal"></asp:Literal>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
