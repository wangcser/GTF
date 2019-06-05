/**
 * @title A defination of fungible token interface for metadata operation
 * @author wangcser
 * @notice end user can use this contract for their FT model to support additional metadata operations
 * @dev see FT and GTF docs for more details
 */


pragma solidity ^0.5.8;

import "./ITokenMetadata.sol";


interface IFTMetadata is ITokenMetadata {
    // read-state methods for token

    /**
     * @dev the number of decimals of ft
     */
    function decimals() external view returns (uint256);
}