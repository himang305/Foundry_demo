// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing the ERC721 standard implementation from OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Defining the MyERC721 contract, which extends the ERC721 contract
contract MyERC721 is ERC721 {
    // Private state variable to store the contract's owner address
    address private _owner;
    // Private state variable to keep track of the token IDs
    uint256 private _tokenIdCounter;

    // Event emitted when ownership is transferred
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // Constructor function to initialize the contract
    constructor() ERC721("MyERC721Token", "M721") {
        // Setting the initial owner to the address deploying the contract
        _owner = msg.sender;
        // Emitting an event indicating the initial ownership
        emit OwnershipTransferred(address(0), _owner);
        // Initializing the token ID counter
        _tokenIdCounter = 0;
    }

    // Modifier to restrict access to functions to only the owner
    modifier onlyOwner() {
        // Checking if the caller is the owner
        require(owner() == msg.sender, "Caller is not the owner");
        _;
    }

    // Function to get the current owner address
    function owner() public view returns (address) {
        return _owner;
    }

    // Function to transfer ownership to a new address
    function transferOwnership(address newOwner) public onlyOwner {
        // Ensuring the new owner is not the zero address
        require(newOwner != address(0), "New owner is the zero address");
        // Emitting an event indicating ownership transfer
        emit OwnershipTransferred(_owner, newOwner);
        // Updating the owner address
        _owner = newOwner;
    }

    // Function to mint a new token to a specified address
    function safeMint(address to) public onlyOwner {
        // Using the current token ID as the new token ID
        uint256 tokenId = _tokenIdCounter;
        // Incrementing the token ID counter
        _tokenIdCounter += 1;
        // Minting the new token
        _safeMint(to, tokenId);
    }
}
