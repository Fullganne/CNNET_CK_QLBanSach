using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Book
{
    public string Id { get; set; } = null!;

    public string? Title { get; set; }

    public string? Image { get; set; }

    public string AuthorId { get; set; } = null!;

    public string SupplierId { get; set; } = null!;

    public decimal? UnitPrice { get; set; }

    public int? PublishYear { get; set; }

    public bool? Available { get; set; }

    public int? Quantity { get; set; }

    public virtual Author Author { get; set; } = null!;

    public virtual ICollection<Bookdetail> Bookdetails { get; set; } = new List<Bookdetail>();

    public virtual ICollection<Cart> Carts { get; set; } = new List<Cart>();

    public virtual ICollection<Orderdetail> Orderdetails { get; set; } = new List<Orderdetail>();

    public virtual Supplier Supplier { get; set; } = null!;
}
