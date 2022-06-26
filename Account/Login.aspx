<%@ Page Title="Login" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerceApp.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <div class="row m-2 d-flex align-align-items-center justify-content-center">
            <div class="col-md-4 border p-3 shadow">
                <h3 class="text-center text-warning">Login</h3>
                <hr />
                <div class="mb-2">
                    <label class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="mb-2">
                    <label class="form-label">Password</label>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                    <span runat="server" id="errorMessage" class="text-danger"></span>
                </div>
                <div class="mb-1 float-end">
                    <asp:Button runat="server" ID="SubmitBtn" Text="Login" OnClick="SubmitBtn_Click" CssClass="btn btn-primary" />
                    <a runat="server" class="btn btn-warning btn-sm" href="~/Account/Register.aspx">Register</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
