/**
 * @title A defination of semi-fungible token interface for enumerable operation
 * @author wangcser
 * @notice end user can use this contract for their SFT model to support additional enumerable operations
 * @dev see SFT and GTF docs for more details
 */


pragma solidity ^0.5.8;


contract ISFTEnumerable {
    // read-state for contract
    function totalClassSupply() external view returns (uint256[] memory);
    function totalSupplyByClass(uint256 cid) external view returns (uint256);
    function totalSupply() external view returns (uint256[] memory, uint256[] memory);
    // read-state for users
    function ownedClass(address owner) external view returns (uint256[] memory);
    function balanceOf(address owner) external view returns (uint256[] memory, uint256[] memory);
}