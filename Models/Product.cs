using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerceApp.Models
{
    public class Product
    {
        public int Id { get; set; }
        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string ProductImage { get; set; }
        public int QuantityAvailable { get; set; }

        public virtual Category Category { get; set; }
    }
}