// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
    }

    function testHelloWorld() public view {
        string memory text = helloWorld.text();
        assertEq(text, "Hello, Solidity!");
    }
}
