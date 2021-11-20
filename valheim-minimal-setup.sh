sudo apt update
sudo apt -y dist-upgrade
sudo apt-get -y install lib32gcc1
sudo apt-get -y install libsdl2-2.0-0
mkdir SteamCMD && cd SteamCMD
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
/home/ubuntu/SteamCMD/steamcmd.sh +login anonymous +force_install_dir /home/ubuntu/Steam +app_update 896660 validate +exit
cd /home/ubuntu/Steam/
cp start_server.sh my_start_server.sh
screen -S scr
./my_start_server.sh
