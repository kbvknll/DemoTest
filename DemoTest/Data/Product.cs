using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Product
{
    public int ProductId { get; set; }

    public string Article { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public int? ProductTypeId { get; set; }

    public string? Description { get; set; }

    public byte[]? Image { get; set; }

    public decimal MinPartnerPrice { get; set; }

    public decimal? PackageLength { get; set; }

    public decimal? PackageWidth { get; set; }

    public decimal? PackageHeight { get; set; }

    public decimal? WeightWithoutPackage { get; set; }

    public decimal? WeightWithPackage { get; set; }

    public byte[]? QualityCertificate { get; set; }

    public string? StandardNumber { get; set; }

    public int? ProductionTime { get; set; }

    public decimal? CostPrice { get; set; }

    public int? WorkshopNumber { get; set; }

    public int? WorkersCount { get; set; }

    public virtual ICollection<FinishedProductMovement> FinishedProductMovements { get; set; } = new List<FinishedProductMovement>();

    public virtual ICollection<FinishedProductStock> FinishedProductStocks { get; set; } = new List<FinishedProductStock>();

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual ICollection<PartnerSalesHistory> PartnerSalesHistories { get; set; } = new List<PartnerSalesHistory>();

    public virtual ICollection<ProductMaterial> ProductMaterials { get; set; } = new List<ProductMaterial>();

    public virtual ICollection<ProductPriceHistory> ProductPriceHistories { get; set; } = new List<ProductPriceHistory>();

    public virtual ProductType? ProductType { get; set; }

    public override string ToString()
    {
        return ProductName ?? $"Продукция #{ProductId}";
    }
}
