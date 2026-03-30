// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SimpleFund {
    address private owner;

    event ReceiveFund(address indexed user, uint256 value);
    event TransferFunds(address indexed user, uint256 value);

    constructor() {
        owner = msg.sender;
    }

    modifier ownerOnly() {
        require(owner == msg.sender, "Un-Auth");
        _;
    }
    // payable func to receive eth
    function fund() payable external {
        require(msg.value > 0, "Amount must greater than 0");
        uint256 amountInEth = msg.value / 1 ether;
        emit ReceiveFund(msg.sender, amountInEth);
    }

    function withdrawAll() external ownerOnly returns(bool _success) {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds");
        (bool success, ) = owner.call{value: balance}("");
        
        if (success) {
            emit TransferFunds(owner, balance / 1 ether);
        }

        return success;
    }

    function withdraw(uint256 _amount) external  ownerOnly returns (bool _success) {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds");

        uint256 amount = _amount * 1 ether;
        require(balance >= amount, "No sufficent funds");
        
        (bool success, ) = owner.call{value: amount}("");

        if (success) {
            emit TransferFunds(owner, amount);
        }

        return success;
    }

    function send(address payable _to, uint256 _amount) external ownerOnly returns (bool _success) {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds");

        uint256 amount = _amount * 1 ether;
        require(balance >= amount, "No sufficent funds");

        (bool success, ) = _to.call{value: amount}("");
        if (success) {
            emit TransferFunds(_to, amount);
        }
        return success;
    }
}
