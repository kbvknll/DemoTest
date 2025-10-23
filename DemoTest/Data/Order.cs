using System;
using System.Collections.Generic;

namespace DemoTest.Data;

public partial class Order
{
    public int OrderId { get; set; }

    public int? PartnerId { get; set; }

    public int? ManagerId { get; set; }

    public DateTime? OrderDate { get; set; }

    public string? Status { get; set; }

    public bool? PrepaymentReceived { get; set; }

    public DateTime? PrepaymentDate { get; set; }

    public bool? FullPaymentReceived { get; set; }

    public DateTime? FullPaymentDate { get; set; }

    public string? DeliveryMethod { get; set; }

    public DateTime? CompletionDate { get; set; }

    public virtual ICollection<FinishedProductMovement> FinishedProductMovements { get; set; } = new List<FinishedProductMovement>();

    public virtual Employee? Manager { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual Partner? Partner { get; set; }
}
