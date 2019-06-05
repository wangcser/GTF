pragma solidity ^0.5.8;

import "./ITokenMetadata.sol";

interface ISTMetadata is ITokenMetadata {
    function tokenInfo(uint256 cid) external view returns (string memory);
}