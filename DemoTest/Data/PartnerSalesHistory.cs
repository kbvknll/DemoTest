using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class PartnerSalesHistory
{
    public int SalesHistoryId { get; set; }

    public int? PartnerId { get; set; }

    public int? ProductId { get; set; }

    public DateOnly SaleDate { get; set; }

    public int QuantitySold { get; set; }

    public decimal SaleAmount { get; set; }

    public virtual Partner? Partner { get; set; }

    public virtual Product? Product { get; set; }
}
