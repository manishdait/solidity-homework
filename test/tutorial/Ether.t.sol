// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Ether} from "../../src/tutorial/Ether.sol";

contract EtherTest is Test {
    Ether etherContract;

    function setUp() public {
        etherContract = new Ether();
    }

    function testIsWei() public view {
        bool value = etherContract.isOneWei();
        assertTrue(value);
    }

    function testIsEther() public view {
        bool value = etherContract.isOneEther();
        assertTrue(value);
    }
}

