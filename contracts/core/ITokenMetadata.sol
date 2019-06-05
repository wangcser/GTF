/**
 * @title A common defination for metadata operation
 * @author wangcser
 */


pragma solidity ^0.5.8;

interface ITokenMetadata {
    // read-data

    /**
     * @dev the name of the token
     */
    function name() external view returns (string memory);

    /**
     * @dev the symbol of the token
     */
    function symbol() external view returns (string memory);
}