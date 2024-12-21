using AdMeStore.Classes;
using AdMeStore.DbModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
    /// Логика взаимодействия для AddClientPage.xaml
    /// </summary>
    public partial class AddClientPage : Page
    {
        private Client currentClient;
        public AddClientPage()
        {
            InitializeComponent();
            AdvertisingChannelComboBox.SelectedIndex = 0;
        }

        public AddClientPage(Client client) : this() // Вызываем основной конструктор
        {
            currentClient = client;
            FillClientData();
        }

        private void FillClientData()
        {
            // Заполняем поля данными клиента
            NameTextBox.Text = currentClient.Name_client;
            EmailTextBox.Text = currentClient.Email;
            PhoneTextBox.Text = currentClient.Phone;

            // Устанавливаем выбранный канал рекламы
            if (currentClient.Preferences == "Онлайн")
            {
                AdvertisingChannelComboBox.SelectedItem = AdvertisingChannelComboBox.Items[0]; // Онлайн
            }
            else if (currentClient.Preferences == "Оффлайн")
            {
                AdvertisingChannelComboBox.SelectedItem = AdvertisingChannelComboBox.Items[1]; // Оффлайн
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Проверка на пустые поля
            if (string.IsNullOrWhiteSpace(NameTextBox.Text) ||
                string.IsNullOrWhiteSpace(EmailTextBox.Text) ||
                string.IsNullOrWhiteSpace(PhoneTextBox.Text) ||
                AdvertisingChannelComboBox.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (currentClient != null)
            {
                currentClient.Name_client = NameTextBox.Text;
                currentClient.Email = EmailTextBox.Text;
                currentClient.Phone = PhoneTextBox.Text;
                currentClient.Preferences = ((ComboBoxItem)AdvertisingChannelComboBox.SelectedItem).Content.ToString();

                // Обновление клиента в базе данных
                ConnectionHelper.db.Clients.AddOrUpdate(currentClient);
            }
            else
            {
                // Создание нового клиента
                var newClient = new Client
                {
                    Name_client = NameTextBox.Text,
                    Email = EmailTextBox.Text,
                    Phone = PhoneTextBox.Text,
                    RegistrationDate = DateTime.Now,
                    Preferences = ((ComboBoxItem)AdvertisingChannelComboBox.SelectedItem).Content.ToString()
                };

                ConnectionHelper.db.Clients.Add(newClient);
            }

            // Добавление клиента в базу данных
            
            ConnectionHelper.db.SaveChanges(); // Сохраняем изменения в базе данных

            MessageBox.Show("Клиент успешно добавлен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            NavigationService.GoBack(); // Закрываем окно после добавления
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
