<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.ExpensePreSplitDisplay>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PreSplit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>PreSplit</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
                
                <table>
                    <tr>
                        <th>
                            Sub Expense
                        </th>
                        <th>
                            Amount
                        </th>
                        <% foreach (var usr in Model.UsersToSplitOver)
                           { %>
                            <th>
                                <%= Html.Encode(usr.UserName) %>
                            </th>
                        <%} %>
                    </tr>
                <% for (int sub = 0; sub < Model.Expense.SubExpenses.Count(); sub++)
                   { %>
                   <tr>
                        <td> <%= Html.Encode(Model.Expense.SubExpenses[sub].Name) %> </td>
                        <td> <%= Html.Encode(Model.Expense.SubExpenses[sub].AmountTotal.ToString()) %></td>
                        <% for (int usr = 0; usr < Model.UsersToSplitOver.Count; usr++)
                           { %>
                                <td>
                                    <% int indexNumber = Model.Expense.SubExpenses.Count() * sub + usr; %>
                                    <%= Html.CheckBox("SplitData[" + indexNumber.ToString() + "].Selected") %>
                                    <%= Html.Hidden("SplitData[" + indexNumber.ToString() + "].SubExpenseID", Model.Expense.SubExpenses[sub].ID)  %>
                                    <%= Html.Hidden("SplitData[" + indexNumber.ToString() + "].UserID", Model.UsersToSplitOver[usr].Id)  %>
                                    <%= Html.Hidden("SplitData[" + indexNumber.ToString() + "].UserName", Model.UsersToSplitOver[usr].UserName)  %>
                                </td>
                        <% } %>
                   
                   </tr>
                <% } %>
                
                </table>



                <input type="submit" value="Create" />


    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

