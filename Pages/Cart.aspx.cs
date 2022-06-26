using ECommerceApp.Data;
using ECommerceApp.Models;
using System;
using System.Data.Entity;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceApp.Pages
{
    public partial class Cart : Page
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
                    btnChekout.Visible = true;
                    BindGridview();
                }
            }
        }
        private void BindGridview()
        {
            SessionManagement obj = new SessionManagement();
            string email = obj.GetEmail();

            using (AppDbContext db = new AppDbContext())
            {
                var cartItems = db.ProductCarts.Where(a => a.User.Email == email).ToList();

                Gridview.DataSource = cartItems;
                Gridview.DataBind();
            }
            txtTotal.Text = GetTotal().ToString();
        }
        protected void Gridview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview.EditIndex = e.NewEditIndex;
            btnChekout.Visible = false;
            BindGridview();
        }

        protected void Gridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (IsPostBack)
            {
                int id = (int)Gridview.DataKeys[e.RowIndex].Value;
                using (AppDbContext db = new AppDbContext())
                {
                    var item = db.ProductCarts.Where(a => a.Id == id).SingleOrDefault();
                    if (item != null)
                    {
                        db.ProductCarts.Remove(item);
                        db.SaveChanges();
                    }
                }
                BindGridview();
            }
        }

        protected void Gridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview.EditIndex = -1;
            btnChekout.Visible = true;
            BindGridview();
        }

        protected void Gridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = Gridview.Rows[e.RowIndex];
            int Id = Convert.ToInt32(Gridview.DataKeys[e.RowIndex].Values[0]);

            int quantity = Convert.ToInt32((row.FindControl("txtQuantityEdit") as TextBox).Text);

            using (AppDbContext db = new AppDbContext())
            {
                int qtyChanged;

                ProductCart cart = db.ProductCarts.Where(a => a.Id == Id).FirstOrDefault();
                var product = db.Products.Find(cart.ProductId);

                if (quantity > 1)
                {
                    if (quantity > cart.Quantity)
                    {
                        qtyChanged = quantity - cart.Quantity;
                        product.QuantityAvailable -= qtyChanged;
                    }
                    else
                    {
                        qtyChanged = cart.Quantity - quantity;
                        product.QuantityAvailable += qtyChanged;
                    }

                }
                if (cart.Quantity > quantity && quantity == 1)
                {
                    qtyChanged = cart.Quantity - quantity;
                    product.QuantityAvailable += qtyChanged;
                }
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();

                if (cart != null)
                {
                    cart.Quantity = quantity;
                    cart.SubTotal = quantity * cart.UnitPrice;

                    db.Entry(cart).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }
            Gridview.EditIndex = -1;
            btnChekout.Visible = true;
            BindGridview();
        }

        public decimal GetTotal()
        {
            SessionManagement obj = new SessionManagement();

            string email = obj.GetEmail();

            decimal? total = decimal.Zero;
            using (AppDbContext db = new AppDbContext())
            {
                total = db.ProductCarts.Where(a => a.User.Email == email).Select(a => a.Quantity * a.UnitPrice).Sum();
            }

            return total ?? decimal.Zero;
        }

        protected void btnChekout_Click(object sender, EventArgs e)
        {
            SessionManagement userobj = new SessionManagement();

            if (Convert.ToDecimal(txtTotal.Text.ToString()) == 0.00m)
            {
                Response.Write("<script>alert('Cart is empty')</script>");
            }
            else
            {
                string email = userobj.GetEmail();
                using (AppDbContext db = new AppDbContext())
                {
                    var user = db.Users.Where(a => a.Email == email).SingleOrDefault();

                    Order order = new Order()
                    {
                        UserId = user.Id,
                        Name = user.Name,
                        Email = user.Email,
                        Address = user.Address,
                        Price = GetTotal(),
                        EntryDate = DateTime.Now
                    };

                    db.Orders.Add(order);

                    db.SaveChanges();

                    var cartItems = db.ProductCarts.Where(a => a.User.Email == email);

                    db.ProductCarts.RemoveRange(cartItems);
                    db.SaveChanges();
                }

                BindGridview();
                txtMessage.Text = "Order Submitted Successfully";
            }
        }
    }
}