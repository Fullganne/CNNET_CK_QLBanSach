using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Bookdetail
{
    public string Id { get; set; } = null!;

    public string BookId { get; set; } = null!;

    public string CategoryId { get; set; } = null!;

    public string? Dimensions { get; set; }

    public int? Pages { get; set; }

    public string? Description { get; set; }

    public virtual Book Book { get; set; } = null!;

    public virtual Category Category { get; set; } = null!;
}
