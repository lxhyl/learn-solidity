pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import {ReceiveETH} from "../src/noPayableReceiveETH.sol";
contract SelfdestructContract {
    function destructContract (address payable receiver) public {
        selfdestruct(receiver);
    }
    receive() payable  external {} 
}

contract ReceiveETHTest is Test {
    address payable receiveETH;
    SelfdestructContract selfdestructContract;
    function setUp() public {
       receiveETH = payable(address(new ReceiveETH()));
       selfdestructContract = new SelfdestructContract();
    }
    function testNormalTransfer() public {
        receiveETH.call{value:1}("");
        console.log("testNormalTransfer amount", ReceiveETH(receiveETH).getETHAmount());
    }
    function testSelfdestruct() public {
       address(selfdestructContract).call{value:100}("");
       selfdestructContract.destructContract(receiveETH);
       console.log("testSelfdestruct amount", ReceiveETH(receiveETH).getETHAmount());
    }
}