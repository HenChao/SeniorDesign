<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcApplication1.Models.FullPermissionInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to revoke this permission?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">UserName</div>
        <div class="display-field"><%= Html.Encode(Model.UserName) %></div>
        
        <div class="display-label">GroupName</div>
        <div class="display-field"><%= Html.Encode(Model.GroupName) %></div>
        
        <div class="display-label">UserID</div>
        <div class="display-field"><%= Html.Encode(Model.UserID) %></div>
        
        <div class="display-label">GroupId</div>
        <div class="display-field"><%= Html.Encode(Model.GroupId) %></div>
        
        <div class="display-label">PermissionName</div>
        <div class="display-field"><%= Html.Encode(Model.PermissionName) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Deny" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

