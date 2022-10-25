<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ASP.NET_Project.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row py-3">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Image ID="Image1" Width="150px" ImageUrl="~/Images/user_login.png" runat="server" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="display-4">Registration</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label1" CssClass="col-form-label col-4 h5 font-weight-bold" AssociatedControlID="txtUsername" runat="server" Text="Username"></asp:Label>
                                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="Username field is required!!" CssClass="invalid-feedback text-danger" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label2" CssClass="col-form-label col-4 h5 font-weight-bold" AssociatedControlID="txtPassword" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ErrorMessage="Password field is required!!" CssClass="invalid-feedback text-danger" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:Label ID="Label3" CssClass="col-form-label col-4 h5 font-weight-bold" AssociatedControlID="txtConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="Password don't match!!" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                    <div class="offset-2">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" />
                    </div>
                </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
