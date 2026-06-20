// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Map} from "../src/Map.sol";

contract MapTest is Test {
    Map map;

    function setUp() public {
        map = new Map();
    }

    function testSetGet() public {
        address key = address(0x1);
        string memory value = "Jhon";
        map.set(key, value);

        string memory name = map.get(key);
        assertEq(name, value);
    }

    function testRemove() public {
        address key = address(0x1);
        string memory value = "Jhon";
        map.set(key, value);

        map.remove(key);
        string memory name = map.get(key);
        assertNotEq(name, value);
        assertEq(name, "");
    }
}
