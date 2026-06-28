// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Array {
    uint256[] public myArray; // dynamic sized
    uint256[] public dynmaicDecalred = [1, 2]; // dynamic

    uint256[10] public fixedArray; // fired array

    function add(uint256 _val) public {
        myArray.push(_val);
    }

    function removeLast() public {
        myArray.pop();
    }

    function size() public view returns (uint256) {
        return myArray.length;
    }

    // not change size of array
    // mkae delete ele 0
    function removeAt(uint256 _index) public {
        delete myArray[_index];
    }
}

contract CompactArray {
    uint256[] public arr;

    // make the remove index value to last and pop()
    function removeAt(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }
}
