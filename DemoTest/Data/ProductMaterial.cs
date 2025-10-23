using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class ProductMaterial
{
    public int ProductMaterialId { get; set; }

    public int? ProductId { get; set; }

    public int? MaterialId { get; set; }

    public decimal QuantityRequired { get; set; }

    public virtual Material? Material { get; set; }

    public virtual Product? Product { get; set; }
}
