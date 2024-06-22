// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {BasicNft} from "../src/BasicNft.sol";
import {Script} from "forge-std/Script.sol";

contract DeployBasicNft is Script {
   
    function run() public returns (BasicNft) {
        vm.startBroadcast();
        BasicNft nft = new BasicNft();
        vm.stopBroadcast();
        return nft;
    }
}