using ECommerceApp;
using ECommerceApp.Data;
using ECommerceApp.Models;
using System;
using System.Web.UI;

namespace OnlineShop.Pages
{
    public partial class AddCategory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SessionManagement obj = new SessionManagement();

                if (obj.GetLoggedIn() == false)
                {
                    Response.Redirect("~/Account/Login.aspx", false);
                }
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string description = txtDescription.Text;

            Category category = new Category
            {
                Name = name,
                Description = description
            };

            using (AppDbContext db = new AppDbContext())
            {
                db.Categories.Add(category);

                db.SaveChanges();
            }

            Response.Redirect("~/Pages/Categories.aspx", false);
        }
    }
}