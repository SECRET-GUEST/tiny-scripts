# Asks the user to choose a DNS server
echo "Choose a DNS server:"
echo "0. Automatic - Uses the DNS assigned by your Internet Service Provider or DHCP"
echo "1. Google - Google Public DNS (8.8.8.8)"
echo "2. Cloudflare - Cloudflare DNS (1.1.1.1), focused on privacy and performance"
echo "3. Quad9 - Quad9 DNS (9.9.9.9), focused on security"
echo "4. OpenDNS - OpenDNS (208.67.222.222), offers content filtering options"
echo "5. DNS.WATCH - DNS.WATCH (84.200.69.80), focused on neutrality and freedom of information"
echo "6. Comodo Secure DNS - Comodo Secure DNS (8.26.56.26), focused on security and reliability"
echo "7. FreeDNS - FreeDNS (37.235.1.174), free and uncensored DNS"
echo "8. Exit without changing"
$choice = Read-Host "Enter your choice"

# The DNS server address will be determined by the user's choice
$dns = switch ($choice) {
    "0" {"Automatic"; break}
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

# Get the name of the network interface
$interface = Get-NetAdapter | ? Status -eq 'Up' | Select -ExpandProperty Name

# Change the DNS
if ($dns -eq "Automatic") {
    Set-DnsClientServerAddress -InterfaceAlias $interface -ResetServerAddresses
    echo "DNS reset to automatic settings"
} else {
    Set-DnsClientServerAddress -InterfaceAlias $interface -ServerAddresses $dns
    echo "DNS changed to $dns"
}
