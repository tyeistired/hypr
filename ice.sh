#!/bin/bash
yay -Syu --noconfirm
yay -S update-grub --noconfirm
yay -S ly --noconfirm
yay -S hyprland-nvidia --noconfirm
yay -S pcmanfm --noconfirm
yay -S foot --noconfirm
yay -S leafpad --noconfirm
yay -S icewm --noconfirm
yay -S qt6-wayland --noconfirm
yay -S qt5-wayland --noconfirm
yay -S wofi --noconfirm
yay -S firefox --noconfirm
yay -S pw-volume --noconfirm
yay -S polkit-dumb-agent-git --noconfirm

systemctl enable ly


sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT='/&nvidia-drm.modeset=1 /" /etc/default/grub
update-grub


cat<<EOF>/etc/X11/xorg.conf.d/50-mouse-acceleration.conf
Section "InputClass"
        Identifier "My Mouse"
        Driver "libinput"
        MatchIsPointer "yes"
        Option "AccelProfile" "flat"
        Option "AccelSpeed" "0"
EndSection
EOF


cat<<EOF>/etc/X11/xorg.conf.d/20-nvidia.conf
Section "Device"
    Identifier "Nvidia Card"
    Driver "nvidia"
    VendorName "NVIDIA Corporation"
EndSection

Section "Screen"
        Identifier      "nvidia"
        Option         "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
        Option          "TripleBuffer"                  "on"
        Option          "AllowIndirectGLXProtocol"      "off"
EndSection
EOF


echo "hide_borders = true" >> /etc/ly/config.ini



sed -i "s/Exec=/&env WLR_NO_HARDWARE_CURSORS=1 /" /usr/share/wayland-sessions/hyprland.desktop




yay -S xdg-desktop-portal-hyprland-git







