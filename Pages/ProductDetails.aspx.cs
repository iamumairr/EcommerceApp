using ECommerceApp.Data;
using System;
using System.Linq;
using System.Web.UI;


namespace ECommerceApp.Pages
{
    public partial class ProductDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var id = Convert.ToInt32(Request.QueryString["Id"]);

                using (AppDbContext db = new AppDbContext())
                {
                    var product = db.Products.Where(a => a.Id == id).SingleOrDefault();

                    if (product != null)
                    {
                        txtName.Text = product.Name;
                        txtCategory.Text = product.Category.Name;
                        txtPrice.Text = product.Price.ToString();
                        txtQuantity.Text = product.QuantityAvailable.ToString();
                        txtDescription.Text = product.Description;

                        literal.Text = "<img src=" + '"' + "/Content/Images/" + product.ProductImage + '"' + " width =" + '"' + "300" + '"' + " height =" + '"' + "150" + '"' + " />";
                    }
                }
            }
        }
    }
}