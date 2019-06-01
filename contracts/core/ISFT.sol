pragma solidity ^0.5.8;

/**
 * @dev  interface for semi-fungible token
 */

interface ISFT {
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed cid, uint256 value);
    
    event Approval(address indexed owner, address indexed operator, uint256 indexed cid, uint256 value);

    // read-state methods
    function totalSupplyByClass(uint256 cid) external view returns (uint256);

    function balanceOfByClass(address owner, uint256 cid) external view returns (uint256);

    function allowance(address owner, address oprator, uint256 cid) external view returns (uint256);

    // write-state methods
    function transfer(address to, uint256 cid, uint256 value) external;
    
    function transferFrom(address from, address to, uint256 cid, uint256 value) external;

    function approve(address oprator, uint256 cid, uint256 value) external;
}