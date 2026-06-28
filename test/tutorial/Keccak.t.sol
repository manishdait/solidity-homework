// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Keccak} from "../../src/tutorial/Keccak.sol";

contract KeccakTest is Test {
    Keccak keccak;

    function setUp() public {
        keccak = new Keccak();
    }

    function testHashGeneration() public view {
        bytes32 hash1 = keccak.generateHash("hello", 1, address(0x1));
        bytes32 hash2 = keccak.generateHash("hello", 1, address(0x1));

        assertEq(hash1, hash2);
    }
}
