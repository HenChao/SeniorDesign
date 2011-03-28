<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SeniorDesign.Models.UserTransactionData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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

    
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

