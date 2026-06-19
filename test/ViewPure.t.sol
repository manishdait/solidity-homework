// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {ViewPure} from "../src/ViewPure.sol";

contract ViewPureTest is Test {
    ViewPure viewPure;

    function setUp() public {
        viewPure = new ViewPure();
    }

    function testAddToX() public view {
        int256 value = viewPure.addToX(1);
        int256 x = viewPure.x();

        assertEq(value, 2);
        assertEq(x, 1);
    }

    function testAdd() public view {
        int256 value = viewPure.add(1, 1);
        assertEq(value, 2);
    }
}
