// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract SimpleStorage {
    string private text;

    function set(string memory _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }
}
