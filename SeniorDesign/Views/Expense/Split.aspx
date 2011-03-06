<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<MvcApplication1.Models.SplitDisplayData>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Split
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Split</h2>

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
                        <% foreach (var usr in Model.First().UserExpences)
                           { %>
                            <th>
                            
                                <%= Html.Encode(usr.UserName) %>
                            </th>
                        <%} %>
                    </tr>
                <% for (int sub = 0; sub < Model.Count; sub++)
                   { %>
                   <tr>
                        <td> <%= Html.Encode(Model[sub].SubExpenseName) %> </td>
                        <td> <%= Html.Encode(Model[sub].Amount.ToString()) %></td>
                        <% for (int usr = 0; usr < Model[sub].UserExpences.Count; usr++)
                           { %>
                                <td>
                                    <% int indexNumber = Model.Count * sub + usr; %>
                                    <%= Html.TextBox("SplitData[" + indexNumber.ToString() + "].Amount", Model[sub].UserExpences[usr].Amount)%>
                                    <%= Html.Hidden("SplitData[" + indexNumber.ToString() + "].SubExpenseID", Model[sub].SubExpenseID)  %>
                                    <%= Html.Hidden("SplitData[" + indexNumber.ToString() + "].UserID", Model[sub].UserExpences[usr].Id)  %>
                                    <%= Html.Hidden("SplitData[" + indexNumber.ToString() + "].UserName", Model[sub].UserExpences[usr].UserName)%>
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

