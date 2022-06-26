using ECommerceApp.Data;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using ECommerceApp.Models;
using ECommerceApp;

namespace ECommerceApp.Pages
{
    public partial class Categories : Page
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
                else
                {
                    BindGridview();
                }
            }
        }

        private void BindGridview()
        {
            using (AppDbContext db = new AppDbContext())
            {
                var categories = db.Categories.ToList<Category>();

                Gridview.DataSource = categories;
                Gridview.DataBind();
            }
        }

        protected void Gridview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview.EditIndex = e.NewEditIndex;
            BindGridview();
        }

        protected void Gridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (IsPostBack)
            {
                int id = (int)Gridview.DataKeys[e.RowIndex].Value;
                using (AppDbContext db = new AppDbContext())
                {
                    var category = db.Categories.Where(a => a.Id == id).SingleOrDefault();
                    if (category != null)
                    {
                        db.Categories.Remove(category);
                        db.SaveChanges();
                    }
                }
                BindGridview();
            }
        }

        protected void Gridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview.EditIndex = -1;
            BindGridview();
        }

        protected void Gridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = Gridview.Rows[e.RowIndex];
            int Id = Convert.ToInt32(Gridview.DataKeys[e.RowIndex].Values[0]);

            string name = (row.FindControl("txtName") as TextBox).Text;
            string description = (row.FindControl("txtDescription") as TextBox).Text;

            using (AppDbContext db = new AppDbContext())
            {
                var category = db.Categories.Find(Id);

                if (category != null)
                {
                    category.Name = name;
                    category.Description = description;

                    db.Entry(category).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            Gridview.EditIndex = -1;
            BindGridview();
        }
    }
}