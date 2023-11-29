using System;
using System.Collections.Generic;

namespace QLCHS.Entities
{
    public partial class Orderdetail
    {
        public string Id { get; set; } = null!;
        public string OrderId { get; set; } = null!;
        public string BookId { get; set; } = null!;
        public decimal? UnitPrice { get; set; }
        public int? Quantity { get; set; }

        public virtual Book Book { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
