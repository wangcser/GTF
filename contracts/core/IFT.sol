pragma solidity ^0.5.8;

import "./IFTEnumerable.sol";
import "./IFTMetadata.sol";


interface IFT is IFTEnumerable {
    // events for transaction
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed operator, uint256 value);
    // read-state methods for single user
    function balanceOf(address owner) external view returns (uint256);
    function allowance(address owner, address operator) external view returns (uint256);
    // write-state methods for single user
    function transfer(address to, uint256 value) external;
    function transferFrom(address from, address to, uint256 value) external;
    function approve(address operator, uint256 value) external;
}