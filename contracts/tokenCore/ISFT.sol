pragma solidity ^0.5.8;

/**
 * @title Token Core Interface
 * @dev  see the GTF model docs
 */

interface INFT {

    function transfer(address to, uint256 tid) external returns (bool);
    
    function approve(address oprator, uint256 tid) external returns (bool);
    
    function transferFrom(address from, address to, uint256 tid) external returns (bool);
    
    function totalSupply() external view returns (uint256);
    
    function balanceOf(address owner) external view returns (uint256);

    function ownerOf(uint256 tid) external view returns (address);

    function getApproved(uint256 tid) external view returns (address);
    
    function allowance(address owner, address oprator) external view returns (uint256);
    
    event Transfer(address indexed from, address indexed to, uint256 indexed tid);
    
    event Approval(address indexed owner, address indexed oprator, uint256 indexed tid);
}