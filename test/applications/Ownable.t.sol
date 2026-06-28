// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {A} from "../../src/applications/Ownable.sol";

contract OwnableTest is Test {
    A a;
    address deployer = address(0x1);

    function setUp() public {
        vm.startPrank(deployer);
        a = new A();
        vm.stopPrank();
    }

    function testInitialization() public view {
        address value = a.owner();
        assertEq(deployer, value);
    }

    function testIncrement() public {
        vm.startPrank(deployer);
        a.increment();
        vm.stopPrank();

        int256 value = a.num();
        assertEq(value, 1);
    }

    function testIncrementNotOwner() public {
        vm.startPrank(address(0x2));
        vm.expectRevert("not a owner");

        a.increment();

        vm.stopPrank();
    }

    function testChangeAddress() public {
        address newOwner = address(0x3);
        vm.startPrank(deployer);
        a.setOwner(newOwner);
        vm.stopPrank();

        address value = a.owner();

        assertEq(newOwner, value);
    }
}
