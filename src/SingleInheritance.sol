// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract A {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function getContractName() public pure returns (string memory) {
        return "Contract A";
    }

    function overrideMethod() public pure virtual returns (string memory) {
        return "Contract A";
    }
}

contract B is A {
    constructor(string memory _name) A(_name) {}

    function overrideMethod() public pure override returns (string memory) {
        return "Contract B";
    }
}
