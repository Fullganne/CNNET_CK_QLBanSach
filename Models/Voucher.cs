using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Voucher
{
    public string Id { get; set; } = null!;

    public int? Quantity { get; set; }

    public decimal? PercentDiscount { get; set; }

    public decimal? MaxDiscount { get; set; }

    public virtual ICollection<Bill> Bills { get; set; } = new List<Bill>();
}
