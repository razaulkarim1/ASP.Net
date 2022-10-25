<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ASP.NET_Project.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Show Order Details</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="Order.aspx">Add New</a>
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="buyerId,serviceId,sellerId" DataSourceID="dsShowOrderDetails">
                    <Columns>
                        <asp:BoundField DataField="orderId" HeaderText="Order Id" InsertVisible="False" ReadOnly="True" SortExpression="orderId" />
                        <asp:BoundField DataField="orderName" HeaderText="Order Name" SortExpression="orderName" />
                        <asp:TemplateField HeaderText="Buyer" SortExpression="buyerId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlBuyer" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("buyerId") %>' DataTextField="buyerName" DataValueField="buyerId" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT [buyerId], [buyerName] FROM [Buyer]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("buyerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service" SortExpression="serviceId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlService" DataSourceID="SqlDataSource2" SelectedValue='<%# Bind("serviceId") %>' DataTextField="serviceName" DataValueField="id" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT [id], [serviceName] FROM [Services]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("serviceName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seller" SortExpression="sellerId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSeller" DataSourceID="SqlDataSource3" SelectedValue='<%# Bind("sellerId") %>' DataTextField="sellerName" DataValueField="sellerId" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT [sellerId], [sellerName] FROM [Seller]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("sellerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                        <asp:TemplateField HeaderText="Action" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" CssClass="btn btn-primary btn-sm" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnCancelUpdate" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-info btn-sm" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnDelet" CssClass="btn btn-danger btn-sm" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsShowOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [MakeOrder] WHERE [buyerId] = @buyerId AND [serviceId] = @serviceId AND [sellerId] = @sellerId" InsertCommand="INSERT INTO [MakeOrder] ([orderName], [buyerId], [serviceId], [sellerId], [price], [isActive]) VALUES (@orderName, @buyerId, @serviceId, @sellerId, @price, @isActive)" SelectCommand="SELECT o.*,b.buyerName,s.serviceName,sl.sellerName FROM MakeOrder o INNER JOIN Buyer b ON o.buyerId=b.buyerId INNER JOIN Services s ON o.serviceId=s.id INNER JOIN Seller sl ON o.sellerId=sl.sellerId" UpdateCommand="UPDATE [MakeOrder] SET [orderId] = @orderId, [orderName] = @orderName, [price] = @price, [isActive] = @isActive WHERE [buyerId] = @buyerId AND [serviceId] = @serviceId AND [sellerId] = @sellerId">
                    <DeleteParameters>
                        <asp:Parameter Name="buyerId" Type="Int32" />
                        <asp:Parameter Name="serviceId" Type="Int32" />
                        <asp:Parameter Name="sellerId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="orderName" Type="String" />
                        <asp:Parameter Name="buyerId" Type="Int32" />
                        <asp:Parameter Name="serviceId" Type="Int32" />
                        <asp:Parameter Name="sellerId" Type="Int32" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="isActive" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="orderId" Type="Int32" />
                        <asp:Parameter Name="orderName" Type="String" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="isActive" Type="Boolean" />
                        <asp:Parameter Name="buyerId" Type="Int32" />
                        <asp:Parameter Name="serviceId" Type="Int32" />
                        <asp:Parameter Name="sellerId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
