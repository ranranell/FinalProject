using AdMeStore.Classes;
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
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            // Reset error messages
            UsernameTextBox.Visibility = Visibility.Collapsed;
            PasswordBox.Visibility = Visibility.Collapsed;

            // Retrieve entered data
            string username = UsernameTextBox.Text;
            string password = PasswordBox.Password;

            // Validation
            bool isValid = true;

            if (string.IsNullOrWhiteSpace(username))
            {
                UsernameTextBox.Text = "Введите логин.";
                PasswordBox.Visibility = Visibility.Visible;
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(password))
            {
                UsernameTextBox.Text = "Введите пароль.";
                PasswordBox.Visibility = Visibility.Visible;
                isValid = false;
            }

            // If data is valid, proceed with login
            if (isValid)
            {
                // Assuming ConnectionHelper.db is your database context
                var user = ConnectionHelper.db.Users
                    .Where(x => x.Login == username && x.Password == password)
                    .FirstOrDefault();

                if (user != null)
                {
                    MessageBox.Show("Вход выполнен успешно!");
                    // Open the main page
                    NavigationService.Navigate(new MainPage());
                }
                else
                {
                    MessageBox.Show("Неправильный логин или пароль.");
                    NavigationService.Navigate(new MainPage());
                }
            }
        }
    }
}
