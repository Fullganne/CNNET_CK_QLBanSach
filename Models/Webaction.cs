using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Webaction
{
    public string Id { get; set; } = null!;

    public string? Name { get; set; }

    public virtual ICollection<Roleaction> Roleactions { get; set; } = new List<Roleaction>();
}
