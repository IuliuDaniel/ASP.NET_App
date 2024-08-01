using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Hide the buttons if the user is logged in

            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true; //user login link button
                    LinkButton2.Visible = true; //user signup link button
                    LinkButton6.Visible = true; //Admit login link button

                    LinkButton3.Visible = false; //Logout button
                    LinkButton5.Visible = false; //Hello user button

                    //Admin buttons
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    //Admin buttons
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    LinkButton6.Visible = false;

                    LinkButton1.Visible = false; //user login link button
                    LinkButton2.Visible = false; //user signup link button

                    LinkButton3.Visible = true; //Logout button
                    LinkButton5.Visible = true; //Hello user button
                    LinkButton5.Text = "Hello, " + Session["username"].ToString();
                }
                else if (Session["role"].Equals("admin"))
                {
                    //Admin buttons
                    LinkButton11.Visible = true;
                    LinkButton12.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                    LinkButton6.Visible = false;

                    LinkButton1.Visible = false; //user login link button
                    LinkButton2.Visible = false; //user signup link button

                    LinkButton3.Visible = true; //Logout button
                    LinkButton5.Visible = true; //Hello user button
                    LinkButton5.Text = "Hello Admin!";
                }

            }
            catch(Exception ex)
            {

            }
        }

        //Administrator log-in 
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }


        //Author management
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }


        //Publisher management
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }


        //Book inventory
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        //Book issuing
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        //Library members management
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }


        //View Books
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        //User login
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        //Sign up
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        //Logout
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; //user login link button
            LinkButton2.Visible = true; //user signup link button
            LinkButton6.Visible = true; //Admit login link button

            LinkButton3.Visible = false; //Logout button
            LinkButton5.Visible = false; //Hello user button

            //Admin buttons
            LinkButton11.Visible = false;
            LinkButton12.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false;
            LinkButton10.Visible = false;

            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}