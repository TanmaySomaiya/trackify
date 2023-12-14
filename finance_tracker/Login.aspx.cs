using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Security;
using System.Web.UI;

namespace finance_tracker
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (IsValidUser(username, password))
            {
                
                Response.Redirect("Dashboard.aspx");
                
            }
            else
            {
                // Display an error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "loginErrorAlert", "alert('Invalid username or password. Please try again.');", true);
            }
        }

        private bool IsValidUser(string username, string password)
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM LoginTbl WHERE Username = @Username AND Password = @Password";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);

                        int count = (int)command.ExecuteScalar();

                        if (count > 0)
                        {
                            // Display a successful login message
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "loginSuccessful", "alert('Login Successful');", true);
                        }

                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (log it, display an error message, etc.)
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }


    }
    }

