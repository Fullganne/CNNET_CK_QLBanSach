using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Author
{
    public string Id { get; set; } = null!;

    public string? Name { get; set; }

    public string? Image { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Book> Books { get; set; } = new List<Book>();
}
