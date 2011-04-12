<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage< SeniorDesign.Models.PermissionsForUser>" %>

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
                <%= Html.ActionLink("Revoke", "Delete", new {id=Model.UserID, group = item.GroupID, data = item.Permission /* id=item.PrimaryKey */ })%>
            </td>
            <td>
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

    <p>
        <%= Html.ActionLink("Create New", "Create", new { id = Model.UserID })%>
    </p>

</asp:Content>

