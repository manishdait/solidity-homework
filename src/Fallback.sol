// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Fallback {
    event Log(uint256 gas);
    // old
    // function () external {}

    fallback() external payable {
        emit Log(gasleft());
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract CallFallback {
    function transferToFallback(address _to) external payable {
        payable(_to).transfer(msg.value);
    }

    function callToFallback(address _to) external payable {
        (bool sent,) = payable(_to).call{value: msg.value}("");
        require(sent, "fail to transfer");
    }
}
