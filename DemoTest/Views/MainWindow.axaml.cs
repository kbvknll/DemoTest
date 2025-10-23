using Avalonia.Controls;

namespace DemoTest.Views
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainControl.Content = new MainContentControl();
        }
    }
}