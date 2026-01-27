// SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {DeployMood} from "../script/DeployMoodScript.s.sol";

contract DeployMoodNftTest is Test {
    DeployMood public deployer;

    function setUp() public {
        deployer = new DeployMood();
    }

    function testConvertSvgToURI() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4KICAgIDx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+WW91IGNvZGVkIHRoaXMgPC90ZXh0Pgo8L3N2Zz4=";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black">You coded this </text></svg>';
        string memory actualURI = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualURI)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
