<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%
    if (Request.IsAuthenticated) {
%>
    <%= Html.ActionLink("Log Off", "LogOff", "Account", null, new { @class = "ui-btn-right" })%>
<%
    }
    else {
%> 
    
<%
    }
%>