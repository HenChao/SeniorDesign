<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<ExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>About this expense:</h2>

    <fieldset>
        <legend>Details</legend>
        
        <div class="display-label">Amount</div>
        <p class="comment"><%= Html.Encode(String.Format("{0:F}", Model.Amount)) %></p>
        
        <div class="display-label">Date Entered</div>
        <p class="comment"><%= Html.Encode(String.Format("{0:g}", Model.DateEntered)) %></p>
        
        <div class="display-label">Date Finalized</div>
        <p class="comment"><%= Html.Encode(String.Format("{0:g}", Model.DateFinalized)) %></p>
        
        <div class="display-label">Date Of Expense</div>
        <p class="comment"><%= Html.Encode(String.Format("{0:g}", Model.DateOfExpense)) %></p>
        
        <div class="display-label">Description</div>
        <p class="comment"><%= Html.Encode(Model.Description) %></p>
        
        <div class="display-label">Part of GroupID</div>
        <p class="comment"><%= Html.Encode(Model.GroupID) %></p>
        
        <div class="display-label">Expense ID</div>
        <p class="comment"><%= Html.Encode(Model.ID) %></p>
        
        <div class="display-label">Name</div>
        <p class="comment"><%= Html.Encode(Model.Name) %></p>
        
        <div class="display-label">Status</div>
        <p class="comment"><%= Html.Encode(Model.Status) %></p>
        
        <div class="display-label">Created by UserID</div>
        <p class="comment"><%= Html.Encode(Model.UserID) %></p>
        
        <div class="display-label">UsesASEPSA</div>
        <p class="comment"><%= Html.Encode(Model.UsesASEPSA) %></p>

        <% foreach (var img in Model.Images) { %>
            <%= Html.ActionLink("Image","Image", new{id=img}) %>
            <img src="<%= Url.Action("Image", new{id=img}) %>" />
        <% } %>
        
        
        <% Html.RenderPartial("SubExpenseList", Model); %>

        
        
    </fieldset>
    <p class="button">
        <% if (Model.Status == 0)
           { %>
        <%= Html.ActionLink("Finalize", "Finalize", new { id = Model.ID /* id=Model.PrimaryKey */ })%> <br />
        <% } else { %>
        <%= Html.ActionLink("Split", "SelectUsersForSplit", new { id = Model.ID, group = Model.GroupID })%> <br />
        <% } %>
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

