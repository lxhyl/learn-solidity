// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Alice {
    uint256 public num;
    address public sender;

    constructor() {}

    function setNumAndSender(uint256 _num) public {
        num = _num;
        sender = msg.sender;
    }
}
