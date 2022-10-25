<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Buyer.aspx.cs" Inherits="ASP.NET_Project.Buyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h2>Buyer</h2>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="dsBuyer" DataKeyNames="buyerId" ItemPlaceholderID="itemHolder" InsertItemPosition="LastItem">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("buyerId") %></td>
                            <td><%# Eval("buyerName") %></td>
                            <td><%# Eval("buyerAddress") %></td>
                            <td><%# Eval("buyerMobile") %></td>
                            <td><%# Eval("buyerEmail") %></td>
                            <td>
                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-info btn-sm" runat="server" CommandName="Edit"><span class="fa fa-pencil-square"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-danger btn-sm" runat="server" CommandName="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <tr>
                            <td>
                                Not Required
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuyerName" CssClass="form-control" runat="server" Text='<%# Bind("buyerName") %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuyerAddress" CssClass="form-control" runat="server" Text='<%# Bind("buyerAddress") %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuyerMobile" CssClass="form-control" runat="server" Text='<%# Bind("buyerMobile") %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuyerEmail" CssClass="form-control" runat="server" Text='<%# Bind("buyerEmail") %>'></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton ID="btnInsert" CssClass="btn btn-info btn-sm" runat="server" CommandName="Insert"><span class="fa fa-plus"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnCancelInsert" CssClass="btn btn-danger btn-sm" runat="server" CommandName="Cancel"><span class="fa fa-ban"></span></asp:LinkButton>
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblEditId" runat="server" Text='<%# Bind("buyerId") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="textEditBuyerName" Text='<%# Bind("buyerName") %>' runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditBuyerAddress" Text='<%# Bind("buyerAddress") %>' runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditBuyerMobile" Text='<%# Bind("buyerMobile") %>' runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditBuyerEmail" Text='<%# Bind("buyerEmail") %>' runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton ID="btnUpdate" CssClass="btn btn-info btn-sm" runat="server" CommandName="Update"><span class="fa fa-pencil"></span></asp:LinkButton>
                            <asp:LinkButton ID="btnCancelUpdate" CssClass="btn btn-danger btn-sm" runat="server" CommandName="Cancel"><span class="fa fa-ban"></span></asp:LinkButton>
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-bordered">
                            <tr>
                                <th>Buyer Id</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Mobile</th>
                                <th>Email</th>
                                <th>Action Link</th>
                            </tr>
                            <tbody runat="server" id="itemHolder"></tbody>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="dsBuyer" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [Buyer] WHERE [buyerId] = @buyerId" InsertCommand="INSERT INTO [Buyer] ([buyerName], [buyerAddress], [buyerMobile], [buyerEmail]) VALUES (@buyerName, @buyerAddress, @buyerMobile, @buyerEmail)" SelectCommand="SELECT * FROM [Buyer]" UpdateCommand="UPDATE [Buyer] SET [buyerName] = @buyerName, [buyerAddress] = @buyerAddress, [buyerMobile] = @buyerMobile, [buyerEmail] = @buyerEmail WHERE [buyerId] = @buyerId">
                    <DeleteParameters>
                        <asp:Parameter Name="buyerId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="buyerName" Type="String" />
                        <asp:Parameter Name="buyerAddress" Type="String" />
                        <asp:Parameter Name="buyerMobile" Type="String" />
                        <asp:Parameter Name="buyerEmail" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="buyerName" Type="String" />
                        <asp:Parameter Name="buyerAddress" Type="String" />
                        <asp:Parameter Name="buyerMobile" Type="String" />
                        <asp:Parameter Name="buyerEmail" Type="String" />
                        <asp:Parameter Name="buyerId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
