pragma solidity ^0.5.8;

import "./INFT.sol";

contract INFTEnumerable is INFT {

    function totalSupply() external view returns (uint256[] memory);

    function balanceOf(address owner) external view returns (uint256[] memory);
}