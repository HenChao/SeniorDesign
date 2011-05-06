<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.UsernamePasswordCreds>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Login
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
                <input type="submit" value="Login" />
              
            </p>
            <!-- TODO: Fix this to non static --> 
                 <a href="http://localhost:3434/g.aspx/2/FbLogon">
                   <img alt="" class="style1" 
                src="http://localhost:3434/Content/images/fbconnect.gif" />
                </a></fieldset>

    <% } %>

    <div>
        <p class="button"><%= Html.ActionLink("Cancel", "Index") %></p>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="SideContent" runat="server">
	<div id="rightSide" style="text-align:center">
        [Your ad here?]
        <br />
        <img src="~/Content/images/rulost.jpg" runat="server"/>
    </div>
</asp:Content>