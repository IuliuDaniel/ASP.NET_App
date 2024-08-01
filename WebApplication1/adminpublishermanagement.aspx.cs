using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Add
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkPublisher())
            {
                Response.Write("<script>alert('Author already exists!!!');</script>");
            }
            else
            {
                AddNewPublisher();
            }
        }

        //Update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkPublisher())
            {
                UpdatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }

        //Delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkPublisher())
            {
                DeletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }

        //Find
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetPublisherById();
        }


        bool checkPublisher()
        {
            //Create a new object for the connection
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + TextBox1.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            return false;
        }

        void AddNewPublisher()
        {
            try
            {
                //Create a new object for the connection
                SqlConnection con = new SqlConnection(strcon);

                //If the connection is closed, open it
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl(publisher_id, publisher_name)" +
                    "values(@publisher_id, @publisher_name)", con);

                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher added succesfully');</script>");
                GridView1.DataBind();
                //Response.Redirect("adminauthormanagement.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdatePublisher()
        {
            try
            {
                //Create a new object for the connection
                SqlConnection con = new SqlConnection(strcon);

                //If the connection is closed, open it
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@publisher_name WHERE publisher_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher updates succesfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeletePublisher()
        {
            try
            {
                //Create a new object for the connection
                SqlConnection con = new SqlConnection(strcon);

                //If the connection is closed, open it
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from publisher_master_tbl WHERE publisher_id='" + TextBox1.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher DELETED succesfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void GetPublisherById()
        {
            //Create a new object for the connection
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + TextBox1.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count >= 1)
            {
                TextBox2.Text = dt.Rows[0][1].ToString();
            }
            else
            {
                TextBox2.Text = "NOTHING FOUND";
            }
        }
    }
}