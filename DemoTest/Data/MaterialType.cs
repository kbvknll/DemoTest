using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class MaterialType
{
    public int TypeId { get; set; }

    public string TypeName { get; set; } = null!;

    public decimal LossCoefficient { get; set; }

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
