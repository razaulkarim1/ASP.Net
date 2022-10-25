<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show_Service.aspx.cs" Inherits="ASP.NET_Project.Show_Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Service List</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="Service.aspx">Add New</a>
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsShowService">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="serviceName" HeaderText="Service Name" SortExpression="serviceName" />
                        <asp:BoundField DataField="decription" HeaderText="Description" SortExpression="decription" />
                        <asp:TemplateField HeaderText="Service Picture" SortExpression="servicePicture">
                            <EditItemTemplate>
                                <asp:FileUpload ID="fuPicture" runat="server" />
                                <asp:HiddenField ID="HiddenField1" Value='<%# Bind("servicePicture","~/Images/{0}") %>' runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# Eval("servicePicture","~/Images/{0}") %>' Width="50px" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Action Link">
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" CssClass="btn btn-primary btn-sm" CausesValidation="True" CommandName="Update" Text="Update"><span class="fa fa-pencil"></span></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnCancelUpdate" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><span class="fa fa-ban"></span></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-info btn-sm" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><span class="fa fa-edit"></span></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm" CausesValidation="False" CommandName="Delete" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsShowService" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [Services] WHERE [id] = @id" InsertCommand="INSERT INTO [Services] ([serviceName], [decription], [servicePicture]) VALUES (@serviceName, @decription, @servicePicture)" SelectCommand="SELECT * FROM [Services]" UpdateCommand="UPDATE [Services] SET [serviceName] = @serviceName, [decription] = @decription, [servicePicture] = @servicePicture WHERE [id] = @id">
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
