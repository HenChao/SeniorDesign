using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class FullUserInfo
    {
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Id { get; set; }
    }

    public class UserPermission
    {
        public string PermissionName { get; set; }
        public string Group { get; set; }
        public int Id { get; set; }
    }
}