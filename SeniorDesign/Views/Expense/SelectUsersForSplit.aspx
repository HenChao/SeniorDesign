<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<SeniorDesign.Models.UserSelectionData>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	SelectUsersForSplit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>SelectUsersForSplit</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        <table>
            <tr>
                <td>Select</td>
                <td>UserName</td>
                <td>Id</td>
            </tr>
            <% for (int i = 0; i < Model.Count; i++)
               { %>
            <tr>
                <td>
                   <%= Html.CheckBoxFor(p => p[i].IsSelected) %>    
                </td>
                <td>
                    <%= Html.Encode(Model[i].UserName)%>
                    <%= Html.HiddenFor(p => p[i].UserName)%>
                </td>
                <td>
                    <%= Html.Encode(Model[i].Id)%>
                    <%= Html.HiddenFor(p => p[i].Id)%>
                </td>
            </tr>

            <%} %>
        </table>
    
            
            <p>
                <input type="submit" value="Save" />
            </p>
       

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

