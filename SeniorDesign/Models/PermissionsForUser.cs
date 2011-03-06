using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class PermissionsForUser
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public List<PermissionInfo> Permissions { get; set; }
    }
}