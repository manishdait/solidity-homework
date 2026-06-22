// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Wallet {
    event Deposite(address indexed sender, uint256 amount, uint256 balance);
    event Withdraw(uint256 amount, uint256 balance);
    event Transfer(address indexed to, uint256 amount, uint256 balance);

    // to pay any adress the address must be payable
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function deposite() external payable {
        emit Deposite(msg.sender, msg.value, address(this).balance);
    }

    // 3 ways
    // transfer (forward 2300gas, throw error)
    // send (forward 2300gas, bool)
    // call (recomended) (forward all gass, bool)

    function withdraw(uint256 _amount) external onlyOwner {
        // owner.transfer(_amount);
        (bool success,) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");

        emit Withdraw(_amount, address(this).balance);
    }

    function transfer(address _to, uint256 _amount) external onlyOwner {
        // _to.transfer(_amount);
        (bool success,) = payable(_to).call{value: _amount}("");
        require(success, "Transfer failed");

        emit Transfer(_to, _amount, address(this).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
