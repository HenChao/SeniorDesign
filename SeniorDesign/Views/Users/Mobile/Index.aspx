<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UserInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Users Managment
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Users Managment</h2>

    <table>
    <% foreach (var item in Model) { %>
    
        <tr>
            <th>
            <!--
                <%= Html.ActionLink("Edit", "Edit", new { id = item.Id /* id=item.PrimaryKey */ })%> |
                <%= Html.ActionLink("Details", "Details", new { id = item.Id /* id=item.PrimaryKey */ })%> |
                <%= Html.ActionLink("Delete", "Delete", new { id = item.Id /* id=item.PrimaryKey */ })%> |
                -->
                <div data-role="button"><%= Html.ActionLink("Change Password", "ChangePassword", new { id=item.Id /* id=item.PrimaryKey */ })%></div>
                <div data-role="button"><%= Html.ActionLink("Permissions", "Index", "Permission", new { id=item.Id /* id=item.PrimaryKey */ }, null)%></div>
            </th>
            <td>
                <b>Username:</b> <%= Html.Encode(item.Username) %><br /><br />

                <b>First Name:</b> <%= Html.Encode(item.FirstName) %><br />
                <b>Last Name:</b> <%= Html.Encode(item.LastName) %><br /><br />
                
                <b>ID:</b> <%= Html.Encode(item.Id) %><br />
                <b>Is SA?:</b> <%= Html.Encode(item.IsSA) %><br />
            </td>
        </tr>
    
    <% } %>

    </table>

    <div data-role="button"><%= Html.ActionLink("Create New", "Create") %></div>

</asp:Content>

