```
 ██████╗██████╗ ██╗   ██╗██████╗ ████████╗ ██████╗     ███╗   ███╗██╗███╗   ██╗██╗███╗   ██╗ ██████╗ 
██╔════╝██╔══██╗╚██╗ ██╔╝██╔══██╗╚══██╔══╝██╔═══██╗    ████╗ ████║██║████╗  ██║██║████╗  ██║██╔════╝ 
██║     ██████╔╝ ╚████╔╝ ██████╔╝   ██║   ██║   ██║    ██╔████╔██║██║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
██║     ██╔══██╗  ╚██╔╝  ██╔═══╝    ██║   ██║   ██║    ██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╗██║██║   ██║
╚██████╗██║  ██║   ██║   ██║        ██║   ╚██████╔╝    ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚████║╚██████╔╝
 ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝        ╚═╝    ╚═════╝     ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 

```

### 1. Prerequisites: Ensure you have a Raspberry Pi 4 with an operating system already installed.

### 2. Installing Dependencies
   ```bash
   sudo apt-get update
   sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
   ```

### 3. Downloading Mining Software
   ```bash
   git clone https://github.com/bitcoin/bitcoin.git
   ```

### 4. Compilation
   ```bash
   cd bitcoin/
   ./autogen.sh
   ./configure
   make
   ```

### 5. Configuration
   ```bash
   mkdir ~/.bitcoin
   nano ~/.bitcoin/bitcoin.conf
   ```
   Add the following:
   ```
   server=1
   daemon=1
   rpcuser=YourUsername
   rpcpassword=YourPassword
   ```
   
#### 5bis. Choose a Mining Pool
   Select a mining pool like Slush Pool, F2Pool, or BTC.com. Register to get the necessary configuration details.

### 6. Starting the Node: 
   ```bash
   ./src/bitcoind
   ```

### 7. Generating a Mining Address
   ```bash
   ./src/bitcoin-cli -rpcuser=YourUsername -rpcpassword=YourPassword getnewaddress "label_mining"
   ```
   Note down the generated address.

### 8. Setting the Address for Mining
   ```bash
   ./src/bitcoin-cli -rpcuser=YourUsername -rpcpassword=YourPassword setminingaddr "your_bitcoin_address"
   ```

### 9. Starting Mining: 
   ```bash
   ./src/bitcoin-cli -rpcuser=YourUsername -rpcpassword=YourPassword setgenerate true
   ```
#### 9bis. Pool Mining Setup 
   - Install Pool Mining Software: Popular choices are `cgminer` and `bfgminer`. Install via `apt` or compile from source.
   - Configuration: Provide the pool's URL, port, and your credentials (username and password).


### 10. Backing Up the Wallet
    ```bash
    cp ~/.bitcoin/wallet.dat /path/to/your/backup/location/
    ```
    Store this backup in a safe place, preferably offline.

#### 10 bis. Start Pool Mining
   Launch the mining software with the pool's configuration. E.g., for `cgminer`:
   ```bash
   cgminer -o [pool_URL]:[port] -u [YourUsername] -p [YourPassword]
   ```


### 11. Making a Transaction

   To send Bitcoins to another address, use:
    ```bash
    ./src/bitcoin-cli -rpcuser=YourUsername -rpcpassword=YourPassword sendtoaddress "recipient_address" amount
    ```
    Replace "recipient_address" with the recipient's address and "amount" with the amount of Bitcoin you wish to send.

#### 11bis. Monitor Progress
   Most mining pools have a web interface to track progress, view earnings, and manage payouts.



### 12. Checking Mining Activity
    ```bash
    ./src/bitcoin-cli -rpcuser=YourUsername -rpcpassword=YourPassword getmininginfo
    ```
#### 12bis. Receive Payouts
   Ensure you've set a Bitcoin address in your pool account settings for receiving payouts.

By joining a pool, you combine computational power with other miners, increasing the chance of earning rewards, albeit shared among pool participants.


13. Stopping Mining (if needed): 
    ```bash
    ./src/bitcoin-cli -rpcuser=YourUsername -rpcpassword=YourPassword setgenerate false
    ```

By following these steps, you'll be able to mine Bitcoin, back up your wallet, create a mining address, and make transactions from your Raspberry Pi 4.

If you're looking for more detailed information or video tutorials, there are several available links, such as [this one on YouTube](https://www.youtube.com/watch?v=8lIvwwMGlsM) that might be helpful.

Power Consumption when Mining Bitcoin on Raspberry Pi: 
   - Idle: ~2.7 W to 3 W
   - While Mining: ~5 W to 7.6 W

Note on Raspberry Pi Lifespan:
   - Mining without cooling can reduce the lifespan of the Raspberry Pi by up to 2 years.
   - Mining with adequate cooling can reduce its lifespan by 1 month to 1 year.