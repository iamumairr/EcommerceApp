<%@ Page Title="Add Category" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="OnlineShop.Pages.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="col-md-12">
        <div class="row m-2 d-flex align-align-items-center justify-content-center">
            <div class="col-md-6 border p-3 shadow">
            <h3 class="text-center text-warning">Add Category</h3>
                <hr />
                <div class="mb-2">
                    <label class="form-label">Name</label>
                    <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-2">
                    <label class="form-label">Description</label>
                    <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="Description is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
               
                <div class="my-1 float-end">
                    <asp:Button runat="server" ID="SubmitBtn" Text="Add" OnClick="SubmitBtn_Click" CssClass="btn btn-primary"/>
                    <a runat="server" Class="btn btn-warning btn-sm" href="~/Pages/Categories.aspx">All Categories</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
