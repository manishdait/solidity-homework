// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8;

import { Test } from "forge-std/Test.sol";
import { Ether } from "../src/Ether.sol";

contract EtherTest is Test {
  Ether ethers;

  function setUp() public {
    ethers = new Ether();
  }

  function testIsWei() public view {
    assertTrue(ethers.isWei());
  }

  function testIsGwei() public view {
    assertTrue(ethers.isGwei());
  }

  function testIsEther() public view {
    assertTrue(ethers.isEther());
  }
}
