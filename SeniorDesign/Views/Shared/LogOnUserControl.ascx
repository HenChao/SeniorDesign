<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%: Page.User.Identity.Name %></b>!
        [ <%= Html.ActionLink("Log Off", "LogOff", "Account", null, new {@class = "transition" }) %> ]
<%
    }
    else {
%> 
        [ <%= Html.ActionLink("Log In", "Index", "Login", null, new {@class = "transition" })%> ]
<%
    }
%>
