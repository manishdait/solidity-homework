// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract Order {
    enum Status {
        Pending, // 0
        Shipped, // 1
        Accepted, // 2
        Rejected, // 3
        Canceled // 4
    }

    Status public status; // will be first state

    function ship() public {
        require(status == Status.Pending, "status not pending");
        status = Status.Shipped;
    }

    function acceptDelivery() public {
        require(status == Status.Shipped, "status not shipped");
        status = Status.Accepted;
    }

    function rejectDelivery() public {
        require(status == Status.Shipped, "status not shipped");
        status = Status.Rejected;
    }

    function cancel() public {
        require(status == Status.Pending, "status not pending");
        status = Status.Canceled;
    }
}
