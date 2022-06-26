using System;
using System.Web;

namespace ECommerceApp
{
    public class SessionManagement
    {
        public void SetUserProperties(string name, string email, bool loggedIn)
        {
            HttpContext.Current.Session["Name"] = name;
            HttpContext.Current.Session["EmailAddress"] = email;
            HttpContext.Current.Session["LoggedIn"] = loggedIn;
        }

        public string GetName()
        {
            if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["Name"])))
            {
                return Convert.ToString(HttpContext.Current.Session["Name"]);
            }
            else
            {
                return string.Empty;
            }
        }
        public string GetEmail()
        {
            if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Session["EmailAddress"])))
            {
                return Convert.ToString(HttpContext.Current.Session["EmailAddress"]);
            }
            else
            {
                return string.Empty;
            }
        }
        public bool GetLoggedIn()
        {
            return Convert.ToBoolean(HttpContext.Current.Session["LoggedIn"]);
        }
        public void Logout()
        {
            HttpContext.Current.Session.Abandon();
        }
    }
}