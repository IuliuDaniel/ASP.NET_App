<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApplication1.userprofile" %>
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
                            <img src="images/generaluser.png" width="100px" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>Your profile</h4>
                            <span>Account Status - </span>
                            <asp:Label ID="Label1" runat="server" Text="Your Status"></asp:Label>
                            
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
                            <label>Full Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Full Name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="TextBox2">Date of Birth</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="Password" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- Second row -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Phone number</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" placeholder="Phone number" TextMode="Phone" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>E-mail</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" placeholder="Please enter a valid E-mail address" TextMode="Email" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- Third row. Has 3 fields -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>County</label>
                            <div class="form-group">
                                <!-- Drop down list items, hardcoded -> Should upgrade it to something fancy -->
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Choose an option..."></asp:ListItem>
                                    <asp:ListItem Text="Alba" Value="Alba"></asp:ListItem>
                                    <asp:ListItem Text="Arad" Value="Arad"></asp:ListItem>
                                    <asp:ListItem Text="Arges" Value="Arges"></asp:ListItem>
                                    <asp:ListItem Text="Bacau" Value="Bacau"></asp:ListItem>
                                    <asp:ListItem Text="Bihor" Value="Bihor"></asp:ListItem>
                                    <asp:ListItem Text="Bistrita-Nasaud" Value="Bistrita-Nasaud"></asp:ListItem>
                                    <asp:ListItem Text="Botosani" Value="Botosani"></asp:ListItem>
                                    <asp:ListItem Text="Brasov" Value="Brasov" ></asp:ListItem>
                                    <asp:ListItem Text="Braila" Value="Braila"></asp:ListItem>
                                    <asp:ListItem Text="Bucharest" Value="Bucharest"></asp:ListItem>
                                    <asp:ListItem Text="Buzau" Value="Buzau"></asp:ListItem>
                                    <asp:ListItem Text="Caras-Severin" Value="Caras-Severin"></asp:ListItem>
                                    <asp:ListItem Text="Calarasi" Value="Calarasi"></asp:ListItem>
                                    <asp:ListItem Text="Cluj" Value="Cluj"></asp:ListItem>
                                    <asp:ListItem Text="Constanta" Value="Constanta"></asp:ListItem>
                                    <asp:ListItem Text="Covasna" Value="Covasna"></asp:ListItem>
                                    <asp:ListItem Text="Dambovita" Value="Dambovita"></asp:ListItem>
                                    <asp:ListItem Text="Dolj" Value="Dolj"></asp:ListItem>
                                    <asp:ListItem Text="Galati" Value="Galati"></asp:ListItem>
                                    <asp:ListItem Text="Giurgiu" Value="Giurgiu"></asp:ListItem>
                                    <asp:ListItem Text="Gorj" Value="Gorj"></asp:ListItem>
                                    <asp:ListItem Text="Harghita" Value="Harghita"></asp:ListItem>
                                    <asp:ListItem Text="Hunedoara" Value="Hunedoara"></asp:ListItem>
                                    <asp:ListItem Text="Ialomita" Value="Ialomita"></asp:ListItem>
                                    <asp:ListItem Text="Iasi" Value="Iasi"></asp:ListItem>
                                    <asp:ListItem Text="Ilfov" Value="Ilfov"></asp:ListItem>
                                    <asp:ListItem Text="Maramures" Value="Maramures"></asp:ListItem>
                                    <asp:ListItem Text="Mehedinti" Value="Mehedinti"></asp:ListItem>
                                    <asp:ListItem Text="Mures" Value="Mures"></asp:ListItem>
                                    <asp:ListItem Text="Neamt" Value="Neamt"></asp:ListItem>
                                    <asp:ListItem Text="Olt" Value="Olt"></asp:ListItem>
                                    <asp:ListItem Text="Prahova" Value="Prahova"></asp:ListItem>
                                    <asp:ListItem Text="Satu Mare" Value="Satu Mare"></asp:ListItem>
                                    <asp:ListItem Text="Salaj" Value="Salaj"></asp:ListItem>
                                    <asp:ListItem Text="Sibiu" Value="Sibiu"></asp:ListItem>
                                    <asp:ListItem Text="Suceava" Value="Suceava"></asp:ListItem>
                                    <asp:ListItem Text="Teleorman" Value="Teleorman"></asp:ListItem>
                                    <asp:ListItem Text="Timis" Value="timis"></asp:ListItem>
                                    <asp:ListItem Text="Tulcea" Value="Tulcea"></asp:ListItem>
                                    <asp:ListItem Text="Vaslui" Value="Vaslui"></asp:ListItem>
                                    <asp:ListItem Text="Valcea" Value="Valcea"></asp:ListItem>
                                    <asp:ListItem Text="Vrancea" Value="Vrancea"></asp:ListItem>

                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>City</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox6" placeholder="City" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>ZIP Code</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" placeholder="ZIP Code" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <!-- Fourth row, has a multiline text box -->
                    <div class="row">
                        <div class="col mb-5">
                            <label>Full Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" placeholder="Address" TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col mb-3">
                                <center>
                                <span class="badge text-bg-success">Login credentials</span>
                                    </center>
                            </div>
                        </div>

                        <!-- Fifth row, has username and password - readonly and another password field for update purposes -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>Username</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" placeholder="Username" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">Password</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" placeholder="Password" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="TextBox2">New password</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox10" placeholder="New password" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>



                    <!-- Update button -->
                    <div class="row">
                        <div class="col-md-12">
                            <center>
                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="Button1_Click" />
                            </div>
                                </center>
                        </div>
                    </div>
                </div>
            </div> 
            <a href="homepage.aspx" style="font-weight: bold;">Back to main page</a>
        </div>

            <!-- FIrst card ends here ! ! ! -->
    </div> 

        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col text-center">
                            <img src="images/books1.png" width="100px" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col text-center">
                            <h4>Your library</h4>
                            <asp:Label ID="Label2" runat="server" Text="Information about your libraries"></asp:Label>  
                        </div>    
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <hr/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:GridView class="table table-dark table-bordered" ID="GridView1" runat="server">

                            </asp:GridView>
                        </div>
                    </div>

            </div> 

</div>
    </div>
        </div>
    </div>


</asp:Content>
