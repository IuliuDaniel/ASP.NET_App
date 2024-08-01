 <%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication1.adminlogin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img src="images/adminuser.png" width="150px" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col text-center">
                            <h3>Administrator log-in panel</h3>
                        </div>    
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>
                    <!-- Image and text end here, below are the textboxes -->
                    <div class="row mb-3">
                        <div class="col">
                            <!-- form-group --- predefined class in bootstrap -->
                            <label for="TextBox1">Admin ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Admin ID" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="TextBox2">Password</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!-- Log in and Signup buttons -->
                    <div class="row mb-3">
                        <div class="col">
                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <a href="homepage.aspx" style="font-weight: bold;">Back to main page</a>
        </div>
        
    </div> 
</div>
</asp:Content>
