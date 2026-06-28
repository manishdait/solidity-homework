// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Loop {
    int256 public count = 0;

    function loop(int256 i) public {
        for (int256 j = 0; j < i; j++) {
            count++;
        }
    }
}
