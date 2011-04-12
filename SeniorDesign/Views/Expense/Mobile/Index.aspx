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
                Name
            </th>
            <th>
                Amount($)
            </th>
            <th>
                Description
            </th>
            <th>
                Date Entered
            </th>
            <th>
                Date Finalized
            </th>
            <th>
                Date Of Expense
            </th>
            <th>
                GroupID
            </th>
            <th>
                Status
            </th>
            <th>
                UserID
            </th>
            <th>
                UsesASEPSA
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
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Amount)) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <% String[] s = String.Format("{0:g}", item.DateEntered).Split(' ');
                   if (s.Length == 3)
                   {%>
                <%= Html.Encode(s[0])%>
                <br />
                <%= Html.Encode(s[1])%>
                <%= Html.Encode(s[2])%>
                <% }%>
            </td>
            <td>
                <%  s = String.Format("{0:g}", item.DateFinalized).Split(' ');
                    if (s.Length == 3)
                   {%>
                <%= Html.Encode(s[0]) %>
                <br />
                <%= Html.Encode(s[1]) %>
                <%= Html.Encode(s[2]) %>
                <% }%>
            </td>
            <td>
                <%  s = String.Format("{0:g}", item.DateOfExpense).Split(' ');
                    if (s.Length == 3)
                   {%>
                <%= Html.Encode(s[0]) %>
                <br />
                <%= Html.Encode(s[1]) %>
                <%= Html.Encode(s[2]) %>
                <% }%>
            </td>
            <td>
                <%= Html.Encode(item.GroupID) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
            <td>
                <%= Html.Encode(item.UserID) %>
            </td>
            <td>
                <%= Html.Encode(item.UsesASEPSA) %>
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

