using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Supplier
{
    public string Id { get; set; } = null!;

    public string? Name { get; set; }

    public string? Email { get; set; }

    public string? Description { get; set; }

    public string Phone { get; set; } = null!;

    public virtual ICollection<Book> Books { get; set; } = new List<Book>();
}
