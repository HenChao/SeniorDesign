<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UserInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Users Managment
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Users Managment</h2>

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
                <a class="info" href="#">
                IsSA
                    <span>Indicates if the user is a super user</span>
                </a>
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
                <!--
                <%= Html.ActionLink("Edit", "Edit", new { id = item.Id /* id=item.PrimaryKey */ })%> |<br />
                <%= Html.ActionLink("Details", "Details", new { id = item.Id /* id=item.PrimaryKey */ })%> |<br />
                <%= Html.ActionLink("Delete", "Delete", new { id = item.Id /* id=item.PrimaryKey */ })%> |<br />
                -->
                <%= Html.ActionLink("Change Password", "ChangePassword", new { id=item.Id /* id=item.PrimaryKey */ })%> |
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

    <p class="button">
        <%= Html.ActionLink("Create New User", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SideContent" runat="server">
    <div id="rightSide">
    <p>
        This is the user management window for the users in the Cost Split system. If you can see this page and
        you are not an administrator of the Cost Split system, you must have taken a wrong turn somewhere.
    </p>
    <p>
        Happens to the best of us.
    </p>
    </div>
</asp:Content>