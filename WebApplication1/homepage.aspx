<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="images/home-bg.jpg" class="img-fluid" style="width:100%" />
    </section>


    <!-- First section -->
    <section>
        <div class="container">
            <!-- First row of the container -->
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Features</h2>
                    <p><b>We offer ease of use with our primary 3 out of many features:</b></p>
                    </center>
                </div>
            </div>

            <!-- Second row, contains images with descriptions-->
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img src="images/digital-inventory.png" width="150px" />
                        <h4>Digital book inventory</h4>
                        <p>Easily browse, search, and manage our extensive collection of books. With detailed book listings, availability status, and filtering options,
                            finding your next read has never been simpler. 
                            Stay organized and keep track of your borrowed books with our intuitive inventory system.</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="images/digital-data.png" width="150px"/>
                        <h4>Search Books</h4>
                        <p>Quickly find your next read with our powerful search functionality.
                            Filter by title, author, genre, or keywords to discover a vast selection of books in our library..</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="images/personalized.jpg" width="300px"/>
                        <h4>Personalized Recommendations</h4>
                        <p>Discover books tailored to your interests with our personalized recommendation engine. 
                            Based on your reading history and preferences, we suggest titles that match your taste, helping you find your next favorite book effortlessly.</p>
                    </center>
                </div>
            </div>

        </div>
    </section>

    <!-- Second section, second banner -->
    <section>
        <img src="images/in-homepage-banner.jpg" class="img-fluid" style="width:100%" />
    </section>



    <!-- Third section -->
    <section>
        <div class="container">
            <!-- First row of the container -->
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>How to get a book?</h2>
                    <p><b>Follow the steps below:</b></p>
                    </center>
                </div>
            </div>

            <!-- Second row, contains images with descriptions-->
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img src="images/sign-up.png" width="150px" />
                        <h4>First, Sign-Up</h4>
                        <p>After you become a member, getting your desired book is a straightforward process! And it's free</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="images/search-online.png" width="150px"/>
                        <h4>Find your book</h4>
                        <p>Find your book using the search feature, click a couple of buttons and you're set!</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="images/library.png" width="150px"/>
                        <h4>Visit us in person</h4>
                        <p>You can also get a book the old fashioned way, by visiting us and picking it up yourself.</p>
                    </center>
                </div>
            </div>

        </div>
    </section>

</asp:Content>
