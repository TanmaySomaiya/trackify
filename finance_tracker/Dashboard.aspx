<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="finance_tracker.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <meta chTransactions">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Dashboard</title>
   
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    nav {
        background-color: #333;
        overflow: hidden;
    }

    nav a {
        float: left;
        display: block;
        color: white;
        text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

nav a:hover {
    background-color: #ddd;
    color: black;
}

.tab-content {
    padding: 16px;
    display: flex; 
 }


#transaction-content {
    display: block; /* Show transaction tab content by default */
}

    label {
        display: block;
        margin-bottom: 8px;
    }

    input, select {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        box-sizing: border-box;
    }

    .form-control {
        margin-bottom: 16px;
    }

    .transaction-grid {
        margin-top: 16px;
    }

        

</style>
<head>    
</head>
<body>

    <nav>
        <a href="#" onclick="openTab('transaction')">Transaction</a>
        <a href="#" onclick="openTab('categories')">Categories</a>
        <a href="#" onclick="openTab('charts')">Charts</a>
    </nav>

    <div class="tab-content" id="transaction-content">
        <!-- Transaction tab content goes here -->
        <div id="transaction-form">
        <div>
            <h2>Transaction Details</h2>
            <div>
                <label for="txtExpenseId">Expense ID:</label>
                <asp:TextBox ID="txtExpenseId" runat="server" TextMode="Number" CssClass="form-control" Required="true"></asp:TextBox>

                <label for="txtExpenseDescription">Expense Description:</label>
                <asp:TextBox ID="txtExpenseDescription" runat="server" TextMode="MultiLine" CssClass="form-control" Required="true"></asp:TextBox>

                <label for="ddlPaymentMode">Payment Mode:</label>
                <asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-control" Required="true">
                    <asp:ListItem Text="UPI" Value="upi" />
                    <asp:ListItem Text="Offline" Value="offline" />
                </asp:DropDownList>

                <label for="txtAmount">Amount:</label>
                <asp:TextBox ID="txtAmount" runat="server" TextMode="Number" CssClass="form-control" Required="true"></asp:TextBox>

                <label for="ddlCategory">Category:</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" Required="true">
                    <asp:ListItem Text="Gas" Value="gas" />
                    <asp:ListItem Text="Electricity" Value="electricity" />
                    <asp:ListItem Text="Grocery" Value ="grocery" />
                    <asp:ListItem Text="Recreation" Value ="recreation" />
                    <asp:ListItem Text="Academic" Value ="academic" />

                </asp:DropDownList>

                <label for="date">Date:</label>
                <asp:TextBox ID="date" runat="server" TextMode="Date" CssClass="form-control" Required="true" ></asp:TextBox>
                
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" AutoPostBack="true" Style="background-color: #4caf50; color: #fff; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; display: block; margin: 0 auto;"/> <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" AutoPostBack="true" Style="background-color: #4caf50; color: #fff; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; display: block; margin: 0 auto;"/> <br />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" AutoPostBack="true" Style="background-color: #4caf50; color: #fff; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; display: block; margin: 0 auto;"/> <br />

                <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="False" CssClass="transaction-grid" GridLines="Both">
        <Columns>
        <asp:BoundField DataField="ExpenseID" HeaderText="Expense ID" SortExpression="ExpenseID" />
        <asp:BoundField DataField="ExpenseDescription" HeaderText="Expense Description" SortExpression="ExpenseDescription" />
        <asp:BoundField DataField="PaymentMode" HeaderText="Payment Mode" SortExpression="PaymentMode" />
        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
    </Columns>
</asp:GridView>

            </div>
        </div>
    </div>

    <div class="tab-content" id="categories-content">
        <asp:Chart id="Chart1" runat="server">
            <Series>
                <asp:Series Name="Series1"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>

        <asp:GridView ID="GridView2" runat="server"></asp:GridView>
    </div>

    <script>
        function openTab(tabName) {
            console.log('openTab executed for ' + tabName);
            var i;
            var tabContents = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = "none";
            }
            document.getElementById(tabName + "-content").style.display = "flex";
        }

    </script>
</body>
</asp:Content>

