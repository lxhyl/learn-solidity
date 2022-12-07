// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Ecrecover {
    function randomRecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public pure {
        address add = ecrecover(hash, v, r, s);
        if (add != address(0)) {
            revert();
        }
    }
}
