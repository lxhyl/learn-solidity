pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract BaseGas {
  function test() external payable {
    console.log("test 1:",address(this).balance);
    for(uint256 i; i< 1000;i++){
        address(msg.sender).call{value:1}("");
    }
    console.log("test 2:",address(this).balance);
  }
  receive() external payable {
    console.log("receive");
  }
}