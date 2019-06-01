pragma solidity ^0.5.8;

/**
 * @dev inteface for non-fungible token 
 */

interface INFT {
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed tid);

    event Approval(address indexed owner, address indexed operator, uint256 indexed tid);

    // read-state methods    
    function totalSupplyByAmount() external view returns (uint256);

    function balanceOfByAmount(address owner) external view returns (uint256);

    function ownerOf(uint256 tid) external view returns (address);
    
    function getApproved(uint256 tid) external view returns (address);
    
    // write-state methods
    function transfer(address to, uint256 tid) external returns (bool);
    
    function transferFrom(address from, address to, uint256 tid) external returns (bool);
    
    function approve(address operator, uint256 tid) external returns (bool);
}