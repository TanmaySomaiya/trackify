using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace finance_tracker
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Get user input
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string dob = txtDOB.Text;
            string address = txtAddress.Text;

            // Validate password and confirmPassword
            if (password != confirmPassword)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "passwordMismatchAlert", "alert('Passwords do not match. Please try again.');", true);
                return;
            }
            if (!IsValidPassword(password))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidPasswordAlert", "alert('Invalid Password. Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one numeric digit.');", true);
                return;
            }

            if (!IsValidDOB(dob))
            {
                // Date of Birth is not valid, display an alert to the user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidDOBAlert", "alert('Invalid Date of Birth. You must be at least 18 years old.');", true);
                return;
            }

            if (IsUsernameExists(username))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "usernameExistsAlert", "alert('Username already exists. Please choose a different username.');", true);
                return;
            }


            // Save user information to the database
            SaveUserToDatabase(username, email, password, dob, address);

            // Optionally, you can redirect the user to a login page or any other page
            Response.Redirect("Login.aspx");
        }

        private bool IsUsernameExists(string username)
        {
            // Check if the username already exissts
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM LoginTbl WHERE Username = @Username";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }

        private bool IsValidPassword(string password)
        {
            // Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one numeric digit
            return password.Length >= 8 &&
                   password.Any(char.IsUpper) &&
                   password.Any(char.IsLower) &&
                   password.Any(char.IsDigit);
        }

        private bool IsValidDOB(string stringdob)
        {
            DateTime dob;
            if (DateTime.TryParse(stringdob, out dob))
            {
                // Check if the user is at least 18 years old
                return DateTime.Now.AddYears(-18) >= dob;
            }
            return false;
        }
        private void SaveUserToDatabase(string username, string email, string password, string dob, string address)
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO LoginTbl (Username, Email, Password, DOB, Address) VALUES (@Username, @Email, @Password, @DOB, @Address)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@DOB", dob);
                    command.Parameters.AddWithValue("@Address", address);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
