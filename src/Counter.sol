// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

contract Counter {
  int256 public count;

  function get() external view returns (int256) {
    return count;
  }

  function incr() external {
    count++;
  }

  function decr() external {
    count--;
  }
}
