<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Project Status
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="~/Content/Tables.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Current Project Status</h2>

<h3>How's She Lookin', Captain?</h3>
<p>So good. Like pie.</p>

<h4>Preliminary Deliverables</h4>

<table>
    <tr>
        <td>Date (Expected)</td>
        <td>Deliverables</td>
        <td>Status</td>
    </tr>
    <tr>
        <td>February 11th</td>
        <td>Database Schema and UML Diagrams</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>February 11th</td>
        <td>Basic Desktop Application</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>February 11th</td>
        <td>Preliminary Frontend Website</td>
        <td class="green">You're looking at it</td>
    </tr>
    <tr>
        <td>February 11th</td>
        <td>Create code repository on GitHub</td>
        <td class="green">Complete</td>
    </tr>
</table>

<h4>Intermediate Deliverables</h4>

<table class="future">
    <tr>
        <td>Date (Expected)</td>
        <td>Deliverables</td>
        <td>Status</td>
    </tr>
    <tr>
        <td>February 25th</td>
        <td>Database Schema - Revision</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>February 25th</td>
        <td>Advanced Desktop Application</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>February 25th</td>
        <td>Advanced Website Application</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>Program Refinement</td>
        <td>Create code repository on GitHub</td>
        <td class="green">Complete</td>
    </tr>
</table>

<h4>Final Deliverables</h4>

<table class="future">
    <tr>
        <td>Date (Expected)</td>
        <td>Deliverables</td>
        <td>Status</td>
    </tr>
    <tr>
        <td>April 15th</td>
        <td>Preliminary Mobile Website</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>April 29th</td>
        <td>Advanced Mobile Website</td>
        <td class="green">Complete</td>
    </tr>
    <tr>
        <td>May 6th</td>
        <td>Final Deliverable</td>
        <td class="green">Made it to the promise land!</td>
    </tr>
</table>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideContent" runat="server">
<div id="rightSide">
    <h4>About Us: The Team Behind the Machine</h4>

    <h5>Edward Thiele</h5>
    <p>Some say he only sleeps 2 hours a day, and naps for the other 22 hours. Others claim that he once killed a yak from 200 yards away with mind bullets. All we know is his name: Edward Thiele.</p>

    <h5>Henry Chao</h5>
    <p>Henry is a senior at Rutgers University, studying Electrical and Computer Engineering. He enjoys taking long walks on the beach, and drinking pina coladas.</p>
</div>
</asp:Content>