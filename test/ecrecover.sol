// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import {Ecrecover} from "../src/sign/ecrecover.sol";

// get fake address. can use this fake address send transaction
// https://weka.medium.com/how-to-send-ether-to-11-440-people-187e332566b7

/**
eg:
random hash and v,r,s
hash-------0x0000000000000000000000000000000000000000000000000000000086b4cc4f
v----------28
r----------0x0000000000000000000000001804c8ab1f12e6bbf3894d4083f33e07309d1f38
s----------0xdb73b9d801554f43b257065531063478cb0dc516ac104c9f8892bcfcf7076d8c

parsed address
address---0x953858aB74B281dA7291eF3149757c78422ed617
 */

contract EcrecoverTest is Test {
    Ecrecover myEcrecover;

    function setUp() public {
        console.log("setup");
        myEcrecover = new Ecrecover();
    }

    function testRandomRecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        myEcrecover.randomRecover(hash, v, r, s);
    }

    function testAddress() public {
        address a = ecrecover(
            bytes32(
                uint256(
                    0x0000000000000000000000000000000000000000000000000000000086b4cc4f
                )
            ),
            28,
            bytes32(
                uint256(
                    0x0000000000000000000000001804c8ab1f12e6bbf3894d4083f33e07309d1f38
                )
            ),
            bytes32(
                uint256(
                    0xdb73b9d801554f43b257065531063478cb0dc516ac104c9f8892bcfcf7076d8c
                )
            )
        );
        console.log("a", a);
    }
}
