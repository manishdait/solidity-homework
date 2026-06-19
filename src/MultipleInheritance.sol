// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

// more base like than c
contract A {
    function foo() public pure returns (string memory) {
        return "Foo";
    }

    function same() public pure virtual returns (string memory) {
        return "A";
    }
}

// most base like than c
contract B {
    function bar() public pure returns (string memory) {
        return "Bar";
    }

    function same() public pure virtual returns (string memory) {
        return "B";
    }
}

// order contract form most base like to most derived
// Same method right to left depth wise
// derive since extend A and B
contract C is A, B {
    function same() public pure override(A, B) returns (string memory) {
        return super.same(); // using super all parent contract call
    }
}

// more derived than a and c
// contract D is A, C {}
