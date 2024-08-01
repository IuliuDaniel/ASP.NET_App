using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        //Add button
        protected void Button2_Click(object sender, EventArgs e)
        {   
            if(checkAuthor())
            {
                Response.Write("<script>alert('Author already exists!!!');</script>");
            }
            else
            {
                AddNewAuthor();
            }
        }

        //Update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkAuthor())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }


        //Delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkAuthor())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }


        //Find button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetAuthorById();
        }


        //Custom methods

        bool checkAuthor()
        {
                //Create a new object for the connection
                SqlConnection con = new SqlConnection(strcon);

                //If the connection is closed, open it
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                return false;
        }

        void AddNewAuthor()
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

                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id, author_name)" +
                    "values(@author_id, @author_name)", con);

                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added succesfully');</script>");
                GridView1.DataBind();
                //Response.Redirect("adminauthormanagement.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateAuthor()
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

                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name WHERE author_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author updates succesfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        
            void DeleteAuthor()
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

                    SqlCommand cmd = new SqlCommand("DELETE from author_master_tbl WHERE author_id='" + TextBox1.Text.Trim() + "'", con);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Author DELETED succesfully');</script>");
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

        void GetAuthorById()
        {
            //Create a new object for the connection
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "';", con);
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