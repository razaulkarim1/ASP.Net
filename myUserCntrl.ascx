<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="myUserCntrl.ascx.cs" Inherits="ASP.NET_Project.myUserCntrl" %>
<nav class="navbar navbar-dark font-weight-bold h6 navbar-expand-md bg-info border-bottom fixed-top">
    <div class="container-fluid">
        <a href="Default.aspx">
            <asp:Image ID="Image1" Width="50px" Height="50px" ImageUrl="~/Images/logo.png" runat="server" CssClass="rounded-circle" /></a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navBar" aria-controls="navBar" aria-expanded="false" aira-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navBar">
            <ul class="nav navbar-nav ml-4">
                <li class="nav-item">
                    <a class="nav-link active" href="Default.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Seller.aspx">Seller</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Buyer.aspx">Buyer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Order.aspx">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Order_Report.aspx">Report</a>
                </li>
            </ul>
            <ul class="nav navbar-nav ml-auto">
                <%
                    if (Request.IsAuthenticated)
                    {
                %>
                <li class="navbar-text"><%=Page.User.Identity.Name %></li>
                <li class="nav-item">
                    <asp:LinkButton ID="signout" runat="server" CssClass="nav-link">Log out</asp:LinkButton>
                </li>
                <%
                    }
                    else
                    {
                %>
                <li class="nav-item"><a href="register.aspx" class="nav-link">Sign Up</a></li>
                <li class="nav-item"><a href="Login.aspx" class="nav-link">Log In</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
