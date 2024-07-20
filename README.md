# Foundry Testing for Solidity Contracts

This README provides step-by-step instructions to set up Foundry and run tests on Solidity contracts. The tests include checking ownership and minting functionalities for an ERC721 token.

## Prerequisites

- Foundry installed on your machine.
- Basic knowledge of Solidity and smart contract testing.

## Steps

### 1. Install Foundry

1. **Install Foundry:**
   - Use the following command to install Foundry using `foundryup`:
     ```sh
     curl -L https://foundry.paradigm.xyz | bash
     ```
   - Add Foundry to your PATH:
     ```sh
     source $HOME/.foundry/env
     ```

2. **Verify Installation:**
   - Check that Foundry is installed correctly by running:
     ```sh
     forge --version
     ```
   - You should see the version information for Foundry.

### 2. Setup Solidity Project

1. **Create a Solidity Project Directory:**
   - Create a directory for your Solidity project. For example:
     ```sh
     mkdir -p ~/foundry-project
     cd ~/foundry-project
     ```

2. **Initialize Foundry:**
   - Run the following command to initialize a new Foundry project:
     ```sh
     forge init
     ```

3. **Add Your Solidity Code:**
   - Save the following Solidity code in a file named `MyERC721.sol` under the `src` directory:

    
### 3. Add Test Code

1. **Create Test File:**
   - Save the following test code in a file named `MyERC721_1.t.sol` under the `test` directory:
   - Save the following test code in a file named `MyERC721_2.t.sol` under the `test` directory:

    
### 4. Compile and Run Tests

1. **Compile the Contract:**
   - Compile the smart contracts by running:
     ```sh
     forge build
     ```

2. **Execute Tests:**
   - Run the tests using the following command:
     ```sh
     forge test
     ```

3. **Verify Test Results:**
   - Review the output to ensure all tests pass.

## Screenshots

Please refer to the provided screenshots for each step:

1. **Foundry Installation Verification:**
   - ![Foundry Complilation](https://i.postimg.cc/PxQPS1sN/Screenshot-2024-07-20-224043.png)

2. **Project Setup:**
   - ![Project Directory](https://i.postimg.cc/Kc7nWgrP/Screenshot-2024-07-20-224008.png)

3. **Running Tests:**
   - ![Tests Running](https://i.postimg.cc/j5bD6Z1G/Screenshot-2024-07-20-224122.png)

## Understanding the Results

### Test Results

- **Failures:** If any test fails, review the specific failure message to debug the issue in the contract or test logic.The tests failed due to the following reasons: 

1. **`testMintAfterOwnershipTransfer`**: This test failed because after transferring ownership to `newOwner`, minting a token should succeed. However, the test attempts to assert ownership of token ID 1, which does not exist, leading to an `ERC721NonexistentToken(1)` error. This indicates that the token was either not minted or the token ID used in the assertion was incorrect.

2. **`testMultipleOwnershipTransfers`**: This test failed because it attempts multiple ownership transfers. The failure was due to a revert with the message "Caller is not the owner," indicating that the contract's current owner was not the expected owner when attempting to transfer ownership for the second or third time. This suggests a logic error in the test setup or the contract's ownership transfer functionality.


## Frequently Asked Questions (FAQs)

### What is Foundry?

Foundry is a comprehensive suite of Ethereum development tools, including a Solidity compiler, a testing framework, and a deployment tool. It is designed to improve the developer experience by providing fast and efficient testing and deployment capabilities for Solidity smart contracts.
