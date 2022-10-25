<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Designation_list.aspx.cs" Inherits="ASP.NET_Project.Designation_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h2>Designation List</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="Designation.aspx">Add New</a>
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsDesignation">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="desigName" HeaderText="desigName" SortExpression="desigName" />
                        <asp:TemplateField ShowHeader="true" HeaderText="Action">
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" CssClass="btn btn-info btn-sm" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnCancelUpdate" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsDesignation" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [Designation] WHERE [id] = @id" InsertCommand="INSERT INTO [Designation] ([desigName]) VALUES (@desigName)" SelectCommand="SELECT * FROM [Designation]" UpdateCommand="UPDATE [Designation] SET [desigName] = @desigName WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="desigName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="desigName" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
