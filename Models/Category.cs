using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Category
{
    public string Id { get; set; } = null!;

    public string? Name { get; set; }

    public virtual ICollection<Bookdetail> Bookdetails { get; set; } = new List<Bookdetail>();
}
