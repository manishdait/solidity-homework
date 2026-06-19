// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract ViewPure {
    int256 public x = 1;

    function addToX(int256 y) public view returns (int256) {
        return x + y;
    }

    function add(int256 a, int256 b) public pure returns (int256) {
        return a + b;
    }
}
