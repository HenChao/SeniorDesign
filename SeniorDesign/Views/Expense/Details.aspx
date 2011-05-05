<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ExpenceInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>About Expense #<%= Html.Encode(Model.ID) %>: <%= Html.Encode(Model.Name) %></h2>

    <fieldset>
        <legend>Details</legend>
        
        <table>
            <tr>
                <th>
                    <a class="info" href="#">
                       Amount
                       <span>The amount spent on this expense</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       Date Entered
                       <span>The date this expense was entered into the system</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       Date Finalized
                       <span>The date this expense was finalized by all parties</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       Date Of Expense
                       <span>The date this expense was incurred</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       Description
                       <span>Description of the expense</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       GroupID
                       <span>The group to which this expense belongs</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       Status
                       <span>The status of this expense</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       UserID
                       <span>The ID of the user who created this expense</span>
                    </a>
                </th>
                <th>
                    <a class="info" href="#">
                       UsesASEPSA
                       <span>Whether or not this uses ASEPSA</span>
                    </a>
                </th>
            </tr>
            <td>
                <p class="comment"><%= Html.Encode(String.Format("{0:F}", Model.Amount)) %></p>
            </td>
            <td>        
                <p class="comment"><%= Html.Encode(String.Format("{0:g}", Model.DateEntered)) %></p>
            </td>
            <td>
                <p class="comment"><%= Html.Encode(String.Format("{0:g}", Model.DateFinalized)) %></p>
            </td>
            <td>
                <p class="comment"><%= Html.Encode(String.Format("{0:g}", Model.DateOfExpense)) %></p>
            </td>        
            <td>
                <p class="comment"><%= Html.Encode(Model.Description) %></p>
            </td>
            <td>
                <p class="comment"><%= Html.Encode(Model.GroupID) %></p>
            </td>
            <td>
                <p class="comment"><%= Html.Encode(Model.Status) %></p>
            </td>
            <td>
                <p class="comment"><%= Html.Encode(Model.UserID) %></p>
            </td>
            <td>
                <p class="comment"><%= Html.Encode(Model.UsesASEPSA) %></p>
            </td>
        </tr>
    </table>
    <br />
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

