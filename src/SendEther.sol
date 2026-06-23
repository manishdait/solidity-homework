// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract ReceiveEther {
    // This function is executed on a call to the contract if none of the other
    // functions match the given function signature, or if no data is supplied at all
    // fallback() external payable {

    // }

    // This function is executed when a contract receives plain Ether (without data)
    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendEther {
    // 3 ways
    // transfer (forward 2300gas, throw error)
    // send (forward 2300gas, bool)
    // call (recomended) (forward all gass, bool)

    function sendViaTransfer(address _to) external payable {
        payable(_to).transfer(msg.value);
    }

    function sendViaSend(address _to) external payable {
        bool sent = payable(_to).send(msg.value);
        require(sent, "fail to send ether");
    }

    function sendViaCall(address _to) external payable {
        // (bool sent, bytes memory data) = payable(_to).call{value: msg.value, gas: 1000}("");
        (bool sent,) = payable(_to).call{value: msg.value}("");
        require(sent, "fail to send ether");
    }
}
