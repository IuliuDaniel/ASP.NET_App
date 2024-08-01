<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="WebApplication1.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('imgview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-5 mb-3">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>Book inventory details</h4>
                        </div>   
                        
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img id="imgview" src="book_inventory/books1.png" width="100px" />
                        </div>
                    </div>


                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>

                    <!-- First row, file uploading here -->
                    <div class="row">
                        <div class="col mb-3">
                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" onchange="readURL(this);" />
                        </div>
                    </div>

                    <!-- Second row -->
                    <div class="row">
                        <div class="col-md-3 mb-5">
                            <label>Book ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Book ID" runat="server"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" Text="Search" OnClick="LinkButton4_Click"><i class ="fas fa-check-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <label for="TextBox2">Book Name</label>
                            <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="The name should appear here..." runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <!-- Third row -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>Language</label>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                    <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                    <asp:ListItem Text="Romanian" Value="Romanian"></asp:ListItem>
                                    <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                    <asp:ListItem Text="Russian" Value="Russian"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Author Name</label>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownList3" runat="server" class="form-control">
                                    <asp:ListItem Text="A1" Value="A1"></asp:ListItem>
                                    <asp:ListItem Text="A2" Value="A2"></asp:ListItem>
                                    <asp:ListItem Text="A3" Value="A3"></asp:ListItem>
                                    <asp:ListItem Text="A4" Value="A4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Genre</label>
                            <div class="form-group">
                                <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" class="form-control" Rows="2">
                                    <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                    <asp:ListItem Text="Comic Book" Value="Comic Book"></asp:ListItem>
                                    <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem>
                                    <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                    <asp:ListItem Text="Healthy Living" Value="Healthy Living"></asp:ListItem>
                                    <asp:ListItem Text="Wellness" Value="Wellness"></asp:ListItem>
                                    <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                    <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                    <asp:ListItem Text="Poetry" Value="Poetry"></asp:ListItem>
                                    <asp:ListItem Text="Personal Development" Value="Personal Development"></asp:ListItem>
                                    <asp:ListItem Text="Romance" Value="Romance"></asp:ListItem>
                                    <asp:ListItem Text="Science Fiction" Value="Science Fiction"></asp:ListItem>
                                    <asp:ListItem Text="Suspense" Value="Suspense"></asp:ListItem>
                                    <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                    <asp:ListItem Text="Art" Value="Art"></asp:ListItem>
                                    <asp:ListItem Text="Autobiography" Value="Autobiography"></asp:ListItem>
                                    <asp:ListItem Text="Encyclopedia" Value="Encyclopedia"></asp:ListItem>
                                </asp:ListBox>
                            </div>
                        </div>
                    </div>



                    <!-- Fourth row -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>Publisher name</label>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                    <asp:ListItem Text="P1" Value="P1"></asp:ListItem>
                                    <asp:ListItem Text="P2" Value="P2"></asp:ListItem>
                                    <asp:ListItem Text="P3" Value="P3"></asp:ListItem>
                                    <asp:ListItem Text="P4" Value="P4"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Published Date</label>
                            <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" placeholder="Member's City" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                        </div> 
                    </div>


                    <!-- Fifth row -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>Edition</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Price per unit</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Nr. of pages</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        </div>

                    <!-- Sixth row -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>Actual stock</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Current stock</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Nr. of borrowed books</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        </div>

                    <!-- Seventh row, has a large texbox -->

                    <div class="row">
                        <div class="col mb-5">
                            <label>Book description</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox10" placeholder="A nice description of that book should appear here..." TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        </div>


                    <!-- Buttons start here -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn btn-primary btn-lg" OnClick="Button2_Click" />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-success btn-lg" OnClick="Button1_Click" />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button3" runat="server" Text="Delete" CssClass="btn btn-danger btn-lg" OnClick="Button3_Click" />
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
                            <h4>Book inventory</h4>
                        </div>    
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]">

                        </asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-dark table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                        <div class ="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">

                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("book_name") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12">

                                                            Author -
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                            &nbsp;| Genre -
                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                            &nbsp;| Language -
                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>

                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-12">

                                                            Publisher -
                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                            &nbsp;| Date of publishing -
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publisher_date") %>'></asp:Label>
                                                            &nbsp;| Pages -<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                            &nbsp;| Edition -
                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12">

                                                            Cost -
                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                            &nbsp;| Actual stock -
                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                            &nbsp;| Available -
                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12">

                                                            Description -
                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>'></asp:Label>

                                                        </div>
                                                    </div>



                                                </div>

                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                </div>
                                            </div>
                                        </div>
                                            </ItemTemplate>
                                    </asp:TemplateField>
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
