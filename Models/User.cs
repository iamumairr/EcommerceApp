using System.ComponentModel.DataAnnotations;

namespace ECommerceApp.Models
{
    public class User
    {
        public int Id { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        [StringLength(100)]
        public string Email { get; set; }
        [StringLength(20)]
        public string Password { get; set; }
        public string Address { get; set; }
    }
}