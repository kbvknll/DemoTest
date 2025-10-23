using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Supplier
{
    public int SupplierId { get; set; }

    public string SupplierName { get; set; } = null!;

    public int? SupplierTypeId { get; set; }

    public string Inn { get; set; } = null!;

    public int? Rating { get; set; }

    public DateOnly StartDate { get; set; }

    public virtual ICollection<MaterialSupplier> MaterialSuppliers { get; set; } = new List<MaterialSupplier>();

    public virtual SupplierType? SupplierType { get; set; }
}
