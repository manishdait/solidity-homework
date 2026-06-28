// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Array} from "../../src/tutorial/Array.sol";

contract ArrayTest is Test {
    Array arr;

    function setUp() public {
        arr = new Array();
    }

    function testPush() public {
        uint256 previousSize = arr.size();
        assertEq(previousSize, 0);

        arr.add(1);
        arr.add(2);

        uint256 newSize = arr.size();
        assertEq(newSize, 2);
    }

    function testPop() public {
        uint256 previousSize = arr.size();
        assertEq(previousSize, 0);

        arr.add(1);
        uint256 newSize = arr.size();
        assertEq(newSize, 1);

        arr.removeLast();
        assertEq(arr.size(), 0);
    }

    function testRemove() public {
        uint256 previousSize = arr.size();
        assertEq(previousSize, 0);

        arr.add(1);
        arr.add(2);
        arr.add(3);
        uint256 newSize = arr.size();
        assertEq(newSize, 3);
        arr.removeAt(1);
        assertEq(arr.size(), 3);

        // make delete ele 0
        uint256 val = arr.myArray(1);
        assertEq(0, val);
        assertEq(arr.myArray(2), 3);
    }
}
