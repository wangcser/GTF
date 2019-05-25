pragma solidity ^0.5.2;

/**
 * @title Token Core Interface
 * @dev  see the GTF model docs
 */

interface ITokenCore {

    function transfer(address to, uint256 value) external returns (bool);
    
    function approve(address oprator, uint256 value) external returns (bool);
    
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    
    function totalSupply() external view returns (uint256);
    
    function balanceOf(address owner) external view returns (uint256);
    
    function allowance(address owner, address oprator) external view returns (uint256);
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    event Approval(address indexed owner, address indexed oprator, uint256 value);
}