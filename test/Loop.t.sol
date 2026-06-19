// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Loop} from "../src/Loop.sol";

contract LoopTest is Test {
    Loop loop;

    function setUp() public {
        loop = new Loop();
    }

    function testLoop() public {
        loop.loop(10);
        int256 value = loop.count();

        assertEq(value, 10);
    }
}
