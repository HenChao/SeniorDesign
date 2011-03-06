using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Index()
        {
            return View(new SeniorDesign.Models.UsernamePasswordCreds());
        }


        [HttpPost]
        public ActionResult Index(SeniorDesign.Models.UsernamePasswordCreds creds)
        {
            ServiceClient sc = Session["ServiceClient"] as ServiceClient;
            if (sc == null || sc.State == System.ServiceModel.CommunicationState.Faulted)
            {
                sc = new ServiceClient();
                Session["ServiceClient"] = sc;
            }

            if (sc.State != System.ServiceModel.CommunicationState.Opened)
            {
                sc.Open();
            }

            bool auth = sc.UsernamePasswordAuthenticate(creds.Username, creds.Password);
           
            if (auth)
            {
                Session["AuthStatus"] = true;
                Session["UserId"] = sc.CurrentUser();
                creds.CredStatusFailed = false;
                if ((Session["LoginRedirectUrl"] != null))
                {
                    Response.Redirect(Session["LoginRedirectUrl"].ToString());
                }
                else
                {
                    RedirectToAction("Index", "Home");
                }
            }
            else
            {
                Session["AuthStatus"] = false;
                creds.CredStatusFailed = true;
            }
            
            
            
            return View(creds);
        }

    }
}
