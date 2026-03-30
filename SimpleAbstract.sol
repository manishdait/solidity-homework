// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

abstract contract AbContract {
    uint256 public count = 122;

    // private and virtual no no
    function abFunc() public virtual returns (string memory);

    function incrementCount() internal virtual;
}

contract AbContractImpl is AbContract {    
    function abFunc() public  override returns (string memory) {
        incrementCount();
        return "Hello Impl";
    }

    function incrementCount() internal override  {
        count++;
    }
}


// methods must be external
// variables not allow
interface SomeAction {
    function action() external pure returns (bool);
}

contract ActionImpl is SomeAction {
    function action() external pure returns (bool) {
        return true;
    }
}

contract TestActionImpl {
    ActionImpl action = new ActionImpl();

    function callAction() view public returns (bool) {
        return SomeAction(action).action();
    }
}