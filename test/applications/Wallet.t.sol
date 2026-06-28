// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Wallet} from "../../src/applications/Wallet.sol";

contract WalletTest is Test {
    Wallet wallet;
    address owner = address(0x1);

    function setUp() public {
        vm.startPrank(owner);
        vm.deal(owner, 2 ether);

        wallet = new Wallet{value: 1 ether}();

        vm.stopPrank();
    }

    function testInitialState() public view {
        uint256 balance = wallet.getBalance();
        assertEq(1 ether, balance);
    }

    function testDeopsiteByOwner() public {
        vm.startPrank(owner);
        vm.deal(owner, 2 ether);

        wallet.deposite{value: 1 ether}();

        vm.stopPrank();

        uint256 balance = wallet.getBalance();
        assertEq(2 ether, balance);
    }

    function testDeopsiteByUnknown() public {
        address jhon = address(0x2);
        vm.startPrank(jhon);
        vm.deal(jhon, 2 ether);

        wallet.deposite{value: 1 ether}();

        vm.stopPrank();

        uint256 balance = wallet.getBalance();
        assertEq(2 ether, balance);
    }

    function testWithdraw() public {
        vm.startPrank(owner);
        vm.deal(owner, 2 ether);

        wallet.deposite{value: 1 ether}();

        uint256 balance = wallet.getBalance();
        assertEq(2 ether, balance);

        wallet.withdraw(1 * 1e18);
        vm.stopPrank();

        uint256 newBalance = wallet.getBalance();
        assertEq(1 ether, newBalance);
    }

    function testWithdrawnNotOwner() public {
        vm.startPrank(owner);
        vm.deal(owner, 2 ether);

        wallet.deposite{value: 1 ether}();
        vm.stopPrank();

        uint256 balance = wallet.getBalance();
        assertEq(2 ether, balance);

        address jhon = address(0x2);
        vm.startPrank(jhon);
        vm.expectRevert("not owner");

        wallet.withdraw(1 * 1e18);

        vm.stopPrank();

        uint256 newBalance = wallet.getBalance();
        assertEq(2 ether, newBalance);
    }

    function testTransfer() public {
        address alice = address(0x3);

        vm.startPrank(owner);
        vm.deal(owner, 2 ether);

        wallet.deposite{value: 1 ether}();

        uint256 balance = wallet.getBalance();
        assertEq(2 ether, balance);

        wallet.transfer(alice, 1 ether);
        vm.stopPrank();

        uint256 newBalance = wallet.getBalance();
        assertEq(1 ether, newBalance);

        uint256 aliceBalance = alice.balance;
        assertEq(1 ether, aliceBalance);
    }

    function testTransferNotOwner() public {
        address alice = address(0x3);

        vm.startPrank(owner);
        vm.deal(owner, 2 ether);

        wallet.deposite{value: 1 ether}();

        uint256 balance = wallet.getBalance();
        assertEq(2 ether, balance);
        vm.stopPrank();

        address jhon = address(0x2);

        vm.startPrank(jhon);
        vm.expectRevert("not owner");

        wallet.transfer(alice, 1 ether);

        vm.stopPrank();

        uint256 newBalance = wallet.getBalance();
        assertEq(2 ether, newBalance);

        uint256 aliceBalance = alice.balance;
        assertEq(0, aliceBalance);
    }
}
