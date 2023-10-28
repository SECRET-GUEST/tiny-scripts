#!/bin/bash

# Vérifie si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 
   exit 1
fi

# Demande des informations de configuration
read -p "Entrez le nom de domaine de votre serveur Matrix (par exemple, matrix.example.com) : " domain

# Mise à jour des paquets
sudo apt update && sudo apt upgrade -y

# Installation des paquets nécessaires
sudo apt install -y lsb-release wget apt-transport-https nginx certbot python3-certbot-nginx ufw fail2ban

# Configuration de Synapse
sudo wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" |
    sudo tee /etc/apt/sources.list.d/matrix-org.list
sudo apt update
sudo apt install -y matrix-synapse-py3

# Obtention d'un certificat SSL avec Certbot
sudo certbot --nginx -d $domain

# Configuration de Nginx pour Synapse avec HTTPS strict
nginx_config="
server {
    listen 80;
    server_name $domain;
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name $domain;

    ssl_certificate /etc/letsencrypt/live/$domain/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$domain/privkey.pem;

    # Configuration HTTPS stricte
    add_header Strict-Transport-Security \"max-age=31536000\";

    location / {
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For \$remote_addr;
    }
}
"
echo "$nginx_config" | sudo tee /etc/nginx/sites-available/matrix
sudo ln -s /etc/nginx/sites-available/matrix /etc/nginx/sites-enabled
sudo nginx -s reload

# Configuration du pare-feu
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# Configuration de Fail2Ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i "s/bantime  = 10m/bantime  = 5m/" /etc/fail2ban/jail.local
sudo sed -i "s/maxretry = 5/maxretry = 5/" /etc/fail2ban/jail.local
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Planification des sauvegardes hebdomadaires de la base de données
backup_script="
#!/bin/bash
pg_dump matrix-synapse > /media/usb/matrix_backup_$(date +\%F).sql
"
echo "$backup_script" | sudo tee /etc/cron.weekly/matrix_backup.sh
sudo chmod +x /etc/cron.weekly/matrix_backup.sh

# Démarrage de Synapse
sudo systemctl enable matrix-synapse
sudo systemctl start matrix-synapse

echo "L'installation de Synapse, Nginx, et Certbot est terminée. Votre serveur Matrix est maintenant en cours d'exécution sur https://$domain."
