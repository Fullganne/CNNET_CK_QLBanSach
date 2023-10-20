using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Role
{
    public string Id { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<Roleaction> Roleactions { get; set; } = new List<Roleaction>();

    public virtual ICollection<Userrole> Userroles { get; set; } = new List<Userrole>();
}
