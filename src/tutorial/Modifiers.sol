// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract Modifiers {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // function onlyOwner() public {
    //     require(msg.sender == owner, "not owner");
    // }

    // function validAddresS(address _addr) public {
    //     require(_addr != address(0), "zero address");
    // }

    // function changeOwner(address _newOwner) public {
    //     onlyOwner();
    //     validAddresS(_newOwner);
    //     owner = _newOwner;
    // }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "zero address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Reenterancy hack

    int256 x = 10;
    bool locked = false;

    modifier noReenterancy() {
        require(!locked, "locked");
        locked = true;
        _;
        locked = false;
    }

    function decrement(int256 i) public noReenterancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }
}
