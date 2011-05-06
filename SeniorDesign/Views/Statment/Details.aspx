<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.StatmentData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Html.DisplayFor(model => model.Title) %></h2>

<fieldset>
    <table style="min-width:300px; border-bottom-width:0px" >
        <tr><td><b>Username</b></td><td><b>Amount</b></td></tr>
        <% foreach (var line in Model.Lines) {%>
            <tr>
            <td> 
                <%: line.Username %>
            </td>
            <td>
                <%: line.Amount %>
            </td>
            </tr>
        <% } %>
        <tr>
            <td colspan=2>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <b><i>Total:</i></b>
            </td>
            <td>
                 <%: Html.DisplayFor(model => model.AmountTotal) %>
            </td>
        </tr>
    </table>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
