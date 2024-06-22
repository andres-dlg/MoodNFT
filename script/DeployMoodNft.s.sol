// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MoodNft} from "../src/MoodNft.sol";
import {Script, console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    // https://book.getfoundry.sh/cheatcodes/fs?highlight=readFile#signature
    // Make sure to have fs_permissions = [{access = "read", path = "./images/"}] enabled in foundry.toml
    function run() public returns (MoodNft) {
        string memory sadSvg = vm.readFile("./images/dynamicNft/sad.svg");
        string memory happySvg = vm.readFile("./images/dynamicNft/happy.svg");
        vm.startBroadcast();
        MoodNft nft = new MoodNft(
            svgToUri(sadSvg),
            svgToUri(happySvg)
        );
        vm.stopBroadcast();
        return nft;
    }

    function svgToUri(string memory svg) public pure returns (string memory) {
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseUrl, svgBase64Encoded));
    }
}
