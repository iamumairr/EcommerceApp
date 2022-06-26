using ECommerceApp.Data;
using ECommerceApp.Models;
using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceApp.Pages
{
    public partial class AddProduct : Page
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
                    PopulateDropdown();
                }
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
        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                decimal price = Convert.ToDecimal(txtPrice.Text);
                int quantity = Convert.ToInt32(txtQuantity.Text);
                string description = txtDescription.Text;
                var fileUpload = ImageUpload;

                Product product = new Product();
                product.CategoryId = categoryId;
                product.Name = name;
                product.Price = price;
                product.ProductImage = fileUpload.FileName;
                product.Description = description;
                product.QuantityAvailable = quantity;

                using (AppDbContext db = new AppDbContext())
                {
                    db.Products.Add(product);
                    db.SaveChanges();
                }
                FileUpload(ImageUpload);

                Response.Redirect("~/Pages/Products.aspx", false);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        private void FileUpload(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                fileUpload.PostedFile.SaveAs(Server.MapPath("~/Content/Images/") + fileName);
            }
        }
    }
}