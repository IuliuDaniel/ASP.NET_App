<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="WebApplication1.adminbookissuing" %>
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
                            <h4>Borrowed - Returned Books</h4>
                        </div>   
                        
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img src="images/books.png" width="100px" />
                        </div>
                    </div>


                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>


                    <!-- Here start the fields, the rows below have 2 fields each -> Easy to copy paste -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Member ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Enter the member's ID" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="TextBox2">Book ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="Enter the book's ID" runat="server"></asp:TextBox>
                                    <asp:Button CssClass="btn btn-secondary" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Second row, has readonly fields -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Member Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" placeholder="The member's name should appear here" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="TextBox2">Book name</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" placeholder="The book's name should appear here" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>



                    <!-- Third row -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Borrow date</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" placeholder="The member's name should appear here" runat="server" TextMode="Date" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="TextBox2">Due to return date</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" placeholder="The book's name should appear here" runat="server" TextMode="Date" ></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <!-- Buttons start here -->
                    <div class="row">
                        <div class="col-6 mb-3">
                            <asp:Button ID="Button2" runat="server" Text="Issue" CssClass="btn btn-primary btn-lg" OnClick="Button2_Click" />
                        </div>

                        <div class="col-6">
                            <asp:Button ID="Button3" runat="server" Text="Return" CssClass="btn btn-success btn-lg" OnClick="Button3_Click" />
                        </div>
                    </div>

            <a href="homepage.aspx" style="font-weight: bold;">Back to main page</a>
            </div> 
        </div>
    </div> 


        <!-- FIrst card ends here ! ! ! -->
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>Member's borrowed books information</h4>
                        </div>    
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:elibraryDBConnectionString %>' SelectCommand="SELECT * FROM [book_issue_tbl]">

                        </asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-dark table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                                <Columns>
                                    <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id"></asp:BoundField>
                                    <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name"></asp:BoundField>
                                    <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id"></asp:BoundField>
                                    <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name"></asp:BoundField>
                                    <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date"></asp:BoundField>
                                    <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date"></asp:BoundField>
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
