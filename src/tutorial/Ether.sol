// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract Ether {
    uint256 public oneWei = 1 wei;
    uint256 public oneEther = 1 ether;

    function isOneWei() external view returns (bool) {
        return oneWei == 1;
    }

    function isOneEther() external view returns (bool) {
        return oneEther == 1e18 wei;
    }
}
