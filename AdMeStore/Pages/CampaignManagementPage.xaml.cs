using AdMeStore.Classes;
using AdMeStore.DbModel;
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
    /// Логика взаимодействия для CampaignManagementPage.xaml
    /// </summary>
    public partial class CampaignManagementPage : Page
    {
        public CampaignManagementPage()
        {
            InitializeComponent();
            LoadCampaigns();
        }

        private void LoadCampaigns()
        {
            //using (var db = new adStoreEntities())
            //{
                CampaignsListView.ItemsSource = ConnectionHelper.db.Projects.ToList();
            //}
        }

        private void AddCampaignButton_Click(object sender, RoutedEventArgs e)
        {
            LoadCampaigns();

            NavigationService.Navigate(new AddCampaignPage());
        }

        private void EditCampaignButton_Click(object sender, RoutedEventArgs e)
        {
            if (CampaignsListView.SelectedItem is Project selectedCampaign)
            {
                LoadCampaigns();
                NavigationService.Navigate(new AddCampaignPage(selectedCampaign));
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите кампанию для редактирования.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void DeleteCampaignButton_Click(object sender, RoutedEventArgs e)
        {
            if (CampaignsListView.SelectedItem is Project selectedCampaign)
            {
                ConnectionHelper.db.Projects.Remove(selectedCampaign);
                ConnectionHelper.db.SaveChanges();
                LoadCampaigns();
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите кампанию для удаления.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void GoBack(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MainPage());
        }
    }
}
