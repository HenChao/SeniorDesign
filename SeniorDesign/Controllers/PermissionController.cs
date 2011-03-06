using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class PermissionController : Controller
    {
        // id: User ID
        // GET: /Permission/{id}

        public ActionResult Index(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SeniorDesign.Models.PermissionsForUser lst = new Models.PermissionsForUser();
            lst.Permissions = sc.GetPermissions(id).ToList();
            lst.UserID = id;
            lst.UserName = sc.GetUser(id).Username;
            return View(lst);
        }

        //
        // GET: /Permission/Create

        public ActionResult Create(string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SeniorDesign.Models.PermissionGrant pg = new Models.PermissionGrant();
            pg.Groups = sc.GetAllGroups(new PagedDataRequest { StartRow = 0, EndRow = 100000 }).Data.ToDictionary(p=>p.Name, p=>p.Id);
            pg.Permissions = (new string[] { "admin", "member", "issuer"}).ToList();

            return View(pg);
        } 

        //
        // POST: /Permission/Create

        [HttpPost]
        public ActionResult Create(int id, SeniorDesign.Models.PermissionGrant pg, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.Grant(id, pg.GroupID, pg.Permission);
            return RedirectToAction("Index", "Permission", new { id = id });
        }
        

        //
        // GET: /Permission/Delete/5

        public ActionResult Delete(int id, int group, string data, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            UserInfo usr = sc.GetUser(id);
            GroupInfo gpr = sc.GetGroup(group);
            SeniorDesign.Models.FullPermissionInfo fpi = new Models.FullPermissionInfo()
            {
                GroupId = group,
                GroupName = gpr.Name,
                PermissionName = data,
                UserID = id,
                UserName = usr.Username
            };

            return View(fpi);
        }

        //
        // POST: /Permission/Delete/5

        [HttpPost]
        public ActionResult Delete(SeniorDesign.Models.FullPermissionInfo fpi, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.Deny(fpi.UserID, fpi.GroupId, fpi.PermissionName);

            return RedirectToAction("Index", "Permission", new { id = fpi.UserID });
        }
    }
}
