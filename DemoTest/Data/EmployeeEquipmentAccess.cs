using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class EmployeeEquipmentAccess
{
    public int AccessId { get; set; }

    public int? EmployeeId { get; set; }

    public string EquipmentType { get; set; } = null!;

    public string AccessLevel { get; set; } = null!;

    public virtual Employee? Employee { get; set; }
}
