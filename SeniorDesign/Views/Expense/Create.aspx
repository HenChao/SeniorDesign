<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcApplication1.Models.CreateExpenseModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.8.4.custom.min.js" type="text/javascript"></script>
    <link type="text/css" href="/Content/jquery-ui-1.8.4.custom.css" rel="stylesheet" />

    <script type="text/javascript">
        $(function () {
            $("#datepicker").datepicker();
        });
	</script>

    <h2>Create Expense</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Description) %>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Total) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Total) %>
                <%= Html.ValidationMessageFor(model => model.Total) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.DateOfExpense) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.DateOfExpense, new { id = "datepicker" })%>
                <%= Html.ValidationMessageFor(model => model.DateOfExpense) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ASEPSA) %>
            </div>
            <div class="editor-field">
                <%= Html.CheckBoxFor(model => model.ASEPSA) %>
                <%= Html.ValidationMessageFor(model => model.ASEPSA) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.UserId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.UserId) %>
                <%= Html.ValidationMessageFor(model => model.UserId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.GroupId) %>
            </div>
            <div class="editor-field">
                <%= Html.DisplayTextFor(model => model.GroupId) %>
                <%= Html.HiddenFor(model => model.GroupId)  %>
                <%= Html.ValidationMessageFor(model => model.GroupId) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

