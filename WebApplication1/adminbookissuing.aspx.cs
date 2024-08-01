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
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //Search button
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetNames();
        }


        //Issue button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkBook() && checkMember())
            {
                if(checkIssueEntry())
                {
                    Response.Write("<script>alert('This member already has this book!');</script>");
                }
                else
                {
                    issueBook();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong member ID or book ID');</script>");
            }
        }


        //Return button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkBook() && checkMember())
            {
                if (checkIssueEntry())
                {
                    returnBook();
                }
                else
                {
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong member ID or book ID');</script>");
            }
        }


        void returnBook()
        {
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("DELETE from book_issue_tbl WHERE book_id='" + TextBox2.Text.Trim() + "' AND member_id='" + TextBox1.Text.Trim() + "'", con);
            int result = cmd.ExecuteNonQuery();
            if(result > 0)
            {
                if(con.State ==ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand("update book_master_tbl SET current_stock = current_stock + 1 WHERE book_id='" + TextBox2.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Returned!');</script>");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Invalid Details');</script>");
            }
        }

        void issueBook()
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

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl(member_id, member_name, book_id, book_name, issue_date, due_date)" +
                    "values(@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);

                cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock - 1 WHERE book_id='" + TextBox2.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Issued!');</script>");
                GridView1.DataBind();
                //Response.Redirect("adminauthormanagement.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        bool checkBook()
        {
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl where book_id='" + TextBox2.Text.Trim() + "' AND current_stock > 0;", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            return false;
        }


        bool checkMember()
        {
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT full_name from member_master_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            return false;
        }

        bool checkIssueEntry()
        {
            SqlConnection con = new SqlConnection(strcon);

            //If the connection is closed, open it
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id='" + TextBox1.Text.Trim() + "' AND book_id='" + TextBox2.Text.Trim() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            return false;
        }




        void GetNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                //If the connection is closed, open it
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl where book_id='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong book ID');</script>");
                }
                cmd = new SqlCommand("SELECT full_name FROM member_master_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong member ID');</script>");
                }



            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        /*  in DEV, make the entry red if due date is past!
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if(today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        */
    }
}