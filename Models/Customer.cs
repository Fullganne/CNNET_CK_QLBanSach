using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Customer
{
    public string Id { get; set; } = null!;

    public string? FullName { get; set; }

    public string? Photo { get; set; }

    public string? Activated { get; set; }

    public string? Password { get; set; }

    public string? Email { get; set; }

    public string Phone { get; set; } = null!;

    public virtual ICollection<Cart> Carts { get; set; } = new List<Cart>();

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
