<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ECommerceApp.Pages.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-12 shadow p-3">
            <h3 class="text-center text-warning">Shopping Cart</h3>
            <hr />
            <asp:GridView runat="server" ID="Gridview" AllowSorting="True" CssClass="table table-bordered table-striped table-hover table-sm" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="Shopping cart is empty." DataKeyNames="Id" OnRowEditing="Gridview_RowEditing" OnRowDeleting="Gridview_RowDeleting" OnRowCancelingEdit="Gridview_RowCancelingEdit" OnRowUpdating="Gridview_RowUpdating">
                <Columns>

                    <asp:TemplateField HeaderText="Id" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Product.Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="15%">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuantityEdit" TextMode="Number" min="1" runat="server" Text='<%# Bind("Quantity") %>' Width="100px" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Unit Price" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sub Total" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("SubTotal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="25%">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-outline-primary"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-outline-secondary"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-outline-warning"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-sm btn-outline-danger"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br />
            <div class="float-start">
                <asp:HyperLink runat="server" NavigateUrl="~/Pages/Products.aspx" Text="Explore more products" CssClass="btn btn-outline-info"></asp:HyperLink>
            </div>
            <div class="float-end">
                <b>Total Amount:</b>
                <asp:Label ID="txtTotal" runat="server"></asp:Label>
                <br />
               <hr />

                <asp:Button runat="server" ID="btnChekout" Text="Check Out" OnClick="btnChekout_Click" CssClass="btn btn-warning text-white"></asp:Button>
                <br />
                <asp:Label runat="server" ID="txtMessage" CssClass="text-success"></asp:Label>
            </div>
            
        </div>
    </div>
</asp:Content>
