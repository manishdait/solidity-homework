// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Map {
    mapping(address => string) public map;

    function get(address _addr) public view returns (string memory) {
        return map[_addr];
    }

    function set(address _addr, string memory _name) public {
        map[_addr] = _name;
    }

    function remove(address _addr) public {
        delete map[_addr];
    }
}
