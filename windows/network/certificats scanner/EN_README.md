[![OS](https://img.shields.io/badge/WviNdwoS-Powershell-blue)](https://img.shields.io/badge/OS-Windows-blue)
```
 ██████╗███████╗██████╗ ████████╗    ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██╔══██╗╚══██╔══╝    ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗
██║     █████╗  ██████╔╝   ██║       ███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝
██║     ██╔══╝  ██╔══██╗   ██║       ╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗
╚██████╗███████╗██║  ██║   ██║       ███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║
 ╚═════╝╚══════╝╚═╝  ╚═╝   ╚═╝       ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
```
# Certificate Exporter

A PowerShell utility to safely export certificate information for analysis, designed for security-conscious users.

## Overview

This script exports a filtered list of certificates from your Windows certificate stores, creating a text file that can be reviewed for security analysis. It's specifically designed to ensure that no private key information is included in the export, making it safe to share the output with security analysts or AI assistants.

## Features

- Exports certificates from multiple Windows certificate stores:
  - Local Machine Root store
  - Local Machine Certificate Authority store
  - Current User Personal store
- Automatically filters out:
  - Certificates containing private keys
  - Certificates with names that appear to be machine-generated or local keys
  - Non-human-readable certificate names
- Formats expiration dates clearly (YYYY-MM-DD) without time information
- Creates a ready-to-use output file on your desktop
- Includes helpful guidance for recipients analyzing the certificate list

## Usage

1. Open PowerShell with administrative privileges
2. Run the script:
   ```powershell
   .\CertificateExporter.ps1
   ```
3. Find the generated file on your desktop: `certificats_a_analyser.txt`

## Security Features

The script includes multiple layers of security filtering to ensure sensitive information is never exported:

- **HasPrivateKey Filter**: Excludes any certificate with associated private key material
- **Pattern Matching**: Filters out certificates with patterns commonly associated with private keys:
  - GUIDs and long hexadecimal strings
  - Names containing keywords like "KEYID" or "PRIVKEY"
  - Names identifying local or personal certificates
- **Human Readability Check**: Only includes certificates with names that appear to be proper common names

## Example Output

The output file includes a formatted header with instructions for analysis, followed by a list of certificates in the format:

```
Certificate Name - Expire le: YYYY-MM-DD
```

## Requirements

- Windows operating system
- PowerShell 3.0 or higher
- Administrative privileges (to access certain certificate stores)

## License

[MIT License](LICENSE)

## Disclaimer

Always review the exported data before sharing to ensure no sensitive information is included. This tool is provided as-is with no warranty.
