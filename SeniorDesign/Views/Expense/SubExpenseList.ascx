<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ExpenceInfo>" %>

    <table>
        <tr>
            <th>
                <a class="info" href="#">
                       ID
                       <span>The ID of this particular item</span>
                </a>
            </th>
            <th></th>
            <th>
                <a class="info" href="#">
                       Name
                       <span>The Name of this particular item</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                        ASEPSA_Amount
                       <span>The ASEPSA Amount</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                       AmountSubtotal
                       <span>The subtotal of this particular item</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                       AmountTotal
                       <span>The total of this particular item</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                       Description
                       <span>The description of this particular item</span>
                </a>
            </th>
            <!--
            <th>
                ExpenseID
            </th>
            -->
            <th>
                <a class="info" href="#">
                        Split Issued?
                       <span>Has this item been split?</span>
                </a>
            </th>
        </tr>

    <% foreach (var item in Model.SubExpenses) { %>
    
        <tr>
            <td style="font-size:large; text-align:center;">
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
            <% if (Model.Status == 0)
               { // Created  %>
                    <p class="smallbutton">
                    <%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ })%>
                    <%= Html.ActionLink("Delete", "Delete", "SubExpense", new { id = item.ID /* id=item.PrimaryKey */ }, null)%>
                    </p>
                <% } %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
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
            <!--
            <td>
                <%= Html.Encode(item.ExpenseID) %>
            </td>
            -->
            <td>
                <%= Html.Encode(item.SplitIssued) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p class="smallbutton">
        <%= Html.ActionLink("Create New", "Create", "SubExpense", new { id = Model.ID }, null)%>
    </p>


