<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<TransactionWindowInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create a New Transaction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create a New Transaction</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Form</legend>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <p class="comment">
                Enter a name for this transaction.
            </p>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                Make Primary? <%= Html.CheckBoxFor(model => model.IsPrimary) %>
                <%= Html.ValidationMessageFor(model => model.IsPrimary) %>
            </div>
            <p class="comment">
                Make this transaction your primary transaction for this period?
            </p>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <p class="button">
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

