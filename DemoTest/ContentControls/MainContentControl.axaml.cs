using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using System.Collections.Generic;

namespace DemoTest;

public partial class MainContentControl : UserControl
{
    private Stack<UserControl> _navigationHistory = new Stack<UserControl>();
    private UserControl _currentPage;

    public MainContentControl()
    {
        InitializeComponent();
        _currentPage = this;
    }

    private void NavigateTo(UserControl page)
    {
        if (_currentPage != null && _currentPage != this)
        {
            _navigationHistory.Push(_currentPage);
        }

        ContentControl.Content = page;
        _currentPage = page;
        btnBack.IsEnabled = _navigationHistory.Count > 0;
    }

    private void BackButton_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (_navigationHistory.Count > 0)
        {
            var previousPage = _navigationHistory.Pop();
            ContentControl.Content = previousPage;
            _currentPage = previousPage;
            btnBack.IsEnabled = _navigationHistory.Count > 0;
        }
    }

    private void ProductsButton_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        NavigateTo(new ProductsPage());
    }

    private void MaterialsButton_Click_1(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        NavigateTo(new MaterialsPage());
    }
}