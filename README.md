# Instalacion de I3 Minimalista para Arch Linux


## Instalacion Basica

### Servidor Grafico.
```sh
pacman -S xorg xorg-xinit xorg-xinput
```
- [xorg]	Servidor X, un servidor gráfico que permite a las aplicaciones mostrar gráficos en la pantalla.
- [xorg-xinit]	Script de inicio para el servidor X que se ejecuta al iniciar la sesión de un usuario.
- [xorg-xinput]	Utilidad para configurar dispositivos de entrada como ratones y teclados.

### Interfaz Grafica

```sh
sudo pacman -S i3-gaps i3status # or i3blocks
```
- [i3-gaps]	Gestor de ventanas muy ligero y altamente configurable.
- [i3blocks]	Sistema de barras de estado para el gestor de ventanas i3.
- [i3status]	Programa de estado de sistema para el gestor de ventanas i3.


### Herramientas Adicionales
```sh
sudo pacman -S lightdm rofi feh dunst picom dmenu lightdm-gtk-greeter kitty 
```
- [lightdm]	Gestor de inicio de sesión.
- [rofi]  Selector de aplicaciones y lanzador de búsqueda.
- [feh]	Visor de imágenes ligero.
- [dunst]	Sistema de notificación de escritorio.
- [picom] Compositor de ventanas, que permite la transparencia y otros efectos visuales. 
- [dmenu]	Selector de menús para el entorno de escritorio i3.
- [lightdm-gtk-greeter]	Tema para el gestor de inicio de sesión LightDM.
- [kitty]	Emulador de terminal que permite la configuración avanzada.

### Lightdm: para habilitar y ejecutar

```sh
sudo systemctl enable lightdm
sudo systemctl start lightdm
```
### Instalacion de Yay
```sh
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```


> Adicionalmente se puede instalar el 
> repositorio de Blackarch, para poder
> disponer de Herramientas de Hacking.

#### Instalacion de BlackArch

```sh
cd /tmp
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh
```

 

## CONFIGURACIONES ADICIONALES


> Nota: `localectl set-x11-keymap es` cambia la configuracion del teclado a Español.

 
Para ejecutar el comando xrandr con las medidas adecuadas desde i3wm
Mostrar las pantallas y resoluciones disponibles

```bash
xrandr --listmonitors
xrandr
```

Para establecer  la pantalla con las medidas de la resolucion adecuada

```bash
xrandr --output NOMBRE_PANTALLA --mode nombre_resolución
#para deshabilitar una pantalla xrandr --output NOMBRE_PANTALLA --off --output NOMBRE_PANTALLA2 --mode nombre_resolución
```
Para agregarlo para que se ejecute cada inicio del sistema, modificar:
```bash
nano ~/.config/i3/config

exec --no-startup-id xrandr --output NOMBRE_PANTALLA --mode nombre_resolución

```

## License

MIT

**Free Software, Hell Yeah!**