using System.Web.Mvc;

namespace SeniorDesign.Areas.Mobile
{
    public class MobileAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Mobile";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {

            // For mobile development: http://www.asp.net/learn/whitepapers/add-mobile-pages-to-your-aspnet-web-forms-mvc-application
            context.MapRoute(
                "Mobile_default",
                "Mobile/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
