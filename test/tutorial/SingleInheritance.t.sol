// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {A, B} from "../../src/tutorial/SingleInheritance.sol";

contract SingleInheritanceTest is Test {
    A a;
    B b;

    function setUp() public {
        a = new A("C1");
        b = new B("C2");
    }

    function testInheritMethod() public view {
        string memory value1 = a.getContractName();
        string memory value2 = b.getContractName();

        assertEq(value1, value2);
    }

    function testInheritOverrideMethod() public view {
        string memory value1 = a.overrideMethod();
        string memory value2 = b.overrideMethod();

        assertNotEq(value1, value2);
    }

    function testName() public view {
        string memory value = b.name();
        assertEq(value, "C2");
    }
}
