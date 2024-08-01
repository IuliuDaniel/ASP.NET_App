using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherDDLs();
            }
            GridView1.DataBind();
        }

        //Add
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(AddNewBookCheck())
            {
                Response.Write("<script>alert('Book already exists!');</script>");
            }
            else
            {
                AddNewBook();
            }
        }


        //Update
        protected void Button1_Click(object sender, EventArgs e)
        {
            UpdateBook();
        }


        //Search
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GetBookById();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            DeleteBook();
        }


        void DeleteBook()
        {
            if (AddNewBookCheck())
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

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "'", con);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book DELETED succesfully');</script>");
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
        void fillAuthorPublisherDDLs()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt; //fill with author name
                DropDownList3.DataValueField  = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt; //fill with author name
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();


            }
            catch(Exception ex)
            {

            }
        }
        void UpdateBook()
        {
            if (AddNewBookCheck())
            {
                int actual_stock = Convert.ToInt32(TextBox7.Text.Trim());
                int current_stock = Convert.ToInt32(TextBox9.Text.Trim());

                if(global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if(actual_stock<global_issued_books)
                    {
                        Response.Write("<script>alert('Actual stock cannot be less than the issued books');</script>");
                       
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        TextBox9.Text = "" + current_stock;
                    }
                }

                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/book1";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name," +
                        "publisher_date=@publisher_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description," +
                        "actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                    //SqlDataReader dr = cmd.ExecuteReader();

                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_date", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book updated successfully');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid book ID');</script>");
            }
        }

        bool AddNewBookCheck()
        {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "' OR book_name='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    return true;
                }
                return false;
            }

        void GetBookById()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                TextBox6.Text = dt.Rows[0]["publisher_date"].ToString();
                TextBox4.Text = dt.Rows[0]["edition"].ToString();
                TextBox3.Text = dt.Rows[0]["book_cost"].ToString();
                TextBox5.Text = dt.Rows[0]["no_of_pages"].ToString();
                TextBox7.Text = dt.Rows[0]["actual_stock"].ToString();
                TextBox8.Text = dt.Rows[0]["current_stock"].ToString();
                TextBox9.Text = dt.Rows[0]["current_stock"].ToString();
                TextBox10.Text = dt.Rows[0]["book_description"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                ListBox1.ClearSelection();
                string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                for(int i = 0; i < genre.Length; i++)
                {
                    for(int j = 0; j < ListBox1.Items.Count; j++)
                    {
                        if (ListBox1.Items[j].ToString() == genre[i])
                        {
                            ListBox1.Items[j].Selected = true;
                        }
                    }
                }
                global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                global_issued_books = global_actual_stock - global_current_stock;
                global_filepath = dt.Rows[0]["book_img_link"].ToString();

            }
            else
            {
                Response.Write("<script>alert('This book ain't it chief');</script>");
            }
        }

        void AddNewBook()
        {
            string genres = "";
            foreach(var items in ListBox1.GetSelectedIndices())
            {
                genres = genres + ListBox1.Items[items] + ", ";
            }
            genres = genres.Remove(genres.Length - 2);

            string filepath = "~/book_inventory/books1.png";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
            filepath = "~/book_inventory/" + filename;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id, book_name, genre, author_name, publisher_name, publisher_date, language, edition, book_cost, " +
                    "no_of_pages, book_description, actual_stock, current_stock, book_img_link)" +
                    "values(@book_id, @book_name, @genre, @author_name, @publisher_name, @publisher_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);

                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@publisher_date", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@edition", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();            
                Response.Write("<script>alert('Book added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        }
   
    }