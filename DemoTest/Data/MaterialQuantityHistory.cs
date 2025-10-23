using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class MaterialQuantityHistory
{
    public int HistoryId { get; set; }

    public int? MaterialId { get; set; }

    public decimal? OldQuantity { get; set; }

    public decimal? NewQuantity { get; set; }

    public DateTime? ChangeDate { get; set; }

    public string? ChangeReason { get; set; }

    public virtual Material? Material { get; set; }
}
