using ECommerceApp.Data;
using System;
using System.Linq;
using System.Web.UI;

namespace ECommerceApp.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                errorMessage.Visible = false;
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(txtEmail.Text, txtPassword.Text))
            {
                    Response.Redirect("~/Default.aspx", false);
            }
            else
            {
                errorMessage.InnerText = "Email address or password is invalid!";
                errorMessage.Visible = true;
            }
        }
        private bool AuthenticateUser(string email, string password)
        {
            using (AppDbContext db = new AppDbContext())
            {
                var user = db.Users.FirstOrDefault(a => a.Email == email && a.Password == password);
                if (user != null)
                {
                    SessionManagement obj = new SessionManagement();
                    obj.SetUserProperties(user.Name, user.Email, true);

                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}