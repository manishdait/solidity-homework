// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract Error {
    // assert
    // require
    // revert

    uint256 public balance;
    uint256 public constant MAX_VALUE = 2 ** 256 - 1;

    function deposite(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;

        require(newBalance > oldBalance, "overflow");

        balance = balance + _amount;
        assert(balance > oldBalance);
    }

    function withdraw(uint256 _amount) public {
        uint256 oldBalance = balance;

        if (balance < _amount) {
            revert("underflow");
        }

        balance = balance - _amount;

        assert(balance < oldBalance);
    }
}
