/**
 * @title A defination of non-fungible token interface for enumerable operation
 * @author wangcser
 * @notice end user can use this contract for their NFT model to support additional enumerable operations
 * @dev see NFT and GTF docs for more details
 */


pragma solidity ^0.5.8;


contract INFTEnumerable {
    // read-state method
    function totalSupply() external view returns (uint256[] memory);
    function totalSupplyByAmount() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256[] memory);
    function balanceOfByAmount(address owner) external view returns (uint256);
}