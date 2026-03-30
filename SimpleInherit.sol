// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SimpleInherit {
    Child child = new Child();

    function func1() public view returns (string memory) {
        return child.publicFunc();
    }
}

contract Parent {
    function publicFunc() public pure returns(string memory) {
        return "Public call";
    }

    function externalFunc() external pure returns(string memory) {
        return "External call";
    }

    // No access in child
    function privateFunc() private pure returns(string memory) {
        return "Private call";
    }

    function internalCall() internal pure returns(string memory)  {
        return "Internal call";
    }
}

contract Child is Parent {
    function accessInternal() external pure returns (string memory) {
        return internalCall();
    }

    // No access in the instance
    function childInternal() internal pure returns(string memory) {
        return "Child Internal call";
    }
}
