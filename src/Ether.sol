// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

contract Ether {
    uint256 public oneWei = 1 wei;
    uint256 public oneGwei = 1 gwei;
    uint256 public oneEther = 1 ether;

    function isWei() external view returns (bool) {
        return oneWei == 1;
    }

    function isGwei() external view returns (bool) {
        return oneGwei == 1e9;
    }

    function isEther() external view returns (bool) {
        return oneEther == 1e18;
    }
}
