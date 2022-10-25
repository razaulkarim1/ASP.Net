<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show_Seller.aspx.cs" Inherits="ASP.NET_Project.Show_Seller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap-datepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Seller List</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="Seller.aspx">Add New</a>
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="sellerId" DataSourceID="dsShowSeller" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="sellerId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="sellerId" />
                        <asp:BoundField DataField="sellerName" HeaderText="Name" SortExpression="sellerName" />
                        <asp:BoundField DataField="sellerAddress" HeaderText="Address" SortExpression="sellerAddress" />
                        <asp:TemplateField HeaderText="Date of Birth" SortExpression="dob">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDateEdit" runat="server" Text='<%# Bind("dob","{0:yyyy-mm-dd}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dob","{0:yyyy-mm-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Designation" SortExpression="desigId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDesignation" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("desigId") %>' DataTextField="desigName" CssClass="form-control" DataValueField="id" runat="server"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT * FROM [Designation]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("desigName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="sellMobile" HeaderText="Mobile" SortExpression="sellMobile" />
                        <asp:BoundField DataField="sellEmail" HeaderText="Email" SortExpression="sellEmail" />
                        <asp:TemplateField HeaderText="Picture" SortExpression="sellPicture">
                            <EditItemTemplate>
                                <asp:FileUpload ID="fuPicture" runat="server" />
                                <asp:HiddenField ID="HiddenField1" Value='<%# Bind("sellPicture") %>' runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# Eval("sellPicture","~/Images/{0}") %>' Width="50px" Height="40px" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" CssClass="btn btn-primary btn-sm" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><span class="fa fa-pencil"></span></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnCancelUpdate" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><span class="fa fa-ban"></span></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-info btn-sm" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><span class="fa fa-edit"></span></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnDelete" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsShowSeller" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [Seller] WHERE [sellerId] = @sellerId" InsertCommand="INSERT INTO [Seller] ([sellerName], [sellerAddress], [dob], [desigId], [sellMobile], [sellEmail], [sellPicture]) VALUES (@sellerName, @sellerAddress, @dob, @desigId, @sellMobile, @sellEmail, @sellPicture)" SelectCommand="SELECT s.*,d.desigName FROM Seller s INNER JOIN Designation d ON s.desigId=d.id" UpdateCommand="UPDATE [Seller] SET [sellerName] = @sellerName, [sellerAddress] = @sellerAddress, [dob] = @dob, [desigId] = @desigId, [sellMobile] = @sellMobile, [sellEmail] = @sellEmail, [sellPicture] = @sellPicture WHERE [sellerId] = @sellerId">
                    <DeleteParameters>
                        <asp:Parameter Name="sellerId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="sellerName" Type="String" />
                        <asp:Parameter Name="sellerAddress" Type="String" />
                        <asp:Parameter DbType="Date" Name="dob" />
                        <asp:Parameter Name="desigId" Type="Int32" />
                        <asp:Parameter Name="sellMobile" Type="String" />
                        <asp:Parameter Name="sellEmail" Type="String" />
                        <asp:Parameter Name="sellPicture" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sellerName" Type="String" />
                        <asp:Parameter Name="sellerAddress" Type="String" />
                        <asp:Parameter DbType="Date" Name="dob" />
                        <asp:Parameter Name="desigId" Type="Int32" />
                        <asp:Parameter Name="sellMobile" Type="String" />
                        <asp:Parameter Name="sellEmail" Type="String" />
                        <asp:Parameter Name="sellPicture" Type="String" />
                        <asp:Parameter Name="sellerId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="Scripts/jquery-3.6.0.js"></script>
    <script src="Scripts/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input[name$='txtDateEdit']").datepicker({ format: "yyyy-mm-dd" });
        });
    </script>
</asp:Content>
