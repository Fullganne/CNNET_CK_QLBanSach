using System;
using System.Collections.Generic;

namespace QLCHS.Entities
{
    public partial class Customer
    {
        public Customer()
        {
            Carts = new HashSet<Cart>();
            Orders = new HashSet<Order>();
        }

        public string? Id { get; set; }
        public string? FullName { get; set; }
        public string? Photo { get; set; }
        public bool? Activated { get; set; }
        public string? Password { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }

        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
