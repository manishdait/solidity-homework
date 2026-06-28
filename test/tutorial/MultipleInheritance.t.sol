// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {A, B, C} from "../../src/tutorial/MultipleInheritance.sol";

contract MultipleInheritanceTest is Test {
    A a;
    B b;
    C c;

    function setUp() public {
        a = new A();
        b = new B();
        c = new C();
    }

    function testInheritance() public view {
        string memory val1 = a.foo();
        string memory val2 = b.bar();

        assertEq(c.foo(), val1);
        assertEq(c.bar(), val2);
    }

    function testInheritSameMethod() public view {
        string memory val = c.same();
        assertEq(val, b.same());
    }
}
