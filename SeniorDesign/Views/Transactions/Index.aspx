<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.UserTransactionData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
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
           ?
        <% } %>
    </h2>
    <h3>Summery</h3>
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
        <tr>
            <th></th>
            <th>
                Amount
            </th>
            <th>
                Date Of Expense
            </th>
            <th>
                Expense Name
            </th>
            <th>
                SubExpence Name
            </th>
             <th>
                % of Expense
            </th>
            <th>
                % of SubExpense
            </th>
            <th>
                From UserName
            </th>
            <th>
                ID
            </th>
            <th>
                Status
            </th>
            <th>
                To UserName
            </th>
        </tr>

    <% foreach (var item in Model.Costs) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("View Expense", "Details", "Expense", new{id=item.ForExpense}, null) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:C}", item.Amount)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.DateOfExpense))%>
            </td>
            <td>
                <%= Html.Encode(item.ForExpenseName) %>
            </td>
            <td>
                <%= Html.Encode(item.ForSubExpenceName) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:p1}", item.PercentOfExpense)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:p1}", item.PercentOfSubExpense)) %>
            </td>
            <td>
                <%= Html.Encode(item.FromUserName) %>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
            <td>
                <%= Html.Encode(item.ToUserName) %>
            </td>
        </tr>
        
    <% } %>
    </table>
    <h6>
        Total: <%= String.Format("{0:C}", Model.Costs.Sum(p => p.Amount)) %>
    </h6>

      <h3>Transactions Receivable</h3>

    <table>
            <th></th>
            <th>
                Amount
            </th>
            <th>
                Date Of Expense
            </th>
            <th>
                Expense Name
            </th>
            <th>
                SubExpence Name
            </th>
            <th>
                % of Expense
            </th>
            <th>
                % of SubExpense
            </th>
            <th>
                From UserName
            </th>
            <th>
                ID
            </th>
            <th>
                Status
            </th>
            <th>
                To UserName
            </th>
        </tr>

    <% foreach (var item in Model.Payments) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("View Expense", "Details", "Expense", new{id=item.ForExpense}, null) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:C}", item.Amount)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.DateOfExpense))%>
            </td>
            <td>
                <%= Html.Encode(item.ForExpenseName) %>
            </td>
            <td>
                <%= Html.Encode(item.ForSubExpenceName) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:p1}", item.PercentOfExpense)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:p1}", item.PercentOfSubExpense)) %>
            </td>
            <td>
                <%= Html.Encode(item.FromUserName) %>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
            <td>
                <%= Html.Encode(item.ToUserName) %>
            </td>
        </tr>
    
    <% } %>

    </table>

        <h6>
        Total: <%= String.Format("{0:C}",  Model.Payments.Sum(p => p.Amount)) %>
    </h6>


</asp:Content>

