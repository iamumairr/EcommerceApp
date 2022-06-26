using ECommerceApp.Models;
using System.Data.Entity;

namespace ECommerceApp.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base("ECommerceApp")
        {

        }
        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductCart> ProductCarts { get; set; }
    }
}