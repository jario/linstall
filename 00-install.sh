#!/bin/sh
# sudo dpkg --configure -a && sudo rm -rf ~/var/cache/apt/ && rm -rf ~/.cache/*

sudo echo "%jario ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# yt-dlp
mkdir -p ~/.local/bin
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp
export PATH="$HOME/.local/bin:$PATH"
source ~/.bashrc

# netdata
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --disable-telemetry --disable-cloud
sudo /etc/netdata/edit-config netdata.conf
sudo systemctl restart netdata

wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install ./discord.deb

# helium browser
curl -fsSL https://raw.githubusercontent.com/imputnet/helium-linux/main/pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/helium.gpg
echo "deb [signed-by=/usr/share/keyrings/helium.gpg] https://pkg.helium.computer/deb stable main" | sudo tee /etc/apt/sources.list.d/helium.list
sudo apt update && sudo apt install helium-bin


# brave browser
curl -fsS https://dl.brave.com/install.sh | sh

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg &&  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && sudo apt update && sudo apt install gh -y

curl -o webmin-setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repos.sh
sudo sh webmin-setup-repos.sh -y
sudo apt install --install-recommends webmin -y

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

sudo apt install curl wget aptitude synaptic -y;
sudo apt install apt-transport-https -y;
sudo apt install -y build-essential -y; 
sudo apt install -y libpam0g-dev libxcb-xkb-dev -y;
sudo apt install uget qbittorrent -y;
sudo apt install arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip -y;
sudo apt install timeshift -y;
sudo apt install tlp tlp-rdw -y && sudo systemctl enable tlp && sudo tlp start

sudo apt install vlc handbrake audacity ffmpeg atomicparsley rhash sox aria2  -y
sudo apt install laptop-mode-tools flashrom  -y

# WLS ou edite

mkdir -p ~/.config/yt-dlp &&
cat <<'EOF' > ~/.config/yt-dlp/config
# Extrair áudio em MP3
-x
--audio-format mp3

# Inserir metadados (título, artista, álbum)
--add-metadata

# Baixar miniatura e usar como capa
--embed-thumbnail

# Salvar direto no diretório de música
-o /mnt/d/media/mp3/%(title)s.%(ext)s
EOF

cat <<'EOF' > ~/.ssh/config
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_jario_ed25519
  AddKeysToAgent yes
EOF

# sudo apt install apache2 apache2-utils apache2-suexec-pristine apache2-suexec-custom  ca-certificates apache2-suexec-pristine apache2-suexec-custom -y;  -y;

# sudo apt install php php-cli php-common php-json php-mysql php-mbstring php-zip php-fpm php-intl php-soap php-gd libapache2-mod-php php-mbstring php-curl php-zip php-json php-xml -y;

sudo apt install ufw gufw -y;
sudo ufw enable &&
sudo ufw default deny incoming &&
sudo ufw default allow outgoin g&&
sudo ufw set default policy &&
sudo ufw allow ssh &&
sudo ufw allow http &&
sudo ufw allow 80 &&
sudo ufw allow https  &&
sudo ufw allow 443 &&

sudo chown -R $USER:www-data /var/www && sudo chmod -R 775 /var/www && cd /var/www && sudo usermod -a -G www-data $USER  && cd ;

# SGUI Ly Console Manager
# Needed packages
# sudo xorg display server installation
# sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput xorg-dev
# sudo apt install -y build-essential 
# sudo apt install -y libpam0g-dev libxcb-xkb-dev
# cd /usr/share/
# sudo git clone --recurse-submodules https://github.com/fairyglade/ly
# cd ly
# sudo make
# sudo make install installsystemd
# sudo systemctl enable ly.service