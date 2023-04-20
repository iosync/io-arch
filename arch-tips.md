
## Para cambiar el idioma del teclado en i3wm en Arch Linux
```bash
localectl list-x11-keymap-layouts
localectl set-x11-keymap <código-de-idioma>
sudo localectl set-x11-keymap es,us
```

 
### Tip para usar la ultima ruta (!S) [Argumento]
```bash
git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks
cd !$

# cp config.example config
# !! para usar el ultimo comando
```

#### Descargar Man para revisar manuales
```shell
sudo pacman -S man-pages
```
### uso de grep para abrir picom con vim usando locate,vim y picom instalado 
```shell
locate picom | grep "/home/io/picom.conf" | xargs vim
locate picom | grep "picom.conf" | head -n 1 | xargs vim # Muestra la primera linea
locate picom | grep "picom.conf" | sed -n '2p' | xargs vim # Muestra  la segunda linea
```
### Para montar particiones ntfs y exfat
```shell 
sudo pacman -S exfat-utils ntfs-3g
```
### Para montar un disco externo manualmente en Arch Linux
```shell
sudo mount /dev/sdb1 /mnt
sudo mount -o rw /dev/sdb1 /mnt
sudo umount /mnt
````
### Instalar VirtualBox
```shell
sudo pacman -S virtualbox virtualbox-host-dkms virtualbox-ext-oracle
yay -S virtualbox virtualbox-host-dkms virtualbox-ext-oracle
```

### Sonido,Usando pipewire: Conf pamix
```shell
sudo pacman -S pipewire pipewire-alsa pipewire-jack pipewire-pulse
# sudo pacman -S alsa-utils pavucontrol alsa-plugins pulseaudio-alsa

# sudo systemctl enable --now pipewire.service pipewire.socket
# sudo systemctl enable --now pipewire-pulse.service pipewire-pulse.socket
```
### Establecer el Fondo de pantalla y elegir pantalla usando xrandr, feh
```shell
# Resolucion de pantalla
xrandr 
# Opcion 1
xrandr | grep ' connected' | awk '{print $1}'
# Opcion 2 corto
xrandr | awk '/ connected/ {print $1}'
# ejmplo: xrandr --output VGA-1 --off --output HDMI-1 --mode 1920x1080
# de manera mas simple usar arandr tiene una interfaz grafica.
```
```shell
sudo pacman -S feh
feh --bg-fill /ruta/a/tu/fondo/de/pantalla.jpg
# En i3: ~/.config/i3/config
# exec --no-startup-id feh --bg-fill /ruta/a/tu/fondo/de/pantalla.jpg
```

### Comprobar driver de video en Uso 
```shell 
lspci -k | grep -A 2 -E "(VGA|3D)"
```

### Conectarse a la red via Wifi
```shell
# Opción 1
iwlist wlan0 scan
iwctl --passphrase 'contraseña' station wlan0 connect 'NombreDeRed'  
# Opción 2
nmcli dev wifi con "Wifi Name" password "password"
```

### Agregar los servidores mas rapidos y agregarlos
```shell 
sudo pacman -S reflector

sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

### Agregar Fuentes 
```shell
# Directorio recomendado para almacenar las fuentes de usuario es ~/.local/share/fonts/.
mkdir -p ~/.local/share/fonts/ 
# Para todo el sistema "/usr/share/fonts/"
mkdir -p /usr/share/fonts/
# Ejemplo descargamos la fuente JetBrainsMono y la copiamos en el directorio
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
cp JetBrainsMono.zip ~/.local/share/fonts/ 
unzip -o ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/ 
# Actualizar fuentes
fc-cache -f -v
``` 


## Borrar particion de manera segura[No Probado]

```shell
sudo pacman -S coreutils
sudo dd if=/dev/zero of=/dev/sda bs=4M status=progress
#escribirá ceros en todo el disco /dev/sda, borrando permanentemente todos los datos. Ten en cuenta que este proceso puede tardar un tiempo considerable, dependiendo del tamaño del disco.
sudo pacman -S smartmontools
sudo smartctl -a /dev/sda

# @ ejecutar un diagnóstico de disco antes de utilizar dd para borrarlo

```

### Instalar Driver de Video NVIDIA
```shell
sudo pacman -S nvidia nvidia-utils
# abre el archivo /etc/mkinitcpio.conf en un editor de texto y busca la sección que comienza con "MODULES". Deberías agregar "nvidia" a esta sección, de modo que se vea así:
MODULES=(nvidia) 
# Luego, deberías reconstruir el archivo initramfs con el siguiente comando:
sudo mkinitcpio -p linux
# si tienes linux lts instalado
sudo mkinitcpio -p linux-lts
# para comprobar 
lspci -k | grep -A 2 -E "(VGA|3D)"

```