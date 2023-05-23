const fs = require('fs');
const Web3 = require('web3');
require('dotenv').config();

const web3 = new Web3(process.env.EndPointUrl);
const walletAddress = process.env.WalletAddress;
const privateKey = process.env.PrivateKey;
const bytecodeFile = 'artifacts/contract_output_bytecode.json';
const bytecodeJson = fs.readFileSync(bytecodeFile, 'utf8');
const bytecodeObject = JSON.parse(bytecodeJson);
const bytecode = bytecodeObject.bytecode;
const bytecodeString = bytecode.toString();
const account = web3.eth.accounts.privateKeyToAccount(privateKey);


const transactionData = {
    gas: 8000000, 
    data: bytecodeString 
  };


web3.eth.accounts.signTransaction(transactionData, privateKey)
  .then((signedTx) => {
    return web3.eth.sendSignedTransaction(signedTx.rawTransaction);
  })
  .then((receipt) => {
    console.log('Tx  :', receipt.transactionHash);
  })
  .catch((error) => {
    console.error('Error:', error);
  });
