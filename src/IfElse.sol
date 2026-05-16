// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

contract IfElse {
    function max(uint256 a, uint256 b) external pure returns (uint256) {
        if (a > b) {
            return a;
        } else {
            return b;
        }
    }
}
