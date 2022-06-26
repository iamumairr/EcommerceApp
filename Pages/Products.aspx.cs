using ECommerceApp.Data;
using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceApp.Pages
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropdown();
                PopulateDataList();
            }
        }

        private void PopulateDropdown()
        {
            using (AppDbContext db = new AppDbContext())
            {
                var categories = db.Categories.ToList();

                ddlCategory.DataValueField = "Id";
                ddlCategory.DataTextField = "Name";
                ddlCategory.DataSource = categories;
                ddlCategory.DataBind();
            }
            ddlCategory.Items.Insert(0, new ListItem("--Choose a Category--", "0"));
        }

        private void PopulateDataList()
        {
            using (AppDbContext db = new AppDbContext())
            {
                var products = db.Products.ToList();
                dataList.DataSource = products;
                dataList.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (AppDbContext db = new AppDbContext())
            {
                var products = (from a in db.Products
                                where a.Name.StartsWith(txtSearch.Text.Trim()) ||
                                a.Name.Contains(txtSearch.Text.Trim()) ||
                                a.Name.EndsWith(txtSearch.Text.Trim())
                                select a).ToList();
                if (products != null)
                {
                    dataList.DataSource = products;
                    dataList.DataBind();
                }
                else
                {
                    dataList.DataSource = null;
                    dataList.DataBind();
                }
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddlCategory.SelectedValue);

            using (AppDbContext db = new AppDbContext())
            {
                if (id > 0)
                {
                    var products = db.Products.Where(a => a.CategoryId == id).ToList();
                    if (products != null)
                    {
                        dataList.DataSource = products;
                        dataList.DataBind();
                    }
                    else
                    {
                        dataList.DataSource = null;
                        dataList.DataBind();
                    }
                }
                else
                {
                    var prod = db.Products.ToList();

                    dataList.DataSource = prod;
                    dataList.DataBind();
                }
            }
        }
    }
}