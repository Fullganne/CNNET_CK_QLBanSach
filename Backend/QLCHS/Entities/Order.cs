using System;
using System.Collections.Generic;

namespace QLCHS.Entities
{
    public partial class Order
    {
        public Order()
        {
            Bills = new HashSet<Bill>();
            Orderdetails = new HashSet<Orderdetail>();
        }

        public string Id { get; set; } = null!;
        public string CustomerId { get; set; } = null!;
        public DateTime? OrderDate { get; set; }
        public byte? Status { get; set; }
        public string? Address { get; set; }
        public string? Description { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual ICollection<Bill> Bills { get; set; }
        public virtual ICollection<Orderdetail> Orderdetails { get; set; }
    }
}
