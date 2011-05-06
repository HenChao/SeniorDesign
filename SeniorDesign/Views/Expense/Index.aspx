<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ExpenceInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Expenses
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Expenses</h2>

    <table>
        <tr>
            <th>
                ID
            </th>
            <th></th>
            <th>
                <a class="info" href="#">
                    Name
                    <span>The name of the expense</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    Amount($)
                    <span>The cost of the expense</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    Description
                    <span>A short description of the expense</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    Date Entered
                    <span>The date the expense was entered into the system</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    Date Finalized
                    <span>The date the expense was finalized</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    Date Of Expense
                    <span>The date of the expense</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    GroupID
                    <span>The group with which this expense is associated</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    Status
                    <span>The status of this expense:
                        <br />0: Issued 
                        <br />1: Accepted
                        <br />2: Rejected
                        <br />3: Revoked
                        <br />4: Refunded
                    </span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    UserID
                    <span>The UserID of the one who created this expense</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                    UsesASEPSA?
                    <span>Indicates if CostSplit has already detected and handled the tax and/or tip associated with this expense</span>
                </a>
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td style="font-size:large; text-align:center;">
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <p class="smallbutton"><%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %>
                <%= Html.ActionLink("Details", "Details", new { id = item.ID /* id=item.PrimaryKey */ })%>
                <%= Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%></p>
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
    
    <% } %>

    </table>

    <p class="button">
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

    <p class="button">
        <%= Html.ActionLink("Back to Transactions", "Index", "TransactionWindow") %>
    </p>

</asp:Content>

