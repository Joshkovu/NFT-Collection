// SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title This is a dog minting NFT contract
 * @author Kuteesa Joash
 * @notice This contract helps us to mint a dog NFT into our wallets
 */
contract BasicNft is ERC721 {
    uint256 private sTokenCounter;
    mapping(uint256 => string) private sTokenIdUri;

    constructor() ERC721("Dogie", "DOG") {
        sTokenCounter = 0;
    }

    function mintNft(string memory tokenURI) public {
        sTokenIdUri[sTokenCounter] = tokenURI;
        _safeMint(msg.sender, sTokenCounter);
        sTokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return sTokenIdUri[tokenId];
    }
}
