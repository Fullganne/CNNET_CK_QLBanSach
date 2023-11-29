using System;
using System.Collections.Generic;

namespace QLCHS.Entities
{
    public partial class Webaction
    {
        public Webaction()
        {
            Roleactions = new HashSet<Roleaction>();
        }

        public string Id { get; set; } = null!;
        public string? Name { get; set; }

        public virtual ICollection<Roleaction> Roleactions { get; set; }
    }
}
