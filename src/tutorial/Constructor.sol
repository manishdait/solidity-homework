// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Constructor {
    int256 public x;
    string public name;
    address public owner;

    constructor(int256 _x, string memory _name) {
        x = _x;
        name = _name;
        owner = msg.sender;
    }
}
