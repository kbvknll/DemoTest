using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class PartnerRatingHistory
{
    public int RatingHistoryId { get; set; }

    public int? PartnerId { get; set; }

    public int? OldRating { get; set; }

    public int? NewRating { get; set; }

    public DateTime? ChangeDate { get; set; }

    public int? ChangedBy { get; set; }

    public string? Reason { get; set; }

    public virtual Employee? ChangedByNavigation { get; set; }

    public virtual Partner? Partner { get; set; }
}
