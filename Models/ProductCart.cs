namespace ECommerceApp.Models
{
    public class ProductCart
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public int Quantity { get; set; }
        public decimal? UnitPrice { get; set; }
        public decimal? SubTotal { get; set; }
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}