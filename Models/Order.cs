using System;

namespace ECommerceApp.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public decimal Price { get; set; }
        public DateTime EntryDate { get; set; }

        public virtual User User { get; set; }
    }
}