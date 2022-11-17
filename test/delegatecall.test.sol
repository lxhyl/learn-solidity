// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import {Alice} from "../src/delegatecall/Alice.sol";
import {Bob} from "../src/delegatecall/Bob.sol";

contract Delegate is Test {
    Alice public alice;
    Bob public bob;

    function setUp() public {
        alice = new Alice();
        bob = new Bob();
    }

    /**
     *  me call Bob. Bob delegatecall Alice
     *
     */
    function testSetNum(uint256 num) public {
        address me = address(this);

        bob.setNumAndSender(address(alice), num);

        assertEq(alice.num(), 0);
        assertEq(alice.sender(), address(0));
        assertEq(bob.num(), num);
        assertEq(bob.sender(), me);

        console2.log("me", address(this));
        console2.log("alice num", alice.num());
        console2.log("alice sender", alice.sender());
        console2.log("bob num", bob.num());
        console2.log("bob sender", bob.sender());
    }
}
