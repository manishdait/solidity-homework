// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

contract A {
  string public name;

  constructor (string memory _name) {
    name = _name;
  }

  function getContractName() public pure returns (string memory) {
    return "Contract A";
  }
}

contract B is A {
  constructor(string memory _name) A (_name) {

  }

  // Override
  function getContractName() public pure returns (string memory) {
    return "Contract B";
  }
}

contract C is A ("Contract C") {

}