<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ASP.NET_Project.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Place an Order</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="OrderDetails.aspx">Order Details</a>&nbsp;<a class="btn btn-info btn-sm mb-2" href="Show_Service.aspx">Show Service</a>
                </div>
                <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered" runat="server" Height="50px" AutoGenerateRows="False" DataKeyNames="buyerId,serviceId,sellerId" DataSourceID="dsEntryOrder" DefaultMode="Insert">
                    <Fields>
                        <asp:BoundField DataField="orderId" HeaderText="Order Id" InsertVisible="False" ReadOnly="True" SortExpression="orderId" />
                        <asp:TemplateField HeaderText="Order Name" SortExpression="orderName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("orderName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Order name is required!!" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("orderName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer" SortExpression="buyerId">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("buyerId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlBuyer" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("buyerId") %>' DataTextField="buyerName" DataValueField="buyerId" CssClass="form-control" runat="server" AppendDataBoundItems="true"><asp:ListItem Value="0" Text="--Please Select--" Selected="True"></asp:ListItem></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select a buyer!!" ControlToValidate="ddlBuyer" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT [buyerId], [buyerName] FROM [Buyer]"></asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("buyerId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service" SortExpression="serviceId">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("serviceId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlService" DataSourceID="SqlDataSource2" SelectedValue='<%# Bind("serviceId") %>' DataTextField="serviceName" DataValueField="id" CssClass="form-control" runat="server" AppendDataBoundItems="true"><asp:ListItem Value="0" Text="--Please Select--" Selected="True"></asp:ListItem></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select a service!!" ControlToValidate="ddlService" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT [id], [serviceName] FROM [Services]"></asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("serviceId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seller" SortExpression="sellerId">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("sellerId") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlSeller" DataSourceID="SqlDataSource3" SelectedValue='<%# Bind("sellerId") %>' DataTextField="sellerName" DataValueField="sellerId" CssClass="form-control" runat="server" AppendDataBoundItems="true"><asp:ListItem Value="0" Text="--Please Select--" Selected="True"></asp:ListItem></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select a seller!!" ControlToValidate="ddlSeller" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT [sellerId], [sellerName] FROM [Seller]"></asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("sellerId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price" SortExpression="price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Price is required!!" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="btnInsert" runat="server" CausesValidation="True" CssClass="btn btn-info btn-sm" CommandName="Insert" Text="Insert"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn btn-danger btn-sm" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnNew" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsEntryOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [MakeOrder] WHERE [buyerId] = @buyerId AND [serviceId] = @serviceId AND [sellerId] = @sellerId" InsertCommand="INSERT INTO [MakeOrder] ([orderName], [buyerId], [serviceId], [sellerId], [price], [isActive]) VALUES (@orderName, @buyerId, @serviceId, @sellerId, @price, @isActive)" SelectCommand="SELECT * FROM [MakeOrder]" UpdateCommand="UPDATE [MakeOrder] SET [orderId] = @orderId, [orderName] = @orderName, [price] = @price, [isActive] = @isActive WHERE [buyerId] = @buyerId AND [serviceId] = @serviceId AND [sellerId] = @sellerId">
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
