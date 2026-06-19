// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Constructor} from "../src/Constructor.sol";

contract ConstructorTest is Test {
    Constructor c;
    address deployer = address(0x1);

    function testInitializtion() public {
        int256 x = 100;
        string memory name = "Hello";

        vm.startPrank(deployer);
        c = new Constructor(x, name);

        int256 _x = c.x();
        string memory _name = c.name();
        address owner = c.owner();

        assertEq(_x, x);
        assertEq(_name, name);
        assertEq(owner, deployer);
    }
}
