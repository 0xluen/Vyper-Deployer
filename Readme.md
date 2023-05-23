# Vyper-Deployer

This repository contains the compile and deploy script for a smart contract written in the Vyper language.
- Please make the necessary adjustments in the .env file first.
## Prerequisites

Before running the code in this repository, make sure you have the following dependencies installed:

- Git
- Python 3.10
- Tkinter (for GUI support)
- Node.js
- Vyper 0.3.7

To install the dependencies automatically, run the following command:
<br>
./install.sh

## Usage

- To use this repository, follow the steps below:

1. Clone this repository:

<code>git clone https://github.com/sinyordes/Vyper-Deployer.git</code>

2. Change into the cloned directory:

<code>cd Vyper-Deployer</code>

3. Choose one of the following options by entering the corresponding number in the terminal:

<code>chmod +x vyper.sh</code> <br>
<code>./vyper.sh</code>

### Option 1: Install Dependencies

Select "1. Install" in the console to install the required dependencies.


### Option 2: Only Compile

Select "2. Only Compile" in the console to only compile the smart contract and get the artifacts data.


### Option 3:  Deploy 

Select the "3. Deploy" command in the console to deploy the smart contract on the network. This process will automatically compile first.

## License
This project is licensed under the MIT License.
