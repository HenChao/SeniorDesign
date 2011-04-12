<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%: Page.User.Identity.Name %></b>!
        [ <%: Html.ActionLink("Log Off", "Index", "Login") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Log In", "Index", "Login")%> ]
<%
    }
%>
