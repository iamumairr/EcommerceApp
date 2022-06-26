using ECommerceApp.Data;
using ECommerceApp.Models;
using System;
using System.Linq;
using System.Web.UI;

namespace ECommerceApp
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string address = txtAddress.Text;

            if (Page.IsValid)
            {
                User users = new User
                {
                    Name = name,
                    Email = email,
                    Password = password,
                    Address = address
                };

                using (AppDbContext db = new AppDbContext())
                {
                    db.Users.Add(users);
                    db.SaveChanges();
                }

                Response.Redirect("~/Account/Login.aspx", false);
            }
        }

        private bool EmailExists(string email)
        {
            using (AppDbContext db = new AppDbContext())
            {
                return db.Users.Any(a => a.Email.Equals(email));
            }
        }

        protected void customValidate_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (EmailExists(txtEmail.Text))
            {
                customValidate.ErrorMessage = "This email already exists.";
                args.IsValid = false;
            }
        }
    }
}