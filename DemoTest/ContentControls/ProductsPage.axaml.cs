using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using System.Linq;

namespace DemoTest;

public partial class ProductsPage : UserControl
{
    public ProductsPage()
    {
        InitializeComponent();
        Update();
    }

    private void Update()
    {
        var products = App.dbContext.Products
            .ToList()
            .OrderBy(x => x.ProductId)
            .ToList();

        ListBoxProducts.ItemsSource = products;
    }

    private void AddButton_Click_1(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        var addWindow = new AddEditProduct();
        addWindow.Closed += (s, args) => Update();
        addWindow.Show();
    }

    private void EditButton_Click_2(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (ListBoxProducts.SelectedItem != null)
        {
            dynamic selectedItem = ListBoxProducts.SelectedItem;
            int productId = selectedItem.ProductId;

            var product = App.dbContext.Products.FirstOrDefault(p => p.ProductId == productId);
            if (product != null)
            {
                var editWindow = new AddEditProduct(product);
                editWindow.Closed += (s, args) => Update();
                editWindow.Show();
            }
        }
        else
        {
            ShowMessage("Пожалуйста, выберите продукт для редактирования");
        }
    }



    private void ShowMessage(string message)
    {
        var messageBox = new Window
        {
            Title = "Информация",
            Content = new TextBlock { Text = message },
            SizeToContent = SizeToContent.WidthAndHeight,
            WindowStartupLocation = WindowStartupLocation.CenterOwner
        };
        messageBox.Show();
    }
}