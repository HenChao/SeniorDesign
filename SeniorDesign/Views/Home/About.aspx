<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About Us</h2>
    
    <h3>The Team Behind the Machine</h3>
    <ul style="list-style: none;">
        <li style="padding-bottom: 30px; padding-top: 30px;">
            <img src="../../Content/images/profiles/fawkes.jpg" style="float: left; margin-right:62px;"/>
            <h4>EJ Thiele</h4>
            <p>
            Some say he only sleeps 2 hours a day, and naps for the other 22 hours. Others claim that he prefers
            to code drunk... but can never find enough alcohol. All we know is his name: EJ Thiele.
            </p>

            <p><a href="mailto:webmaster@costsplit.com">webmaster@costsplit.com</a></p>
        </li>
        <li style="padding-bottom: 30px; padding-top: 30px;">
            <img src="../../Content/images/profiles/close_enough.jpg" style="float: left; margin-right: 50px;" />
            <h4>Henry Chao</h4>
            <p>
            Henry is a senior at Rutgers University, studying Electrical and Computer Engineering. He enjoys
            taking long walks on the beach, and drinking pina coladas.
            </p>

            <p><a href="mailto:webmaster@costsplit.com">webmaster@costsplit.com</a></p>
        </li>
    </ul>



</asp:Content>
