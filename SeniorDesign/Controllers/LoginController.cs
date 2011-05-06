using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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
                var remoteUsr = sc.CurrentUser();
                Session["UserId"] = remoteUsr;
                creds.CredStatusFailed = false;
                FormsAuthentication.SetAuthCookie(remoteUsr.Username, false);
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

        public ActionResult LogOff(string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            return View(new SeniorDesign.Models.LogOffVerify(){ UserName= ((UserInfo)Session["UserId"]).Username});
        }

        [HttpPost]
        public ActionResult LogOff(SeniorDesign.Models.LogOffVerify model)
        {
            FormsAuthentication.SignOut();
            this.Session.Clear();
            return RedirectToAction("Index");
        }
        

    }
}
