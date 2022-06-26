using ECommerceApp.Data;
using System;
using System.Linq;
using System.Web.UI;

namespace ECommerceApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SessionManagement profile = new SessionManagement();

                if (string.IsNullOrEmpty(profile.GetName()) || string.IsNullOrEmpty(profile.GetEmail()) || profile.GetLoggedIn() == false)
                {
                    RegisterLogin.Visible = true;
                    LoginPanel.Visible = false;
                }
                else
                {
                    SessionManagement obj = new SessionManagement();
                    name.InnerText = obj.GetName();
                    username.InnerText = obj.GetName();
                    email.InnerText = obj.GetEmail();

                    using (AppDbContext db = new AppDbContext())
                    {
                        cartvalue.InnerText = db.ProductCarts.Where(a => a.User.Email == email.InnerText).Count().ToString();
                    }

                    RegisterLogin.Visible = false;
                    LoginPanel.Visible = true;
                }
            }
        }
    }
}