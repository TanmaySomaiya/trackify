using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace finance_tracker
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                 
                BindTransactionsGrid();
                BindChart();

            
        }

        private void BindChart()
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Fetch data from the database
                string query = "SELECT Date, SUM(Amount) AS TotalAmount FROM ExpenseTble GROUP BY Date";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Clear existing series
                        Chart1.Series.Clear();

                        // Add a new series to the chart
                        Series series = new Series("Total Amount");
                        series.ChartType = SeriesChartType.Line;

                        // Add data points to the series
                        while (reader.Read())
                        {
                            string date = reader["Date"].ToString();
                            decimal totalAmount = Convert.ToDecimal(reader["TotalAmount"]);

                            series.Points.AddXY(date, totalAmount);
                        }

                        // Add the series to the chart
                        Chart1.Series.Add(series);
                    }
                }
            }
        }




        private void BindTransactionsGrid()
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT ExpenseID, ExpenseDescription, PaymentMode, Amount, Category, Date FROM ExpenseTble";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    gvTransactions.DataSource = dataTable;
                    gvTransactions.DataBind();
                }
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO ExpenseTble (ExpenseID, ExpenseDescription, PaymentMode, Amount, Category, Date) " +
                               "VALUES (@ExpenseID, @ExpenseDescription, @PaymentMode, @Amount, @Category, @Date)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ExpenseID", txtExpenseId.Text);
                    command.Parameters.AddWithValue("@ExpenseDescription", txtExpenseDescription.Text);
                    command.Parameters.AddWithValue("@PaymentMode", ddlPaymentMode.SelectedValue);
                    command.Parameters.AddWithValue("@Amount", Convert.ToDecimal(txtAmount.Text));
                    command.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                    command.Parameters.AddWithValue("@Date", date.Text.Trim());

                    command.ExecuteNonQuery();
                }
            }

            BindTransactionsGrid();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "UPDATE ExpenseTble SET " +
                               "ExpenseDescription = @ExpenseDescription, " +
                               "PaymentMode = @PaymentMode, " +
                               "Amount = @Amount, " +
                               "Category = @Category " +
                               "WHERE ExpenseID = @ExpenseID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ExpenseID", txtExpenseId.Text);
                    command.Parameters.AddWithValue("@ExpenseDescription", txtExpenseDescription.Text);
                    command.Parameters.AddWithValue("@PaymentMode", ddlPaymentMode.SelectedValue);
                    command.Parameters.AddWithValue("@Amount", Convert.ToDecimal(txtAmount.Text));
                    command.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                    command.ExecuteNonQuery();
                }
            }

            BindTransactionsGrid();

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=TANMAYPC\\SQLEXPRESS;Initial Catalog=finance_tracker;Integrated Security=True;TrustServerCertificate=True";;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "DELETE FROM ExpenseTble WHERE ExpenseID = @ExpenseID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ExpenseID", txtExpenseId.Text);

                    command.ExecuteNonQuery();
                }
            }

            BindTransactionsGrid();
        }
    }
}
