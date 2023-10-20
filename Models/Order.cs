using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Order
{
    public string Id { get; set; } = null!;

    public string CustomerId { get; set; } = null!;

    public DateTime? OrderDate { get; set; }

    public byte? Status { get; set; }

    public string? Address { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Bill> Bills { get; set; } = new List<Bill>();

    public virtual Customer Customer { get; set; } = null!;

    public virtual ICollection<Orderdetail> Orderdetails { get; set; } = new List<Orderdetail>();
}
