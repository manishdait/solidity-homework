// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {IfElse} from "../src/IfElse.sol";

contract IfElseTest is Test {
    IfElse ifelse;

    function setUp() public {
        ifelse = new IfElse();
    }

    function testMax() public view {
        uint256 a = 10;
        uint256 b = 20;
        uint256 c = ifelse.max(a, b);

        assertEq(c, b);
    }
}
