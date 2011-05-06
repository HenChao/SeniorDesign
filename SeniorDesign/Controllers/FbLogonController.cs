using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Facebook;
using System.Web.Security;

namespace SeniorDesign.Controllers
{
    public class FbLogonController : Controller
    {
        //TODO: FixURLs
        private const string logoffUrl = "http://localhost:3434/";
        private const string redirectUrl = "http://localhost:3434/g.aspx/2/FbLogon/OAuth";
        //
        // GET: /FbLogon/

        public ActionResult Index()
        {
            var oAuthClient = new FacebookOAuthClient(FacebookApplication.Current);
            oAuthClient.RedirectUri = new Uri(redirectUrl);
            var loginUri = oAuthClient.GetLoginUrl(new Dictionary<string, object> { { "state", "none" } });
            return Redirect(loginUri.AbsoluteUri);
        }

        public ActionResult OAuth(string code, string state)
        {
            FacebookOAuthResult oauthResult;
            if (FacebookOAuthResult.TryParse(Request.Url, out oauthResult))
            {
                if (oauthResult.IsSuccess)
                {
                    var oAuthClient = new FacebookOAuthClient(FacebookApplication.Current);
                    oAuthClient.RedirectUri = new Uri(redirectUrl);
                    dynamic tokenResult = oAuthClient.ExchangeCodeForAccessToken(code);
                    string accessToken = tokenResult.access_token;

                    DateTime expiresOn = DateTime.MaxValue;

                    if (tokenResult.ContainsKey("expires"))
                    {
                        DateTimeConvertor.FromUnixTime(tokenResult.expires);
                    }

                    FacebookClient fbClient = new FacebookClient(accessToken);
                    dynamic me = fbClient.Get("me?fields=id,name");
                    long facebookId = Convert.ToInt64(me.id);
                    Auth(facebookId.ToString());

                    //InMemoryUserStore.Add(new FacebookUser
                    //{
                    //    AccessToken = accessToken,
                    //    Expires = expiresOn,
                    //    FacebookId = facebookId,
                    //    Name = (string)me.name,
                    //});

                    //FormsAuthentication.SetAuthCookie(facebookId.ToString(), false);

                    // prevent open redirection attack by checking if the url is local.
                    //if (Url.IsLocalUrl(state))
                    //{
                    //    return Redirect(state);
                    //}
                    //else
                    //{
                    //    return RedirectToAction("Index", "Home");
                    //}
                    return RedirectToAction("Index", "Home");

                }
            }

            return RedirectToAction("Index", "Home");
        }

        private bool Auth(string FacebookId)
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
          
            bool auth = sc.FbAuthenticate("AlphaMikeFoxtrot", FacebookId);
            if (auth)
            {
                Session["AuthStatus"] = true;
                var remoteUsr = sc.CurrentUser();
                Session["UserId"] = remoteUsr;
                FormsAuthentication.SetAuthCookie(remoteUsr.Username, false);
                return true;
            }
            else
            {
                Session["AuthStatus"] = false;
                return false;
            }
        }
    }
}
