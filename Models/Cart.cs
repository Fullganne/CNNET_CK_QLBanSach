using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Cart
{
    public string Id { get; set; } = null!;

    public string IdBook { get; set; } = null!;

    public string IdCustomer { get; set; } = null!;

    public virtual Book IdBookNavigation { get; set; } = null!;

    public virtual Customer IdCustomerNavigation { get; set; } = null!;
}
