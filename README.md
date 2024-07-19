# alcruzProject-Degen-Gaming
This is the DegenToken smart contract for Degen Gaming on the Avalanche blockchain. The token is an ERC-20 compliant token that supports minting, transferring, redeeming for in-game store items, checking balances, and burning tokens. The contract owner has exclusive minting rights, while any user can transfer and burn tokens.

## Features
- Minting tokens (only owner)
- Transferring tokens
- Burning tokens
- Redeeming tokens for in-game store items
- Viewing store items
- Checking token balance

## Store Items
- Extra Life = 100 tokens
- Shield = 50 tokens
- Double Damage = 200 tokens
- Invisibility = 100 tokens
- Health Potion = 150 tokens

## Prerequsites
- Metamask: You should have an existing wallet already within the Fuji C-Chain Network. This extension should be enabled in your browser.
  - Request 2 AVAX from [this website](https://core.app/tools/testnet-faucet/?subnet=c&token=c). You will be needing this to deploy your contract later.
  - Save your wallet's private key in your clipboard or a safe text file.
- Remix IDE is open
- Snowtrace is open

## Setup instructions
1. Create an empty folder in your desired directory. You may use VSCode.
2. Clone the repository
git clone <repository-url>
cd <folder-name>
3. In the `hardhat.config.js` file, paste your wallet's private key inside `accounts:[""]`. Note that you will only use this for yourself, you can also opt to use a .env file.
4. In your terminal, run these commands:
   ```
   npm install --save-dev hardhat
   npx hardhat run scripts/deploy.js --network fuji
   ```
   - You should get an output similar to this:
     ```
     Compiled n Solidity files successfully (evm target: paris).
     Degen token deployed to <0x... contract address>
     ```
5. Copy the contract address then paste it in the searchbar of Snowtrace testnet, you will see that your contract has been deployed.
6. Open an additional terminal, then run this command: `remixd`. Do not close this terminal.
7. You can now open your Remix IDE then follow these steps:
   - In the file explorer, choose `connect to localhost` under the workspaces menu.
   - Click  `Connect` when a popup shows.
   - Under the `contracts` folder, open the `DegenToken.sol` file.

## Deploying and Run
1. Go to the Solidity compiler tab. Make sure you have selected the right version. Click Compile.
2. Go to the Deploy and Run Transactions tab. Paste the contract addess in the `At Address` field.
3. Click the `At Address` button. Expand the deployed contract.
4. You can now interact with the contract.

## Interacting with the Contract
1. Checking token balance
   - Simply click the `getBalance` button.
   - This will be 0 initially, depending on the balance of your wallet.
2. Minting tokens (only owner)
   - Expland the `mint` field then input the address and value.
   - Make sure you are in the owner account to do this properly.
3. Transferring tokens
   - Expland the `transferTokens` field then input the address and value.
4. Burning tokens
   - Input a value you would like to burn.
5. Viewing store items
   - Simply click the `listStoreItems` button.
7. Redeeming tokens for in-game store items
   - Choose an index from the list you would like to redeem, then input the value in the `redeemTokens` field.
   - Take note that you can only redeem it once, and that your balance should be sufficient.

## Credits
This project was made with the help of the [starter template](https://github.com/Metacrafters/DegenToken) from Metacrafters

## Author
Althea Louise Cruz
