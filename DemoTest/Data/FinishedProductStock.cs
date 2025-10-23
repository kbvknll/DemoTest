using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class FinishedProductStock
{
    public int StockId { get; set; }

    public int? ProductId { get; set; }

    public int Quantity { get; set; }

    public int? ReservedQuantity { get; set; }

    public DateTime? LastUpdated { get; set; }

    public virtual Product? Product { get; set; }
}
