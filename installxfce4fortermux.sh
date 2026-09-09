#!/data/data/com.termux/files/usr/bin/bash

clear

echo -e "\e[34mUpdating...\e[0m"

sleep 1

pkg update && pkg upgrade -y

echo -e "\e[34mInstalling Repo and necessary package...\e[0m"

sleep 1

pkg install x11-repo && pkg install termux-x11-nightly pulseaudio wget -y

echo -e "\e[34mInstalling full xfce4 Desktop...\e[0m"

sleep 1

pkg install xfce4 xfce4-goodies -y

echo -e "\e[34mInstalling Vscode, Libreoffice, vlc, etc...\e[0m"

sleep 1

pkg install tur-repo && pkg install code-oss libreoffice vlc -y

echo -e "\e[34mInstalling Browser...\e[0m"

sleep 1

while true; do
  echo -e "\e[32m1)\e[0m Firefox (Recommended)"
  echo -e "\e[32m2)\e[0m Chromium"
  echo -e "\e[31m3)\e[0m None"
  echo ""
  read -p "Select option (1-3): " choice

  case $choice in
  1)
    echo -e "\e[33mInstall Firefox? (y/n)\e[0m"
    read -p "> " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      echo -e "\e[34mInstalling Firefox...\e[0m"
      pkg install firefox -y
      break
    else
      echo -e "\e[34mInstallation cancelled\e[0m"
      sleep 1
    fi
    ;;
  2)
    echo -e "\e[33mInstall Chromium? (y/n)\e[0m"
    read -p "> " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      echo -e "\e[34mInstalling Chromium...\e[0m"
      pkg install chromium -y
      break
    else
      echo -e "\e[34mInstallation cancelled\e[0m"
      sleep 1
    fi
    ;;
  3)
    echo -e "\e[34mSkipping Browser...\e[0m"
    sleep 1
    break
    ;;
  *)
    echo -e "\e[31mInvalid option! Please select 1-3\e[0m"
    echo -e "\e[33mPress Enter to try again...\e[0m"
    read
    ;;
  esac
done

echo -e "\e[34mInstalling Hardware Acceleration...\e[0m"

sleep 1

while true; do
  echo -e "\e[32m1)\e[0m Virgl (Any GPU)"
  echo -e "\e[32m2)\e[0m Virgl with Zink (Mali and Adreno)"
  echo -e "\e[32m3)\e[0m Zink (Mali and Adreno)"
  echo -e "\e[31m4)\e[0m None (CPU)"
  echo ""
  read -p "Select option (1-4): " choice

  case $choice in
  1 | 2 | 3)
    echo -e "\e[33mYou selected option $choice. Proceed with installation? (y/n)\e[0m"
    read -p "> " confirm
    case $confirm in
    [yY] | [yY][eE][sS])
      case $choice in
      1)
        echo -e "\e[34mInstalling Virgl...\e[0m"
        pkg install virglrenderer virglrenderer-android -y
        ;;
      2)
        echo -e "\e[34mInstalling Virgl with Zink...\e[0m"
        pkg install virglrenderer virglrenderer-mesa-zink -y
        ;;
      3)
        echo -e "\e[34mInstalling Zink...\e[0m"
        pkg install mesa-zink virglrenderer -y
        ;;
      esac
      break
      ;;
    [nN] | [nN][oO])
      echo -e "\e[34mInstallation cancelled.\e[0m"
      sleep 1
      ;;
    *)
      echo -e "\e[31mInvalid input. Returning to menu...\e[0m"
      sleep 1
      ;;
    esac
    ;;
  4)
    echo -e "\e[34mNo installation selected. Skipping...\e[0m"
    sleep 1
    break
    ;;
  *)
    echo -e "\e[31mInvalid option! Please select 1-4\e[0m"
    echo -e "\e[33mPress Enter to try again...\e[0m"
    read
    ;;
  esac
done

echo -e "\e[34mDownloading Script...\e[0m"

sleep 1

cd ~

wget https://raw.githubusercontent.com/LinuxDroidMaster/Termux-Desktops/main/scripts/termux_native/startxfce4_termux.sh

chmod +x startxfce4_termux.sh

echo ""
echo -e "\e[34mInstallation Completed, You can now run 'sh startxfce4_termux.sh' for starting desktop\e[0m"
echo ""
