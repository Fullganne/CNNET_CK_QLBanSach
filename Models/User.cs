using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class User
{
    public string Id { get; set; } = null!;

    public string FullName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? Email { get; set; }

    public string Phone { get; set; } = null!;

    public virtual ICollection<Bill> Bills { get; set; } = new List<Bill>();

    public virtual ICollection<Userrole> Userroles { get; set; } = new List<Userrole>();
}
