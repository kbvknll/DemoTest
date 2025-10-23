using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DemoTest.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<EmployeeEquipmentAccess> EmployeeEquipmentAccesses { get; set; }

    public virtual DbSet<FinishedProductMovement> FinishedProductMovements { get; set; }

    public virtual DbSet<FinishedProductStock> FinishedProductStocks { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<MaterialQuantityHistory> MaterialQuantityHistories { get; set; }

    public virtual DbSet<MaterialSupplier> MaterialSuppliers { get; set; }

    public virtual DbSet<MaterialType> MaterialTypes { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderItem> OrderItems { get; set; }

    public virtual DbSet<Partner> Partners { get; set; }

    public virtual DbSet<PartnerRatingHistory> PartnerRatingHistories { get; set; }

    public virtual DbSet<PartnerSalesHistory> PartnerSalesHistories { get; set; }

    public virtual DbSet<Position> Positions { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductMaterial> ProductMaterials { get; set; }

    public virtual DbSet<ProductPriceHistory> ProductPriceHistories { get; set; }

    public virtual DbSet<ProductType> ProductTypes { get; set; }

    public virtual DbSet<Supplier> Suppliers { get; set; }

    public virtual DbSet<SupplierType> SupplierTypes { get; set; }

    public virtual DbSet<UnitsOfMeasure> UnitsOfMeasures { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=TestDemo;Username=postgres;Password=2006");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.EmployeeId).HasName("employees_pkey");

            entity.ToTable("employees");

            entity.HasIndex(e => e.PassportData, "employees_passport_data_key").IsUnique();

            entity.HasIndex(e => e.PositionId, "idx_employees_position");

            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.BankDetails)
                .HasMaxLength(255)
                .HasColumnName("bank_details");
            entity.Property(e => e.BirthDate).HasColumnName("birth_date");
            entity.Property(e => e.FamilyStatus)
                .HasMaxLength(50)
                .HasColumnName("family_status");
            entity.Property(e => e.FullName)
                .HasMaxLength(255)
                .HasColumnName("full_name");
            entity.Property(e => e.HealthStatus).HasColumnName("health_status");
            entity.Property(e => e.HireDate)
                .HasDefaultValueSql("CURRENT_DATE")
                .HasColumnName("hire_date");
            entity.Property(e => e.PassportData)
                .HasMaxLength(255)
                .HasColumnName("passport_data");
            entity.Property(e => e.PositionId).HasColumnName("position_id");

            entity.HasOne(d => d.Position).WithMany(p => p.Employees)
                .HasForeignKey(d => d.PositionId)
                .HasConstraintName("employees_position_id_fkey");
        });

        modelBuilder.Entity<EmployeeEquipmentAccess>(entity =>
        {
            entity.HasKey(e => e.AccessId).HasName("employee_equipment_access_pkey");

            entity.ToTable("employee_equipment_access");

            entity.HasIndex(e => new { e.EmployeeId, e.EquipmentType }, "employee_equipment_access_employee_id_equipment_type_key").IsUnique();

            entity.Property(e => e.AccessId).HasColumnName("access_id");
            entity.Property(e => e.AccessLevel)
                .HasMaxLength(50)
                .HasColumnName("access_level");
            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.EquipmentType)
                .HasMaxLength(100)
                .HasColumnName("equipment_type");

            entity.HasOne(d => d.Employee).WithMany(p => p.EmployeeEquipmentAccesses)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("employee_equipment_access_employee_id_fkey");
        });

        modelBuilder.Entity<FinishedProductMovement>(entity =>
        {
            entity.HasKey(e => e.MovementId).HasName("finished_product_movement_pkey");

            entity.ToTable("finished_product_movement");

            entity.Property(e => e.MovementId).HasColumnName("movement_id");
            entity.Property(e => e.MovementDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("movement_date");
            entity.Property(e => e.MovementType)
                .HasMaxLength(20)
                .HasColumnName("movement_type");
            entity.Property(e => e.Notes).HasColumnName("notes");
            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.Quantity).HasColumnName("quantity");

            entity.HasOne(d => d.Order).WithMany(p => p.FinishedProductMovements)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("finished_product_movement_order_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.FinishedProductMovements)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("finished_product_movement_product_id_fkey");
        });

        modelBuilder.Entity<FinishedProductStock>(entity =>
        {
            entity.HasKey(e => e.StockId).HasName("finished_product_stock_pkey");

            entity.ToTable("finished_product_stock");

            entity.Property(e => e.StockId).HasColumnName("stock_id");
            entity.Property(e => e.LastUpdated)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("last_updated");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.Quantity).HasColumnName("quantity");
            entity.Property(e => e.ReservedQuantity)
                .HasDefaultValue(0)
                .HasColumnName("reserved_quantity");

            entity.HasOne(d => d.Product).WithMany(p => p.FinishedProductStocks)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("finished_product_stock_product_id_fkey");
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.MaterialId).HasName("materials_pkey");

            entity.ToTable("materials");

            entity.HasIndex(e => e.MaterialName, "idx_materials_name");

            entity.Property(e => e.MaterialId).HasColumnName("material_id");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.MaterialName)
                .HasMaxLength(255)
                .HasColumnName("material_name");
            entity.Property(e => e.MinQuantity)
                .HasPrecision(10, 2)
                .HasColumnName("min_quantity");
            entity.Property(e => e.PackageQuantity)
                .HasPrecision(10, 2)
                .HasColumnName("package_quantity");
            entity.Property(e => e.QuantityInStock)
                .HasPrecision(10, 2)
                .HasColumnName("quantity_in_stock");
            entity.Property(e => e.TypeId).HasColumnName("type_id");
            entity.Property(e => e.UnitId).HasColumnName("unit_id");
            entity.Property(e => e.UnitPrice)
                .HasPrecision(10, 2)
                .HasColumnName("unit_price");

            entity.HasOne(d => d.Type).WithMany(p => p.Materials)
                .HasForeignKey(d => d.TypeId)
                .HasConstraintName("materials_type_id_fkey");

            entity.HasOne(d => d.Unit).WithMany(p => p.Materials)
                .HasForeignKey(d => d.UnitId)
                .HasConstraintName("materials_unit_id_fkey");
        });

        modelBuilder.Entity<MaterialQuantityHistory>(entity =>
        {
            entity.HasKey(e => e.HistoryId).HasName("material_quantity_history_pkey");

            entity.ToTable("material_quantity_history");

            entity.Property(e => e.HistoryId).HasColumnName("history_id");
            entity.Property(e => e.ChangeDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("change_date");
            entity.Property(e => e.ChangeReason)
                .HasMaxLength(255)
                .HasColumnName("change_reason");
            entity.Property(e => e.MaterialId).HasColumnName("material_id");
            entity.Property(e => e.NewQuantity)
                .HasPrecision(10, 2)
                .HasColumnName("new_quantity");
            entity.Property(e => e.OldQuantity)
                .HasPrecision(10, 2)
                .HasColumnName("old_quantity");

            entity.HasOne(d => d.Material).WithMany(p => p.MaterialQuantityHistories)
                .HasForeignKey(d => d.MaterialId)
                .HasConstraintName("material_quantity_history_material_id_fkey");
        });

        modelBuilder.Entity<MaterialSupplier>(entity =>
        {
            entity.HasKey(e => e.MaterialSupplierId).HasName("material_suppliers_pkey");

            entity.ToTable("material_suppliers");

            entity.HasIndex(e => e.MaterialId, "idx_material_suppliers_material");

            entity.HasIndex(e => e.SupplierId, "idx_material_suppliers_supplier");

            entity.HasIndex(e => new { e.MaterialId, e.SupplierId }, "material_suppliers_material_id_supplier_id_key").IsUnique();

            entity.Property(e => e.MaterialSupplierId).HasColumnName("material_supplier_id");
            entity.Property(e => e.MaterialId).HasColumnName("material_id");
            entity.Property(e => e.SupplierId).HasColumnName("supplier_id");

            entity.HasOne(d => d.Material).WithMany(p => p.MaterialSuppliers)
                .HasForeignKey(d => d.MaterialId)
                .HasConstraintName("material_suppliers_material_id_fkey");

            entity.HasOne(d => d.Supplier).WithMany(p => p.MaterialSuppliers)
                .HasForeignKey(d => d.SupplierId)
                .HasConstraintName("material_suppliers_supplier_id_fkey");
        });

        modelBuilder.Entity<MaterialType>(entity =>
        {
            entity.HasKey(e => e.TypeId).HasName("material_types_pkey");

            entity.ToTable("material_types");

            entity.HasIndex(e => e.TypeName, "material_types_type_name_key").IsUnique();

            entity.Property(e => e.TypeId).HasColumnName("type_id");
            entity.Property(e => e.LossCoefficient)
                .HasPrecision(5, 4)
                .HasColumnName("loss_coefficient");
            entity.Property(e => e.TypeName)
                .HasMaxLength(100)
                .HasColumnName("type_name");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("orders_pkey");

            entity.ToTable("orders");

            entity.HasIndex(e => e.PartnerId, "idx_orders_partner");

            entity.HasIndex(e => e.Status, "idx_orders_status");

            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.CompletionDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("completion_date");
            entity.Property(e => e.DeliveryMethod)
                .HasMaxLength(50)
                .HasColumnName("delivery_method");
            entity.Property(e => e.FullPaymentDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("full_payment_date");
            entity.Property(e => e.FullPaymentReceived)
                .HasDefaultValue(false)
                .HasColumnName("full_payment_received");
            entity.Property(e => e.ManagerId).HasColumnName("manager_id");
            entity.Property(e => e.OrderDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("order_date");
            entity.Property(e => e.PartnerId).HasColumnName("partner_id");
            entity.Property(e => e.PrepaymentDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("prepayment_date");
            entity.Property(e => e.PrepaymentReceived)
                .HasDefaultValue(false)
                .HasColumnName("prepayment_received");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .HasDefaultValueSql("'CREATED'::character varying")
                .HasColumnName("status");

            entity.HasOne(d => d.Manager).WithMany(p => p.Orders)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("orders_manager_id_fkey");

            entity.HasOne(d => d.Partner).WithMany(p => p.Orders)
                .HasForeignKey(d => d.PartnerId)
                .HasConstraintName("orders_partner_id_fkey");
        });

        modelBuilder.Entity<OrderItem>(entity =>
        {
            entity.HasKey(e => e.OrderItemId).HasName("order_items_pkey");

            entity.ToTable("order_items");

            entity.HasIndex(e => e.OrderId, "idx_order_items_order");

            entity.Property(e => e.OrderItemId).HasColumnName("order_item_id");
            entity.Property(e => e.Discount)
                .HasPrecision(5, 2)
                .HasDefaultValueSql("0")
                .HasColumnName("discount");
            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.ProductionDate).HasColumnName("production_date");
            entity.Property(e => e.Quantity).HasColumnName("quantity");
            entity.Property(e => e.UnitPrice)
                .HasPrecision(10, 2)
                .HasColumnName("unit_price");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("order_items_order_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderItems)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("order_items_product_id_fkey");
        });

        modelBuilder.Entity<Partner>(entity =>
        {
            entity.HasKey(e => e.PartnerId).HasName("partners_pkey");

            entity.ToTable("partners");

            entity.HasIndex(e => e.CompanyName, "partners_company_name_key").IsUnique();

            entity.HasIndex(e => e.Inn, "partners_inn_key").IsUnique();

            entity.Property(e => e.PartnerId).HasColumnName("partner_id");
            entity.Property(e => e.CompanyName)
                .HasMaxLength(255)
                .HasColumnName("company_name");
            entity.Property(e => e.DirectorName)
                .HasMaxLength(255)
                .HasColumnName("director_name");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.Inn)
                .HasMaxLength(12)
                .HasColumnName("inn");
            entity.Property(e => e.LegalAddress).HasColumnName("legal_address");
            entity.Property(e => e.Logo).HasColumnName("logo");
            entity.Property(e => e.PartnerType)
                .HasMaxLength(50)
                .HasColumnName("partner_type");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .HasColumnName("phone");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.SalesLocations).HasColumnName("sales_locations");
        });

        modelBuilder.Entity<PartnerRatingHistory>(entity =>
        {
            entity.HasKey(e => e.RatingHistoryId).HasName("partner_rating_history_pkey");

            entity.ToTable("partner_rating_history");

            entity.Property(e => e.RatingHistoryId).HasColumnName("rating_history_id");
            entity.Property(e => e.ChangeDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("change_date");
            entity.Property(e => e.ChangedBy).HasColumnName("changed_by");
            entity.Property(e => e.NewRating).HasColumnName("new_rating");
            entity.Property(e => e.OldRating).HasColumnName("old_rating");
            entity.Property(e => e.PartnerId).HasColumnName("partner_id");
            entity.Property(e => e.Reason).HasColumnName("reason");

            entity.HasOne(d => d.ChangedByNavigation).WithMany(p => p.PartnerRatingHistories)
                .HasForeignKey(d => d.ChangedBy)
                .HasConstraintName("partner_rating_history_changed_by_fkey");

            entity.HasOne(d => d.Partner).WithMany(p => p.PartnerRatingHistories)
                .HasForeignKey(d => d.PartnerId)
                .HasConstraintName("partner_rating_history_partner_id_fkey");
        });

        modelBuilder.Entity<PartnerSalesHistory>(entity =>
        {
            entity.HasKey(e => e.SalesHistoryId).HasName("partner_sales_history_pkey");

            entity.ToTable("partner_sales_history");

            entity.HasIndex(e => e.SaleDate, "idx_partner_sales_date");

            entity.HasIndex(e => e.PartnerId, "idx_partner_sales_partner");

            entity.Property(e => e.SalesHistoryId).HasColumnName("sales_history_id");
            entity.Property(e => e.PartnerId).HasColumnName("partner_id");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.QuantitySold).HasColumnName("quantity_sold");
            entity.Property(e => e.SaleAmount)
                .HasPrecision(12, 2)
                .HasColumnName("sale_amount");
            entity.Property(e => e.SaleDate).HasColumnName("sale_date");

            entity.HasOne(d => d.Partner).WithMany(p => p.PartnerSalesHistories)
                .HasForeignKey(d => d.PartnerId)
                .HasConstraintName("partner_sales_history_partner_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.PartnerSalesHistories)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("partner_sales_history_product_id_fkey");
        });

        modelBuilder.Entity<Position>(entity =>
        {
            entity.HasKey(e => e.PositionId).HasName("positions_pkey");

            entity.ToTable("positions");

            entity.HasIndex(e => e.PositionName, "positions_position_name_key").IsUnique();

            entity.Property(e => e.PositionId).HasColumnName("position_id");
            entity.Property(e => e.PositionName)
                .HasMaxLength(100)
                .HasColumnName("position_name");
            entity.Property(e => e.Responsibilities).HasColumnName("responsibilities");
            entity.Property(e => e.SalaryRange)
                .HasMaxLength(100)
                .HasColumnName("salary_range");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("products_pkey");

            entity.ToTable("products");

            entity.HasIndex(e => e.Article, "idx_products_article");

            entity.HasIndex(e => e.Article, "products_article_key").IsUnique();

            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.Article)
                .HasMaxLength(50)
                .HasColumnName("article");
            entity.Property(e => e.CostPrice)
                .HasPrecision(10, 2)
                .HasColumnName("cost_price");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.MinPartnerPrice)
                .HasPrecision(10, 2)
                .HasColumnName("min_partner_price");
            entity.Property(e => e.PackageHeight)
                .HasPrecision(8, 2)
                .HasColumnName("package_height");
            entity.Property(e => e.PackageLength)
                .HasPrecision(8, 2)
                .HasColumnName("package_length");
            entity.Property(e => e.PackageWidth)
                .HasPrecision(8, 2)
                .HasColumnName("package_width");
            entity.Property(e => e.ProductName)
                .HasMaxLength(255)
                .HasColumnName("product_name");
            entity.Property(e => e.ProductTypeId).HasColumnName("product_type_id");
            entity.Property(e => e.ProductionTime).HasColumnName("production_time");
            entity.Property(e => e.QualityCertificate).HasColumnName("quality_certificate");
            entity.Property(e => e.StandardNumber)
                .HasMaxLength(100)
                .HasColumnName("standard_number");
            entity.Property(e => e.WeightWithPackage)
                .HasPrecision(8, 2)
                .HasColumnName("weight_with_package");
            entity.Property(e => e.WeightWithoutPackage)
                .HasPrecision(8, 2)
                .HasColumnName("weight_without_package");
            entity.Property(e => e.WorkersCount).HasColumnName("workers_count");
            entity.Property(e => e.WorkshopNumber).HasColumnName("workshop_number");

            entity.HasOne(d => d.ProductType).WithMany(p => p.Products)
                .HasForeignKey(d => d.ProductTypeId)
                .HasConstraintName("products_product_type_id_fkey");
        });

        modelBuilder.Entity<ProductMaterial>(entity =>
        {
            entity.HasKey(e => e.ProductMaterialId).HasName("product_materials_pkey");

            entity.ToTable("product_materials");

            entity.HasIndex(e => new { e.ProductId, e.MaterialId }, "product_materials_product_id_material_id_key").IsUnique();

            entity.Property(e => e.ProductMaterialId).HasColumnName("product_material_id");
            entity.Property(e => e.MaterialId).HasColumnName("material_id");
            entity.Property(e => e.ProductId).HasColumnName("product_id");
            entity.Property(e => e.QuantityRequired)
                .HasPrecision(10, 2)
                .HasColumnName("quantity_required");

            entity.HasOne(d => d.Material).WithMany(p => p.ProductMaterials)
                .HasForeignKey(d => d.MaterialId)
                .HasConstraintName("product_materials_material_id_fkey");

            entity.HasOne(d => d.Product).WithMany(p => p.ProductMaterials)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("product_materials_product_id_fkey");
        });

        modelBuilder.Entity<ProductPriceHistory>(entity =>
        {
            entity.HasKey(e => e.PriceHistoryId).HasName("product_price_history_pkey");

            entity.ToTable("product_price_history");

            entity.Property(e => e.PriceHistoryId).HasColumnName("price_history_id");
            entity.Property(e => e.ChangeDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("change_date");
            entity.Property(e => e.NewPrice)
                .HasPrecision(10, 2)
                .HasColumnName("new_price");
            entity.Property(e => e.OldPrice)
                .HasPrecision(10, 2)
                .HasColumnName("old_price");
            entity.Property(e => e.ProductId).HasColumnName("product_id");

            entity.HasOne(d => d.Product).WithMany(p => p.ProductPriceHistories)
                .HasForeignKey(d => d.ProductId)
                .HasConstraintName("product_price_history_product_id_fkey");
        });

        modelBuilder.Entity<ProductType>(entity =>
        {
            entity.HasKey(e => e.ProductTypeId).HasName("product_types_pkey");

            entity.ToTable("product_types");

            entity.HasIndex(e => e.TypeName, "product_types_type_name_key").IsUnique();

            entity.Property(e => e.ProductTypeId).HasColumnName("product_type_id");
            entity.Property(e => e.TypeCoefficient)
                .HasPrecision(5, 2)
                .HasColumnName("type_coefficient");
            entity.Property(e => e.TypeName)
                .HasMaxLength(100)
                .HasColumnName("type_name");
        });

        modelBuilder.Entity<Supplier>(entity =>
        {
            entity.HasKey(e => e.SupplierId).HasName("suppliers_pkey");

            entity.ToTable("suppliers");

            entity.HasIndex(e => e.SupplierName, "idx_suppliers_name");

            entity.HasIndex(e => e.Inn, "suppliers_inn_key").IsUnique();

            entity.HasIndex(e => e.SupplierName, "suppliers_supplier_name_key").IsUnique();

            entity.Property(e => e.SupplierId).HasColumnName("supplier_id");
            entity.Property(e => e.Inn)
                .HasMaxLength(12)
                .HasColumnName("inn");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.StartDate).HasColumnName("start_date");
            entity.Property(e => e.SupplierName)
                .HasMaxLength(255)
                .HasColumnName("supplier_name");
            entity.Property(e => e.SupplierTypeId).HasColumnName("supplier_type_id");

            entity.HasOne(d => d.SupplierType).WithMany(p => p.Suppliers)
                .HasForeignKey(d => d.SupplierTypeId)
                .HasConstraintName("suppliers_supplier_type_id_fkey");
        });

        modelBuilder.Entity<SupplierType>(entity =>
        {
            entity.HasKey(e => e.SupplierTypeId).HasName("supplier_types_pkey");

            entity.ToTable("supplier_types");

            entity.HasIndex(e => e.TypeName, "supplier_types_type_name_key").IsUnique();

            entity.Property(e => e.SupplierTypeId).HasColumnName("supplier_type_id");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.TypeName)
                .HasMaxLength(50)
                .HasColumnName("type_name");
        });

        modelBuilder.Entity<UnitsOfMeasure>(entity =>
        {
            entity.HasKey(e => e.UnitId).HasName("units_of_measure_pkey");

            entity.ToTable("units_of_measure");

            entity.HasIndex(e => e.UnitName, "units_of_measure_unit_name_key").IsUnique();

            entity.Property(e => e.UnitId).HasColumnName("unit_id");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.UnitName)
                .HasMaxLength(20)
                .HasColumnName("unit_name");
            entity.Property(e => e.UnitSymbol)
                .HasMaxLength(10)
                .HasColumnName("unit_symbol");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
