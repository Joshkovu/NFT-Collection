// SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

/**
 * @title This is a  mood NFT contract
 * @author Kuteesa Joash
 * @notice This contract ensures the Nft changes depending on the person's mood
 */

contract MoodNft is ERC721 {
    uint256 private sTokenCounter;
    string private sSadSvgImageUri;
    string private sHappySvgImageUri;
    address private spender = msg.sender;

    error MoodNft__NotOnwer();

    enum Mood {
        HAPPY,
        SAD
    }
    mapping(uint256 => Mood) private sTokenIdMood;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("Mood NFT", "MN") {
        sTokenCounter = 0;
        sSadSvgImageUri = sadSvgImageUri;
        sHappySvgImageUri = happySvgImageUri;
    }

    function minNft() public {
        _safeMint(msg.sender, sTokenCounter);
        sTokenIdMood[sTokenCounter] = Mood.HAPPY;
        sTokenCounter++;
    }

    function flipMood(uint256 tokenId) public {
        //Only want the NFT owner to be able  to change the mood
        address owner = ownerOf(tokenId);

        if (!_isAuthorized(owner, spender, tokenId)) {
            revert MoodNft__NotOnwer();
        }
        if (sTokenIdMood[tokenId] == Mood.HAPPY) {
            sTokenIdMood[tokenId] = Mood.SAD;
        } else {
            sTokenIdMood[tokenId] = Mood.HAPPY;
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:image/svg+xml;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (sTokenIdMood[tokenId] == Mood.HAPPY) {
            imageURI = sHappySvgImageUri;
        } else {
            imageURI = sSadSvgImageUri;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            name(),
                            '", "description":"An NFT that reflects the owners mood.", "attributes":[{"trait_type":"mood","value":"100"}],"image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
}
