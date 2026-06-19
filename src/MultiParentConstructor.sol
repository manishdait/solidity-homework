// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Y {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract X {
    string public message;

    constructor(string memory _message) {
        message = _message;
    }
}


contract A is X("message"), Y("name") {

}

contract B is X, Y {
    constructor() X("message") Y("name") {
        
    }
}

contract C is X, Y {
    constructor(string memory _name, string memory _message) X(_message) Y(_name) {

    }
}

// How to override value?

contract D {
    address public owner = address(0x1);

    function getAddress() public view returns(address) {
        return owner;
    }
}

contract E is D {
    // invalid override
    // address public owner = address(0x2);

    constructor() {
        owner = address(0x2);
    } 
}
