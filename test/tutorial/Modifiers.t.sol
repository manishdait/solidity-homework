// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Modifiers} from "../../src/tutorial/Modifiers.sol";

contract ModifiersTest is Test {
    Modifiers modifiers;
    address deployer = address(0x1);

    function setUp() public {
        vm.startPrank(deployer);
        modifiers = new Modifiers();
        vm.stopPrank();
    }

    function testChangeOwner() public {
        address newOwner = address(0x2);

        vm.startPrank(deployer);
        modifiers.changeOwner(newOwner);
        vm.stopPrank();

        address value = modifiers.owner();
        assertEq(value, newOwner);
    }

    function testChangeOwnerInvalidOwner() public {
        address newOwner = address(0x2);

        vm.startPrank(newOwner);

        vm.expectRevert("not owner");
        modifiers.changeOwner(newOwner);

        vm.stopPrank();
    }

    function testChangeOwnerInvalidAddress() public {
        address newOwner = address(0x0);

        vm.startPrank(deployer);

        vm.expectRevert("zero address");
        modifiers.changeOwner(newOwner);

        vm.stopPrank();
    }

    function testReentrancy() public {
        vm.expectRevert("locked");
        modifiers.decrement(3);
    }
}
