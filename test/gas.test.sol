// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "forge-std/Vm.sol";
import {BaseGas} from "../src/gas.sol";

contract TestGas is Test {
    BaseGas baseGas;
   function setUp() public {
      baseGas = new BaseGas();
   }
   function Gas2() public {
      console.log("gasleft:",gasleft());
      try  baseGas.test{gas:5000,value:1}()  {
        console.log("try");
     }catch (bytes memory err) {
       console.logBytes(err);
     }
   }
   function testGas() public {
      TestGas(address(this)).Gas2{gas:1000}();
   }
}