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
    /// Логика взаимодействия для AddCampaignPage.xaml
    /// </summary>
    public partial class AddCampaignPage : Page
    {
        private Project _currentCampaign;
        public AddCampaignPage()
        {
            InitializeComponent();
            statustxt.Visibility = Visibility.Hidden;
            AdvertisingChannelComboBox.Visibility = Visibility.Hidden;
        }

        public AddCampaignPage(Project campaign)
        {
            InitializeComponent();
            _currentCampaign = campaign;

            // Заполнение ComboBox статусами
            var statuses = new List<string>
            {
                "Запланировано",
                "В процессе",
                "Завершено",
                "Приостановлено",
                "Отменено",
                "На согласовании",
                "Ожидание"
            };

            //AdvertisingChannelComboBox.ItemsSource = null;
            //AdvertisingChannelComboBox.ItemsSource = statuses;

            // Установка выбранного значения ComboBox
            var currentStatus = _currentCampaign.Status?.Trim(); // Удаляем лишние пробелы

            // Находим индекс выбранного статуса
            int selectedIndex = statuses.IndexOf(currentStatus);

            // Устанавливаем SelectedIndex, если статус найден
            if (selectedIndex >= 0)
            {
                AdvertisingChannelComboBox.SelectedIndex = selectedIndex;
            }
            else
            {
                AdvertisingChannelComboBox.SelectedIndex = 0; // Установить значение по умолчанию, если статус не найден
            }

            DataContext = campaign;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (_currentCampaign == null)
            {
                using (var db = new adStoreEntities())
                {
                    var newCampaign = new Project
                    {
                        Name_project = NameTextBox.Text,
                        Budget = Convert.ToInt32(BudgetTextBox.Text),
                        Start_date = StartDatePicker.SelectedDate.Value,
                        End_date = EndDatePicker.SelectedDate.Value,
                        Status = "Запланировано"
                    };

                    db.Projects.Add(newCampaign);
                    db.SaveChanges();
                }
            }
            else
            {
                using (var db = new adStoreEntities())
                {
                    _currentCampaign.Name_project = NameTextBox.Text;
                    _currentCampaign.Budget = Convert.ToInt32(BudgetTextBox.Text);
                    _currentCampaign.Start_date = StartDatePicker.SelectedDate.Value;
                    _currentCampaign.End_date = EndDatePicker.SelectedDate.Value;
                    _currentCampaign.Status = ((ComboBoxItem)AdvertisingChannelComboBox.SelectedItem).Content.ToString();

                    db.SaveChanges();
                }
            }

            MessageBox.Show("Кампания успешно сохранена.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            NavigationService.GoBack();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
