using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SeniorDesign
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    "Default", // Route name
            //    "{controller}/{action}/{id}", // URL with parameters
            //    new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            //);


            routes.MapRoute("GroupFunctions",
                "g.aspx/{group}/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = -1}
           );

            routes.MapRoute(
                "Default", // Route name
                "{controller}.aspx/{action}/{id}/{group}/{data}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional, group = UrlParameter.Optional, data = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }

        public void Session_Start(object sender, EventArgs e)
        {
            ServiceClient sc = new ServiceClient();
            sc.Open();
            Session["ServiceClient"] = sc;
            Session["AuthStatus"] = false;

        }

        public void Session_End(object sender, EventArgs e)
        {
            ServiceClient sc = Session["ServiceClient"] as ServiceClient;
            if (sc != null)
            {
                sc.Close();
            }
        }

        void Application_Error(object sender, EventArgs e)
        {
            Exception exp = Server.GetLastError();
            if (exp is MvcApplication1.UnauthenticatedUserException)
            {
                Server.ClearError();
            }
        }
    }
}