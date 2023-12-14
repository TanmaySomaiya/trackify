<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="finance_tracker.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .signup-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: left; /* Align the text to the left */
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="signup-container">
        <label for="txtUsername">Username:</label>
        <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter your username" required></asp:TextBox>

        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Enter your email" required></asp:TextBox>

        <label for="txtPassword">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password" required></asp:TextBox>

        <label for="txtConfirmPassword">Confirm Password:</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password" required></asp:TextBox>

        <label for="txtDOB">Date of Birth:</label>
        <asp:TextBox ID="txtDOB" runat="server" type="date" placeholder="Enter your date of birth" required></asp:TextBox>

        <label for="txtAddress">Address:</label>
        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" placeholder="Enter your address" required></asp:TextBox>

        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" Style="background-color: #4caf50; color: #fff; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; display: block; margin: 0 auto;" />
        <asp:SqlDataSource runat="server"></asp:SqlDataSource>


    </div>
</asp:Content>
