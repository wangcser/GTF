/**
 * @title A defination of fungible token interface for enumerable operation
 * @author wangcser
 * @notice end user can use this contract for their FT model to support additional enumerable operations.
 * @dev see FT and GTF docs for more details
 */


pragma solidity ^0.5.8;


interface IFTEnumerable {
    // read-state method for contract

    /**
     * @dev total number of fts being launched
     */
    function totalSupply() external view returns (uint256);
}