<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ExpenceInfo>" %>

    <table>
        <tr>
            <th></th>
            <th>
                ASEPSA_Amount
            </th>
            <th>
                AmountSubtotal
            </th>
            <th>
                AmountTotal
            </th>
            <th>
                Description
            </th>
            <th>
                ExpenseID
            </th>
            <th>
                ID
            </th>
            <th>
                Name
            </th>
            <th>
                SplitIssued
            </th>
        </tr>

    <% foreach (var item in Model.SubExpenses) { %>
    
        <tr>
            <td>
            <% if (Model.Status == 0)
               { // Created  %>
                    <%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ })%> |
                    <%= Html.ActionLink("Delete", "Delete", "SubExpense", new { id = item.ID /* id=item.PrimaryKey */ }, null)%>
                <% } %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.ASEPSA_Amount)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.AmountSubtotal)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.AmountTotal)) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.Encode(item.ExpenseID) %>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.SplitIssued) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create", "SubExpense", new { id = Model.ID }, null)%>
    </p>


