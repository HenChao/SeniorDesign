<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.PermissionGrant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Add New Permission
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add New Permission</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.GroupID) %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownListFor(model => model.GroupID, Model.Groups.Select(p => new SelectListItem(){ Text = p.Key, Value=p.Value.ToString()})) %>
                <%= Html.ValidationMessageFor(model => model.GroupID) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Permission) %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownListFor(model => model.Permission, Model.Permissions.Select(p => new SelectListItem(){ Text = p, Value=p})) %>
                <%= Html.ValidationMessageFor(model => model.Permission) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

   <div>
        <p class="button"><%= Html.ActionLink("Back to Users List", "Index") %></p>
    </div>

</asp:Content>

