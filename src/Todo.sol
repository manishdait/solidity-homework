// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function addTodo(string memory _val) public {
        // Todo({text: _val, completed: false})
        // Todo memory todo;
        // todo.text = _val;

        todos.push(Todo(_val, false));
    }

    function get(uint256 _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function update(uint256 _index, string memory _val) public {
        Todo storage todo = todos[_index];
        todo.text = _val;
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
