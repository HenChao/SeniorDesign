<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage< SeniorDesign.Models.PermissionsForUser>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Permissions for  <%= Html.Encode(Model.UserName) %></h2>

    <table>
        <tr>
            <th></th>
            <th>
                GroupID
            </th>
            <th>
                GroupName
            </th>
            <th>
                Permission
            </th>
        </tr>

    <% foreach (var item in Model.Permissions) { %>
    
        <tr>
            <td>
                <p class="smallbutton"><%= Html.ActionLink("Revoke", "Delete", new {id=Model.UserID, group = item.GroupID, data = item.Permission /* id=item.PrimaryKey */ })%></p>
            </td>
            <td style="text-align: center; font-size:x-large;">
                <%= Html.Encode(item.GroupID) %>
            </td>
            <td>
                <%= Html.Encode(item.GroupName) %>
            </td>
            <td>
                <%= Html.Encode(item.Permission) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <div>
        <p class="button"><%= Html.ActionLink("Add Permission", "Create", new { id = Model.UserID })%></p>

        <p class="button"><%= Html.ActionLink("Back to Users List", "Index") %></p>
    </div>

</asp:Content>

