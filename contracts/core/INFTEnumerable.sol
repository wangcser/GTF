pragma solidity ^0.5.8;

import "./INFT.sol";

contract INFTEnumerable is INFT {
    // read-state method
    function totalSupply() external view returns (uint256[] memory);
    function totalSupplyByAmount() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256[] memory);
    function balanceOfByAmount(address owner) external view returns (uint256);
}