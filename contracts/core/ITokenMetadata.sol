pragma solidity ^0.5.8;

interface ITokenMetadata {
    // read-state
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
}