using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class MaterialSupplier
{
    public int MaterialSupplierId { get; set; }

    public int? MaterialId { get; set; }

    public int? SupplierId { get; set; }

    public virtual Material? Material { get; set; }

    public virtual Supplier? Supplier { get; set; }
}
