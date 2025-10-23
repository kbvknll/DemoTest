using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using DemoTest.Data;
using System.Linq;

namespace DemoTest
{
    public partial class AddEditProduct : Window
    {
        public Product? _product;

        public AddEditProduct()
        {
            InitializeComponent();
            LoadComboBoxData();
        }

        private void LoadComboBoxData()
        {
            var typeProducts = App.dbContext.ProductTypes.ToList();
            cbProductType.ItemsSource = typeProducts;
        }

        public AddEditProduct(Product? product = null)
        {
            InitializeComponent();
            _product = product;
            LoadComboBoxData();

            if (_product != null)
            {
                Title = "Редактирование продукции";
                tbArticle.Text = _product.Article;
                tbProductName.Text = _product.ProductName;
                tbMinPartnerPrice.Text = _product.MinPartnerPrice.ToString();
                tbRollWidth.Text = _product.PackageWidth?.ToString() ?? "0";
                tbProductionTime.Text = _product.ProductionTime?.ToString() ?? "";
                tbWorkshopNumber.Text = _product.WorkshopNumber?.ToString() ?? "";
                tbWorkersCount.Text = _product.WorkersCount?.ToString() ?? "";
                tbDescription.Text = _product.Description ?? "";

                cbProductType.SelectedValue = _product.ProductTypeId;
            }
            else
            {
                Title = "Добавление продукции";
            }
        }

        private void SaveButton_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbArticle.Text) ||
                string.IsNullOrWhiteSpace(tbProductName.Text) ||
                string.IsNullOrWhiteSpace(tbMinPartnerPrice.Text) ||
                string.IsNullOrWhiteSpace(tbRollWidth.Text))
            {
                ShowError("Пожалуйста, заполните все обязательные поля (отмечены *)");
                return;
            }

            if (!decimal.TryParse(tbMinPartnerPrice.Text.Replace('.', ','), out decimal minPrice) || minPrice < 0)
            {
                ShowError("Минимальная цена должна быть положительным числом");
                return;
            }

            if (!decimal.TryParse(tbRollWidth.Text.Replace('.', ','), out decimal rollWidth) || rollWidth < 0)
            {
                ShowError("Ширина рулона должна быть положительным числом");
                return;
            }

            int? productionTime = null;
            if (!string.IsNullOrWhiteSpace(tbProductionTime.Text) &&
                (!int.TryParse(tbProductionTime.Text, out int tempTime) || tempTime < 0))
            {
                ShowError("Время производства должно быть положительным целым числом");
                return;
            }
            else if (!string.IsNullOrWhiteSpace(tbProductionTime.Text))
            {
                productionTime = int.Parse(tbProductionTime.Text);
            }

            int? workshopNumber = null;
            if (!string.IsNullOrWhiteSpace(tbWorkshopNumber.Text) &&
                (!int.TryParse(tbWorkshopNumber.Text, out int tempWorkshop) || tempWorkshop < 0))
            {
                ShowError("Номер цеха должен быть положительным целым числом");
                return;
            }
            else if (!string.IsNullOrWhiteSpace(tbWorkshopNumber.Text))
            {
                workshopNumber = int.Parse(tbWorkshopNumber.Text);
            }

            int? workersCount = null;
            if (!string.IsNullOrWhiteSpace(tbWorkersCount.Text) &&
                (!int.TryParse(tbWorkersCount.Text, out int tempWorkers) || tempWorkers < 0))
            {
                ShowError("Количество рабочих должно быть положительным целым числом");
                return;
            }
            else if (!string.IsNullOrWhiteSpace(tbWorkersCount.Text))
            {
                workersCount = int.Parse(tbWorkersCount.Text);
            }

            var selectedProductType = cbProductType.SelectedItem as ProductType;

            if (_product == null)
            {
                var newProduct = new Product()
                {
                    Article = tbArticle.Text.Trim(),
                    ProductName = tbProductName.Text.Trim(),
                    ProductTypeId = selectedProductType?.ProductTypeId,
                    MinPartnerPrice = minPrice,
                    PackageWidth = rollWidth,
                    ProductionTime = productionTime,
                    WorkshopNumber = workshopNumber,
                    WorkersCount = workersCount,
                    Description = tbDescription.Text.Trim(),
                    CostPrice = CalculateCostPrice(selectedProductType, minPrice)
                };

                App.dbContext.Products.Add(newProduct);
            }
            else
            {
                _product.Article = tbArticle.Text.Trim();
                _product.ProductName = tbProductName.Text.Trim();
                _product.ProductTypeId = selectedProductType?.ProductTypeId;
                _product.MinPartnerPrice = minPrice;
                _product.PackageWidth = rollWidth;
                _product.ProductionTime = productionTime;
                _product.WorkshopNumber = workshopNumber;
                _product.WorkersCount = workersCount;
                _product.Description = tbDescription.Text.Trim();
                _product.CostPrice = CalculateCostPrice(selectedProductType, minPrice);

                App.dbContext.Products.Update(_product);
            }

            App.dbContext.SaveChanges();
            this.Close();
        }

        private decimal CalculateCostPrice(ProductType? productType, decimal minPrice)
        {
            return minPrice * 0.6m;
        }

        private void ShowError(string message)
        {
            var messageBox = new Window
            {
                Title = "Ошибка",
                Content = new TextBlock { Text = message },
                SizeToContent = SizeToContent.WidthAndHeight,
                WindowStartupLocation = WindowStartupLocation.CenterOwner
            };
            messageBox.ShowDialog(this);
        }
    }
}