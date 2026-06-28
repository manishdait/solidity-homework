pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Todos} from "../../src/tutorial/Todo.sol";

contract TodoTest is Test {
    Todos todo;

    function setUp() public {
        todo = new Todos();
    }

    function testAdd() public {
        todo.addTodo("Hello");
        (string memory text, bool completed) = todo.get(0);

        assertEq(text, "Hello");
        assertEq(completed, false);
    }

    function testUpdate() public {
        todo.addTodo("Hello");
        todo.update(0, "New Hello");

        (string memory text, bool completed) = todo.get(0);
        assertEq(text, "New Hello");
        assertEq(completed, false);
    }
}
