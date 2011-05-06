<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.PaymentData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Direct
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Html.DisplayFor(model => model.Title) %></h2>

<fieldset>
    <table style="min-width:300px; border-bottom-width:0px" >
        <tr><td><b>From User</b></td><td><b>To User</b></td><td><b>Amount</b></td></tr>
        <% foreach (var line in Model.Lines) {%>
            <tr>
            <td> 
                <%: line.FromUsername %>
            </td>
            <td> 
                <%: line.ToUsername %>
            </td>
            <td>
                <%: line.Amount %>
            </td>
            </tr>
        <% } %>
    </table>

</fieldset>
<p>
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideContent" runat="server">
</asp:Content>

