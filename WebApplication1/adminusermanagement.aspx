<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="WebApplication1.adminusermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid">
    <div class="row">
        <div class="col-md-5 mb-3">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>User's details:</h4>
                        </div>   
                        
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img src="images/generaluser.png" width="100px" />
                        </div>
                    </div>


                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>


                    <!-- Here start the fields -->
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label>Member ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Member ID" runat="server"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" Text="Search" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Full Name</label>
                            <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="The name should appear here..." runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label>Account status:</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" placeholder="Account status placeholder" runat="server" ReadOnly="true"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" Text="S" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server" Text="P" OnClick="LinkButton2_Click"><i class ="far fa-pause-circle"></i></asp:LinkButton>
                                    <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server" Text="D" OnClick="LinkButton3_Click"><i class ="fas fa-times-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Second row, has readonly fields -->
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label>Date of birth</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" placeholder="Date of birth" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Phone number</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" placeholder="Phone number" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <label for="TextBox2">E-mail</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" placeholder="Member's Email" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>



                    <!-- Third row, has readonly fields-->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>State</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" placeholder="Member's state" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">City</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" placeholder="Member's City" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div> 
                        <div class="col-md-4">
                            <label for="TextBox2">ZIP Code</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" placeholder="ZIP Code" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- Fourth row, has a large texbox -->

                    <div class="row">
                        <div class="col mb-5">
                            <label>Full Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox10" placeholder="Member's full address" TextMode="MultiLine" Rows="2" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        </div>


                    <!-- Buttons start here -->
                    <div class="row">
                        <div class="col mb-3">
                            <asp:Button ID="Button2" runat="server" Text="                                                                     DELETE USER PERMANENTLY                                                         " CssClass="btn btn-danger btn-lg" OnClick="Button2_Click" />
                        </div>

            <a href="homepage.aspx" style="font-weight: bold;">Back to main page</a>
            </div> 
        </div>
    </div> 
            </div>
                         <!-- First card ends here ! ! ! -->





        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>Member list</h4>
                        </div>    
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]">

                        </asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-dark table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                                    <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                    <asp:BoundField DataField="pincode" HeaderText="pincode" SortExpression="pincode" />
                                    <asp:BoundField DataField="full_address" HeaderText="full_address" SortExpression="full_address" />
                                    <asp:BoundField DataField="member_id" HeaderText="member_id" ReadOnly="True" SortExpression="member_id" />
                                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                    <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>

            </div> 

</div>
    </div>
        </div>
    </div>


</asp:Content>
