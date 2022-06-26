using ECommerceApp.Data;
using ECommerceApp.Models;
using System;
using System.Data.Entity;
using System.Linq;

namespace ECommerceApp.Pages
{
    public partial class AddToCart : System.Web.UI.Page
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

                var id = Request.QueryString["Id"];
                
                using (AppDbContext db = new AppDbContext())
                {
                    var product = db.Products.Find(Convert.ToInt32(id));

                    string email = obj.GetEmail();
                    var user = db.Users.Where(a => a.Email == email).SingleOrDefault();

                    ProductCart cartItem = new ProductCart()
                    {
                        ProductId = product.Id,
                        UserId = user.Id,
                        Quantity = 1,
                        UnitPrice = product.Price,
                        SubTotal = product.Price * 1
                    };

                    db.ProductCarts.Add(cartItem);
                    db.SaveChanges();

                    Product productUpdate = db.Products.Find(product.Id);

                    if (productUpdate != null)
                    {
                        productUpdate.QuantityAvailable = product.QuantityAvailable - 1;

                        db.Entry(product).State = EntityState.Detached;
                    }

                    db.Entry(productUpdate).State = EntityState.Modified;
                    db.SaveChanges();
                }

                Response.Redirect("~/Pages/Cart.aspx", false);
            }
        }
    }
}