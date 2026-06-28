// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Gas} from "../../src/tutorial/Gas.sol";

contract GasTest is Test {
    Gas gas;

    function setUp() public {
        gas = new Gas();
    }

    function testForever() public {
        vm.expectRevert();
        gas.forever();

        uint256 value = gas.i();
        assertEq(value, 0);
    }
}
