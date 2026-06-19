// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function testDefaultValue() public view {
        int256 value = counter.count();
        assertEq(value, 0);
    }

    function testIncrement() public {
        counter.increment();
        int256 value = counter.count();

        assertEq(value, 1);
    }

    function testDecrement() public {
        counter.decrement();
        int256 value = counter.count();

        assertEq(value, -1);
    }

    function testReset() public {
        counter.increment();
        counter.reset();
        int256 value = counter.count();

        assertEq(value, 0);
    }
}
