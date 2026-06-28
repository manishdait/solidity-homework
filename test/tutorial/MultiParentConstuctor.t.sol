// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {E} from "../../src/tutorial/MultiParentConstructor.sol";

contract MultiParentConstructor is Test {
    E e;

    function setUp() public {
        e = new E();
    }

    function testOverrideStateVar() public view {
        address value1 = e.owner();
        address value2 = e.getAddress();

        assertEq(value1, address(0x2));
        assertEq(value2, address(0x2));
    }
}
