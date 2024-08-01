<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="WebApplication1.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <div class="row">
        <div class="col-md-5 mb-3">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>Author Details</h4>
                        </div>   
                        
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img src="images/writer.png" width="100px" />
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
                        <div class="col-md-4 mb-3">
                            <label>Author ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Author ID" runat="server"></asp:TextBox>
                                    <asp:Button CssClass="btn btn-secondary" ID="Button1" runat="server" Text="Find" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label for="TextBox2">Author NAME</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="Enter the author's name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-4 mb-3">
                            <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn btn-primary btn-lg" OnClick="Button2_Click" />
                        </div>

                        <div class="col-4">
                            <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-warning btn-lg" OnClick="Button3_Click" />
                        </div>

                        <div class="col-4">
                            <asp:Button ID="Button4" runat="server" Text="Delete" CssClass="btn btn-danger btn-lg" OnClick="Button4_Click" />
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
                            <h4>List of authors</h4>
                        </div>    
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [author_master_tbl]">

                        </asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-dark table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                    <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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
