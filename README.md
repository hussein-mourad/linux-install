# Fresh Linux Installer 
This script helps install apps that I need on a fresh install of linux

## Manual install links:
- mongodb: https://docs.mongodb.com/manual/installation/
- lsd: https://github.com/Peltoche/lsd 
- nerd fonts (3270.zip): https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.1.0
- bat: https://github.com/sharkdp/bat 
- ros: http://wiki.ros.org/noetic/Installation/Ubuntu
- jetbrains editors: https://www.jetbrains.com/
- arduino ide: https://www.arduino.cc/en/software/
- touche: https://github.com/JoseExposito/touche
- google chrome: https://www.google.com/chrome/
- vscode
- atom 
- latex: https://linuxconfig.org/how-to-install-latex-on-ubuntu-20-04-focal-fossa-linux
- dust
- duf


## Config
- Swap escape and capslock from gnome tweaks
- Git verified commits:  https://docs.github.com/en/enterprise-server@3.1/authentication/managing-commit-signature-verification/about-commit-signature-verification
- cp gitconfig and .gnupg from old installation
- install grub bootloader:
```bash
sudo apt update -y; sudo apt upgrade -y;sudo apt install -y grub-efi grub2-common grub-customizer;sudo grub-install; sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi;
```
- Add this to grub-customizer > change environment > OUTPUT_FILE=/boot/efi/EFI/pop/grub.cfg
- stm config: https://cyclic-meadow-5c5.notion.site/Linux-workspace-setup-guide-967954da4f044a8db181dff3964252b8
- Stm: install stm cude programmer
- Stm: https://raw.githubusercontent.com/stm32duino/BoardManagerFiles/main/package_stmicroelectronics_index.json

