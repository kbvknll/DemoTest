using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class ProductType
{
    public int ProductTypeId { get; set; }

    public string TypeName { get; set; } = null!;

    public decimal TypeCoefficient { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();

    public override string ToString()
    {
        return TypeName ?? $"Тип #{ProductTypeId}";
    }
}
