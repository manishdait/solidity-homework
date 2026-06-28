// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../../src/tutorial/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage store;

    function setUp() public {
        store = new SimpleStorage();
    }

    function testSetGetText() public {
        store.set("Hello");
        string memory value = store.get();

        assertEq(value, "Hello");
    }
}
