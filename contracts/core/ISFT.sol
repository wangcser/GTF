pragma solidity ^0.5.8;

import "./ISFTEnumerable.sol";
import "./ISFTMetadata.sol";


interface ISFT is ISFTEnumerable {
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed cid, uint256 value);
    event Approval(address indexed owner, address indexed operator, uint256 indexed cid, uint256 value);
    // read-state methods
    function balanceOfByClass(address owner, uint256 cid) external view returns (uint256);
    function allowance(address owner, address oprator, uint256 cid) external view returns (uint256);
    // write-state methods
    function transfer(address to, uint256 cid, uint256 value) external;
    function transferFrom(address from, address to, uint256 cid, uint256 value) external;
    function approve(address oprator, uint256 cid, uint256 value) external;
}