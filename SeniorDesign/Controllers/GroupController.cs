using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class GroupController : Controller
    {
        //
        // GET: /Group/

        public ActionResult Index(string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            if (sc != null)
            {
                //PagedDataOfGroupInfo groups = sc.GetAllGroups(new PagedDataRequest() { StartRow = 0, EndRow = 10000 });
                return View(sc.GetGroupsForUser(((UserInfo)Session["UserId"]).Id));
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }

        //
        // GET: /Group/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Group/Create

        [HttpPost]
        public ActionResult Create(GroupInfo gi, string action)
        {
            try
            {
                ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
                if (sc != null)
                {
                    sc.CreateGroup(gi.Name, gi.Description);
                }
                
                return RedirectToAction("Index");
            }
            catch
            {
                return View(gi);
            }
        }
        
        //
        // GET: /Group/Edit/5
 
        public ActionResult Edit(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            if (sc != null)
            {
                GroupInfo gi = sc.GetGroup(id);
                return View(gi);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }

        //
        // POST: /Group/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, GroupInfo gi, string action)
        {
            try
            {
                ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
                if (sc != null)
                {
                    sc.UpdateGroup(id, gi.Name, gi.Description);
                }
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Group/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Group/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
