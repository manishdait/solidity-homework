// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

/*
    Keccak256 Hash
    - take any size output and return fixed size data
    - keccak256(abi.encodePacked("Hello", uint(1), address(0x1))), give  32 byte hash
*/
contract Keccak {
    function generateHash(string memory _text, uint256 _num, address _addr) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }
}
