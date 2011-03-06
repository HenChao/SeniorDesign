using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class UsersController : Controller
    {
        //
        // GET: /Users/

        public ActionResult Index(string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            PagedDataOfUserInfo pdr = sc.GetAllUsers(new PagedDataRequest() { StartRow = 0, EndRow = 10000 });
           
            return View(pdr.Data);
        }

        //
        // GET: /Users/Details/5

        public ActionResult Details(int id)
        {

            return View();
        }

        //
        // GET: /Users/Create

        public ActionResult Create(string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SeniorDesign.Models.CreateUserModel usrMod = new Models.CreateUserModel();
            usrMod.Groups = sc.GetAllGroups(new PagedDataRequest { StartRow = 0, EndRow = 100000 }).Data.ToDictionary(p => p.Name, p => p.Id);
            
            return View(usrMod);
        } 

        //
        // POST: /Users/Create

        [HttpPost]
        public ActionResult Create(SeniorDesign.Models.CreateUserModel usrMod, string action)
        {
            try
            {
                ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
                sc.CreateUser(usrMod.Username, usrMod.Password, usrMod.FirstName, usrMod.LastName, 0, usrMod.GroupId);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Users/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Users/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Users/ChangePassword/5

        public ActionResult ChangePassword(int id, string action)
        {
            Sas.GetAuthenticatedServiceClient(this, action);
            return View(new SeniorDesign.Models.PasswordChangeData());
        }

        [HttpPost]
        public ActionResult ChangePassword(int id, SeniorDesign.Models.PasswordChangeData passwordData, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            if (ModelState.IsValid)
            {
                sc.UpdateUser(id, null, passwordData.Password, null, null, null);   
            }

            return View(passwordData);
        }

        //
        // GET: /Users/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Users/Delete/5

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
