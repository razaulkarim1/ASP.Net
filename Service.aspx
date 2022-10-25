<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="ASP.NET_Project.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Add New Service</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="Show_Service.aspx">Show Service</a>
                </div>
                <asp:FormView ID="FormView1" DefaultMode="Insert" CssClass="table table-bordered" runat="server" DataKeyNames="id" DataSourceID="dsServiceEntry" OnItemInserting="FormView1_ItemInserting">
                    <ItemTemplate>
                        <tr>
                            <th>Id</th>
                            <td><%# Eval("id") %></td>
                        </tr>
                        <tr>
                            <th>Service Name</th>
                            <td><%# Eval("serviceName") %></td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td><%# Eval("decription") %></td>
                        </tr>
                        <tr>
                            <th>Picture</th>
                            <td><%# Eval("servicePicture") %></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnAddNew" runat="server" CssClass="btn btn-info btn-sm" CommandName="New">Add New</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <tr>

                        </tr>
                        <tr>
                            <th>Service Name</th>
                            <td>
                                <asp:TextBox ID="txtInsertServiceName" CssClass="form-control" runat="server" Text='<%# Bind("serviceName") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td>
                                <asp:TextBox ID="txtInsertDescription" CssClass="form-control" runat="server" Text='<%# Bind("decription") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>Picture</th>
                            <td>
                                <asp:FileUpload ID="fuPicture" runat="server" />
                                <asp:HiddenField ID="HiddenField1" Value='<%# Bind("servicePicture","~/Images/{0}") %>' runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnServiceInsert" runat="server" CssClass="btn btn-info btn-sm" CommandName="Insert">Save</asp:LinkButton>
                                <asp:LinkButton ID="btnCancelInsert" runat="server" CssClass="btn btn-danger btn-sm" CommandName="Cancel">Cancel</asp:LinkButton>
                            </td>
                        </tr>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="dsServiceEntry" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [Services] WHERE [id] = @id" InsertCommand="INSERT INTO [Services] ([serviceName], [decription], [servicePicture]) VALUES (@serviceName, @decription, @servicePicture)" SelectCommand="SELECT * FROM [Services]" UpdateCommand="UPDATE [Services] SET [serviceName] = @serviceName, [decription] = @decription, [servicePicture] = @servicePicture WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="serviceName" Type="String" />
                        <asp:Parameter Name="decription" Type="String" />
                        <asp:Parameter Name="servicePicture" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="serviceName" Type="String" />
                        <asp:Parameter Name="decription" Type="String" />
                        <asp:Parameter Name="servicePicture" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
