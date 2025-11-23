sudo apt update -y
sudo apt install apache2 unzip -y
sudo systemctl status apache2
sudo cd /tmp
sudo wget https://www.tooplate.com/zip-templates/2108_dashboard.zip
sudo unzip 2108_dashboard.zip
sudo cp -R 2108_dashboard/* /var/www/html/
