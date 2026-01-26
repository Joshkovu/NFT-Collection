// SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployScript.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public user = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        bytes memory encodedExpectedName = abi.encodePacked(expectedName);
        bytes32 expectedNameHash = keccak256(encodedExpectedName);
        string memory actualName = basicNft.name();
        bytes32 actualNameHash = keccak256(abi.encodePacked(actualName));
        assert(expectedNameHash == actualNameHash);
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);
        basicNft.mintNft(PUG);
        assert(basicNft.balanceOf(user) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
