<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ExpenceInfo>" %>
<table>
    <% foreach (var item in Model.SubExpenses)
       { %>
    <tr>
        <td>
            <% if (Model.Status == 0)
               { // Created  %>
            <p class="smallbutton">
                <div data-role="button"><%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ })%></div>
                <div data-role="button"><%= Html.ActionLink("Delete", "Delete", "SubExpense", new { id = item.ID /* id=item.PrimaryKey */ }, null)%></div>
            </p>
            <% } %>
        </td>
        <td>
            <b>ASEPSA_Amount:</b> <%= Html.Encode(String.Format("{0:F}", item.ASEPSA_Amount)) %><br />
            <b>AmountSubtotal:</b> <%= Html.Encode(String.Format("{0:F}", item.AmountSubtotal)) %><br />
            <b>AmountTotal:</b> <%= Html.Encode(String.Format("{0:F}", item.AmountTotal)) %><br />
            <b>Description:</b> <%= Html.Encode(item.Description) %><br />
            <b>ExpenseID:</b> <%= Html.Encode(item.ExpenseID) %><br />
            <b>ID:</b> <%= Html.Encode(item.ID) %><br />
            <b>Name:</b> <%= Html.Encode(item.Name) %><br />
            <b>SplitIssued?:</b> <%= Html.Encode(item.SplitIssued) %>
        </td>
    </tr>
    <% } %>
</table>
<div data-role="button">
    <%= Html.ActionLink("Create New", "Create", "SubExpense", new { id = Model.ID }, null)%></div>
