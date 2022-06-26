using System;
using System.Web.UI;

namespace ECommerceApp
{
    public partial class Logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SessionManagement profile = new SessionManagement();
                profile.Logout();

                Response.Redirect("~/Login.aspx", false);
            }
        }
    }
}