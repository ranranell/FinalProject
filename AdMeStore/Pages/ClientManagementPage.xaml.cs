using AdMeStore.Classes;
using AdMeStore.DbModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для ClientManagementPage.xaml
    /// </summary>
    public partial class ClientManagementPage : Page
    {
        public ClientManagementPage()
        {
            InitializeComponent();
            LoadClients();
        }

        private void LoadClients()
        {
            // Загружаем клиентов из базы данных
            //ConnectionHelper.db.Clients.Load();
            ClientsListView.ItemsSource = ConnectionHelper.db.Clients.ToList(); // Привязываем к ListView
        }

        private void AddClient_Click(object sender, RoutedEventArgs e)
        {
            LoadClients(); // Обновляем список клиентов

            NavigationService.Navigate(new AddClientPage());
        }

        private void EditClient_Click(object sender, RoutedEventArgs e)
        {
            if (ClientsListView.SelectedItem is Client selectedClient)
            {
                LoadClients(); // Обновляем список клиентов

                NavigationService.Navigate(new AddClientPage(selectedClient));
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите клиента для редактирования.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void DeleteClient_Click(object sender, RoutedEventArgs e)
        {
            if (ClientsListView.SelectedItem is Client selectedClient)
            {
                ConnectionHelper.db.Clients.Remove(selectedClient);
                ConnectionHelper.db.SaveChanges(); // Сохраняем изменения в базе данных
                LoadClients(); // Обновляем список клиентов
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите клиента для удаления.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void GoToBack(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MainPage());
        }
    }
}
