using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign
{
    public class Sas
    {
        public static ServiceClient GetAuthenticatedServiceClient(System.Web.Mvc.Controller callingControler, string action)
        {
            ServiceClient sc = callingControler.Session["ServiceClient"] as ServiceClient;
            bool AuthStatus = (bool)callingControler.Session["AuthStatus"];
            if (AuthStatus && sc != null && sc.State != System.ServiceModel.CommunicationState.Faulted)
            {
                return sc;
            }
            callingControler.Session["LoginRedirectUrl"] = callingControler.Url.Action(action, callingControler.RouteData.Values);
            callingControler.Response.Redirect("~/Login.aspx");
            throw new MvcApplication1.UnauthenticatedUserException();
        }

        public static int GetLoggedInUserId(System.Web.Mvc.Controller callingControler, string action)
        {
            ServiceClient sc = callingControler.Session["ServiceClient"] as ServiceClient;
            bool AuthStatus = (bool)callingControler.Session["AuthStatus"];
            if (AuthStatus && sc != null && sc.State != System.ServiceModel.CommunicationState.Faulted)
            {
                return ((UserInfo)callingControler.Session["UserId"]).Id;
            }
            callingControler.Session["LoginRedirectUrl"] = callingControler.Url.Action(action, callingControler.RouteData.Values);
            callingControler.Response.Redirect("~/Login.aspx");
            throw new MvcApplication1.UnauthenticatedUserException();
        }
    }
}