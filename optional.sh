# sync time between win10 and ubuntu18
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
reboot


# language
export LANG=en_US
xdg-user-dirs-gtk-update
