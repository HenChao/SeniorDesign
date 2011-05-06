<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<GroupInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Groups
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Page.User.Identity.Name%>'s Groups</h2>

    <p>
        Listed below are the groups in which you belong. Select one of the groups below to add/edit transactions, or create a new group.
    </p>

    <p class="button">
        <div data-role="button"><%= Html.ActionLink("Create A New Group", "Create") %></div>
    </p>

    <table>
        <tr>
            <th></th>
            <th>
                Name
            </th>
            <!--
            <th>
                Id
            </th>
            -->
            <th>
                Description
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <div data-role="button"><%= Html.ActionLink("Select", "Index", "TransactionWindow", new { group = item.Id}, null)%></div>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <!--
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            -->
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
        </tr>
    
    <% } %>

    </table>

</asp:Content>

