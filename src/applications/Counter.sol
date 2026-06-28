// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract Counter {
    int256 public count;

    function increment() external {
        count++;
    }

    function decrement() external {
        count--;
    }

    function reset() external {
        count = 0;
    }
}
