// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract A {
    function privateFunc() private pure returns (string memory) {
        return "Private func/var available only inside contract";
    }

    function internalFunc() internal pure returns (string memory) {
        return "Internal func/var available inside contract and to child";
    }

    function publicFunc() public pure returns (string memory) {
        return "Public func/var available to all";
    }

    // state variable can not be external
    function externalFunc() external pure returns (string memory) {
        return "External func/var available to external contract and user";
    }
}
