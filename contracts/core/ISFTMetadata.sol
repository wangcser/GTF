/**
 * @title A defination of semi-fungible token interface for metadata operation
 * @author wangcser
 * @notice end user can use this contract for their SFT model to support additional metadata operations
 * @dev see SFT and GTF docs for more details
 */


pragma solidity ^0.5.8;

import "./ITokenMetadata.sol";

interface ISTMetadata is ITokenMetadata {
    function tokenInfo(uint256 cid) external view returns (string memory);
}