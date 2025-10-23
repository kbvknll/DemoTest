using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Material
{
    public int MaterialId { get; set; }

    public string MaterialName { get; set; } = null!;

    public int? TypeId { get; set; }

    public int? UnitId { get; set; }

    public decimal UnitPrice { get; set; }

    public decimal QuantityInStock { get; set; }

    public decimal MinQuantity { get; set; }

    public decimal PackageQuantity { get; set; }

    public string? Description { get; set; }

    public byte[]? Image { get; set; }

    public virtual ICollection<MaterialQuantityHistory> MaterialQuantityHistories { get; set; } = new List<MaterialQuantityHistory>();

    public virtual ICollection<MaterialSupplier> MaterialSuppliers { get; set; } = new List<MaterialSupplier>();

    public virtual ICollection<ProductMaterial> ProductMaterials { get; set; } = new List<ProductMaterial>();

    public virtual MaterialType? Type { get; set; }

    public virtual UnitsOfMeasure? Unit { get; set; }

    public override string ToString()
    {
        return MaterialName ?? $"Материал #{MaterialId}";
    }
}
