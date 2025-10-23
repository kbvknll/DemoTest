using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class SupplierType
{
    public int SupplierTypeId { get; set; }

    public string TypeName { get; set; } = null!;

    public string? Description { get; set; }

    public virtual ICollection<Supplier> Suppliers { get; set; } = new List<Supplier>();
}
