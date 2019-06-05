pragma solidity ^0.5.8;

import "./INFTEnumerable.sol";
import "./INFTMetadata.sol";


interface INFT is INFTEnumerable {
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed tid);
    event Approval(address indexed owner, address indexed operator, uint256 indexed tid);
    // read-state methods for single user and single NFT
    function ownerOf(uint256 tid) external view returns (address);
    function allowance(uint256 tid) external view returns (address);
    // write-state methods
    function transfer(address to, uint256 tid) external;
    function transferFrom(address from, address to, uint256 tid) external;
    function approve(address operator, uint256 tid) external;
}