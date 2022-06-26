<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ECommerceApp.Pages.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <div class="row m-2 d-flex align-align-items-center justify-content-center">
            <div class="col-md-6 border p-3 shadow">
                <h3 class="text-center text-warning">Add Product</h3>
                <hr />
                <div class="mb-2">
                    <label class="form-label">Name</label>
                    <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Category</label>
                    <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-select"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="Category is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Price</label>
                    <asp:TextBox runat="server" ID="txtPrice" TextMode="SingleLine" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Price is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Image</label>
                    <asp:FileUpload runat="server" ID="ImageUpload" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ImageUpload" Display="Dynamic" ErrorMessage="Image is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Quantity</label>
                    <asp:TextBox runat="server" ID="txtQuantity" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Price is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Description</label>
                    <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="Description is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="my-1 float-end">
                    <asp:Button runat="server" ID="SubmitBtn" Text="Add" OnClick="SubmitBtn_Click" CssClass="btn btn-primary" />
                    <a runat="server" class="btn btn-warning btn-sm" href="~/Pages/Products.aspx">Go to Products</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
