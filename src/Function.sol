// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8;

contract Function {
    // public function input restriction = {} map

    // function mapInput(mapping(string => int256) memory map) public {}

    function multiDimensionalFixedArrayInput(int256[2][2] memory arr) public {}

    function multiDimensionalDynamicArrayInput(int256[][] memory arr) public {}

    function arrayInput(int256[] memory arr) public {}

    mapping(int256 => string) map;

    int256[][] dynamicMultiArray;

    int256[2][2] fixedMultiArray;

    int256[] array;

    // public function out restriction = {} map

    // function mapOutput() public returns (mapping(int256 => string) memory) {
    //     return map;
    // }

    function dynamicArrayOutput() public view returns (int256[][] memory) {
        return dynamicMultiArray;
    }

    function fixedArrayOutput() public view returns (int256[2][2] memory) {
        return fixedMultiArray;
    }

    function arrayOutput() public view returns (int256[] memory) {
        return array;
    }

    function mutlipleValsOutput() public pure returns (bool, uint256) {
        return (true, 10);
    }

    function multipleNamedValsOutput() public pure returns (bool a, uint256 b, uint256 c) {
        return (true, 10, 100);
    }

    function multipleNamedAssignedOutput() public pure returns (bool a, uint256 b) {
        a = true;
        b = 10;
    }

    function destructingAssignement() public pure returns (bool, uint256, int256, uint256, int256) {
        (bool a, uint256 b, uint256 c) = multipleNamedValsOutput();

        // If function returns 3 params and we not care of 2 we can ignore it
        (int256 x,, int256 y) = (4, 5, 6);

        return (a, b, x, c, y);
    }
}
