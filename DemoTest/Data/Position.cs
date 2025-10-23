using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Position
{
    public int PositionId { get; set; }

    public string PositionName { get; set; } = null!;

    public string? SalaryRange { get; set; }

    public string? Responsibilities { get; set; }

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
