using System;
using System.Collections.Generic;

namespace CNNET_CK_QLBanSach.Models;

public partial class Roleaction
{
    public string Id { get; set; } = null!;

    public string RoleId { get; set; } = null!;

    public string WebActionId { get; set; } = null!;

    public virtual Role Role { get; set; } = null!;

    public virtual Webaction WebAction { get; set; } = null!;
}
