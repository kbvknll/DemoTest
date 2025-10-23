using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class UnitsOfMeasure
{
    public int UnitId { get; set; }

    public string UnitName { get; set; } = null!;

    public string? UnitSymbol { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
