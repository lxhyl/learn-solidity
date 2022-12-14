pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
contract ReceiveETH {
   function getETHAmount() external returns (uint256){
     return address(this).balance;
   }
}