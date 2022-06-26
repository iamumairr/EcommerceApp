using System.ComponentModel.DataAnnotations;

namespace ECommerceApp.Models
{
    public class Category
    {
        public int Id { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        public string Description { get; set; }
    }
}