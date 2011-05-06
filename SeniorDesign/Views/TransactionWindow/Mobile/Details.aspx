<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.UserTransactionData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="float: none;">
        Transaction report for: 
        <%= Model.WindowInfo.Name %>
    </h1>
    <h2>
        <%= Model.WindowInfo.StartDate.ToShortDateString() %>
        - 
        <% if (Model.WindowInfo.EndDate.HasValue)
           { %>
           <%= Model.WindowInfo.EndDate.Value.ToShortDateString() %>
        <% }
           else
           { %>
           Present
        <% } %>
    </h2>

    <h3>Summary</h3>
    <table>
        <tr>
            <th>
                Name
            </th>
            <th>
                Receivable
            </th>
            <th>
                Payable
            </th>
            <th>
                Amout Owed
            </th>
        </tr>
        <% var namesFromPay = (from p in Model.Costs
                               select p.ToUserName).Distinct();
           var namesFromRec = (from p in Model.Payments
                               select p.FromUserName).Distinct();
           var names = (namesFromPay.Union(namesFromRec)).Distinct().OrderBy(p => p);

           foreach (var name in names)
           { %>
                <tr>
                    <td>
                        <%= name %>
                    </td>
                    <td>
                        <% var payAmount = Model.Costs.Where(p => p.ToUserName == name).Sum(p => p.Amount); %>
                        <%= Html.Encode(String.Format("{0:C}", payAmount))%>
                    </td>
                    <td>
                        <% var recAmount = Model.Payments.Where(p => p.FromUserName == name).Sum(p => p.Amount); %>
                        <%= Html.Encode(String.Format("{0:C}", recAmount)) %>
                    </td>
                    <td>
                        <%= Html.Encode(String.Format("{0:C}", payAmount - recAmount))%>
                    </td>
                </tr>
        <% } %>
    </table>

    <h3>Transactions Payable</h3>

    <table>
    <% foreach (var item in Model.Costs) { %>
    
        <tr>
            <td>
                <div data-role="button"><%= Html.ActionLink("View Expense", "Details", "Expense", new{id=item.ForExpense}, null) %></div>
            </td>
            <td>
                <b>Amount:</b> <%= Html.Encode(String.Format("{0:C}", item.Amount)) %><br />
                <b>Date of Expense:</b> <%= Html.Encode(String.Format("{0:g}", item.DateOfExpense))%><br />
                <b>Expense Name:</b> <%= Html.Encode(item.ForExpenseName) %><br />
                <b>SubExpense Name:</b> <%= Html.Encode(item.ForSubExpenceName) %><br />
                <b>% of Expense:</b> <%= Html.Encode(String.Format("{0:p1}", item.PercentOfExpense)) %><br />
                <b>% of SubExpense:</b> <%= Html.Encode(String.Format("{0:p1}", item.PercentOfSubExpense)) %><br />
                <b>From User:</b> <%= Html.Encode(item.FromUserName) %><br />
                <b>ID:</b> <%= Html.Encode(item.ID) %><br />
                <b>Status:</b> <%= Html.Encode(item.Status) %><br />
                <b>To User:</b> <%= Html.Encode(item.ToUserName) %>
            </td>
        </tr>
        
    <% } %>
    </table>
    <h6>
        Total: <%= String.Format("{0:C}", Model.Costs.Sum(p => p.Amount)) %>
    </h6>

      <h3>Transactions Receivable</h3>

    <table>

    <% foreach (var item in Model.Payments) { %>
    
        <tr>
            <td>
                <div data-role="button"><%= Html.ActionLink("View Expense", "Details", "Expense", new{id=item.ForExpense}, null) %></div>
            </td>
            <td>
                <b>Amount:</b> <%= Html.Encode(String.Format("{0:C}", item.Amount)) %><br />
                <b>Date of Expense:</b> <%= Html.Encode(String.Format("{0:g}", item.DateOfExpense))%><br />
                <b>Expense Name:</b> <%= Html.Encode(item.ForExpenseName) %><br />
                <b>SubExpense Name:</b> <%= Html.Encode(item.ForSubExpenceName) %><br />
                <b>% of Expense:</b> <%= Html.Encode(String.Format("{0:p1}", item.PercentOfExpense)) %><br />
                <b>% of SubExpense:</b> <%= Html.Encode(String.Format("{0:p1}", item.PercentOfSubExpense)) %><br />
                <b>From User:</b> <%= Html.Encode(item.FromUserName) %><br />
                <b>ID:</b> <%= Html.Encode(item.ID) %><br />
                <b>Status:</b> <%= Html.Encode(item.Status) %><br />
                <b>To User:</b> <%= Html.Encode(item.ToUserName) %>
            </td>
        </tr>
    
    <% } %>

    </table>

        <h6>
        Total: <%= String.Format("{0:C}",  Model.Payments.Sum(p => p.Amount)) %>
    </h6>
        
    <div data-role="button"><%= Html.ActionLink("Back To Transactions", "Index", "TransactionWindow") %></div>

<%--<h2>Details</h2>

<fieldset>
    <legend>UserTransactionData</legend>
</fieldset>
<p>
    <%: Model.WindowInfo.Name %>
    <br />
    <br />
    <% foreach (var item in Model.Costs)  
	{
		%>
            
            <%: item.ForExpenseName %>
            <%: item.Amount.ToString() %>
            <br />
        <%  
	} %>
    
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>

    
</p>--%>

</asp:Content>

