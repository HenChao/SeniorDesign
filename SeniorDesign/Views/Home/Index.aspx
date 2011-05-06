<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    
    <h3>
        So, Just What is CostSplit?
    </h3>

    <p>
        Traditional accounting software are designed to be used by small businesses and more sophisticated users 
        for more complicated tasks. Our web application aims for a more generalized audience that simplifies accounts 
        receivable and payable transactions among friends.  Through the use of this software, users can track group 
        expenditures and manage the reconciliation of debts.
    </p>
    <p>
	    Whether you are living in an apartment with friends and trying to figure out the division of rent, or out on 
        a dinner and want to avoid the hassle of splitting the bill, this web application will handle the needs of common, 
        everyday financial situational problems in an easy-to-use interface, in the clouds.
    </p>

    <h3>
        That Sounds Fantastic! When Can I Expect to Start Using This Service?
    </h3>

    <p>
        Patience, my anonymous friend. It will be several months until this website is up and running. Until then, feel free
        to take a look around!
    </p>

    <p>
        User accounts are current available on an invitation-only basis. In a later release of the website, we hope to eventually
        support beta user accounts.
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SideContent" runat="server">
    <div id="rightSide" style="text-align:center">
        <h4>What Are People Saying About CostSplit?</h4>
        <br />
        <img src="~/Content/images/reviews/neuyork.jpg" runat="server" style="width: 150px"/>
        <br />
        <img src="~/Content/images/reviews/seanet.jpg" runat="server" style="width: 150px"/>
        <br />
        <img src="~/Content/images/reviews/semantics.jpg" runat="server" style="width: 150px"/>
    </div>
</asp:Content>
