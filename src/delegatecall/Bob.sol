// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./Alice.sol";

contract Bob {
    uint256 public num;
    address public sender;

    constructor() {}

    function setNumAndSender(address aliceAddress, uint256 _num)
        public
        returns (bytes memory)
    {
        (bool success, bytes memory data) = aliceAddress.delegatecall(
            abi.encodeWithSelector(Alice.setNumAndSender.selector, _num)
        );
        require(success);
        return data;
    }
}
