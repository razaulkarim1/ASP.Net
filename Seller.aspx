<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Seller.aspx.cs" Inherits="ASP.NET_Project.Seller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap-datepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-4">
                <h2 class="mt-4 mb-3">Add New Seller</h2>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-info btn-sm mb-2" href="Show_Seller.aspx">Show Seller</a>&nbsp;<a class="btn btn-info btn-sm mb-2" href="Designation.aspx">Designation</a>
                </div>
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="sellerId" DataSourceID="dsSellerEntry" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting">
                    <Fields>
                        <asp:BoundField DataField="sellerId" HeaderText="sellerId" InsertVisible="False" ReadOnly="True" SortExpression="sellerId" />
                        <asp:TemplateField HeaderText="Seller Name" SortExpression="sellerName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("sellerName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtSellerName" CssClass="form-control" runat="server" Text='<%# Bind("sellerName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Seller Name is required!!" ControlToValidate="txtSellerName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("sellerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address" SortExpression="sellerAddress">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("sellerAddress") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAddressInsert" CssClass="form-control" runat="server" Text='<%# Bind("sellerAddress") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address is required!!" ControlToValidate="txtAddressInsert" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("sellerAddress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Of Birth" SortExpression="dob">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dob") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDateInsert" CssClass="form-control" runat="server" Text='<%# Bind("dob") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date of Birth is required!!" ControlToValidate="txtDateInsert" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;<%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Type must be date format!!!" ControlToValidate="txtDateInsert" ForeColor="Red" Type="Date"></asp:RangeValidator>--%>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dob") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Designation" SortExpression="desigId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("desigId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlDesignation" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("desigId") %>' DataTextField="desigName" CssClass="form-control" DataValueField="id" runat="server" AppendDataBoundItems="true"><asp:ListItem Value="0" Text="--Please Select--" Selected="True"></asp:ListItem></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must choose a designation!!" ControlToValidate="ddlDesignation" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" SelectCommand="SELECT * FROM [Designation]"></asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("desigId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile" SortExpression="sellMobile">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("sellMobile") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertMobile" CssClass="form-control" runat="server" Text='<%# Bind("sellMobile") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mobile number is required!!" ControlToValidate="txtInsertMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("sellMobile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="sellEmail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("sellEmail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtInsertEmail" CssClass="form-control" runat="server" Text='<%# Bind("sellEmail") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email is required!!" ControlToValidate="txtInsertEmail" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please type email in correct format!!" ControlToValidate="txtInsertEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("sellEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Picture" SortExpression="sellPicture">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sellPicture") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:FileUpload ID="fuPicture" runat="server" />
                                <asp:HiddenField ID="HiddenField1" Value='<%# Bind("sellPicture") %>' runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please upload a picture!!!!" ControlToValidate="fuPicture" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("sellPicture") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="btnInsert" CssClass="btn btn-info" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="btnCancel" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsSellerEntry" runat="server" ConnectionString="<%$ ConnectionStrings:ElectricsDBCon %>" DeleteCommand="DELETE FROM [Seller] WHERE [sellerId] = @sellerId" InsertCommand="INSERT INTO [Seller] ([sellerName], [sellerAddress], [dob], [desigId], [sellMobile], [sellEmail], [sellPicture]) VALUES (@sellerName, @sellerAddress, @dob, @desigId, @sellMobile, @sellEmail, @sellPicture)" SelectCommand="SELECT * FROM [Seller]" UpdateCommand="UPDATE [Seller] SET [sellerName] = @sellerName, [sellerAddress] = @sellerAddress, [dob] = @dob, [desigId] = @desigId, [sellMobile] = @sellMobile, [sellEmail] = @sellEmail, [sellPicture] = @sellPicture WHERE [sellerId] = @sellerId">
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
            $("input[name$='txtDateInsert']").datepicker({format: "yyyy-MM-dd"});
        });
    </script>
</asp:Content>
