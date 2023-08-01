# Demande à l'utilisateur de choisir un serveur DNS
echo "Choisissez un serveur DNS:"
echo "0. Automatique - Utilise le DNS attribue par votre fournisseur d'acces Internet ou DHCP"
echo "1. Google - Google Public DNS (8.8.8.8)"
echo "2. Cloudflare - Cloudflare DNS (1.1.1.1), axe sur la confidentialite et la performance"
echo "3. Quad9 - Quad9 DNS (9.9.9.9), axe sur la securite"
echo "4. OpenDNS - OpenDNS (208.67.222.222), offre des options de filtrage de contenu"
echo "5. DNS.WATCH - DNS.WATCH (84.200.69.80), axe sur la neutralite et la liberte d'information"
echo "6. Comodo Secure DNS - Comodo Secure DNS (8.26.56.26), axe sur la securite et la fiabilite"
echo "7. FreeDNS - FreeDNS (37.235.1.174), DNS gratuit et sans censure"
echo "8. Quitter sans changer"
$choice = Read-Host "Entrez votre choix"

# L'adresse du serveur DNS sera determinee par le choix de l'utilisateur
$dns = switch ($choice) {
    "0" {"Automatique"; break}
    "1" {"8.8.8.8"; break}
    "2" {"1.1.1.1"; break}
    "3" {"9.9.9.9"; break}
    "4" {"208.67.222.222"; break}
    "5" {"84.200.69.80"; break}
    "6" {"8.26.56.26"; break}
    "7" {"37.235.1.174"; break}
    "8" {exit}
    default {"Invalid choice"; exit}
}

# Obtenez le nom de l'interface reseau
$interface = Get-NetAdapter | ? Status -eq 'Up' | Select -ExpandProperty Name

# Change le DNS
if ($dns -eq "Automatique") {
    Set-DnsClientServerAddress -InterfaceAlias $interface -ResetServerAddresses
    echo "DNS reinitialise aux parametres automatiques"
} else {
    Set-DnsClientServerAddress -InterfaceAlias $interface -ServerAddresses $dns
    echo "DNS change en $dns"
}
