# Install Arch Linux | Tips

```shell
ls /sys/firmware/efi/efivars
loadkeys
timedatectl set-ntp true
``` 
### Network Configuration/wifi
```shell
# Optinal: Wifi-Connect
iwlist wlan0 scan
 iwctl --passphrase 'pass' station wlan0 connect 'essid-name'
```
### Partitions
```shell
gdisk /dev/sda
# 1 Boot 'EFI System (EF00)'          --> +550M   --> mkfs.fat -F32 /dev/sda1
# 2 Swap 'Linux Swap (8200)'          --> +2G     --> mkswap /dev/sda2
# 3 Root 'Linux-x86-64 root(8304)'    --> +20G    --> mkfs.ext4 /dev/sda3
# 4 Home 'Linux Home (8302)'          --> +100G   --> mkfs.ext4 /dev/sda4
```
### Mount
```shell
# Mount: Root
mount /dev/sda3 /mnt
# Swap>
swapon /dev/sda2
# Boot Directory
mkdir -p /mnt/boot/efi
# Mount: Boot
mount /dev/sda1 /mnt/boot/efi
# Home Directory
mkdir -p /mnt/home
# Mount: Home Directory
mount /dev/sda4 /mnt/home
```

### Base Arch Install 
```shell
pacstrap /mnt base base-devel linux linux-firmware linux-headers linux-lts networkmanager grub efibootmgr nano vim amd-ucode
# optional: intel-ucode | amd-ucode
```

```shell
genfstab -U /mnt >> /mnt/etc/fstab
```

### Login with root 
```shell
arch-chroot /mnt /bin/bash
```

```shell
# set language
nano /etc/locale.gen
# build language
locale-gen
# set local config
echo LANG=es_ES.UTF-8 > /etc/locale.conf
# symbolic link
# Alternatively timedatectl list-timezones | grep Zurich
ln -s /usr/share/zoneinfo/Zone1/Zone_2 /etc/localtime

# set keyboard lang: es, us, en, fr, la-latin1
echo KEYMAP=es > /etc/vconsole.conf

```
### Grub
```shell
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg
#optional configure video resolution
nano /etc/default/grub
# and setting video=1920x1080:
# GRUB_CMDLINE_LINUX_DEFAULT ="loglevel=3 quiet video=1920x1080"
# And build grub configuration
# grub-mkconfig -o /boot/grub/grub.cfg
```
### Add Hostname
```shell
echo user > /etc/hostname
```
### hosts file config
```shell
# /etc/hosts
127.0.0.1   localhost.localdomain   localhost
::1         localhost.localdomain   localhost
127.0.1.1   user.localdomain        user
```

### Add Password to root user
```shell
passwd
# exit and umount root user
exit
umount -R /mnt 
reboot
```

### Optional user add
```shell
useradd -m user #-s /bin/bash
passwd user
nano /etc/sudoers
```
### Add Network Manager
```shell
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
ping -c 3 archlinux.org
```

```shell
sudo pacman -S reflector

sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
```
### Instalar el Repositorio de BlackArch
```shell
cd /tmp
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh

```