// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {SendEther, ReceiveEther} from "../../src/tutorial/SendEther.sol";

contract SendEtherTest is Test {
    SendEther sender;
    ReceiveEther receiver;

    address bob = address(0x1);

    function setUp() public {
        sender = new SendEther();
        receiver = new ReceiveEther();
    }

    function testSendVaiTransfer() public {
        vm.deal(bob, 2 ether);
        vm.startPrank(bob);

        sender.sendViaTransfer{value: 1 ether}(address(receiver));

        vm.stopPrank();

        uint256 balance = receiver.getBalance();
        assertEq(1 ether, balance);
    }

    function testSendVaiSend() public {
        vm.deal(bob, 2 ether);
        vm.startPrank(bob);

        sender.sendViaSend{value: 1 ether}(address(receiver));

        vm.stopPrank();

        uint256 balance = receiver.getBalance();
        assertEq(1 ether, balance);
    }

    function testSendVaiCall() public {
        vm.deal(bob, 2 ether);
        vm.startPrank(bob);

        sender.sendViaCall{value: 1 ether}(address(receiver));

        vm.stopPrank();

        uint256 balance = receiver.getBalance();
        assertEq(1 ether, balance);
    }
}
