<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TransactionWindowInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Transactions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>All Transactions for Group: <%= Html.Encode(ViewData["Message"]) %></h2>

    <table>
        <tr>
            <th>
                <a class="info" href="#">
                Transaction ID
                    <span>The ID of the transaction</span>
                </a>
            </th>
            <th>
                Name
            </th>
            <th>
                <a class="info" href="#">
                Start Date
                    <span>The date and time when the transaction was first created</span>
                </a>
            </th>
            <th>
                <a class="info" href="#">
                End Date
                    <span>The date and time when the transaction was closed. If blank, then the transaction is still open</span>
                </a>
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
                    <img id="Img1" src="~/Content/images/primary.png" runat="server"/>
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
                <p class="smallbutton"><%= Html.ActionLink("Summary", "Details", new { id=item.Id })%>
                <%= Html.ActionLink("Statment", "Details", "Statment",  new { id=item.Id }, null)%>
                <%= Html.ActionLink("Expenses", "Index", "Expense", new { /* id=item.PrimaryKey */ }, null)%></p>
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

    <p class="button">
        <%= Html.ActionLink("Add New Transaction", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SideContent" runat="server">
    <div id="rightSide">
    <p>
        Listed to the left are the transactions for this group.
    </p>
    <p>
        Note: The <img id="Img2" src="~/Content/images/primary.png" runat="server"/> symbol indicates 
        that this is your primary transaction. Default actions made for the group will automatically
        affect this transaction.
    </p>
    <p>
        Click on "Summary" to obtain a payment plan for this transaction.
    </p>
    <p>
        Click on "Expenses" to obtain a detailed view of all your expenses for this transaction.
    </p>
    </div>
</asp:Content>