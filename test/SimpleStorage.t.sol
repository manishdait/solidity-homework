// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testSetMessage() public {
        string memory _message = "Hello";
        simpleStorage.set(_message);

        string memory message = simpleStorage.get();

        assertEq(message, _message);
    }
}
