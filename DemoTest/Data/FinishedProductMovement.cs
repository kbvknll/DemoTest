using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class FinishedProductMovement
{
    public int MovementId { get; set; }

    public int? ProductId { get; set; }

    public int Quantity { get; set; }

    public string? MovementType { get; set; }

    public DateTime? MovementDate { get; set; }

    public int? OrderId { get; set; }

    public string? Notes { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Product? Product { get; set; }
}
