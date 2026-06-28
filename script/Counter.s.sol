// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../../src/applications/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public returns (address) {
        uint256 deployerPrivateKey = vm.envUint("HEDERA_PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        Counter counter = new Counter();
        vm.stopBroadcast();

        console.log("Counter Contract deployed to:", address(counter));
        return address(counter);
    }
}
