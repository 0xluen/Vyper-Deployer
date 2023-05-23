// @ts-ignore
import fs from 'fs';
import Web3 from 'web3';
import dotenv from 'dotenv';

dotenv.config();

const web3 = new Web3(process.env.EndPointUrl as string);
const walletAddress = process.env.WalletAddress as string;
const privateKey = process.env.PrivateKey as string;
const bytecodeFile = 'artifacts/contract_output_bytecode.json';
const bytecodeJson = fs.readFileSync(bytecodeFile, 'utf8');
const bytecodeObject = JSON.parse(bytecodeJson);
const bytecode = bytecodeObject.bytecode;
const bytecodeString = bytecode.toString();
const account = web3.eth.accounts.privateKeyToAccount(privateKey);

const transactionData = {
  gas: 8000000,
  data: bytecodeString,
};

web3.eth.accounts.signTransaction(transactionData, privateKey)
  .then((signedTx) => {
    return web3.eth.sendSignedTransaction(signedTx.rawTransaction || '')
      .once('transactionHash', (hash) => {
        console.log('Tx  :', hash);
      })
      .once('receipt', (receipt) => {
        console.log('Contract Address :', receipt.contractAddress);
      })
      .on('error', (error) => {
        console.error('Error:', error);
      });
  })
  .catch((error) => {
    console.error('Error:', error);
  });
