// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Bank {
    enum TransactionType {
        CREDIT,
        DEBIT
    }

    struct Transaction {
        TransactionType transactionType;
        uint256 amountInWei;
        uint256 amountInEth;
        uint256 timestamp;
    }

    mapping(address => uint256) accountBalance;
    mapping(address => Transaction[]) accountTransactions;

    event Deposite(address indexed owner, uint256 amount);
    event Withdraw(address indexed owner, uint256);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function addTransaction(address _owner, TransactionType _transactionType, uint256 _amount) internal {
        uint256 _amountInWei = _amount;
        uint256 _amountInEth = _amount / 1 ether;

        accountTransactions[_owner].push(Transaction({
            transactionType: _transactionType,
            amountInWei: _amountInWei,
            amountInEth: _amountInEth,
            timestamp: block.timestamp
        }));
    }

    function deposite() payable  external returns (bool) {
        require(msg.value > 0, "amount <= 0");
        accountBalance[msg.sender] += msg.value;

        addTransaction(msg.sender, TransactionType.CREDIT, msg.value);

        uint256 amountInEth = msg.value / 1 ether;
        emit Deposite(msg.sender, amountInEth);

        return true;
    }

    function withdraw(uint256 _amount) external returns (bool) {
        uint balance = accountBalance[msg.sender];
        uint amountInWei = _amount * 1 ether;

        require(balance >= amountInWei, "No suffecient funds");

        (bool success, ) = msg.sender.call{value: amountInWei}("");

        if (success) {
            accountBalance[msg.sender] -= amountInWei;
            addTransaction(msg.sender, TransactionType.DEBIT, amountInWei);
            emit Withdraw(msg.sender, amountInWei);
        }

        return  success;
    }

    function transfer(address _to, uint256 _amount) external returns (bool) {
        uint balance = accountBalance[msg.sender];
        uint amountInWei = _amount * 1 ether;

        require(balance >= amountInWei, "No suffecient funds");

        accountBalance[msg.sender] -= amountInWei;
        accountBalance[_to] += amountInWei;

        addTransaction(msg.sender, TransactionType.DEBIT, amountInWei);
        addTransaction(_to, TransactionType.CREDIT, amountInWei);

        emit Transfer(msg.sender, _to, _amount);

        return  true;
    }

    function getBalance() view external returns (uint256 _wei, uint256 _ether) {
        uint256 balanceInWei = accountBalance[msg.sender];
        uint256 balanceInEth = balanceInWei / 1 ether;
        return (_wei=balanceInWei, _ether=balanceInEth);
    }

    function getTransactions() view external returns (Transaction[] memory) {
        return accountTransactions[msg.sender];
    }
}
