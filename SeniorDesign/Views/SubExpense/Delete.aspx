<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SubExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ASEPSA_Amount</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:F}", Model.ASEPSA_Amount)) %></div>
        
        <div class="display-label">AmountSubtotal</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:F}", Model.AmountSubtotal)) %></div>
        
        <div class="display-label">AmountTotal</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:F}", Model.AmountTotal)) %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%= Html.Encode(Model.Description) %></div>
        
        <div class="display-label">ExpenseID</div>
        <div class="display-field"><%= Html.Encode(Model.ExpenseID) %></div>
        <%= Html.HiddenFor(p => p.ExpenseID) %>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%= Html.Encode(Model.ID) %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">SplitIssued</div>
        <div class="display-field"><%= Html.Encode(Model.SplitIssued) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

