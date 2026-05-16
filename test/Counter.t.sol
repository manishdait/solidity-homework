// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function testGetCount() public view {
        int256 count = counter.get();
        assertEq(count, 0);
    }

    function testIncrCount() public {
        counter.incr();
        int256 count = counter.get();
        assertEq(count, 1);
    }

    function testDecrCount() public {
        counter.decr();
        int256 count = counter.get();
        assertEq(count, -1);
    }
}
