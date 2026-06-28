// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {stdError} from "forge-std/StdError.sol";
import {Error} from "../../src/tutorial/Error.sol";

contract ErrorTest is Test {
    Error err;

    function setUp() public {
        err = new Error();
    }

    function testDeposite() public {
        err.deposite(1);
        uint256 value = err.balance();
        assertEq(value, 1);
    }

    function testDepositeMaxVal() public {
        err.deposite(1);
        try err.deposite(err.MAX_VALUE()) {
            fail("Test should have cause painc");
        } catch Panic(uint256 errorCode) {
            assertEq(errorCode, 0x11);
        }
    }
}
