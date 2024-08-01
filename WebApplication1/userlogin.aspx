<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="WebApplication1.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Log in pannel is in this container -->
<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img src="images/generaluser.png" width="150px" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col text-center">
                            <h3>Customer log-in panel</h3>
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
                            <label for="TextBox1">Member ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Member ID" runat="server"></asp:TextBox>
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
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <a href ="usersignup.aspx">
                                    <input class="btn btn-info btn-block" id="Button2" type="button" value="Sign Up" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <a href="homepage.aspx" style="font-weight: bold;" >Back to main page</a>
        </div>
        
    </div> 
</div>


</asp:Content>
