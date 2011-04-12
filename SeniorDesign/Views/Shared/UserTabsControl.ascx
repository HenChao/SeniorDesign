<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    if (Request.IsAuthenticated) {
%>
        <li><%: Html.ActionLink("Groups", "Index", "Group")%></li>
        <li><%: Html.ActionLink("Users", "Index", "Users")%></li>
<%
    }
    else {
%> 
        <li><%: Html.ActionLink("Login", "Index", "Login")%></li>
<%
    }
%>