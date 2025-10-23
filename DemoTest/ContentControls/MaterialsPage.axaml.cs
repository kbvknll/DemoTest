using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace DemoTest;

public partial class MaterialsPage : UserControl
{
    public MaterialsPage()
    {
        InitializeComponent();
        Update();
    }

    private void Update()
    {
        var material = App.dbContext.ProductMaterials
            .Include(material => material.Material)
            .Include(material => material.Product)
            .ToList()
            .OrderBy(x => x.ProductMaterialId);
        DataGridMaterials.ItemsSource = material;
    }

}