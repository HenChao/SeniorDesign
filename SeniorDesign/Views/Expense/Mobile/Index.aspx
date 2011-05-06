<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ExpenceInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Expenses
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Expenses</h2>

    <% foreach (var item in Model) { %>
    <div data-role="collapsible" data-collapsed="true">
        <h3><%= Html.Encode(item.ID) %>: <%= Html.Encode(item.Name) %> - $<%= Html.Encode(String.Format("{0:F}", item.Amount)) %></h3>
        <table>
        <tr>
            <th>
                ID
            </th>
            <th></th>
            <th>
                Details
            </th>
        </tr>
    
        <tr>
            <td style="font-size:large; text-align:center;">
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <div data-role="button" data-inline="true"><%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %></div><br />
                <div data-role="button" data-inline="true"><%= Html.ActionLink("Details", "Details", new { id = item.ID /* id=item.PrimaryKey */ })%></div><br />
                <div data-role="button" data-inline="true"><%= Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%></p></div>
            </td>
            <td>
                <b>Name:</b> <%= Html.Encode(item.Name) %><br />
                <b>Amount:</b> <%= Html.Encode(String.Format("{0:F}", item.Amount)) %><br />
                <b>Description:</b> <%= Html.Encode(item.Description) %><br />
                <b>Date Entered:</b> <%= Html.Encode(item.DateEntered)%><br />
                <b>Date Finalized:</b> <%= Html.Encode(item.DateFinalized)%><br />
                <b>Date of Expense:</b> <%= Html.Encode(item.DateOfExpense)%><br />
                <b>GroupID:</b> <%= Html.Encode(item.GroupID) %><br />
                <b>Status:</b> <%= Html.Encode(item.Status) %><br />
                <b>UserID:</b> <%= Html.Encode(item.UserID) %><br />
                <b>UsesASEPSA?:</b> <%= Html.Encode(item.UsesASEPSA) %><br />
            </td>
        </tr>
    </table>
    </div>
    <% } %>

    

    <div data-role="button">
        <%= Html.ActionLink("Create New", "Create") %>
    </div>

    <div data-role="button">
        <%= Html.ActionLink("Back to Transactions", "Index", "TransactionWindow") %>
    </div>

</asp:Content>

