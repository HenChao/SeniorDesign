﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcApplication1.Models.UsernamePasswordCreds>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Login</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Username) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Username) %>
                <%= Html.ValidationMessageFor(model => model.Username) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Password) %>
            </div>
            <div class="editor-field">
                <%= Html.PasswordFor(model => model.Password) %>
                <%= Html.ValidationMessageFor(model => model.Password) %>
            </div>
            
            <% if (Model.CredStatusFailed)
               { %>
            <div class="editor-label">
                Login failed. Bad username / password.
            </div>
            <% } %>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>
