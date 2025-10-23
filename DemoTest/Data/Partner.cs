using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Partner
{
    public int PartnerId { get; set; }

    public string PartnerType { get; set; } = null!;

    public string CompanyName { get; set; } = null!;

    public string LegalAddress { get; set; } = null!;

    public string Inn { get; set; } = null!;

    public string DirectorName { get; set; } = null!;

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public byte[]? Logo { get; set; }

    public int? Rating { get; set; }

    public string? SalesLocations { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<PartnerRatingHistory> PartnerRatingHistories { get; set; } = new List<PartnerRatingHistory>();

    public virtual ICollection<PartnerSalesHistory> PartnerSalesHistories { get; set; } = new List<PartnerSalesHistory>();
}
