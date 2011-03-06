<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SubExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.ExpenseID) %>
            </div>
            <div class="editor-field">
                <%= Html.LabelFor(model => model.ExpenseID) %>
                <%= Html.HiddenFor(model => model.ExpenseID) %>
                <%= Html.ValidationMessageFor(model => model.ExpenseID) %>
            </div>
                        
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
                     
<%--            <div class="editor-label">
                <%= Html.LabelFor(model => model.ID) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ID) %>
                <%= Html.ValidationMessageFor(model => model.ID) %>
            </div>--%>

<%--            <div class="editor-label">
                <%= Html.LabelFor(model => model.SplitIssued) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.SplitIssued) %>
                <%= Html.ValidationMessageFor(model => model.SplitIssued) %>
            </div>--%>
            
<%--            <div class="editor-label">
                <%= Html.LabelFor(model => model.ASEPSA_Amount) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ASEPSA_Amount) %>
                <%= Html.ValidationMessageFor(model => model.ASEPSA_Amount) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.AmountSubtotal) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.AmountSubtotal) %>
                <%= Html.ValidationMessageFor(model => model.AmountSubtotal) %>
            </div>--%>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.AmountTotal) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.AmountTotal) %>
                <%= Html.ValidationMessageFor(model => model.AmountTotal) %>
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

