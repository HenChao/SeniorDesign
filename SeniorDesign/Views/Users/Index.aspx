<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UserInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                FirstName
            </th>
            <th>
                Id
            </th>
            <th>
                IsSA
            </th>
            <th>
                LastName
            </th>
            <th>
                Username
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id = item.Id /* id=item.PrimaryKey */ })%> |
                <%= Html.ActionLink("Details", "Details", new { id = item.Id /* id=item.PrimaryKey */ })%> |
                <%= Html.ActionLink("Delete", "Delete", new { id = item.Id /* id=item.PrimaryKey */ })%>
                <%= Html.ActionLink("Change Password", "ChangePassword", new { id=item.Id /* id=item.PrimaryKey */ })%>
                <%= Html.ActionLink("Permissions", "Index", "Permission", new { id=item.Id /* id=item.PrimaryKey */ }, null)%>
            </td>
            <td>
                <%= Html.Encode(item.FirstName) %>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.IsSA) %>
            </td>
            <td>
                <%= Html.Encode(item.LastName) %>
            </td>
            <td>
                <%= Html.Encode(item.Username) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

