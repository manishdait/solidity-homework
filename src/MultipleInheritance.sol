// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

// A is most base like
contract A {
  function foo() public pure returns (string memory) {
    return "Contract A foo()";
  }
}

contract B {
  function bar() public pure returns (string memory) {
    return "Contract B bar()";
  }

  function foo() public pure returns (string memory) {
    return "Contract B foo()";
  }
}

// order must be more base like to most derive
// C is most derived
contract C is A, B {
  // has both foo and bar

  // when call foo() the foo in B is called
}

// contract C is B, A {
//   // when call foo() the foo in A is called
// }