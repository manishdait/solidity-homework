// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

contract SimpleStorage {
    string private message;

    function set(string memory _message) external {
        message = _message;
    }

    function get() external view returns (string memory) {
        return message;
    }
}
