<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="finance_tracker.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance Tracker App Features</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #bfbdbd;
            margin: 0;
            padding: 0;
        }

        .banner img {
            height: 600px;
            width: 1475px;
            border-radius: 10px; /* Add a border-radius for a slight curve */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a box shadow */
            display: block; /* Make sure the image is a block element */
            margin: auto; /* Center the image */
        }

        .feature-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px;
        }

        .feature {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin: 10px;
            text-align: center;
            max-width: 300px;
            width: 100%;
            transition: transform 0.3s ease-in-out;
        }

        .feature:hover {
            transform: scale(1.05);
        }

        h2 {
            color: #333;
        }

        p {
            color: #666;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<body>
    <div class="banner">
        <img src="images/banner.jpg" />

    </div>

    <div class="feature-container">
        <!-- Budgeting Feature -->
        <div class="feature">
            <h2>Budgeting</h2>
            <p>Set and manage budgets for different categories (e.g., groceries, utilities, entertainment).</p>
            <p>Receive alerts or notifications when approaching or exceeding budget limits.</p>
        </div>

        <!-- Transaction Management Feature -->
        <div class="feature">
            <h2>Transaction Management</h2>
            <p>Ability to add, categorize, and track income and expenses.</p>
            <p>Support for manual entry or automatic import of transactions from bank accounts and credit cards.</p>
        </div>

        <!-- Reports and Analytics Feature -->
        <div class="feature">
            <h2>Reports and Analytics</h2>
            <p>Generate detailed reports and visualizations of spending patterns, income sources, and overall financial health.</p>
            <p>Offer insights and recommendations based on financial data.</p>
        </div>
    </div>

</body>
</html>
</asp:Content>
