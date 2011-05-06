<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TransactionWindowInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create a New Transaction
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create a New Transaction</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>New Transaction Form</legend>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                Make Primary? <%= Html.CheckBoxFor(model => model.IsPrimary) %>
                <%= Html.ValidationMessageFor(model => model.IsPrimary) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <p class="button">
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SideContent" runat="server">
    <div id="rightSide">
    <h4>Name</h4>
            <p>
                Enter a name for this transaction.
            </p>
            
    <h4>Make Primary?</h4>
            <p>
                Make this transaction your primary transaction? If set to be your primary transaction,
                then all future default actions made will automatically affect this transaction.
            </p>
    </div>
</asp:Content>