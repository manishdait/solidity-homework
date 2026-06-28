// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

import {Test} from "forge-std/Test.sol";
import {Order} from "../../src/tutorial/Enum.sol";

contract EnumTest is Test {
    Order order;

    function setUp() public {
        order = new Order();
    }

    function testInitialState() public view {
        Order.Status value = order.status();
        assertEq(uint256(value), uint256(Order.Status.Pending));
    }

    function testShip() public {
        order.ship();

        Order.Status value = order.status();
        assertEq(uint256(value), uint256(Order.Status.Shipped));
    }

    function testShipStatusNotPending() public {
        order.ship();

        vm.expectRevert("status not pending");
        order.ship();
    }

    function testAccept() public {
        order.ship();
        order.acceptDelivery();

        Order.Status value = order.status();
        assertEq(uint256(value), uint256(Order.Status.Accepted));
    }

    function testAcceptOrderNotShipped() public {
        vm.expectRevert("status not shipped");
        order.acceptDelivery();
    }

    function testReject() public {
        order.ship();
        order.rejectDelivery();

        Order.Status value = order.status();
        assertEq(uint256(value), uint256(Order.Status.Rejected));
    }

    function testRejectOrderNotShipped() public {
        vm.expectRevert("status not shipped");
        order.rejectDelivery();
    }

    function testCancel() public {
        order.cancel();

        Order.Status value = order.status();
        assertEq(uint256(value), uint256(Order.Status.Canceled));
    }

    function testCancelOnOrderShip() public {
        order.ship();
        vm.expectRevert("status not pending");
        order.cancel();
    }
}
