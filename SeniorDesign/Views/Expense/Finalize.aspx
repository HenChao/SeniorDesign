<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Finalize
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Finalize</h2>

    <h3>Are you sure you want to finalize this expense? This action cannot be undone.</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Amount</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:F}", Model.Amount)) %></div>
        
        <div class="display-label">DateEntered</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.DateEntered)) %></div>
        
        <div class="display-label">DateFinalized</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.DateFinalized)) %></div>
        
        <div class="display-label">DateOfExpense</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.DateOfExpense)) %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%= Html.Encode(Model.Description) %></div>
        
        <div class="display-label">GroupID</div>
        <div class="display-field"><%= Html.Encode(Model.GroupID) %></div>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%= Html.Encode(Model.ID) %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
        <div class="display-label">UserID</div>
        <div class="display-field"><%= Html.Encode(Model.UserID) %></div>
        
        <div class="display-label">UsesASEPSA</div>
        <div class="display-field"><%= Html.Encode(Model.UsesASEPSA) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Finalize" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

