// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

contract FuncModifier {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // function onlyOwner() internal {
    //   require(msg.sender == owner, "Not owner");
    // }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // function validAddress(address _address) internal {
    //   require(_address != address(0), "Not valid address");
    // }

    modifier validAddress(address _address) {
        require(_address != address(0), "Not valid address");
        _;
    }

    // function changeOwner(address _newOwner) external onlyOwner {
    //   onlyOwner();
    //   validAddress(_newOwner);
    //   owner = _newOwner;
    // }

    function changeOwner(address _newOwner) external onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Reeentrancy hack using modifiers

    uint256 public x = 10;
    bool locked = false;

    modifier noReentrancy() {
        require(!locked, "Locked");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 _i) public noReentrancy {
        x -= _i;
        if (_i > 1) {
            decrement(_i - 1);
        }
    }
}
