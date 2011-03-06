using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class CreateUserModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int GroupId { get; set; }
        public Dictionary<string, int> Groups { get; set; }
    }
}