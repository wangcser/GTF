/**
 * @title A defination of non-fungible token interface for metadata operation
 * @author wangcser
 * @notice end user can use this contract for their NFT model to support additional metadata operations
 * @dev see NFT and GTF docs for more details
 */


pragma solidity ^0.5.8;


interface INFTMetadata {
    // read-state method
    function tokenInfo(uint256 tid) external view returns (string memory);
}