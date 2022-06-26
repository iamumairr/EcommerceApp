<%@ Page Title="All Categories" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ECommerceApp.Pages.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-12 shadow border">
            <h3 class="text-center text-warning">All Categories</h3>
            <hr />
            <asp:GridView runat="server" ID="Gridview" AllowSorting="True" CssClass="table table-borderless table-hover table-sm" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="No records found." DataKeyNames="Id" OnRowEditing="Gridview_RowEditing" OnRowDeleting="Gridview_RowDeleting" OnRowCancelingEdit="Gridview_RowCancelingEdit" OnRowUpdating="Gridview_RowUpdating">
                <Columns>

                    <asp:TemplateField HeaderText="Id" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="25%">
                         <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Description" ItemStyle-Width="25%">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="25%">
                        <EditItemTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-outline-info btn-sm"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary btn-sm"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-outline-primary btn-sm"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-outline-danger btn-sm"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
