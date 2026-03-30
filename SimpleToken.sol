// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SimpleToken {
    string public constant name = "Simple Token";
    string public constant symbol = "SIMP";

    uint256 public totalSupply;

    mapping(address => uint256) addressBalance;
    mapping(address => mapping(address => uint256)) addressAllowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;
        addressBalance[msg.sender] = _initialSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return addressBalance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(addressBalance[msg.sender] >= _value, "No sufficient token");
        addressBalance[msg.sender] -= _value;
        addressBalance[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        addressAllowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return addressAllowance[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(addressBalance[_from] >= _value, "No sufficient token");
        require(addressAllowance[_from][msg.sender] >= _value, "No sufficient allowance");

        addressAllowance[_from][msg.sender] -= _value;
        addressBalance[_from] -= _value;
        addressBalance[_to] += _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
} 
