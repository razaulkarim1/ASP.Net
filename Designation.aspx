<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="ASP.NET_Project.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Add New Designation</h2>
                <div class="d-flex">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </div>
                <div class="d-flex justify-content-end">
                    <a class="font-weight-bold mb-2" href="Designation_list.aspx">Designation List</a>
                </div>
                <asp:FormView ID="FormView1" DefaultMode="Insert" CssClass="table table-bordered" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource1">
                    <ItemTemplate>
                        <tr>
                            <th>Id</th>
                            <td><%# Eval("id") %></td>
                        </tr>
                        <tr>
                            <th>Designation</th>
                            <td><%# Eval("desigName") %></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnNew" CssClass="btn btn-info" CommandName="New" runat="server">Add New</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <tr>

                        </tr>
                        <tr>
                            <th>Designation</th>
                            <td>
                            <asp:TextBox ID="txtInsertDesignation" runat="server" CssClass="form-control" Text='<%# Bind("desigName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsertDesignation" ErrorMessage="Designation name is required!!" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Name must be at least 4 chars!!" ControlToValidate="txtInsertDesignation" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnDesigInsert" runat="server" CssClass="btn btn-info btn-sm" CommandName="Insert">Save</asp:LinkButton>
                                <asp:LinkButton ID="btnCancelDesig" runat="server" CssClass="btn btn-danger btn-sm" CommandName="Cancel">Cancel</asp:LinkButton>
                            </td>
                        </tr>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ASP.NET_Project.Models.Designation" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Get" TypeName="ASP.NET_Project.DAL.DesignationGetWay" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
 