# Hall-Of-Shame-NFT-collection

```
const factoryContractAddress = "0x..."; // Replace with your Factory contract address
const factoryABI = [...]; // ABI for the Factory contract
const web3 = new Web3(window.ethereum); // Initialize web3 instance

const factoryContract = new web3.eth.Contract(factoryABI, factoryContractAddress);

const name = "MyNFTCollection";
const symbol = "MNFT";
const baseTokenURI = "https://my-nft-api.com/tokens/";

// Call createCollection from the connected wallet
web3.eth.getAccounts().then(accounts => {
  const currentAccount = accounts[0]; // Using the first account in the wallet
  factoryContract.methods.createCollection(name, symbol, baseTokenURI)
    .send({ from: currentAccount })
    .then(receipt => {
      console.log("Collection created at address:", receipt.events.CollectionCreated.returnValues.newCollectionAddress);
    });
});

```