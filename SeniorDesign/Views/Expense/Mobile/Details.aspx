<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<ExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        About Expense #<%= Html.Encode(Model.ID) %>:
        <%= Html.Encode(Model.Name) %></h2>
    <h3>
        Amount</h3>
    <%= Html.Encode(String.Format("{0:F}", Model.Amount)) %>
    <h3>
        Date Entered</h3>
    <%= Html.Encode(String.Format("{0:g}", Model.DateEntered)) %>
    <h3>
        Date Finalized</h3>
    <%= Html.Encode(String.Format("{0:g}", Model.DateFinalized)) %>
    <h3>
        Date Of Expense</h3>
    <%= Html.Encode(String.Format("{0:g}", Model.DateOfExpense)) %>
    <h3>
        Description</h3>
    <%= Html.Encode(Model.Description) %>
    <h3>
        Part of GroupID</h3>
    <%= Html.Encode(Model.GroupID) %>
    <h3>
        Expense ID</h3>
    <%= Html.Encode(Model.ID) %>
    <h3>
        Name</h3>
    <%= Html.Encode(Model.Name) %>
    <h3>
        Status</h3>
    <%= Html.Encode(Model.Status) %>
    <h3>
        Created by UserID</h3>
    <%= Html.Encode(Model.UserID) %>
    <h3>
        UsesASEPSA</h3>
    <%= Html.Encode(Model.UsesASEPSA) %>

    <% foreach (var img in Model.Images)
       { %>
    <%= Html.ActionLink("Image","Image", new{id=img}) %>
    <img src="<%= Url.Action("Image", new{id=img}) %>" />
    <% } %>

    <% Html.RenderPartial("SubExpenseList", Model); %>

    <% if (Model.Status == 0)
       { %>
    <div data-role="button"><%= Html.ActionLink("Finalize", "Finalize", new { id = Model.ID /* id=Model.PrimaryKey */ })%></div>
    <br />
    <% }
       else
       { %>
        <div data-role="button"><%= Html.ActionLink("Split", "SelectUsersForSplit", new { id = Model.ID, group = Model.GroupID })%></div>
    <br />
    <% } %>

    <div data-role="button"><%= Html.ActionLink("Back to List", "Index") %></div>
</asp:Content>
