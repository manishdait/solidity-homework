// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./SimpleToken.sol";

contract SimpleTokenSale {
    address admin;
    bool paused;

    SimpleToken public  tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address indexed _buyer, uint256 _amount);

    modifier adminOnly() {
        require(msg.sender == admin, "Unauthorize");
        _;
    }

    modifier requiredNotPaused() {
        require(!paused, "Contract Paused");
        _;
    }

    constructor(SimpleToken _tokenContract, uint256 _tokenPrice) {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function multiply(uint256 a, uint256 b) internal pure returns(uint256 c) {
        return a * b;
    }

    function buyTokens(uint256 _numberOfTokens) public payable requiredNotPaused {
        require(_numberOfTokens > 0, "Invalid token number");

        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens, "No sufficient tokens");
        require(msg.value == multiply(_numberOfTokens, tokenPrice), "Invalid price");

        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;
        emit Sell(msg.sender, _numberOfTokens);
    }

    function endSale() public adminOnly requiredNotPaused returns (bool _success) {
        if (tokenContract.balanceOf(address(this)) > 0) {
            require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
        }

        uint256 balance = address(this).balance;
        (bool success, ) = payable(admin).call{value: balance}("");

        paused = true;
        return success;
    }
}
