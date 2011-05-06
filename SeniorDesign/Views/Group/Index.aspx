<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<GroupInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Groups
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Page.User.Identity.Name%>'s Groups</h2>

    <p class="button">
        <%= Html.ActionLink("Create A New Group", "Create") %>
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
                <p class="smallbutton"><%= Html.ActionLink("Select", "Index", "TransactionWindow", new { group = item.Id }, null)%></p>
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

<asp:Content ID="Content3" ContentPlaceHolderID="SideContent" runat="server">
    <div id="rightSide">
	<p>
        Listed to the left are the groups in which you belong.
    </p>
    <p>
        Select one of the groups to add/edit transactions, or create a new group.
    </p>
    </div>
</asp:Content>
