<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<GroupInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create Group</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
                Enter a name for your group.
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>           

            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
                Provide a short description to help you remember the purpose of this group.
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Description) %>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>

            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div data-role="button">
        <%= Html.ActionLink("Cancel", "Index") %>
    </div>

</asp:Content>

