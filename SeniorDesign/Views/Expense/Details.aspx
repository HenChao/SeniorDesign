<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

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

        <% foreach (var img in Model.Images) { %>
            <%= Html.ActionLink("Image","Image", new{id=img}) %>
            <img src="<%= Url.Action("Image", new{id=img}) %>" />
        <% } %>
        
        
        <% Html.RenderPartial("SubExpenseList", Model); %>

        
        
    </fieldset>
    <p>
        <% if (Model.Status == 0)
           { %>
        <%= Html.ActionLink("Finalize", "Finalize", new { id = Model.ID /* id=Model.PrimaryKey */ })%> |
        <% } else { %>
        <%= Html.ActionLink("Split", "SelectUsersForSplit", new { id = Model.ID, group = Model.GroupID })%> | 
        <% } %>
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

