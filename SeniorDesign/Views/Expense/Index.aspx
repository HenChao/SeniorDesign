<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ExpenceInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Amount
            </th>
            <th>
                DateEntered
            </th>
            <th>
                DateFinalized
            </th>
            <th>
                DateOfExpense
            </th>
            <th>
                Description
            </th>
            <th>
                GroupID
            </th>
            <th>
                ID
            </th>
            <th>
                Name
            </th>
            <th>
                Status
            </th>
            <th>
                UserID
            </th>
            <th>
                UsesASEPSA
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%= Html.ActionLink("Details", "Details", new { id = item.ID /* id=item.PrimaryKey */ })%> |
                <%= Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Amount)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.DateEntered)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.DateFinalized)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.DateOfExpense)) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.Encode(item.GroupID) %>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
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

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

