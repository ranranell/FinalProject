using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AdMeStore.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            // Load clients, campaigns, and reports into ListViews
        }


        private void ExitMenuItem_Click(object sender, RoutedEventArgs e)
        {

        }

        private void HelpMenuItem_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ManageClientsButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ClientManagementPage());
        }

        private void ManageCampaignsButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new CampaignManagementPage());
        }

        private void ManageProjectsButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ReportsButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SettingsButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
