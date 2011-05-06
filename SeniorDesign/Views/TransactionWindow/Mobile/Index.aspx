<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TransactionWindowInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Transactions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>All Transactions for Group: <%= Html.Encode(ViewData["Message"]) %></h2>

    <p>
        Listed below are the transactions for this group.
    </p>

    <table>
        <tr>
            <th>
                Transaction ID
            </th>
            <th>
                Name
            </th>
            <th>
                Start Date
            </th>
            <th>
                End Date
            </th>
            <th></th>
            <!--
            <th>
                IsClosed
            </th>
            <th>
                IsPrimary
            </th>
            -->
         </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td style="text-align: center; font-size:x-large;">
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <% if (item.IsPrimary)
                   {%>
                    *
                <% } %>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.StartDate)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.EndDate)) %>
            </td>
            <td>
                <div data-role="button"><%= Html.ActionLink("Summary", "Details", new { id=item.Id })%></div>
                <div data-role="button"><%= Html.ActionLink("Expenses", "Index", "Expense", new { /* id=item.PrimaryKey */ }, "data-role='Button'")%></div>
                
            </td>
            <!--
            <td>
                <%= Html.Encode(item.IsClosed) %>
            </td>
            <td>
                <%= Html.Encode(item.IsPrimary) %>
            </td>
            -->
        </tr>
    
    <% } %>

    </table>

    <p>
        Note: The * symbol indicates 
        that this is your primary transaction.
    </p>

    <p class="button">
        <div data-role="button"><%= Html.ActionLink("Add New Transaction", "Create") %></div>
    </p>

</asp:Content>

