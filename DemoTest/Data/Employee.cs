using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Employee
{
    public int EmployeeId { get; set; }

    public string FullName { get; set; } = null!;

    public int? PositionId { get; set; }

    public DateOnly BirthDate { get; set; }

    public string PassportData { get; set; } = null!;

    public string BankDetails { get; set; } = null!;

    public string? FamilyStatus { get; set; }

    public string? HealthStatus { get; set; }

    public DateOnly? HireDate { get; set; }

    public virtual ICollection<EmployeeEquipmentAccess> EmployeeEquipmentAccesses { get; set; } = new List<EmployeeEquipmentAccess>();

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<PartnerRatingHistory> PartnerRatingHistories { get; set; } = new List<PartnerRatingHistory>();

    public virtual Position? Position { get; set; }
}
