pragma solidity ^0.5.8;

interface ITokenMetadata {
    // read-data
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
}