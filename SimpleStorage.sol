// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SimpleStorage {
    struct Person {
        string name;
        uint8 age;
    }

    // dynamic array
    Person[] public persons;

    mapping(string=>uint8) nameToAgeMapping;

    event RegisterPerson(string indexed name, uint8 age);


    // calldata, memory
    // memory tmp var that can be modified
    // calldata tmp var cannot be modified
    function addPerson(string memory _name, uint8 _age) external {
        Person memory person = Person({name: _name, age: _age});
        persons.push(person);
        nameToAgeMapping[_name] = _age;
        emit RegisterPerson(_name, _age);
    }

    function getPerson(uint256 index) view external returns (Person memory) {
        return persons[index];
    }

    function getAgeByName(string memory _name) view external  returns (uint8) {
        return nameToAgeMapping[_name];
    }
}
