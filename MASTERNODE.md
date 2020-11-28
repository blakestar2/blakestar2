### How to setup a Masternode ###
This is a complete guide to setting up a Masternode for Blas Coin. The method employed is to use a cold Windows wallet together with a hot Ubuntu Linux VPS.  The reason is so that your coin will be safe in your Windows wallet and the VPS side will not contain any coins.

#### What you will need (recommended) ####
1. Download the latest windows Blas wallet from here.
2. Get 13750 BLAS coins (you can get 1 more coin to cover transaction fee)
3. Download Putty (https://the.earth.li/~sgtatham/putty/latest/w32/putty-0.70-installer.msi)

#### Getting started ####
- Get an Ubuntu 16.04 VPS
- Install Putty on your windows client machine and open it
- When prompted for username, input "root"
- When prompted for password, use the initial password provided by the VPS provider
- Next, get the Blas auto install script by copying the entire command below:

```bash
wget https://raw.githubusercontent.com/blakestar2/blakestar2/master/contrib/masternode/install.sh
```

Go to Putty and paste (right click mouse button) and hit Enter

Type the command below after gotten the auto install script:

```bash
chmod -R 755 install.sh
```

Then execute the command below:

```bash
./install.sh
```

- Wait for around 30 minutes - 1 hour time for installation to complete
- At the end of the script, it would generate the Masternode private key for you
- Copy the key and paste into a notepad

#### Next ####
- On the windows client (your PC or laptop), extract downloaded Blas windows wallet
- Run the wallet (blas-qt.exe)
- Wait for it to load
- Click Options -> Wallet -> and check "Enable coin control features" & "Show Masternode tab"
- If your coin is still in the exchange, transfer at least 13751 coins back to your windows wallet
- Inside the windows wallet, click File -> Receiving Address
- Click "New"
- Put a name as label for the new address
- Right-click the address, select and copy the address to notepad
- When you have the 13751 coins in your wallet, click on "Send" tab
- Paste the copied address in "Pay to:"
- Key in amount "13750" (have to be exact)
- Click "Send" button

#### Lastly ####
- Once you have the 13750 coins in the new address, Click Tools -> debug console on the wallet
- Issue the command "masternode outputs"
- For the output, there would be one long text (transaction id) and 1 single digit at the end (output index)
- Copy the output to notepad
- Next, you can either type "%appdata%" on a windows file explorer or Click Tools -> open masternode config file from your wallet
- Fill in a new line with the template as below:

```bash
Masternode-Alias[space]VPS-IP-address:9779[space]private-key-from-vps[space]transaction-id[space]output-index
```

- Save & close
- Close Windows wallet & open again
- Wait till complete sync, click "masternodes" tab
- Click "my masternodes"
- Click on masternode that you want to activate
- Click "Start alias"
- After activating, you would see "Pre Enabled" status, wait for around 30 minutes time & it should display as "Enabled"

You are all done & wait for your first reward (around 24 hours time)!

*If there is a need to re-start the masternode, you can run the following:-

```bash
/opt/blas-core/blasd -daemon
```
 
