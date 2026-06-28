// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not a owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }
}

contract A is Ownable {
    int256 public num = 0;

    constructor() Ownable() {}

    function increment() external onlyOwner {
        num += 1;
    }
}
