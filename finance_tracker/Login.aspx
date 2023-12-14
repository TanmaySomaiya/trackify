<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="finance_tracker.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
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
    <div class="login-container">
        <label for="txtUsername">Username:</label>
        <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter your username" required></asp:TextBox>

        <label for="txtPassword">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password" required></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Style="background-color: #4caf50; color: #fff; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; display: block; margin: 0 auto;"/>
        <br /> <br />
        <label>Don't have an account? <a href="SignUp.aspx">Sign Up</a> here</label>
    </div>
</asp:Content>
