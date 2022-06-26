<%@ Page Title="Register" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ECommerceApp.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <div class="row m-2 d-flex align-align-items-center justify-content-center">
            <div class="col-md-6 border p-3 shadow">
                <h3 class="text-center text-warning">Register</h3>
                <hr />

                <div class="mb-2">
                    <label class="form-label">Name</label>
                    <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="txtEmailValidate" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:CustomValidator runat="server" Display="Dynamic" OnServerValidate="customValidate_ServerValidate" ID="customValidate" CssClass="text-danger"></asp:CustomValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Password</label>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-2">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox runat="server" ID="txtPassword2" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword2" Display="Dynamic" ErrorMessage="Confirm password is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ControlToCompare="txtPassword" Display="Dynamic" ControlToValidate="txtPassword2"></asp:CompareValidator>
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address is required." CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="mb-1 float-end">
                    <asp:Button runat="server" ID="SubmitBtn" Text="Register" OnClick="SubmitBtn_Click" CssClass="btn btn-primary" />
                    <a runat="server" class="btn btn-warning btn-sm" href="~/Account/Login.aspx">Login</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
