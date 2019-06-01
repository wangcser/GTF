pragma solidity ^0.5.8;

/**
 * @dev  interface for fungible token
 */

interface IFT {
    // write-state methods
    function transfer(address to, uint256 value) external returns (bool);
    
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    
    function approve(address operator, uint256 value) external returns (bool);
    
    
    // read-state methods
    function totalSupply() external view returns (uint256);
    
    function balanceOf(address owner) external view returns (uint256);
    
    function allowance(address owner, address operator) external view returns (uint256);
    
    // events
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    event Approval(address indexed owner, address indexed operator, uint256 value);
}